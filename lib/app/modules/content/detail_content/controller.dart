import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/models/content.dart';
import 'package:member_rkm/app/data/providers/detailcontent_provider.dart';

class DetailContentController extends GetxController {
  final DetailContentProvider detailContentProvider;

  DetailContentController({required this.detailContentProvider});

  final title = Rx<String?>(null);
  final slug = Rx<String?>(null);
  final date = Rx<String?>(null);
  final category = Rx<String?>(null);
  final detailContent = Rx<Content?>(null);

  @override
  void onInit() {
    title.value = Get.arguments['title'];
    slug.value = Get.arguments['slug'];
    date.value = Get.arguments['date'];
    category.value = Get.arguments['category'];
    fetchDetailContent();
    super.onInit();
  }

  @override
  void onClose() {
    title.value = null;
    slug.value = null;
    date.value = null;
    detailContent.value = null;
    super.onClose();
  }

  Future<void> fetchDetailContent() async {
    try {
      final response =
          await detailContentProvider.fetchDetailContent(slug.value);

      if (response.statusCode == 200) {
        detailContent.value =
            contentFromJson(jsonEncode(response.data['data']));
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Load Konten Gagal',
        'Ups sepertinya terjadi kesalahan. code(${e.response?.statusCode})',
      );
    } finally {
      update();
    }
  }
}
