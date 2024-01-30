import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
import '../../../cart/domain/entities/CartProuductEntety.dart';
import '../../../home/data/models/AddToCartResponse.dart';
import '../../../home/data/models/RemoveResponse.dart';

@injectable
abstract class ProductDetailsDs {
  Future<Either<List<String?>?, Failures>> getWishListIds();

  Future<Either<AddToWishResponse?, Failures>> addToWishListIds(
      String productId);

  Future<Either<RemoveResponse?, Failures>> removeFromWishList(
      String productId);

  Future<Either<AddToCartResponse?, Failures>> addToCart(String productId);

  Future<Either<CartProductEntity, Failures>> upDateCountCartProduct(
      String id, num count);
}
