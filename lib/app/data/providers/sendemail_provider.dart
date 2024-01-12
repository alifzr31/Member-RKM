import 'package:dio/dio.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';

class SendEmailProvider extends DioClient {
  Future<Response> sendEmail(FormData formData) async {
    return await post(EndPoint.sendEmail, data: formData);
  }
}
