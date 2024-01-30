import 'package:dartz/dartz.dart';
import 'package:e_commerce/featuers/cart/domain/repositories/CartRepo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
@injectable
class ClearCartUseCase{
  CartRepo cartRepo;

  ClearCartUseCase(this.cartRepo);
  Future<Either<String, Failures>> call()=>cartRepo.clearCart();
}