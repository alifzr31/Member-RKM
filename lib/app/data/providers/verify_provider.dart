import 'package:dio/dio.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';

class VerifyProvider extends DioClient {
  Future<Response> verify(FormData formData) async {
    return await post(EndPoint.verify, data: formData);
  }

  Future<Response> verifyWa(FormData formData) async {
    return await post(EndPoint.verifyWa, data: formData);
  }
}
