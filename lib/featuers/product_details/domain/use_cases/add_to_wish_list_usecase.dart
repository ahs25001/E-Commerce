import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/product_details/domain/repositories/product_details_repo.dart';

import '../../../../core/error/failuers.dart';
import '../../../home/data/models/AddToWishResponse.dart';

class AddToWishListUseCase {
  ProductDetailsRpo productDetailsRpo;

  AddToWishListUseCase(this.productDetailsRpo);

  Future<Either<AddToWishResponse?, Failures>> call(String productId) =>
      productDetailsRpo.addToWithListIds(productId);
}