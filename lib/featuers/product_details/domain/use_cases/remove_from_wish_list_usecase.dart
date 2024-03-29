import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/data/models/RemoveResponse.dart';
import 'package:e_commerce/featuers/product_details/domain/repositories/product_details_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
@injectable
class DeleteFromWishListUseCase {
  ProductDetailsRpo productDetailsRpo;

  DeleteFromWishListUseCase(this.productDetailsRpo);

  Future<Either<RemoveResponse?, Failures>> call(String productId) =>
      productDetailsRpo.removeFromWishList(productId);
}
