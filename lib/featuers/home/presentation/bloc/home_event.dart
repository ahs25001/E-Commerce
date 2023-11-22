part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class SelectCategoryEvent extends HomeEvent {}

class GetCategoryEvent extends HomeEvent {}

class GEtBrandsEvent extends HomeEvent {}

class ChangeTabEvent extends HomeEvent {
  int index;

  ChangeTabEvent(this.index);
}
