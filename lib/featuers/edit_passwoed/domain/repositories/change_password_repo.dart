import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';

abstract class ChangePasswordRepo {
  Future<Either<UserEntity, Failures>> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String rePassword});
}
