import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';
import 'package:dio/dio.dart';

class ShoppingProvider extends DioClient {
  Future<Response> fetchShoppingHistory() async {
    return await get(EndPoint.shoppingHistory);
  }

  Future<Response> fetchDetailShoppingHistory(docnum) async {
    return await get('${EndPoint.shoppingHistory}/$docnum');
  }
}