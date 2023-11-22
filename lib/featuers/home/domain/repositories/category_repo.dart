import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';

import '../../../../core/error/failuers.dart';
import '../../data/models/Data.dart';

abstract class CategoryRepo{
  Future<Either<List<CategoryEntity>?, Failures>>getCategory();
  Future<Either<List<CategoryEntity>?, Failures>>getBrands();
}