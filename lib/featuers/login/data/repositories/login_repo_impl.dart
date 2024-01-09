import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/login/data/data_sources/local/login_local_ds.dart';
import 'package:e_commerce/featuers/login/data/data_sources/remot/login_ds.dart';
import 'package:e_commerce/featuers/login/data/models/request_data.dart';
import 'package:e_commerce/featuers/login/domain/repositories/login_repo.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';

class LoginRepoImpl extends LoginRepo {
  LoginDataSource loginDataSource;
  LoginLocalDs loginLocalDS;

  LoginRepoImpl(this.loginDataSource, this.loginLocalDS);

  @override
  Future<Either<UserEntity, Failures>> login(
      LoginRequestData loginRequestData) async {
    var result = await loginDataSource.login(loginRequestData);
    if (result.isLeft()) {
      result.fold((l){
        loginLocalDS.setToken(l.token ?? "");
        loginLocalDS.setEmail(l.user?.email ?? "");
        loginLocalDS.setName(l.user?.name ?? "");
      }, (r) => null);
    }
    else {
      print("+++++++++++++++++++++++++++++++");
    }
    return result;
  }
}
