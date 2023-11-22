import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';

import '../models/CategoryResponse.dart';
import '../models/Data.dart';

abstract class CategoryDs{
  Future<Either<List<CategoryModel>?,Failures>> getCategory();
  Future<Either<List<CategoryModel>?,Failures>> getBrands();
}