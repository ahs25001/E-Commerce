import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:injectable/injectable.dart';

import '../../models/UserModel.dart';
import '../../models/request_data.dart';
@injectable
abstract class RemoteDataSource{
  Future<Either<UserModel,Failures>>signUp(SignUpRequestData requestData);
}