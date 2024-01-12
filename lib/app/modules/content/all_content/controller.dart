import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/models/content.dart';
import 'package:member_rkm/app/data/providers/allcontent_provider.dart';

class AllContentController extends GetxController {
  final AllContentProvider allContentProvider;

  AllContentController({required this.allContentProvider});

  final currentTab = 0.obs;
  final event = <Content>[].obs;
  final eventLoading = true.obs;
  final promo = <Content>[].obs;
  final promoLoading = true.obs;

  @override
  void onInit() {
    fetchEvent();
    fetchPromo();
    super.onInit();
  }

  @override
  void onClose() {
    event.clear();
    promo.clear();
    super.onClose();
  }

  Future<void> fetchEvent() async {
    try {
      final response = await allContentProvider.fetchAllContent();

      if (response.statusCode == 200) {
        final List<Content> body = response.data['data'] == null
            ? []
            : listContentFromJson(jsonEncode(response.data['data']));

        event.value = body
            .where((e) => e.category.toString().toLowerCase().contains('event'))
            .toList();
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Load Event Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    } finally {
      eventLoading.value = false;
      update();
    }
  }

  Future<void> fetchPromo() async {
    try {
      final response = await allContentProvider.fetchAllContent();

      if (response.statusCode == 200) {
        final List<Content> body = response.data['data'] == null
            ? []
            : listContentFromJson(jsonEncode(response.data['data']));

        promo.value = body
            .where((e) => e.category.toString().toLowerCase().contains('promo'))
            .toList();
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Load Promo Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    } finally {
      promoLoading.value = false;
      update();
    }
  }

  Future<void> refreshEvent() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      eventLoading.value = true;
      fetchEvent();
    });
  }

  Future<void> refreshPromo() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      promoLoading.value = true;
      fetchPromo();
    });
  }
}
