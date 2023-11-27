import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/featuers/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_deteils_event.dart';

part 'product_deteils_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  static ProductDetailsBloc get(context) => BlocProvider.of(context);

  ProductDetailsBloc() : super(ProductDetailsInitial()) {
    on<ProductDetailsEvent>((event, emit) {
      if (event is ChangeCountEvent) {
        emit(state.copyWith(countOfProduct: event.countOfProduct));
      }
      else if (event is ShowMoreAndLessEvent){
        emit(state.copyWith(isAllDescription: event.isAllDescription));
      }
    });
  }
}
