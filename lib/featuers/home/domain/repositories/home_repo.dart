import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/Data.dart';
import '../../data/models/ProductModel.dart';

abstract class HomeRepo{
  Future<Either<List<CategoryEntity>?, Failures>>getCategory();
  Future<Either<List<CategoryEntity>?, Failures>>getSubCategory(String categoryId);
  Future<Either<List<CategoryEntity>?, Failures>>getBrands();
  Future<Either<ProductModel?, Failures>> getProduct(String subCategoryId);
}