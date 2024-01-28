import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';

import '../../../../core/error/failuers.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoryUseCase{
  HomeRepo categoryRepo;

  GetCategoryUseCase(this.categoryRepo);
  Future<Either<List<CategoryEntity>?, Failures>> call()=>categoryRepo.getCategory();
}