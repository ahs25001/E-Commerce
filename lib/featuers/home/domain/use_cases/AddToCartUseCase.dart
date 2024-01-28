import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/AddToCartResponse.dart';

@injectable
class AddToCartUseCase {
  HomeRepo homeRepo;

  AddToCartUseCase(this.homeRepo);

  Future<Either<AddToCartResponse?, Failures>> call(String productId) =>
      homeRepo.addToCart(productId);
}
