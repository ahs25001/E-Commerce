import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/product_details/domain/repositories/product_details_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
import '../../../cart/domain/entities/CartProuductEntety.dart';

@injectable
class UpDateCountFromProductScreenUseCase {
  ProductDetailsRpo productDetailsRpo;

  UpDateCountFromProductScreenUseCase(this.productDetailsRpo);

  Future<Either<CartProductEntity, Failures>> call(String id, num count) =>
      productDetailsRpo.upDateCountCartProduct(id, count);
}
