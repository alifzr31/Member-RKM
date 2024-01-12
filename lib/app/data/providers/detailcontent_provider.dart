import 'package:dio/dio.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';

class DetailContentProvider extends DioClient {
  Future<Response> fetchDetailContent(slug) async {
    return await get('${EndPoint.detailContent}/$slug');
  }
}
