import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
import '../../../home/data/models/AddToCartResponse.dart';
import '../../data/data_sources/product_ds.dart';

@injectable
class AddToCartFromProductScreenUseCase{
  ProductDetailsDs productDetailsDs;

  AddToCartFromProductScreenUseCase(this.productDetailsDs);
  Future<Either<AddToCartResponse?, Failures>> call(String productId)=>productDetailsDs.addToCart(productId);
}