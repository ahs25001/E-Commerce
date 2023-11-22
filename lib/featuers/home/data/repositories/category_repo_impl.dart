import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/home/data/data_sources/category_ds.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce/featuers/home/domain/repositories/category_repo.dart';

import '../../../../core/error/failuers.dart';
class CategoryRepoImpl extends CategoryRepo{
  CategoryDs categoryDs;

  CategoryRepoImpl(this.categoryDs);

  @override
  Future<Either<List<CategoryEntity>?, Failures>> getCategory()  =>categoryDs.getCategory();
  Future<Either<List<CategoryEntity>?, Failures>> getBrands()  =>categoryDs.getBrands();

}