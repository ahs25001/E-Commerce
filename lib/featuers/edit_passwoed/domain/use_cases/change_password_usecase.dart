import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/edit_passwoed/domain/repositories/change_password_repo.dart';

import '../../../../core/error/failuers.dart';
import '../../../sinUp/domain/entities/UserEntity.dart';

class ChangePasswordUseCase {
  ChangePasswordRepo changePasswordRepo;

  ChangePasswordUseCase(this.changePasswordRepo);

  Future<Either<UserEntity, Failures>> call(
          {required String currentPassword,
          required String newPassword,
          required String rePassword}) =>
      changePasswordRepo.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
          rePassword: rePassword);
}
