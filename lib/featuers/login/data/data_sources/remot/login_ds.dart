import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/sinUp/data/models/UserModel.dart';
import 'package:injectable/injectable.dart';

import '../../models/request_data.dart';
@injectable
abstract class LoginDataSource{
  Future<Either<UserModel,Failures>>login(LoginRequestData loginRequestData);
}