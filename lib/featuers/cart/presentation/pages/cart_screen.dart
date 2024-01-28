import 'package:e_commerce/config.dart';
import 'package:e_commerce/featuers/cart/domain/use_cases/get_cart_products_useCase.dart';
import 'package:e_commerce/featuers/cart/presentation/widgets/CartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(getIt<GetCartProductsUseCase>())
        ..add(GetProductsInCartEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state.cartScreenStatus == CartScreenStatus.loading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => PopScope(
                canPop: false,
                child: AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                      color: AppColors.blue,
                      size: 90.sp,
                    ),
                  ),
                ),
              ),
            );
          } else if (state.cartScreenStatus ==
              CartScreenStatus.getCartSuccess) {
            Navigator.pop(context);
          } else if (state.cartScreenStatus == CartScreenStatus.getCartFull) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return PopScope(
                  canPop: false,
                  child: AlertDialog(
                    title: const Text(AppStrings.error),
                    content: Text(state.failures?.massage ?? ""),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text(AppStrings.cancel))
                    ],
                  ),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppStrings.cart),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  return CartItem(
                      state.cartProductEntity?.data?.products?[index]);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 8.h,
                  );
                },
                itemCount:
                    (state.cartProductEntity?.data?.products?.length) ?? 0),
          );
        },
      ),
    );
  }
}
