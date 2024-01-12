import 'package:dio/dio.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';

class ProfileProvider extends DioClient {
  Future<Response> fetchVillage(address) async {
    return await get(
      EndPoint.village,
      queryParams: {'address': address},
    );
  }

  Future<Response> editProfile(FormData formData) async {
    return await post(EndPoint.editProfile, data: formData);
  }

  Future<Response> changePassword(FormData formData) async {
    return await post(EndPoint.changePassword, data: formData);
  }
}
