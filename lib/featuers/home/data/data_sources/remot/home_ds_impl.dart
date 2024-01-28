import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/home/data/data_sources/remot/home_ds.dart';
import 'package:e_commerce/featuers/home/data/models/AddToCartResponse.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';
import 'package:e_commerce/featuers/home/data/models/CategoryResponse.dart';
import 'package:e_commerce/featuers/home/data/models/ProductModel.dart';
import 'package:e_commerce/featuers/home/data/models/RemoveResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../models/Data.dart';

@Injectable(as: HomeDs)
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
      if (e.toString() ==
          "DioException [connection error]: The connection errored: Failed host lookup: 'ecommerce.routemisr.com'\nError: SocketException: Failed host lookup: 'ecommerce.routemisr.com' (OS Error: No address associated with hostname, errno = 7)") {
        return Right(RemoteFailures("Check Network"));
      }
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
      print("brands : ${e.toString()}");
      if (e.toString() ==
          "DioException [connection error]: The connection errored: Failed host lookup: 'ecommerce.routemisr.com'\nError: SocketException: Failed host lookup: 'ecommerce.routemisr.com' (OS Error: No address associated with hostname, errno = 7)") {
        return Right(RemoteFailures("Check Network"));
      }
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<List<CategoryModel>?, Failures>> getSubCategory(String categoryId) async {
    try {
      Response response = await apiManager.getData(
          endPoint: "/api/v1/categories/$categoryId/subcategories");
      CategoryResponse categoryResponse =
      CategoryResponse.fromJson(response.data);
      return Left(categoryResponse.data);
    } catch (e) {
      if (e.toString() ==
          "DioException [connection error]: The connection errored: Failed host lookup: 'ecommerce.routemisr.com'\nError: SocketException: Failed host lookup: 'ecommerce.routemisr.com' (OS Error: No address associated with hostname, errno = 7)") {
        return Right(RemoteFailures("Check Network"));
      }
      return Right(RemoteFailures(e.toString()));
    }
  }

  Future<Either<ProductModel?, Failures>> getProduct(String subCategoryId) async {
    try {
      Response response = await apiManager.getData(
          endPoint: EndPoints.getProducts,
          data: {"subcategory[_id]": subCategoryId});
      ProductModel productModel = ProductModel.fromJson(response.data);
      return Left(productModel);
    } catch (e) {
      if (e.toString() ==
          "DioException [connection error]: The connection errored: Failed host lookup: 'ecommerce.routemisr.com'\nError: SocketException: Failed host lookup: 'ecommerce.routemisr.com' (OS Error: No address associated with hostname, errno = 7)") {
        return Right(RemoteFailures("Check Network"));
      }
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<ProductModel?, Failures>> getWishList() async {
    try {
      Response response = await apiManager
          .getData(endPoint: EndPoints.getWishList, headers: {"token": AppConstants.token});
      ProductModel productModel = ProductModel.fromJson(response.data);
      return Left(productModel);
    } catch (e) {
      if (e.toString() ==
          "DioException [connection error]: The connection errored: Failed host lookup: 'ecommerce.routemisr.com'\nError: SocketException: Failed host lookup: 'ecommerce.routemisr.com' (OS Error: No address associated with hostname, errno = 7)") {
        return Right(RemoteFailures("Check Network"));
      }
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<AddToWishResponse?, Failures>> addToWishList(String productId) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.addToWishList,
          body: {"productId": productId},
          headers: {"token": AppConstants.token});
      AddToWishResponse addToWishResponse =
      AddToWishResponse.fromJson(response.data);
      return Left(addToWishResponse);
    } catch (e) {
      if (e.toString() ==
          "DioException [connection error]: The connection errored: Failed host lookup: 'ecommerce.routemisr.com'\nError: SocketException: Failed host lookup: 'ecommerce.routemisr.com' (OS Error: No address associated with hostname, errno = 7)") {
        return Right(RemoteFailures("Check Network"));
      }
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<RemoveResponse?, Failures>> removeFromWishList(String productId) async {
    try {
      Response response = await apiManager.deleteData(
          endPoint: "${EndPoints.removeFromWishList}/$productId",
          headers: {"token": AppConstants.token});
      RemoveResponse removeResponse = RemoveResponse.fromJson(response.data);
      return Left(removeResponse);
    } catch (e) {
      if (e.toString() ==
          "DioException [connection error]: The connection errored: Failed host lookup: 'ecommerce.routemisr.com'\nError: SocketException: Failed host lookup: 'ecommerce.routemisr.com' (OS Error: No address associated with hostname, errno = 7)") {
        return Right(RemoteFailures("Check Network"));
      }
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<AddToCartResponse?, Failures>> addToCart(
      String productId) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.addToCart,
          body: {"productId": productId},
          headers: {"token": AppConstants.token});
      AddToCartResponse addToCartResponse =
          AddToCartResponse.fromJson(response.data);
      return Left(addToCartResponse);
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }
}
