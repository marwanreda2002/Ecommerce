import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_constant.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final Dio dio = Dio();

  // https://ecommerce.routemisr.com/api/v1/auth/signup

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: (status) => true, headers: headers));
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Object? body,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(ApiConstant.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: (status) => true, headers: headers),
        data: body);
  }
}
