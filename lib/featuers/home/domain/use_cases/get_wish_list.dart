
import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';

import '../../../../core/error/failuers.dart';
import '../entities/ProductEntity.dart';

class GetWishListUseCase {
  HomeRepo homeRepo;

  GetWishListUseCase(this.homeRepo);
  Future<Either<ProductEntity?, Failures>> call (String token)=>homeRepo.getWishList();
}
