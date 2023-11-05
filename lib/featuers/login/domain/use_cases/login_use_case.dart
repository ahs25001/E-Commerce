import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/login/data/models/request_data.dart';
import 'package:e_commerce/featuers/login/domain/repositories/login_repo.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';

class LoginUseCase {
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<Either<UserEntity,Failures>> call(LoginRequestData loginRequestData) =>
      loginRepo.login(loginRequestData);
}
