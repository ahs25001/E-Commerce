import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/data/data_sources/remot/home_ds.dart';
import 'package:e_commerce/featuers/home/data/models/AddToCartResponse.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';
import 'package:e_commerce/featuers/home/data/models/ProductModel.dart';
import 'package:e_commerce/featuers/home/data/models/RemoveResponse.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce/featuers/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
@Injectable(as:HomeRepo )
class HomeRepoImpl extends HomeRepo {
  HomeDs homeDs;

  HomeRepoImpl(this.homeDs);

  @override
  Future<Either<List<CategoryEntity>?, Failures>> getCategory()  =>homeDs.getCategory();
  Future<Either<List<CategoryEntity>?, Failures>> getBrands()  =>homeDs.getBrands();

  @override
  Future<Either<List<CategoryEntity>?, Failures>> getSubCategory(
      String categoryId) {
    return homeDs.getSubCategory(categoryId);
  }

  @override
  Future<Either<ProductModel?, Failures>> getProduct(String subCategoryId) {
    return homeDs.getProduct(subCategoryId);
  }

  @override
  Future<Either<ProductEntity?, Failures>> getWishList() {
    return homeDs.getWishList();
  }

  @override
  Future<Either<AddToWishResponse?, Failures>> addToWishList(
      String productId) {
    return homeDs.addToWishList( productId);
  }

  @override
  Future<Either<RemoveResponse?, Failures>> removeFromWishList(
       String productId) {
    return homeDs.removeFromWishList(productId);
  }

  @override
  Future<Either<AddToCartResponse?, Failures>> addToCart(String productId) =>homeDs.addToCart(productId);
}