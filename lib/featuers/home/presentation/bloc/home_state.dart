part of 'home_bloc.dart';

enum HomeScreenStatus {
  loading,
  getCategorySuccessfully,
  getSubCategorySuccessfully,
  getSubCategoryFromHomeSuccessfully,
  getSubCategoryLoading,
  getProductsSuccessfully,
  getProductsLoading,
  getWishListSuccessfully,
  getWishListLoading,
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
  addToCartSuccess,
  addToCartFull,
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
  final String? email;
  final String? name;
  final bool? wishListTab;

  HomeState(
      {this.homeScreenStatus,
      this.products,
      this.wishListIds,
      this.massage,
      this.name,
      this.email,
      this.selectedSubCategoryIndex,
      this.tabIndex,
      this.wishList,
      this.subCategoryEntity,
      this.selectedCategoryIndex = 0,
      this.failures,
      this.wishListTab,
      this.categoryEntity,
      this.brandsEntity});

  copyWith(
      {HomeScreenStatus? homeScreenStatus,
      int? tabIndex,
      String? name,
      String? email,
      String? massage,
      bool? wishListTab,
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
        wishListTab: wishListTab ?? this.wishListTab,
        massage: massage ?? this.massage,
        email: email ?? this.email,
        name: name ?? this.name,
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
