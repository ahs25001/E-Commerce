import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/cart/domain/repositories/CartRepo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
import '../entities/CartProuductEntety.dart';

@injectable
class GetCartProductsUseCase {
  CartRepo cartRepo;

  GetCartProductsUseCase(this.cartRepo);

  Future<Either<CartProductEntity, Failures>> call() =>
      cartRepo.getCartProduct();
}
