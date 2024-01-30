import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../cart/domain/entities/CartProuductEntety.dart';
import '../../../home/data/models/AddToCartResponse.dart';
import '../../../home/data/models/RemoveResponse.dart';

@injectable
abstract class ProductDetailsRpo {
  Future<Either<List<String?>?, Failures>> getWithListIds();

  Future<Either<AddToWishResponse?, Failures>> addToWithListIds(
      String productId);

  Future<Either<RemoveResponse?, Failures>> removeFromWishList(
      String productId);

  Future<Either<AddToCartResponse?, Failures>> addToCart(String productId);

  Future<Either<CartProductEntity, Failures>> upDateCountCartProduct(
      String id, num count);
}
