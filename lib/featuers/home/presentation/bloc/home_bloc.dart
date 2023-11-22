import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/featuers/home/data/data_sources/category_ds.dart';
import 'package:e_commerce/featuers/home/data/data_sources/category_ds_impl.dart';
import 'package:e_commerce/featuers/home/data/repositories/category_repo_impl.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce/featuers/home/domain/repositories/category_repo.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_brads_use_case.dart';
import 'package:e_commerce/featuers/home/domain/use_cases/get_category_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failuers.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);
  int index = 0;

  // late Widget tab;

  // getCategories() async {
  //   emit(state.copyWith(homeScreenStatus: HomeScreenStatus.loading));
  //   ApiManager apiManager = ApiManager();
  //   CategoryDs categoryDs = CategoryDSImpl(apiManager);
  //   CategoryRepo categoryRepo = CategoryRepoImpl(categoryDs);
  //   GetCategoryUseCase getCategoryUseCase = GetCategoryUseCase(categoryRepo);
  //   var response = await getCategoryUseCase.call();
  //   response.fold((l) {
  //     emit(state.copyWith(
  //         categoryEntity: l,
  //         homeScreenStatus: HomeScreenStatus.getCategorySuccessfully));
  //   },
  //       (r) => emit(state.copyWith(
  //           failures: RemoteFailures(r.massage),
  //           homeScreenStatus: HomeScreenStatus.getCategoryError)));
  // }

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is ChangeTabEvent) {
        emit(state.copyWith(
            index: event.index, homeScreenStatus: HomeScreenStatus.init));
      }
      else if (event is GetCategoryEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        CategoryDs categoryDs = CategoryDSImpl(apiManager);
        CategoryRepo categoryRepo = CategoryRepoImpl(categoryDs);
        GetCategoryUseCase getCategoryUseCase = GetCategoryUseCase(
            categoryRepo);
        var response = await getCategoryUseCase.call();
        response.fold((l) {
          emit(state.copyWith(
              categoryEntity: l,
              homeScreenStatus: HomeScreenStatus.getCategorySuccessfully));
        },
                (r) =>
                emit(state.copyWith(
                    failures: RemoteFailures(r.massage),
                    homeScreenStatus: HomeScreenStatus.getCategoryError)));
      }
      else if (event is GEtBrandsEvent) {
        emit(state.copyWith(homeScreenStatus: HomeScreenStatus.loading));
        ApiManager apiManager = ApiManager();
        CategoryDs categoryDs = CategoryDSImpl(apiManager);
        CategoryRepo categoryRepo = CategoryRepoImpl(categoryDs);
        GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(categoryRepo);
        var response = await getBrandsUseCase.call();
        response.fold((l) =>
            emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getBrandsSuccessfully,
                brandsEntity: l)), (r) =>
            emit(state.copyWith(
                homeScreenStatus: HomeScreenStatus.getBrandsError,
                failures: RemoteFailures(r.massage))));
      }
    });
  }
}
