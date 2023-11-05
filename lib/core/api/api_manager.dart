import 'package:dio/dio.dart';

import '../utils/app_constants.dart';

class ApiManager {
  Dio dio = Dio();

  Future<Response> getData(
      {required String endPoint, required Map<String, dynamic> data}) {
    return dio.get(AppConstants.baseUrl + endPoint, queryParameters: data);
  }

  Future<Response> postData(
      {required String endPoint, required Map<String, dynamic> body}) {
    return dio.post(AppConstants.baseUrl + endPoint, data: body);
  }
}
