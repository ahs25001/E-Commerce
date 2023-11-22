part of 'home_bloc.dart';

enum HomeScreenStatus {
  loading,
  getCategorySuccessfully,
  getCategoryError,
  getBrandsSuccessfully,
  getBrandsError,
  init
}

@immutable
class HomeState {
  final HomeScreenStatus? homeScreenStatus;
  final Failures? failures;
  final List<CategoryEntity>? categoryEntity;
  final List<CategoryEntity>? brandsEntity;
  final int? index;

  HomeState(
      {this.homeScreenStatus,
      this.index,
      this.failures,
      this.categoryEntity,
      this.brandsEntity});

  copyWith(
      {HomeScreenStatus? homeScreenStatus,
      int? index,
      List<CategoryEntity>? brandsEntity,
      Failures? failures,
      List<CategoryEntity>? categoryEntity}) {
    return HomeState(
        brandsEntity: brandsEntity ?? this.brandsEntity,
        index: index ?? this.index,
        failures: failures ?? this.failures,
        categoryEntity: categoryEntity ?? this.categoryEntity,
        homeScreenStatus: homeScreenStatus ?? this.homeScreenStatus);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(homeScreenStatus: HomeScreenStatus.init);
}
