import 'package:dio/dio.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';

class PinProvider extends DioClient {
  Future<Response> updatePin(FormData formData) async {
    return await post(EndPoint.pinUpdate, data: formData);
  }

  Future<Response> checkPin(FormData formData) async {
    return await post(EndPoint.pinCheck, data: formData);
  }
}