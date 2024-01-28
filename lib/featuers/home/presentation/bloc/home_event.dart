part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class SelectCategoryFromListEvent extends HomeEvent {
 final int selectedIndex;
 final CategoryEntity? selectedCategory;

  SelectCategoryFromListEvent(this.selectedIndex, this.selectedCategory);
}

class SelectCategoryFromHomeEvent extends HomeEvent {
  final int selectedIndex;
  final int tabIndex;

  //CategoryEntity? selectedCategory;

  SelectCategoryFromHomeEvent(
      {required this.selectedIndex,
      //  required this.selectedCategory,
      required this.tabIndex});
}

class GetCategoryEvent extends HomeEvent {}

class GetWishListEvent extends HomeEvent {}

class RefreshWishListEvent extends HomeEvent {}

class EditeDataEvent extends HomeEvent {}

class EditePasswordEvent extends HomeEvent {}

class AddToWishListEvent extends HomeEvent {
  final String productId;

  AddToWishListEvent(this.productId);
}

class AddToCartEvent extends HomeEvent {
  final String productId;

  AddToCartEvent(this.productId);
}

class RemoveWishListEvent extends HomeEvent {
  final String productId;

  RemoveWishListEvent(this.productId);
}

class BackToCategoriesTabEvent extends HomeEvent {}
class GEtBrandsEvent extends HomeEvent {}

class SelectSubCategoryEvent extends HomeEvent {
 final int selectedIndex;

  SelectSubCategoryEvent(this.selectedIndex);
}

class ChangeTabEvent extends HomeEvent {
 final int index;

  ChangeTabEvent(this.index);
}
