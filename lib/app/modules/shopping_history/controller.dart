import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/models/detail_shoppinghistory.dart';
import 'package:member_rkm/app/data/models/shopping_history.dart';
import 'package:member_rkm/app/data/providers/shopping_provider.dart';

class ShoppingController extends GetxController {
  final ShoppingProvider shoppingProvider;

  ShoppingController({required this.shoppingProvider});

  final shoppingLoading = true.obs;
  final shoppingHistory = <ShoppingHistory>[].obs;

  final docnum = Rx<String?>(null);
  final date = Rx<DateTime?>(null);
  final total = Rx<int?>(null);

  final detailShoppingLoading = false.obs;
  final detailShoppingHistory = <DetailShoppingHistory>[].obs;

  @override
  void onInit() {
    fetchShoppingHistory();
    super.onInit();
  }

  @override
  void onClose() {
    shoppingHistory.clear();
    detailShoppingHistory.clear();
    super.onClose();
  }

  Future<void> fetchShoppingHistory() async {
    try {
      final response = await shoppingProvider.fetchShoppingHistory();

      if (response.statusCode == 200) {
        final List<ShoppingHistory> body = response.data['data'] == null
            ? []
            : listShoppingHistoryFromJson(jsonEncode(response.data['data']));

        shoppingHistory.value = body;
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code(${e.response?.statusCode})',
      );
    } finally {
      shoppingLoading.value = false;
      update();
    }
  }

  Future<void> fetchDetailShoppingHistory() async {
    detailShoppingLoading.value = true;

    try {
      final response =
          await shoppingProvider.fetchDetailShoppingHistory(docnum.value);

      if (response.statusCode == 200) {
        final List<DetailShoppingHistory> body = response.data['data'] == null
            ? []
            : listDetailShoppingHistoryFromJson(
                jsonEncode(response.data['data']));

        detailShoppingHistory.value = body;
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code(${e.response?.statusCode})',
      );
    } finally {
      detailShoppingLoading.value = false;
      update();
    }
  }

  Future<void> refreshShoppingHistory() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      shoppingLoading.value = true;
      fetchShoppingHistory();
    });
  }
}
