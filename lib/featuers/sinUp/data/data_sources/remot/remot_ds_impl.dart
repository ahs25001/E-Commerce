import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/sinUp/data/data_sources/remot/remote_ds.dart';
import 'package:e_commerce/featuers/sinUp/data/models/UserModel.dart';
import 'package:e_commerce/featuers/sinUp/data/models/request_data.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  ApiManager apiManager;

  RemoteDataSourceImpl(this.apiManager);

  @override
  Future<Either<UserModel,Failures>> signUp(SignUpRequestData requestData) async {
    try {
       Response response = await apiManager.postData(
          endPoint: EndPoints.singUp, body: requestData.toJson());
       UserModel userModel = UserModel.fromJson(response.data);
       return Left(userModel);
    } catch (e) {
       return Right(RemoteFailures(e.toString()));
    }
  }
}
