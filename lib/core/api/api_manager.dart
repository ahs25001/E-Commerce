import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../utils/app_constants.dart';
@singleton
class ApiManager {
  Dio dio = Dio();

  Future<Response> getData(
      {required String endPoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers}) {
    return dio.get(AppConstants.baseUrl + endPoint,
        queryParameters: data, options: Options(headers: headers));
  }

  Future<Response> postData(
      {required String endPoint,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) {
    return dio.post(AppConstants.baseUrl + endPoint,
        data: body, options: Options(headers: headers));
  }

  Future<Response> deleteData(
      {required String endPoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    return dio.delete(AppConstants.baseUrl + endPoint,
        data: body, options: Options(headers: headers));
  }

  Future<Response> putData(
      {required String endPoint,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    return dio.put(AppConstants.baseUrl + endPoint,
        data: body, options: Options(headers: headers));
  }
}
