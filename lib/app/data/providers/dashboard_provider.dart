import 'package:dio/dio.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';

class DashboardProvider extends DioClient {
  Future<Response> sendFcmToken(String deviceToken, String userDevice) async {
    return await get(
      EndPoint.fcmToken,
      headers: {
        'Device-Token': deviceToken,
        'User-Device': userDevice,
      },
    );
  }

  Future<Response> fetchProfile() async {
    return await get(EndPoint.account);
  }

  Future<Response> fetchContent() async {
    return await get(EndPoint.content);
  }

  Future<Response> fetchStore(lat, long) async {
    return await get(
      EndPoint.store,
      queryParams: {
        'lat': lat,
        'long': long,
      },
    );
  }

  Future<Response> logout() async {
    return await post(EndPoint.logout);
  }
}
