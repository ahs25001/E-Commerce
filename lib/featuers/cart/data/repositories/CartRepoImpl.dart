import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/cart/domain/repositories/CartRepo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
import '../../domain/entities/CartProuductEntety.dart';
import '../data_sources/cart_ds.dart';

@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo {
  CartDs cartDs;

  CartRepoImpl(this.cartDs);

  @override
  Future<Either<CartProductEntity, Failures>> getCartProduct() =>
      cartDs.getCartProducts();

  Future<Either<CartProductEntity, Failures>> upDateCountCartProduct(
          String id, num count) =>
      cartDs.upDateCountCartProduct(id, count);

  @override
  Future<Either<String, Failures>> clearCart() =>cartDs.clearCart();
}
