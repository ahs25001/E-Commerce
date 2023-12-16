import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';

import '../../../../core/error/failuers.dart';
import '../../../home/data/models/RemoveResponse.dart';

abstract class ProductDetailsDs {
  Future<Either<List<String?>?, Failures>> getWishListIds();

  Future<Either<AddToWishResponse?, Failures>> addToWishListIds(
      String productId);

  Future<Either<RemoveResponse?, Failures>> removeFromWishList(
      String productId);
}
