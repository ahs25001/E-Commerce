import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';

import '../../models/UserModel.dart';
import '../../models/request_data.dart';

abstract class RemoteDataSource{
  Future<Either<UserModel,Failures>>signUp(SignUpRequestData requestData);
}