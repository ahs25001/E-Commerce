import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';

import '../../../home/data/models/RemoveResponse.dart';

abstract class ProductDetailsRpo {
  Future<Either<List<String?>?, Failures>> getWithListIds();

  Future<Either<AddToWishResponse?, Failures>> addToWithListIds(
      String productId);

  Future<Either<RemoveResponse?, Failures>> removeFromWishList(
      String productId);
}
