part of 'cart_bloc.dart';

enum CartScreenStatus {
  loading,
  getCartSuccess,
  getCartFull,
  deleteFromCartSuccess,
  deleteFromCartFull,
  upDateCountItemSuccess,
  upDateCountItemFull,
  clearCartSuccess,
  clearCartError,
  init
}

@immutable
class CartState {
  final CartScreenStatus? cartScreenStatus;
  final Failures? failures;
  final CartProductEntity? cartProductEntity;
  final bool? bottomBarIsVisible;
  final num? countOfItem;
  final String? massage;

  const CartState(
      {this.cartScreenStatus,
      this.bottomBarIsVisible,
      this.failures,
      this.massage,
      this.countOfItem,
      this.cartProductEntity});

  CartState copyWith(
      {CartScreenStatus? cartScreenStatus,
      Failures? failures,
      bool? bottomBarIsVisible,
      String? massage,
      num? countOfItem,
      CartProductEntity? cartProductEntity}) {
    return CartState(
        cartProductEntity: cartProductEntity ?? this.cartProductEntity,
        countOfItem: countOfItem ?? this.countOfItem,
        massage: massage ?? this.massage,
        cartScreenStatus: cartScreenStatus ?? this.cartScreenStatus,
        bottomBarIsVisible: bottomBarIsVisible ?? this.bottomBarIsVisible,
        failures: failures ?? this.failures);
  }
}

class CartInitial extends CartState {
  const CartInitial() : super(cartScreenStatus: CartScreenStatus.init);
}
