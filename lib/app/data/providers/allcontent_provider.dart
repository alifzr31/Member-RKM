import 'package:dio/dio.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';

class AllContentProvider extends DioClient {
  Future<Response> fetchAllContent() async {
    return await get(EndPoint.content);
  }
}