import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/featuers/home/data/data_sources/home_ds.dart';
import 'package:e_commerce/featuers/home/data/data_sources/home_ds_impl.dart';
import 'package:e_commerce/featuers/home/data/repositories/home_repo_impl.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce/featuers/home/domain/repositories/home_repo.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_brands_use_case.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_category_use_case.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_product.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_sub_category_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failuers.dart';
import '../../domain/entities/ProductEntity.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is ChangeTabEvent) {
        emit(state.copyWith(
            tabIndex: event.index, homeScreenStatus: HomeScreenStatus.init));
      } else if (event is GetCategoryEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        HomeDs categoryDs = HomeDSImpl(apiManager);
        HomeRepo categoryRepo = HomeRepoImpl(categoryDs);
        GetCategoryUseCase getCategoryUseCase =
            GetCategoryUseCase(categoryRepo);
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
        ApiManager apiManager = ApiManager();
        HomeDs categoryDs = HomeDSImpl(apiManager);
        HomeRepo categoryRepo = HomeRepoImpl(categoryDs);
        GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(categoryRepo);
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
        ApiManager apiManager = ApiManager();
        HomeDs categoryDs = HomeDSImpl(apiManager);
        HomeRepo categoryRepo = HomeRepoImpl(categoryDs);
        GetSubCategoryUseCase getSubCategoryUseCase =
            GetSubCategoryUseCase(categoryRepo);
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
        ApiManager apiManager = ApiManager();
        HomeDs categoryDs = HomeDSImpl(apiManager);
        HomeRepo categoryRepo = HomeRepoImpl(categoryDs);
        GetSubCategoryUseCase getSubCategoryUseCase =
            GetSubCategoryUseCase(categoryRepo);
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
        ApiManager apiManager = ApiManager();
        HomeDs homeDs = HomeDSImpl(apiManager);
        HomeRepo homeRepo = HomeRepoImpl(homeDs);
        GetProductUseCase getProductUseCase = GetProductUseCase(homeRepo);
        var response = await getProductUseCase
            .call(state.subCategoryEntity?[event.selectedIndex ?? 0].id ?? "");
        response.fold(
            (l) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getProductsSuccessfully,
                products: l?.data)),
            (r) => emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getProductsError,
                failures: r)));
      }
    });
  }
}
