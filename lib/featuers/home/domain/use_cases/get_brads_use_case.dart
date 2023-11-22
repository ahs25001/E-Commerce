import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce/featuers/home/domain/repositories/category_repo.dart';

import '../../../../core/error/failuers.dart';

class GetBrandsUseCase{
  CategoryRepo categoryRepo;

  GetBrandsUseCase(this.categoryRepo);
  Future<Either<List<CategoryEntity>?, Failures>> call()=>categoryRepo.getBrands();
}