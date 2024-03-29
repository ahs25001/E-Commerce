import 'package:e_commerce/featuers/product_details/domain/use_cases/add_to_wish_list_usecase.dart';
import 'package:e_commerce/featuers/product_details/domain/use_cases/get_wish_list_ids_usecase.dart';
import 'package:e_commerce/featuers/product_details/domain/use_cases/remove_from_wish_list_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failuers.dart';
import '../../domain/use_cases/add_to_cart_use_case.dart';
import '../../domain/use_cases/up_date_cart_use_case.dart';

part 'product_deteils_event.dart';

part 'product_deteils_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  static ProductDetailsBloc get(context) => BlocProvider.of(context);
  GetWishListIdsUseCase getWishListIdsUseCase;
  AddToWishListUseCase addToWishListUseCase;
  DeleteFromWishListUseCase deleteFromWishListUseCase;
  AddToCartFromProductScreenUseCase addToCartFromProductScreenUseCase;
  UpDateCountFromProductScreenUseCase upDateCountFromProductScreenUseCase;

  ProductDetailsBloc(
      this.getWishListIdsUseCase,
      this.addToWishListUseCase,
      this.deleteFromWishListUseCase,
      this.addToCartFromProductScreenUseCase,
      this.upDateCountFromProductScreenUseCase)
      : super(ProductDetailsInitial()) {
    on<ProductDetailsEvent>((event, emit) async {
      if (event is ChangeCountEvent) {
        emit(state.copyWith(countOfProduct: event.countOfProduct));
      } else if (event is ShowMoreAndLessEvent) {
        emit(state.copyWith(isAllDescription: event.isAllDescription));
      } else if (event is GetWishListIdsEvent) {
        emit(state.copyWith(productScreenStatus: ProductScreenStatus.loading));
        var response = await getWishListIdsUseCase.call();
        response.fold(
                (l) => emit(state.copyWith(
                productScreenStatus:
                    ProductScreenStatus.getWishListIdsSuccessfully,
                wishListIds: l)),
                (r) => emit(state.copyWith(
                failures: r,
                productScreenStatus: ProductScreenStatus.getWishListIdsError)));
      } else if (event is AddToWishListFromDetailsEvent) {
        emit(state.copyWith(productScreenStatus: ProductScreenStatus.loading));
        var response = await addToWishListUseCase.call(event.productId);
        response.fold(
                (l) => emit(state.copyWith(
                productScreenStatus:
                    ProductScreenStatus.addToWishListSuccessfully,
                massage: l?.message)),
                (r) => emit(state.copyWith(
                productScreenStatus: ProductScreenStatus.addToWishListError,
                failures: r)));
      } else if (event is DeleteFromWishListEvent) {
        emit(state.copyWith(productScreenStatus: ProductScreenStatus.loading));
        var response = await deleteFromWishListUseCase.call(event.productId);
        response.fold(
            (l) => emit(state.copyWith(
                productScreenStatus:
                    ProductScreenStatus.removeFromWishListSuccessfully,
                massage: l?.message)),
            (r) => emit(state.copyWith(
                productScreenStatus:
                    ProductScreenStatus.removeFromWishListError,
                failures: r)));
      } else if (event is AddToCartFromProductScreenEvent) {
        emit(state.copyWith(productScreenStatus: ProductScreenStatus.loading));
        var response = await addToCartFromProductScreenUseCase.call(event.id);
        response.fold(
            (l) => emit(state.copyWith(
                productScreenStatus: ProductScreenStatus.addToCartSuccess,
                massage: l?.message ?? "")),
            (r) => emit(state.copyWith(
                productScreenStatus: ProductScreenStatus.addToCartError,
                failures: r)));
      }
      else if (event is UpDateCountFromProductDetailsScreenEvent){
        emit(state.copyWith(productScreenStatus: ProductScreenStatus.loading));
        var response = await upDateCountFromProductScreenUseCase.call(event.id, event.count);
        response.fold(
                (l) => emit(state.copyWith(
                productScreenStatus: ProductScreenStatus.upDateCountItemSuccess)),
                (r) => emit(state.copyWith(
                failures: r,
                    productScreenStatus: ProductScreenStatus.upDateCountItemFull)));
      }
    });
  }
}
