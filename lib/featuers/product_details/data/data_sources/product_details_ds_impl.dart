import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/core/utils/app_constants.dart';
import 'package:e_commerce/featuers/home/data/models/AddToWishResponse.dart';
import 'package:e_commerce/featuers/home/data/models/ProductModel.dart';
import 'package:e_commerce/featuers/product_details/data/data_sources/product_ds.dart';

import '../../../home/data/models/RemoveResponse.dart';

class ProductDetailsDSImpl extends ProductDetailsDs {
  ApiManager apiManager;

  ProductDetailsDSImpl(this.apiManager);

  @override
  Future<Either<List<String?>?, Failures>> getWishListIds() async {
    try {
      Response response = await apiManager.getData(
          endPoint: EndPoints.getWishList,
          headers: {"token": AppConstants.token});
      ProductModel productModel = ProductModel.fromJson(response.data);
      var ids = productModel.data?.map((e) => e.id).toList();
      return Left(ids);
    } catch (e) {
      if (e.toString() ==
          "DioException [connection error]: The connection errored: Failed host lookup: 'ecommerce.routemisr.com'\nError: SocketException: Failed host lookup: 'ecommerce.routemisr.com' (OS Error: No address associated with hostname, errno = 7)") {
        return Right(RemoteFailures("Check Network"));
      }
      return Right(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<AddToWishResponse, Failures>> addToWishListIds(String productId) async {
    try {
      Response response = await apiManager.postData(
          endPoint: EndPoints.addToWishList,
          headers: {"token": AppConstants.token}, body: {"productId": productId});
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
  Future<Either<RemoveResponse?, Failures>> removeFromWishList(String productId) async {
    try {
      Response response = await apiManager.deleteData(
          endPoint: "${EndPoints.removeFromWishList}/$productId",
          headers: {"token": AppConstants.token});
      RemoveResponse removeResponse = RemoveResponse.fromJson(response.data);
      print("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
      return Left(removeResponse);
    } catch (e) {
      print("${e.toString()}RRRRRRRRRRRRRRRRR");
      if (e.toString() ==
          "DioException [connection error]: The connection errored: Failed host lookup: 'ecommerce.routemisr.com'\nError: SocketException: Failed host lookup: 'ecommerce.routemisr.com' (OS Error: No address associated with hostname, errno = 7)") {
        return Right(RemoteFailures("Check Network"));
      }
      return Right(RemoteFailures(e.toString()));
    }
  }
}
