import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/AddToCartUseCase.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/add_to_wish_list_use_case.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_brands_use_case.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_category_use_case.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_product.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_sub_category_usecase.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_wish_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuers.dart';
import '../../domain/entities/ProductEntity.dart';
import '../../domain/use_cases/remove_from_wish_list_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoryUseCase getCategoryUseCase;
  GetBrandsUseCase getBrandsUseCase;
  GetSubCategoryUseCase getSubCategoryUseCase;
  GetProductUseCase getProductUseCase;
  GetWishListUseCase getWishListUseCase;
  AddToWishListUseCase addToWishListUseCase;
  RemoveFromWishListUseCase removeFromWishListUseCase;
  AddToCartUseCase addToCartUseCase;

  static HomeBloc get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  HomeBloc(
      {required this.getCategoryUseCase,
      required this.getBrandsUseCase,
      required this.addToCartUseCase,
      required this.getSubCategoryUseCase,
      required this.getProductUseCase,
      required this.getWishListUseCase,
      required this.addToWishListUseCase,
      required this.removeFromWishListUseCase})
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is ChangeTabEvent) {
        emit(state.copyWith(
            tabIndex: event.index,
            homeScreenStatus: HomeScreenStatus.init,
            wishListTab: event.index == 3));
      } else if (event is GetCategoryEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.loading));
        var response = await getCategoryUseCase.call();
        response.fold((l) {
          emit(state.copyWith(
              categoryEntity: l,
              homeScreenStatus: HomeScreenStatus.getCategorySuccessfully));
        },
                (r) => emit(state.copyWith(
                failures: RemoteFailures(r.massage),
                homeScreenStatus: HomeScreenStatus.getCategoryError)));
      } else if (event is GEtBrandsEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.loading));
        var response = await getBrandsUseCase.call();
        response.fold(
                (l) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getBrandsSuccessfully,
                brandsEntity: l)),
                (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getBrandsError,
                failures: RemoteFailures(r.massage))));
      }
      if (event is SelectCategoryFromListEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.loading));
        var response = await getSubCategoryUseCase
            .call(state.categoryEntity?[event.selectedIndex].id ?? "");
        response.fold(
                (l) => emit(state.copyWith(
                selectedCategoryIndex: event.selectedIndex,
                homeScreenStatus: HomeScreenStatus.getSubCategorySuccessfully,
                subCategoryEntity: l)),
                (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getSubCategoryError,
                failures: r)));
      }
      if (event is SelectCategoryFromHomeEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.loading));
        var response = await getSubCategoryUseCase
            .call(state.categoryEntity?[event.selectedIndex].id ?? "");
        response.fold((l) {
          emit(state.copyWith(
              tabIndex: event.tabIndex,
              selectedCategoryIndex: event.selectedIndex,
              homeScreenStatus: HomeScreenStatus.getSubCategorySuccessfully,
              subCategoryEntity: l));
        },
                (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getSubCategoryError,
                failures: r)));
      } else if (event is SelectSubCategoryEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.loading));
        var response = await getProductUseCase
            .call(state.subCategoryEntity?[event.selectedIndex ?? 0].id ?? "");
        response.fold(
                (l) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getProductsSuccessfully,
                products: l?.data)),
                (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getProductsError,
                failures: r)));
      } else if (event is BackToCategoriesTabEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.init));
      } else if (event is GetWishListEvent) {
        emit(state.copyWith(
            homeScreenStatus: HomeScreenStatus.loading,
            products: state.products));
        var response = await getWishListUseCase.call();
        response.fold((l) {
          var ids = l?.data?.map((e) => e.id).toList();
          emit(state.copyWith(
              homeScreenStatus: HomeScreenStatus.getWishListSuccessfully,
              products: state.products,
              wishList: l?.data,
              wishListIds: ids));
        },
            (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getWishListError,
                failures: r)));
      } else if (event is AddToWishListEvent) {
        emit(state.copyWith(
          homeScreenStatus: HomeScreenStatus.loading,
          products: state.products,
        ));
        var response = await addToWishListUseCase.call(event.productId);
        response.fold(
            (l) => emit(state.copyWith(
                products: state.products,
                homeScreenStatus: HomeScreenStatus.addToWishListSuccessfully,
                massage: l?.message)),
            (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.addToWishListError)));
      } else if (event is RemoveWishListEvent) {
        emit(state.copyWith(
          homeScreenStatus: HomeScreenStatus.loading,
          products: state.products,
        ));
        var response = await removeFromWishListUseCase.call(event.productId);
        response.fold(
            (l) => emit(state.copyWith(
                products: state.products,
                homeScreenStatus:
                    HomeScreenStatus.removeFromWishListSuccessfully,
                massage: l?.message)),
            (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.removeFromWishListError)));
      } else if (event is AddToCartEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.loading,products: state.products));
        var response = await addToCartUseCase.call(event.productId);
        response.fold(
            (l) => emit(state.copyWith(
              products: state.products,
                homeScreenStatus: HomeScreenStatus.addToCartSuccess,
                massage: l?.message ?? "")),
            (r) => emit(state.copyWith(
              products: state.products,
                homeScreenStatus: HomeScreenStatus.addToCartFull,
                failures: r)));
      }
    });
  }
}
