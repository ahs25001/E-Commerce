part of 'cart_bloc.dart';

enum CartScreenStatus {
  loading,
  getCartSuccess,
  getCartFull,
  deleteFromCartSuccess,
  deleteFromCartFull,
  init
}

@immutable
class CartState {
  final CartScreenStatus? cartScreenStatus;
  final Failures? failures;
  final CartProductEntity? cartProductEntity;

  const CartState(
      {this.cartScreenStatus, this.failures, this.cartProductEntity});

  CartState copyWith(
      {CartScreenStatus? cartScreenStatus,
      Failures? failures,
      CartProductEntity? cartProductEntity}) {
    return CartState(
        cartProductEntity: cartProductEntity ?? this.cartProductEntity,
        cartScreenStatus: cartScreenStatus ?? this.cartScreenStatus,
        failures: failures ?? this.failures);
  }
}

class CartInitial extends CartState {
  const CartInitial() : super(cartScreenStatus: CartScreenStatus.init);
}
