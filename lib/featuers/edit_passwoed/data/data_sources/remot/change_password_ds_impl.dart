import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/core/utils/app_constants.dart';
import 'package:e_commerce/featuers/edit_passwoed/data/data_sources/remot/change_password_ds.dart';
import 'package:e_commerce/featuers/sinUp/data/models/UserModel.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';

import '../../../../../core/utils/app_strings.dart';

class ChangePasswordDsImpl extends ChangePasswordDS {
  ApiManager apiManager;

  ChangePasswordDsImpl(this.apiManager);

  @override
  Future<Either<UserEntity, Failures>> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String rePassword}) async {
    try {
      Response response = await apiManager
          .putData(endPoint: EndPoints.changePassword, headers: {
        "token": AppConstants.token
      }, body: {
        "currentPassword": currentPassword,
        "password": newPassword,
        "rePassword": rePassword
      });
      UserModel userModel = UserModel.fromJson(response.data);
      return Left(userModel);
    } catch (e) {
      return Right(RemoteFailures(AppStrings.currentPasswordNotCorrect));
    }
  }
}
