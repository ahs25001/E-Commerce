import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/featuers/home/domain/entities/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/product_deteils_bloc.dart';
import '../widgets/image_cover_item.dart';

class ProductDetails extends StatelessWidget {
  ProductDataEntity productDataEntity;

  ProductDetails(this.productDataEntity);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsBloc(),
      child: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                AppStrings.productDetails,
                style: AppStyles.h1
                    .copyWith(color: AppColors.blue, fontSize: 24.sp),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 30.sp,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 30.sp,
                    ))
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 5.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      items: (productDataEntity.images ?? [])
                          .map((e) => CoverImageItem(e ?? ""))
                          .toList(),
                      options: CarouselOptions(
                        height: 300.h,
                        aspectRatio: 10 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ((productDataEntity.title ?? "").length <= 20)
                              ? productDataEntity.title ?? ""
                              : "${productDataEntity.title!.substring(0, 20)}...",
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.h2.copyWith(color: AppColors.blue),
                        ),
                        Text(
                          "${AppStrings.eGP} ${productDataEntity.price.toString() ?? ""}",
                          style: AppStyles.h2.copyWith(color: AppColors.blue),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 8.w),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blue),
                              borderRadius: BorderRadius.circular(25.r)),
                          child: Text(
                            "${productDataEntity.sold} ${AppStrings.sold}",
                            style: AppStyles.h3.copyWith(
                                fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                            "${productDataEntity.ratingsAverage.toString()} (${productDataEntity.ratingsQuantity})"),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(35.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if ((state.countOfProduct ?? 1) > 1) {
                                      ProductDetailsBloc.get(context).add(
                                          ChangeCountEvent(
                                              state.countOfProduct! - 1));
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.do_not_disturb_on_outlined,
                                    color: Colors.white,
                                  )),
                              Text((state.countOfProduct ?? 1).toString(),
                                  style: TextStyle(color: Colors.white)),
                              IconButton(
                                  onPressed: () {
                                    if ((state.countOfProduct ?? 1) <
                                        (productDataEntity.quantity ?? 0)) {
                                      ProductDetailsBloc.get(context).add(
                                          ChangeCountEvent(
                                              (state.countOfProduct ?? 1) + 1));
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 26.h),
                    Text(
                      AppStrings.description,
                      style: AppStyles.h2.copyWith(color: AppColors.blue),
                    ),
                    Text(
                      ((productDataEntity.description ?? "").length > 150 &&
                              !(state.isAllDescription ?? false))
                          ? "${(productDataEntity.description!).substring(0, 150)}......"
                          : productDataEntity.description ?? "",
                      style: AppStyles.h3.copyWith(color: Colors.black),
                    ),
                    ((productDataEntity.description ?? "").length > 150)
                        ? InkWell(
                            onTap: () => ProductDetailsBloc.get(context).add(
                                ShowMoreAndLessEvent(
                                    !(state.isAllDescription ?? false))),
                            child: Text(!(state.isAllDescription ?? false)
                                ? "Show More"
                                : "Show Less",style: TextStyle(color: AppColors.blue),),
                          )
                        : const SizedBox(),
                    SizedBox(height: 36.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.totalPrice,
                              style: AppStyles.h2.copyWith(color: AppColors.blue),
                            ),
                            Text(
                              "${AppStrings.eGP} ${productDataEntity.price! * (state.countOfProduct ?? 1)}",
                              style: AppStyles.h3.copyWith(
                                  color: AppColors.blue, fontSize: 18.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 43.w,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                                  color: AppColors.blue,
                                  borderRadius: BorderRadius.circular(35.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    AppStrings.addToCart,
                                    style: AppStyles.h2
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
