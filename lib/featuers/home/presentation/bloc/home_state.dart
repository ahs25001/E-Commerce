part of 'home_bloc.dart';

enum HomeScreenStatus {
  loading,
  getCategorySuccessfully,
  getSubCategorySuccessfully,
  getProductsSuccessfully,
  getWishListSuccessfully,
  addToWishListSuccessfully,
  removeFromWishListSuccessfully,
  getWishListError,
  addToWishListError,
  removeFromWishListError,
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
  final List<ProductDataEntity>? wishList;
  final int? tabIndex;
  final int? selectedCategoryIndex;
  final int? selectedSubCategoryIndex;
  final List<String?>? wishListIds;
  final String? massage;

  HomeState(
      {this.homeScreenStatus,
      this.products,
      this.wishListIds,
      this.massage,
      this.selectedSubCategoryIndex,
      this.tabIndex,
      this.wishList,
      this.subCategoryEntity,
      this.selectedCategoryIndex = 0,
      this.failures,
      this.categoryEntity,
      this.brandsEntity});

  copyWith(
      {HomeScreenStatus? homeScreenStatus,
      int? tabIndex,
      String? massage,
      int? selectedSubCategoryIndex,
      List<String?>? wishListIds,
      List<ProductDataEntity>? products,
      List<ProductDataEntity>? wishList,
      List<CategoryEntity>? subCategoryEntity,
      List<CategoryEntity>? brandsEntity,
      int? selectedCategoryIndex,
      Failures? failures,
      List<CategoryEntity>? categoryEntity}) {
    return HomeState(
        massage: massage ?? this.massage,
        wishListIds: wishListIds ?? this.wishListIds,
        wishList: wishList ?? this.wishList,
        selectedSubCategoryIndex:
            selectedSubCategoryIndex ?? this.selectedSubCategoryIndex,
        products: products,
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
