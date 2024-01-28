import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/sinUp/data/data_sources/remot/remote_ds.dart';
import 'package:e_commerce/featuers/sinUp/domain/entities/UserEntity.dart';
import 'package:e_commerce/featuers/sinUp/domain/repositories/sgin_up_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
import '../models/request_data.dart';

@Injectable(as: SignUpRepo)
class SignUpRepoImpl implements SignUpRepo{
  RemoteDataSource remoteDataSource;

  SignUpRepoImpl(this.remoteDataSource);

  @override
  Future<Either<UserEntity,Failures>> sinUp(SignUpRequestData requestData) {
   return remoteDataSource.signUp(requestData);
  }

}