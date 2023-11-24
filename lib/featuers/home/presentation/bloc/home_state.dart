part of 'home_bloc.dart';

enum HomeScreenStatus {
  loading,
  getCategorySuccessfully,
  getSubCategorySuccessfully,
  getProductsSuccessfully,
  getCategoryError,
  getSubCategoryError,
  getBrandsSuccessfully,
  getBrandsError,
  getProductsError,
  init
}

@immutable
class HomeState {
  final HomeScreenStatus? homeScreenStatus;
  final Failures? failures;
  final List<CategoryEntity>? categoryEntity;
  final List<CategoryEntity>? subCategoryEntity;
  final List<CategoryEntity>? brandsEntity;
  final List<ProductDataEntity>? products;
  final int? tabIndex;
  final int? selectedCategoryIndex;
  final int? selectedSubCategoryIndex;

  HomeState(
      {this.homeScreenStatus,
      this.products,
      this.selectedSubCategoryIndex,
      this.tabIndex,
      this.subCategoryEntity,
      this.selectedCategoryIndex,
      this.failures,
      this.categoryEntity,
      this.brandsEntity});

  copyWith(
      {HomeScreenStatus? homeScreenStatus,
      int? tabIndex,
      int? selectedSubCategoryIndex,
      List<ProductDataEntity>? products,
      List<CategoryEntity>? subCategoryEntity,
      List<CategoryEntity>? brandsEntity,
      int? selectedCategoryIndex = 0,
      Failures? failures,
      List<CategoryEntity>? categoryEntity}) {
    return HomeState(
        selectedSubCategoryIndex:
            selectedSubCategoryIndex ?? this.selectedSubCategoryIndex,
        products: products ,
        subCategoryEntity: subCategoryEntity ?? this.subCategoryEntity,
        selectedCategoryIndex:
            selectedCategoryIndex ?? this.selectedCategoryIndex,
        brandsEntity: brandsEntity ?? this.brandsEntity,
        tabIndex: tabIndex ?? this.tabIndex,
        failures: failures ?? this.failures,
        categoryEntity: categoryEntity ?? this.categoryEntity,
        homeScreenStatus: homeScreenStatus ?? this.homeScreenStatus);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(homeScreenStatus: HomeScreenStatus.init);
}
