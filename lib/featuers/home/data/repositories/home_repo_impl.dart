import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/data/data_sources/remot/home_ds.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';
import 'package:e_commerce/featuers/home/data/models/ProductModel.dart';
import 'package:e_commerce/featuers/home/data/models/RemoveResponse.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce/featuers/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';

import '../../../../core/error/failuers.dart';

class HomeRepoImpl extends HomeRepo {
  HomeDs categoryDs;

  HomeRepoImpl(this.categoryDs);

  @override
  Future<Either<List<CategoryEntity>?, Failures>> getCategory()  =>categoryDs.getCategory();
  Future<Either<List<CategoryEntity>?, Failures>> getBrands()  =>categoryDs.getBrands();

  @override
  Future<Either<List<CategoryEntity>?, Failures>> getSubCategory(
      String categoryId) {
    return categoryDs.getSubCategory(categoryId);
  }

  @override
  Future<Either<ProductModel?, Failures>> getProduct(String subCategoryId) {
    return categoryDs.getProduct(subCategoryId);
  }

  @override
  Future<Either<ProductEntity?, Failures>> getWishList() {
    return categoryDs.getWishList();
  }

  @override
  Future<Either<AddToWishResponse?, Failures>> addToWishList(
      String productId) {
    return categoryDs.addToWishList( productId);
  }

  @override
  Future<Either<RemoveResponse?, Failures>> removeFromWishList(
       String productId) {
    return categoryDs.removeFromWishList(productId);
  }
}