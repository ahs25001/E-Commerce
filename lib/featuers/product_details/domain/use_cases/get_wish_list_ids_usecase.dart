import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/product_details/domain/repositories/product_details_repo.dart';

import '../../../../core/error/failuers.dart';

class GetWishListIdsUseCase {
  ProductDetailsRpo productDetailsRpo;

  GetWishListIdsUseCase(this.productDetailsRpo);

  Future<Either<List<String?>?, Failures>> call() =>
      productDetailsRpo.getWithListIds();
}
