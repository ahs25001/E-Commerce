import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';

import '../../../../core/error/failuers.dart';
import '../entities/CategoryEntity.dart';

class GetSubCategoryUseCase {
  HomeRepo categoryRepo;

  GetSubCategoryUseCase(this.categoryRepo);

  Future<Either<List<CategoryEntity>?, Failures>> call(String categoryId) =>
      categoryRepo.getSubCategory(categoryId);
}
