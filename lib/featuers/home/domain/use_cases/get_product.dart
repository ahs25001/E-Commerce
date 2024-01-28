import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/ProductModel.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductUseCase {
  HomeRepo homeRepo;

  GetProductUseCase(this.homeRepo);

  Future<Either<ProductEntity?, Failures>> call(String subCategoryId) =>
      homeRepo.getProduct(subCategoryId);
}
