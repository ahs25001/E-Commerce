part of 'product_deteils_bloc.dart';

enum ProductScreenStatus { init, loading, error }

@immutable
class ProductDetailsState {
  int? countOfProduct;
  ProductScreenStatus? productScreenStatus;
  bool? isAllDescription;

  ProductDetailsState(
      {this.countOfProduct, this.productScreenStatus, this.isAllDescription});

  ProductDetailsState copyWith(
      {int? countOfProduct,
      ProductScreenStatus? productScreenStatus,
      bool? isAllDescription}) {
    return ProductDetailsState(
      isAllDescription: isAllDescription??this.isAllDescription,
        productScreenStatus: productScreenStatus ?? this.productScreenStatus,
        countOfProduct: countOfProduct ?? this.countOfProduct);
  }
}

class ProductDetailsInitial extends ProductDetailsState {
  ProductDetailsInitial()
      : super(productScreenStatus: ProductScreenStatus.init);
}
