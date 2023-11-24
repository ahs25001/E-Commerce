import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/home/data/data_sources/home_ds.dart';
import 'package:e_commerce/featuers/home/data/models/CategoryResponse.dart';
import 'package:e_commerce/featuers/home/data/models/ProductModel.dart';

import '../models/Data.dart';

class HomeDSImpl extends HomeDs {
  ApiManager apiManager;

  HomeDSImpl(this.apiManager);

  @override
  Future<Either<List<CategoryModel>?, Failures>> getCategory() async {
    try {
      Response response =
          await apiManager.getData(endPoint: EndPoints.categories);
      CategoryResponse categoryResponse =
          CategoryResponse.fromJson(response.data);
      return Left(categoryResponse.data);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<List<CategoryModel>?, Failures>> getBrands() async {
    try {
      Response response = await apiManager.getData(endPoint: EndPoints.brands);
      CategoryResponse categoryResponse =
          CategoryResponse.fromJson(response.data);
      return Left(categoryResponse.data);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<List<CategoryModel>?, Failures>> getSubCategory(
      String categoryId) async {
    try {
      Response response = await apiManager.getData(
          endPoint: "/api/v1/categories/$categoryId/subcategories");
      CategoryResponse categoryResponse =
          CategoryResponse.fromJson(response.data);
      return Left(categoryResponse.data);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }

  Future<Either<ProductModel?, Failures>> getProduct(
      String subCategoryId) async {
    try {
      print(subCategoryId);
      Response response = await apiManager.getData(
          endPoint: "${EndPoints.getProducts}[_id]=$subCategoryId");
      print(response.data);
      ProductModel productModel = ProductModel.fromJson(response.data);
      return Left(productModel);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }
}
