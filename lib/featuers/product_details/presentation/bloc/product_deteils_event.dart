part of 'product_deteils_bloc.dart';

@immutable
abstract class ProductDetailsEvent {}

class ChangeCountEvent extends ProductDetailsEvent {
  int countOfProduct;

  ChangeCountEvent(this.countOfProduct);
}

class ShowMoreAndLessEvent extends ProductDetailsEvent {
  bool isAllDescription;

  ShowMoreAndLessEvent(this.isAllDescription);
}

class GetWishListIdsEvent extends ProductDetailsEvent {}

class AddToWishListFromDetailsEvent extends ProductDetailsEvent {
  String productId;

  AddToWishListFromDetailsEvent(this.productId);
}

class DeleteFromWishListEvent extends ProductDetailsEvent {
  String productId;

  DeleteFromWishListEvent(this.productId);
}
class UpDateCountFromProductDetailsScreenEvent extends ProductDetailsEvent {
  String id;
  num count;

  UpDateCountFromProductDetailsScreenEvent({required this.id, required this.count});
}
class AddToCartFromProductScreenEvent extends ProductDetailsEvent{
  String id;

  AddToCartFromProductScreenEvent(this.id);
}
