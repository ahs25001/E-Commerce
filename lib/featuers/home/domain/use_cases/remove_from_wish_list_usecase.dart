import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/RemoveResponse.dart';

class RemoveFromWishListUseCase {
  HomeRepo homeRepo;

  RemoveFromWishListUseCase(this.homeRepo);

  Future<Either<RemoveResponse?, Failures>> call(
           String productId) =>
      homeRepo.removeFromWishList(productId);
}
