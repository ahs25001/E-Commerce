import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/cart/domain/repositories/CartRepo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
import '../entities/CartProuductEntety.dart';

@injectable
class UpDateCountUseCase {
  CartRepo cartRepo;

  UpDateCountUseCase(this.cartRepo);

  Future<Either<CartProductEntity, Failures>> call(String id, num count) =>
      cartRepo.upDateCountCartProduct(id, count);
}
