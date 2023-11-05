import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/request_data.dart';

abstract class SignUpRepo {
  Future<Either<UserEntity,Failures>> sinUp(SignUpRequestData requestData);
}
