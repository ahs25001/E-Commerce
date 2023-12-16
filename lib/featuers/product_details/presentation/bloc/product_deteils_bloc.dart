import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/featuers/product_details/data/data_sources/product_details_ds_impl.dart';
import 'package:e_commerce/featuers/product_details/data/data_sources/product_ds.dart';
import 'package:e_commerce/featuers/product_details/data/repositories/product_details_repo_impl.dart';
import 'package:e_commerce/featuers/product_details/domain/repositories/product_details_repo.dart';
import 'package:e_commerce/featuers/product_details/domain/use_cases/add_to_wish_list_usecase.dart';
import 'package:e_commerce/featuers/product_details/domain/use_cases/get_wish_list_ids_usecase.dart';
import 'package:e_commerce/featuers/product_details/domain/use_cases/remove_from_wish_list_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failuers.dart';

part 'product_deteils_event.dart';

part 'product_deteils_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  static ProductDetailsBloc get(context) => BlocProvider.of(context);

  ProductDetailsBloc() : super(ProductDetailsInitial()) {
    ApiManager apiManager = ApiManager();
    on<ProductDetailsEvent>((event, emit) async {
      if (event is ChangeCountEvent) {
        emit(state.copyWith(
            countOfProduct: event.countOfProduct));
      } else if (event is ShowMoreAndLessEvent) {
        emit(state.copyWith(isAllDescription: event.isAllDescription));
      } else if (event is GetWishListIdsEvent) {
        emit(state.copyWith(productScreenStatus: ProductScreenStatus.loading));
        ProductDetailsDs productDetailsDs = ProductDetailsDSImpl(apiManager);
        ProductDetailsRpo productDetailsRpo =
            ProductDetailsRepoImpl(productDetailsDs);
        GetWishListIdsUseCase getWishListIdsUseCase =
            GetWishListIdsUseCase(productDetailsRpo);
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
        ProductDetailsDs productDetailsDs = ProductDetailsDSImpl(apiManager);
        ProductDetailsRpo productDetailsRpo =
            ProductDetailsRepoImpl(productDetailsDs);
        AddToWishListUseCase addToWishListUseCase =
            AddToWishListUseCase(productDetailsRpo);
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
        ProductDetailsDs productDetailsDs = ProductDetailsDSImpl(apiManager);
        ProductDetailsRpo productDetailsRpo =
            ProductDetailsRepoImpl(productDetailsDs);
        DeleteFromWishListUseCase deleteFromWishListUseCase =
            DeleteFromWishListUseCase(productDetailsRpo);
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
      }
    });
  }
}
