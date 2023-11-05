import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/login/data/models/request_data.dart';
import 'package:e_commerce/featuers/sinUp/data/models/UserModel.dart';

import 'login_ds.dart';

class LoginDataSourceImpl implements LoginDataSource {
  ApiManager apiManager;

  LoginDataSourceImpl(this.apiManager);

  @override
  Future<Either<UserModel,Failures>> login(LoginRequestData loginRequestData) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.singIn, body: loginRequestData.toJson());
      UserModel userModel = UserModel.fromJson(response.data);
      return Left(userModel);
    }catch(e){
      return Right(RemoteFailures(e.toString()));
    }
  }
}
