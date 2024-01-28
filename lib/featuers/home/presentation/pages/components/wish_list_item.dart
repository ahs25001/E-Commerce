import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/featuers/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/featuers/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/featuers/product_details/presentation/pages/productDeteailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../core/utils/app_colors.dart';

class WishListItem extends StatelessWidget {
  final ProductDataEntity productDataEntity;

  const WishListItem(this.productDataEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: CachedNetworkImage(
              imageUrl: productDataEntity.imageCover ?? "",
              width: 150.w,
              height: 143.h,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  LoadingAnimationWidget.fourRotatingDots(
                color: AppColors.blue,
                size: 50.sp,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProductDetails(
                              productDataEntity: productDataEntity,
                              fromWishTab: true,
                            );
                          },
                        )),
                        child: Text(
                          ((productDataEntity.title ?? "").length > 11)
                              ? "${productDataEntity.title!.substring(0, 11)}.."
                              : productDataEntity.title ?? "",
                          style: AppStyles.h2
                              .copyWith(fontSize: 18.sp, color: AppColors.blue),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            HomeBloc.get(context).add(RemoveWishListEvent(
                                productDataEntity.id ?? ""));
                          },
                          icon: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.delete,
                              color: AppColors.blue,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "${AppStrings.eGP} ${productDataEntity.price.toString()}",
                        style: AppStyles.h2
                            .copyWith(fontSize: 18.sp, color: AppColors.blue),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          HomeBloc.get(context).add(AddToCartEvent(productDataEntity.id??""));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(35.r)),
                          child: Text(
                            AppStrings.addToCart,
                            style: AppStyles.h3.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
