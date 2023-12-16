import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';
import 'package:e_commerce/featuers/home/data/models/RemoveResponse.dart';

import '../../models/CategoryResponse.dart';
import '../../models/Data.dart';
import '../../models/ProductModel.dart';

abstract class HomeDs{
  Future<Either<List<CategoryModel>?,Failures>> getCategory();
  Future<Either<List<CategoryModel>?,Failures>> getSubCategory(String categoryId);
  Future<Either<List<CategoryModel>?,Failures>> getBrands();
  Future<Either<ProductModel?, Failures>> getProduct(String subCategoryId);
  Future<Either<ProductModel?, Failures>> getWishList();
  Future<Either<AddToWishResponse?, Failures>> addToWishList(String productId);
  Future<Either<RemoveResponse?, Failures>> removeFromWishList(String productId);
}