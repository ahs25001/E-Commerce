import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/cart/domain/entities/CartProuductEntety.dart';
import 'package:injectable/injectable.dart';
@injectable
abstract class CartDs{
Future<Either<CartProductEntity,Failures>> getCartProducts();
}