import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/home/data/data_sources/category_ds.dart';
import 'package:e_commerce/featuers/home/data/models/CategoryResponse.dart';

import '../models/Data.dart';

class CategoryDSImpl extends CategoryDs {
  ApiManager apiManager;

  CategoryDSImpl(this.apiManager);

  @override
  Future<Either<List<CategoryModel>?, Failures>> getCategory() async {
    try {
      Response response = await apiManager.getData(
          endPoint: EndPoints.categories);
          CategoryResponse categoryResponse =CategoryResponse.fromJson(response.data);
      print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
          return Left(categoryResponse.data);
    } catch (e) {
      print("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<List<CategoryModel>?, Failures>> getBrands() async{

    try {
      Response response = await apiManager.getData(
          endPoint: EndPoints.brands);
      CategoryResponse categoryResponse =CategoryResponse.fromJson(response.data);
      print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBbb");
      return Left(categoryResponse.data);
    } catch (e) {
      print("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ");
      return Right(RemoteFailures(e.toString()));
    }
  }


}