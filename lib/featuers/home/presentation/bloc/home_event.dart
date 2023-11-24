part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class SelectCategoryFromListEvent extends HomeEvent {
  int selectedIndex;
  CategoryEntity? selectedCategory;

  SelectCategoryFromListEvent(this.selectedIndex, this.selectedCategory);
}

class SelectCategoryFromHomeEvent extends HomeEvent {
  int selectedIndex;
  int tabIndex;

  //CategoryEntity? selectedCategory;

  SelectCategoryFromHomeEvent(
      {required this.selectedIndex,
      //  required this.selectedCategory,
      required this.tabIndex});
}

class GetCategoryEvent extends HomeEvent {}

class GEtBrandsEvent extends HomeEvent {}

class SelectSubCategoryEvent extends HomeEvent {
  int selectedIndex;

  SelectSubCategoryEvent(this.selectedIndex);
}

class ChangeTabEvent extends HomeEvent {
  int index;

  ChangeTabEvent(this.index);
}
