import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/login/data/data_sources/remot/login_ds.dart';
import 'package:e_commerce/featuers/login/data/models/request_data.dart';
import 'package:e_commerce/featuers/login/domain/repositories/login_repo.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';

class LoginRepoImpl extends LoginRepo{
  LoginDataSource loginDataSource;

  LoginRepoImpl(this.loginDataSource);

  @override
  Future<Either<UserEntity,Failures>> login(LoginRequestData loginRequestData) {
    return loginDataSource.login(loginRequestData);
  }

}