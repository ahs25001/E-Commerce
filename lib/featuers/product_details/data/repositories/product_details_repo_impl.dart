import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';
import 'package:e_commerce/featuers/product_details/data/data_sources/product_ds.dart';
import 'package:e_commerce/featuers/product_details/domain/repositories/product_details_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../home/data/models/RemoveResponse.dart';
@Injectable(as:ProductDetailsRpo )
class ProductDetailsRepoImpl extends ProductDetailsRpo{
  ProductDetailsDs productDetailsDs;

  ProductDetailsRepoImpl(this.productDetailsDs);

  @override
  Future<Either<List<String?>?, Failures>> getWithListIds() {
    return productDetailsDs.getWishListIds();
  }

  @override
  Future<Either<AddToWishResponse?, Failures>> addToWithListIds(String productId) {
    return productDetailsDs.addToWishListIds(productId);
  }
  Future<Either<RemoveResponse?, Failures>> removeFromWishList(String productId){
    return productDetailsDs.removeFromWishList(productId);
  }
}