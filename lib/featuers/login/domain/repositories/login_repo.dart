import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/request_data.dart';
@injectable
abstract class LoginRepo{
  Future<Either<UserEntity,Failures>>login(LoginRequestData loginRequestData);
}