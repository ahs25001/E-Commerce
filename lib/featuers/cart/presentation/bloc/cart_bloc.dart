import 'package:e_commerce/core/error/failuers.dart';
import 'package:e_commerce/featuers/cart/domain/entities/CartProuductEntety.dart';
import 'package:e_commerce/featuers/cart/domain/use_cases/get_cart_products_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  GetCartProductsUseCase getCartProductsUseCase;

  static CartBloc get(context) => BlocProvider.of(context);

  CartBloc(this.getCartProductsUseCase) : super(const CartInitial()) {
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
      }
    });
  }
}
