import 'package:dio/dio.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';

class LoginProvider extends DioClient {
  Future<Response> login(FormData formData) async {
    return await post(EndPoint.login, data: formData);
  }
}