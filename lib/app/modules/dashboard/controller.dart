import 'dart:async';
import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:member_rkm/app/core/utils/firebase_notif.dart';
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/models/content.dart';
import 'package:member_rkm/app/data/models/store.dart';
import 'package:member_rkm/app/data/models/profile.dart';
import 'package:member_rkm/app/data/providers/dashboard_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  final DashboardProvider dashboardProvider;

  DashboardController({required this.dashboardProvider});

  final deviceToken = Rx<String?>(null);
  final userDevice = Rx<String?>(null);
  final deviceInfo = DeviceInfoPlugin().obs;

  final currentIndex = 0.obs;
  final appName = Rx<String?>(null);
  final currentVersion = Rx<String?>(null);
  final buildNumber = Rx<String?>(null);
  final token = Rx<String?>(null);

  final profile = Rx<Profile?>(null);

  final contentIndex = 0.obs;
  final content = <Content>[].obs;
  final contentLoading = true.obs;

  final googleMapController = Completer<GoogleMapController>().obs;
  final mapController = Rx<GoogleMapController?>(null);
  final boxController = BoxController().obs;
  final positionStream = Rx<StreamSubscription<Position>?>(null);
  final lat = Rx<double?>(null);
  final long = Rx<double?>(null);
  final store = <Store>[].obs;
  final storeLoading = true.obs;
  final locationLoading = false.obs;
  final servicestatus = false.obs;
  final haspermission = false.obs;
  final markers = RxSet<Marker>();
  final selectedLat = Rx<double?>(null);
  final selectedLong = Rx<double?>(null);
  final findStore = Rx<String?>(null);
  final findStoreController = TextEditingController().obs;
  final listFindStore = <Store>[].obs;
  final indexStore = 0.obs;

  @override
  void onInit() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    appName.value = packageInfo.appName;
    currentVersion.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
    token.value = sharedPreferences.getString('token');

    if (token.value != null) {
      await fetchProfile();
    }

    await sendFcmToken();
    await fetchLocation();
    super.onInit();
  }

  @override
  void onClose() {
    profile.value = null;
    content.clear();
    store.clear();
    positionStream.value?.cancel();
    googleMapController.value = Completer();
    mapController.value?.dispose();
    super.onClose();
  }

  Future<void> sendFcmToken() async {
    deviceToken.value = await FirebaseNotif().getDeviceToken();
    if (defaultTargetPlatform == TargetPlatform.android) {
      final android = await deviceInfo.value.androidInfo;
      userDevice.value =
          '${android.brand.capitalize} ${android.model} (Android ${android.version.release})';
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      final ios = await deviceInfo.value.iosInfo;
      userDevice.value = ios.utsname.machine;
    }

    try {
      final response = await dashboardProvider.sendFcmToken(
        deviceToken.value ?? '',
        userDevice.value ?? '',
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data);
      }
    }
  }

  Future<void> fetchProfile() async {
    try {
      final response = await dashboardProvider.fetchProfile();

      if (response.statusCode == 200) {
        profile.value = profileFromJson(jsonEncode(response.data['data']));
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Load Profil Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    } finally {
      update();
    }
  }

  Future<void> fetchContent() async {
    try {
      final response = await dashboardProvider.fetchContent();

      if (response.statusCode == 200) {
        final List<Content> body = response.data['data'] == null
            ? []
            : listContentFromJson(jsonEncode(response.data['data']));
        content.value = body;
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Load Konten Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    } finally {
      contentLoading.value = false;
      update();
    }
  }

  Future<void> fetchLocation() async {
    locationLoading.value = true;

    try {
      late Position position;
      late LocationPermission permission;

      servicestatus.value = await Geolocator.isLocationServiceEnabled();

      if (servicestatus.value) {
        permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            // await Geolocator.openAppSettings();
          } else if (permission == LocationPermission.deniedForever) {
            permission = await Geolocator.requestPermission();
            // await Geolocator.openAppSettings();
          } else {
            haspermission.value = true;
          }
        } else {
          haspermission.value = true;
        }

        if (haspermission.value) {
          position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.best);

          lat.value = position.latitude;
          long.value = position.longitude;

          LocationSettings locationSettings = const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 100,
          );

          positionStream.value =
              Geolocator.getPositionStream(locationSettings: locationSettings)
                  .listen((Position position) {
            lat.value = position.latitude;
            long.value = position.longitude;
          });

          await fetchStore();

          update();
        }
      }
    } catch (e) {
      failedSnackbar('Gagal Menangkap Lokasi', e.toString());
    } finally {
      locationLoading.value = false;
      update();
    }
  }

  Future<void> fetchStore() async {
    try {
      final response =
          await dashboardProvider.fetchStore(lat.value, long.value);

      if (response.statusCode == 200) {
        final List<Store> body = response.data['store'] == null
            ? []
            : listStoreFromJson(jsonEncode(response.data['store']));

        store.value = body;
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Load Toko Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    } finally {
      storeLoading.value = false;
      await createMarkers();
      update();
    }
  }

  Future<void> createMarkers() async {
    for (var element in store) {
      markers.add(
        Marker(
          markerId: MarkerId(element.code.toString()),
          icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(),
            defaultTargetPlatform == TargetPlatform.android
                ? 'assets/images/mapicon_android.png'
                : 'assets/images/mapicon_ios.png',
          ),
          position: LatLng(
            double.parse(element.lat ?? ''),
            double.parse(element.long ?? ''),
          ),
          infoWindow: InfoWindow(
            title: element.name,
            snippet: element.address,
          ),
          onTap: () {},
        ),
      );
    }
  }

  void moveStore() async {
    final GoogleMapController mapController =
        await googleMapController.value.future;
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            selectedLat.value ?? double.parse(store.first.lat ?? ''),
            selectedLong.value ?? double.parse(store.first.long ?? ''),
          ),
          zoom: 15,
        ),
      ),
    );
  }

  void logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    showLoading();

    try {
      final response = await dashboardProvider.logout();

      if (response.statusCode == 200) {
        await sharedPreferences.clear();
        await sharedPreferences.setBool('opened', true);

        if (Get.currentRoute == '/deleteAccount') {
          infoSnackbar(
            'Hapus Akun Berhasil',
            'Akun anda berhasil dihapus dan anda berhenti sebagai anggota member. Terima kasih dan sampai jumpa',
          );
        } else if (Get.currentRoute == '/changePassword') {
          successSnackbar(
            'Ganti Password Berhasil',
            'Password berhasil diganti. Silahkan lakukan log in ulang',
          );
        } else {
          infoSnackbar(
            'Log Out Berhasil',
            'Anda sudah berhasil log out',
          );
        }
        Get.offAllNamed('/dashboard');
      }
    } on DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Log Out Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    }
  }

  void myLocation() async {
    mapController.value = await googleMapController.value.future;
    await mapController.value?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            lat.value!,
            long.value!,
          ),
          zoom: 15,
        ),
      ),
    );
  }

  Future<void> refreshHome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () async {
      if (token.value != null) {
        profile.value = null;
        await fetchProfile();
      }
      await sendFcmToken();
      googleMapController.value = Completer();
      storeLoading.value = true;
      await fetchLocation();
    });
  }
}
