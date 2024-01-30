import 'package:e_commerce/config.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/featuers/cart/domain/use_cases/clear_cart_use_case.dart';
import 'package:e_commerce/featuers/cart/domain/use_cases/get_cart_products_useCase.dart';
import 'package:e_commerce/featuers/cart/domain/use_cases/upDate_count_useCase.dart';
import 'package:e_commerce/featuers/cart/presentation/widgets/CartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CartBloc(getIt<GetCartProductsUseCase>(), getIt<UpDateCountUseCase>(),getIt<ClearCartUseCase>())
        ..add(GetProductsInCartEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state.cartScreenStatus == CartScreenStatus.loading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) =>
                  PopScope(
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
          } else if (state.cartScreenStatus == CartScreenStatus.getCartFull ||
              state.cartScreenStatus == CartScreenStatus.upDateCountItemFull ||
              state.cartScreenStatus == CartScreenStatus.clearCartError) {
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
          } else if (state.cartScreenStatus ==
              CartScreenStatus.upDateCountItemSuccess) {
            Navigator.pop(context);
            CartBloc.get(context).add(GetProductsInCartEvent());
          }
          else if (state.cartScreenStatus ==
              CartScreenStatus.clearCartSuccess) {
            Fluttertoast.showToast(
                msg: state.massage ?? "Done",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: AppColors.blue,
                timeInSecForIosWeb: 3,
                textColor: Colors.white,
                fontSize: 13.0);
            Navigator.pop(context);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) =>
                [
                  SliverAppBar(
                    title: const Text(AppStrings.cart),
                    centerTitle: true,
                    iconTheme: const IconThemeData(color: Colors.black),
                    actions: [
                      IconButton(onPressed: () {
                        CartBloc.get(context).add(ClearCartEvent());
                      }, icon: const Icon(Icons.clear)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
                    ],
                  ),
                ],
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartItem(
                                state.cartProductEntity?.data
                                    ?.products?[index]);
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 8.h,
                            );
                          },
                          itemCount:
                          (state.cartProductEntity?.data?.products?.length) ??
                              0),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                AppStrings.totalPrice,
                                style: AppStyles.h2.copyWith(
                                    color: Colors.black),
                              ),
                              Text(
                                "${AppStrings.eGP} ${state.cartProductEntity
                                    ?.data?.totalCartPrice ?? 0}",
                                style: AppStyles.h2.copyWith(
                                    color: AppColors.blue),
                              ),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: AppStyles.checkOutButtonStyle,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.checkOut,
                                    style: AppStyles.h2,
                                  ),
                                  // SizedBox(width: 18.w,),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
