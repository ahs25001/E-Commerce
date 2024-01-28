part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class GetProductsInCartEvent extends CartEvent {}

class DeleteProductFromCartEvent extends CartEvent {}
