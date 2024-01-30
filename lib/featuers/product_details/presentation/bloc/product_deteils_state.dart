part of 'product_deteils_bloc.dart';

enum ProductScreenStatus {
  init,
  loading,
  error,
  addToWishListError,
  removeFromWishListError,
  getWishListIdsError,
  addToWishListSuccessfully,
  getWishListIdsSuccessfully,
  removeFromWishListSuccessfully,
  upDateCountItemSuccess,
  upDateCountItemFull,
  addToCartSuccess,
  addToCartError
}

@immutable
class ProductDetailsState {
  int? countOfProduct;
  ProductScreenStatus? productScreenStatus;
  bool? isAllDescription;
  List<String?>? wishListIds;
  String? massage;
  Failures? failures;

  ProductDetailsState(
      {this.countOfProduct,
      this.productScreenStatus,
      this.massage,
      this.isAllDescription,
      this.failures,
      this.wishListIds});

  ProductDetailsState copyWith(
      {List<String?>? wishListIds,
      String? massage,
      Failures? failures,
      int? countOfProduct,
      ProductScreenStatus? productScreenStatus,
      bool? isAllDescription}) {
    return ProductDetailsState(
        failures: failures ?? this.failures,
        massage: massage ?? this.massage,
        wishListIds: wishListIds ?? this.wishListIds,
        isAllDescription: isAllDescription ?? this.isAllDescription,
        productScreenStatus: productScreenStatus ?? ProductScreenStatus.init,
        countOfProduct: countOfProduct ?? this.countOfProduct);
  }
}

class ProductDetailsInitial extends ProductDetailsState {
  ProductDetailsInitial()
      : super(productScreenStatus: ProductScreenStatus.init);
}
