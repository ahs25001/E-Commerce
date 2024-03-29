import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/cart/domain/entities/CartProuductEntety.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class CartRepo {
  Future<Either<CartProductEntity, Failures>> getCartProduct();

  Future<Either<CartProductEntity, Failures>> upDateCountCartProduct(
      String id, num count);

  Future<Either<String, Failures>> clearCart();
}
