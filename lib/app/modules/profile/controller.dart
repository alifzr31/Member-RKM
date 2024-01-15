import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:member_rkm/app/core/values/app_helpers.dart';
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/models/village.dart';
import 'package:member_rkm/app/data/providers/profile_provider.dart';
import 'package:member_rkm/app/modules/dashboard/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final ProfileProvider profileProvider;

  ProfileController({required this.profileProvider});

  final userController = Get.find<DashboardController>();

  final village = <Village>[].obs;
  final villageLoading = true.obs;

  final profileImage = Rx<XFile?>(null);
  final enabledEditAccount = false.obs;
  final enabledEditPersonal = false.obs;
  final showEmail = false.obs;
  final showPhoneNumber = false.obs;

  final formKeyEditProfile = GlobalKey<FormState>().obs;
  final noTelpController = TextEditingController().obs;
  final namaController = TextEditingController().obs;
  final tempatLahirController = TextEditingController().obs;
  final tglLahirController = TextEditingController().obs;
  final selectedTglLahir = Rx<DateTime?>(null);
  final alamatController = TextEditingController().obs;
  final kelurahanController = TextEditingController().obs;
  final selectedKelurahan = Rx<String?>(null);
  final selectedJk = Rx<String?>(null);
  final jenisKelamin = [
    'Laki-Laki',
    'Perempuan',
  ].obs;
  final selectedAgama = Rx<String?>(null);
  final agama = [
    'Islam',
    'Protestan',
    'Katolik',
    'Konghucu',
    'Hindu',
    'Buddha',
  ].obs;
  final selectedIdType = Rx<String?>(null);
  final idType = [
    'KTP',
    'SIM',
  ].obs;
  final noIdentitasController = TextEditingController().obs;
  final selectedPendidikan = Rx<String?>(null);
  final pendidikan = [
    'SD',
    'SMP',
    'SMA/K',
    'D3',
    'D4/S1',
    'S2/S3',
  ].obs;
  final selectedPekerjaan = Rx<String?>(null);
  final pekerjaan = [
    'Umum',
    'Kontraktor',
    'Tukang',
    'Mandor',
  ].obs;
  final selectedMarital = Rx<String?>(null);
  final marital = [
    'Menikah',
    'Belum Menikah',
  ].obs;
  final errorMarital = false.obs;

  final formKeyChangePassword = GlobalKey<FormState>().obs;
  final currentPassword = Rx<String?>(null);
  final currentPasswordController = TextEditingController().obs;
  final obscureCurrentPassword = true.obs;
  final newPasswordController = TextEditingController().obs;
  final obscureNewPassword = true.obs;
  final confirmPasswordController = TextEditingController().obs;
  final obscureConfirmPassword = true.obs;

  final currentPageDeleteAccount = 0.obs;
  final pageController = PageController().obs;
  final formKeyQuestion = GlobalKey<FormState>().obs;
  final reasonController = TextEditingController().obs;

  @override
  void onInit() async {
    if (Get.currentRoute == '/editProfile') {
      if (userController.profile.value != null) {
        noTelpController.value.text =
            userController.profile.value?.phoneNumber ?? '';
        namaController.value.text = userController.profile.value?.name ?? '';
        tempatLahirController.value.text =
            userController.profile.value?.birthPlace ?? '';
        selectedTglLahir.value = userController.profile.value?.birthDate;
        if (userController.profile.value?.birthDate != null) {
          tglLahirController.value.text = AppHelpers.dateFormat(
              userController.profile.value?.birthDate ?? DateTime(0000));
        }
        selectedJk.value = userController.profile.value?.gender;
        alamatController.value.text =
            userController.profile.value?.street ?? '';
        kelurahanController.value.text =
            userController.profile.value?.village ?? '';
        if (userController.profile.value?.addOn?.villageId != null) {
          selectedKelurahan.value =
              userController.profile.value?.addOn?.villageId.toString();
        }
        selectedAgama.value = userController.profile.value?.religion;
        selectedIdType.value = userController.profile.value?.idType;
        noIdentitasController.value.text =
            userController.profile.value?.idNumber ?? '';
        selectedPendidikan.value = userController.profile.value?.lastEducation;
        selectedPekerjaan.value = userController.profile.value?.job;
        selectedMarital.value = userController.profile.value?.maritalStatus;
      }
    }

    if (Get.currentRoute == '/changePassword') {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      currentPassword.value = sharedPreferences.getString('password');
    }
    super.onInit();
  }

  @override
  void onClose() {
    village.clear();
    profileImage.value = null;
    noTelpController.value.dispose();
    namaController.value.dispose();
    tempatLahirController.value.dispose();
    tglLahirController.value.dispose();
    alamatController.value.dispose();
    kelurahanController.value.dispose();
    noIdentitasController.value.dispose();
    currentPasswordController.value.dispose();
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
    pageController.value.dispose();
    reasonController.value.dispose();
    super.onClose();
  }

  Future<void> fetchVillage(address) async {
    try {
      final response = await profileProvider.fetchVillage(address);

      if (response.statusCode == 200) {
        final List<Village> body = response.data['data'] == null
            ? []
            : listVillageFromJson(jsonEncode(response.data['data']));

        village.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Load Kelurahan Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    } finally {
      villageLoading.value = false;
      update();
    }
  }

  void editProfile() async {
    final formData = dio.FormData.fromMap({
      '_method': 'PUT',
      if (profileImage.value != null)
        'image':
            await dio.MultipartFile.fromFile(profileImage.value?.path ?? ''),
      if (userController.profile.value?.phoneNumber == null ||
          noTelpController.value.text !=
              userController.profile.value?.phoneNumber)
        'phone_number': noTelpController.value.text,
      'name': namaController.value.text,
      'birth_place': tempatLahirController.value.text,
      'birth_date': selectedTglLahir.value,
      'gender': selectedJk.value,
      'street': alamatController.value.text,
      'village': selectedKelurahan.value,
      'religion': selectedAgama.value,
      'id_type': selectedIdType.value,
      'id_number': noIdentitasController.value.text,
      'last_education': selectedPendidikan,
      'job': selectedPekerjaan,
      'marital_status': selectedMarital.value,
    });

    showLoading();

    try {
      final response = await profileProvider.editProfile(formData);

      if (response.statusCode == 200) {
        Get.back();
        successSnackbar(
          'Edit Profil Berhasil',
          'Profil anda berhasil diperbaharui',
        );
        Get.offAllNamed('/dashboard');
        await userController.fetchProfile();
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 422) {
        infoSnackbar(
          'Ubah Profil Gagal',
          e.response?.data.toString() ?? '',
        );
      } else {
        failedSnackbar(
          'Ubah Profil Gagal',
          'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
        );
      }
    }
  }

  void changePassword() async {
    final formData = dio.FormData.fromMap({
      '_method': 'PUT',
      'old_password': currentPasswordController.value.text,
      'new_password': newPasswordController.value.text,
      'new_password_confirmation': confirmPasswordController.value.text,
    });

    showLoading();

    try {
      final response = await profileProvider.changePassword(formData);

      if (response.statusCode == 200) {
        Get.back();

        final userController = Get.find<DashboardController>();
        userController.logout();
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Ganti Password Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    }
  }
}
