import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/core/utils/app_constants.dart';
import 'package:e_commerce/featuers/cart/data/models/CartProductModel.dart';
import 'package:e_commerce/featuers/cart/domain/entities/CartProuductEntety.dart';
import 'package:injectable/injectable.dart';

import 'cart_ds.dart';

@Injectable(as: CartDs)
class CartDsImpl extends CartDs {
  ApiManager apiManager;

  CartDsImpl(this.apiManager);

  @override
  Future<Either<CartProductEntity, Failures>> getCartProducts() async {
    try {
      Response response = await apiManager.getData(
          endPoint: EndPoints.getCartProducts,
          headers: {"token": AppConstants.token});
      CartProductModel cartProductModel =
          CartProductModel.fromJson(response.data);
      return Left(cartProductModel);
    } catch (e) {
      print(e.toString());
      String massage;
      if (e.toString() ==
          "DioException [bad response]: The request returned an invalid status code of 404.") {
        massage = "Your cart is empty";
      } else {
        massage = e.toString();
      }
      return Right(RemoteFailures(massage));
    }
  }

  @override
  Future<Either<CartProductEntity, Failures>> upDateCountCartProduct(String id,num count)async {
  try{
    Response response = await apiManager.putData(
        endPoint: "${EndPoints.getCartProducts}/$id",
        headers: {"token": AppConstants.token},body: {"count":count});
    CartProductModel cartProductModel =
    CartProductModel.fromJson(response.data);
    return Left(cartProductModel);

  }catch(e){
    return Right(RemoteFailures(e.toString()));
  }
  }

  @override
  Future<Either<String, Failures>> clearCart()async {
    try {
       await apiManager.deleteData(
          endPoint: EndPoints.getCartProducts,
          headers: {"token": AppConstants.token});
      return const Left("Success");
    } catch (e) {
      return Right(RemoteFailures(e.toString()));
    }
  }
}
