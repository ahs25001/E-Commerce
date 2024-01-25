import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/edit_passwoed/data/data_sources/remot/change_password_ds.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';

import '../../domain/repositories/change_password_repo.dart';

class ChangePasswordRepoImpl extends ChangePasswordRepo {
  ChangePasswordDS changePasswordDS;

  ChangePasswordRepoImpl(this.changePasswordDS);

  @override
  Future<Either<UserEntity, Failures>> changePassword(
          {required String currentPassword,
          required String newPassword,
          required String rePassword}) =>
      changePasswordDS.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
          rePassword: rePassword);
}
