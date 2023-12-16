import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';
import 'package:e_commerce/featuers/home/data/models/RemoveResponse.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce/featuers/home/domain/entities/ProductEntity.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/Data.dart';
import '../../data/models/ProductModel.dart';

abstract class HomeRepo{
  Future<Either<List<CategoryEntity>?, Failures>>getCategory();
  Future<Either<List<CategoryEntity>?, Failures>>getSubCategory(String categoryId);
  Future<Either<List<CategoryEntity>?, Failures>>getBrands();
  Future<Either<ProductEntity?, Failures>> getProduct(String subCategoryId);
  Future<Either<ProductEntity?, Failures>> getWishList();
  Future<Either<AddToWishResponse?, Failures>> addToWishList(String productId);
  Future<Either<RemoveResponse?, Failures>> removeFromWishList(String productId);
}