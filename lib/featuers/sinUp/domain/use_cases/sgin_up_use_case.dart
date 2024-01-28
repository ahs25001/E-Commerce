import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';
import 'package:e_commerce/featuers/sinUp/domain/repositories/sgin_up_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/request_data.dart';
@injectable
class SignUpUseCase {
  SignUpRepo signUpRepo;

  SignUpUseCase(this.signUpRepo);

  Future<Either<UserEntity,Failures>> call(SignUpRequestData requestData) => signUpRepo.sinUp(requestData);
}
