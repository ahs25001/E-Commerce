import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_constants.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/account_tab.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/catrgries_tab.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/favorets_tab.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/product_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/home_bloc.dart';
import '../widgets/home_tab.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool currentPasswordShown = false;
    bool rePasswordShown = false;
    bool newPasswordShown = false;
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(GetCategoryEvent())
        ..add(GEtBrandsEvent())
        ..add(GetWishListEvent()),
      child: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.homeScreenStatus == HomeScreenStatus.loading) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: AppColors.blue,
                          size: 90.sp,
                        ),
                      ),
                    ),
              );
            } else if (state.homeScreenStatus ==
                    HomeScreenStatus.getBrandsSuccessfully ||
                state.homeScreenStatus ==
                    HomeScreenStatus.getWishListSuccessfully ||
                state.homeScreenStatus ==
                    HomeScreenStatus.getCategorySuccessfully ||
                state.homeScreenStatus ==
                    HomeScreenStatus.getSubCategorySuccessfully ||
                state.homeScreenStatus ==
                    HomeScreenStatus.getProductsSuccessfully) {
              Navigator.pop(context);
            } else if (state.homeScreenStatus ==
                    HomeScreenStatus.addToWishListSuccessfully ||
                state.homeScreenStatus ==
                    HomeScreenStatus.removeFromWishListSuccessfully) {
              Navigator.pop(context);
              HomeBloc.get(context).add(GetWishListEvent());
              Fluttertoast.showToast(
                  msg: state.massage ?? "Done",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: AppColors.blue,
                  timeInSecForIosWeb: 3,
                  textColor: Colors.white,
                  fontSize: 13.0);
            } else if (state.homeScreenStatus ==
                    HomeScreenStatus.getBrandsError ||
                state.homeScreenStatus == HomeScreenStatus.getWishListError ||
                state.homeScreenStatus ==
                    HomeScreenStatus.removeFromWishListError ||
                state.homeScreenStatus == HomeScreenStatus.addToWishListError ||
                state.homeScreenStatus ==
                    HomeScreenStatus.getSubCategoryError ||
                state.homeScreenStatus == HomeScreenStatus.getProductsError ||
                state.homeScreenStatus == HomeScreenStatus.getCategoryError) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(AppStrings.error),
                    content: Text(state.failures?.massage ?? ""),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            if (state.homeScreenStatus ==
                                    HomeScreenStatus.getBrandsError ||
                                state.homeScreenStatus ==
                                    HomeScreenStatus.getCategoryError) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            } else {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(AppStrings.cancel))
                    ],
                  );
                },
              );
            }
          },
          builder: (context, state) {
            List<Widget> tabs = [
              HomeTab(state.categoryEntity, state.brandsEntity),
              (state.products == null)
                  ? CategoriesTab(
                      categories: state.categoryEntity ?? [],
                      selectedCategory: state
                          .categoryEntity?[state.selectedCategoryIndex ?? 0],
                      selectedIndex: state.selectedCategoryIndex ?? 0,
                      subCategoryEntities: state.subCategoryEntity ?? [])
                  : ProductTab(state.products ?? []),
              FavoritesTab(state.wishList ?? []),
              AccountTab(
                currentPasswordShown: currentPasswordShown,
                newPasswordShown: newPasswordShown,
                rePasswordShown: rePasswordShown,
              )
            ];
            return Form(
              key: HomeBloc.get(context).formKey,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                extendBody: true,
                bottomNavigationBar: CurvedNavigationBar(
                  color: AppColors.blue,
                  backgroundColor: Colors.transparent,
                  index: state.tabIndex ?? 0,
                  items: const [
                    Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.category,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ],
                  onTap: (value) {
                    if (value == 1) {
                      HomeBloc.get(context)
                        ..add(ChangeTabEvent(value))
                        ..add(SelectCategoryFromListEvent(
                            0, state.categoryEntity?[0]));
                    } else if (value == 2) {
                      HomeBloc.get(context)
                        ..add(ChangeTabEvent(value))
                        ..add(GetWishListEvent());
                    } else {
                      HomeBloc.get(context).add(ChangeTabEvent(value));
                    }
                  },
                ),
                body: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppImages.routLogoAppBar,
                        width: 76.w,
                        height: 32.h,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      (!(state.wishListTab ?? false))
                          ? Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                      textInputAction: TextInputAction.search,
                                      decoration: InputDecoration(
                                        hintText: AppStrings.searchHint,
                                        prefixIconColor: AppColors.blue,
                                        prefixIcon: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.search),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 8.h, horizontal: 5.w),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.r),
                                            borderSide: BorderSide(
                                                color: AppColors.blue)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            borderSide: BorderSide(
                                                color: AppColors.blue)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            borderSide: BorderSide(
                                                color: AppColors.blue)),
                                      )),
                                ),
                                SizedBox(
                                  width: 24.w,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.shopping_cart_outlined))
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome , ${AppConstants.userName?.split(" ")[0]}",
                                  style: AppStyles.h2
                                      .copyWith(color: Colors.black),
                                ),
                                Text("${AppConstants.email}"),
                              ],
                            ),
                      SizedBox(
                        height: 18.h,
                      ),
                      tabs[state.tabIndex ?? 0]
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
