import 'package:dartz/dartz.dart';

import '../../../../../core/error/failuers.dart';
import '../../../../sinUp/domain/entities/UserEntity.dart';

abstract class ChangePasswordDS {
  Future<Either<UserEntity, Failures>> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String rePassword});
}
