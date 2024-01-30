import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/cart/domain/entities/CartProuductEntety.dart';
import 'package:e_commerce/featuers/cart/domain/use_cases/get_cart_products_useCase.dart';
import 'package:e_commerce/featuers/cart/domain/use_cases/upDate_count_useCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/clear_cart_use_case.dart';

part 'cart_event.dart';

part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  GetCartProductsUseCase getCartProductsUseCase;
  UpDateCountUseCase upDateCountUseCase;
  ClearCartUseCase clearCartUseCase;

  static CartBloc get(context) => BlocProvider.of(context);

  CartBloc(this.getCartProductsUseCase, this.upDateCountUseCase,
      this.clearCartUseCase)
      : super(const CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is GetProductsInCartEvent) {
        emit(state.copyWith(cartScreenStatus: CartScreenStatus.loading));
        var response = await getCartProductsUseCase.call();
        response.fold(
            (l) => emit(state.copyWith(
                cartScreenStatus: CartScreenStatus.getCartSuccess,
                cartProductEntity: l)),
            (r) => emit(state.copyWith(
                cartScreenStatus: CartScreenStatus.getCartFull, failures: r)));
      } else if (event is UpDateCountEvent) {
        emit(state.copyWith(cartScreenStatus: CartScreenStatus.loading));
        var response = await upDateCountUseCase.call(event.id, event.count);
        response.fold(
            (l) => emit(state.copyWith(
                cartScreenStatus: CartScreenStatus.upDateCountItemSuccess)),
            (r) => emit(state.copyWith(
                failures: r,
                cartScreenStatus: CartScreenStatus.upDateCountItemFull)));
      } else if (event is ClearCartEvent) {
        emit(state.copyWith(cartScreenStatus: CartScreenStatus.loading));
        var response = await clearCartUseCase.call();
        response.fold(
            (l) => emit(state.copyWith(
                cartScreenStatus: CartScreenStatus.clearCartSuccess,
                massage: l)),
            (r) => emit(state.copyWith(
                failures: r,
                cartScreenStatus: CartScreenStatus.clearCartError)));
      }
    });
  }
}
