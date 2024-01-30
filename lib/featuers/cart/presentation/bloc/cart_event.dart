part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class GetProductsInCartEvent extends CartEvent {}

class DeleteProductFromCartEvent extends CartEvent {}

class UpDateCountEvent extends CartEvent {
  String id;
  num count;

  UpDateCountEvent({required this.id, required this.count});
}
class ClearCartEvent extends CartEvent{}
