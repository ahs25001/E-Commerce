import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/featuers/cart/domain/entities/CartProuductEntety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
class CartItem extends StatelessWidget {
 final ProductsEntity ? productsEntity;

  const CartItem(this.productsEntity, {super.key});
  @override
  Widget build(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal:10.w ,vertical: 8.h),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.blue),
      borderRadius: BorderRadius.circular(25.r),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: CachedNetworkImage(
            imageUrl: productsEntity?.product?.imageCover ?? "",
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
                    Text(
                      ((productsEntity?.product?.title ?? "").length > 11)
                          ? "${productsEntity?.product?.title!.substring(0, 11)}.."
                          : productsEntity?.product?.title ?? "",
                      style: AppStyles.h2
                          .copyWith(fontSize: 18.sp, color: AppColors.blue),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {

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
                      "${AppStrings.eGP} ${productsEntity?.price.toString()}",
                      style: AppStyles.h2
                          .copyWith(fontSize: 18.sp, color: AppColors.blue),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(35.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {

                              },
                              icon: const Icon(
                                Icons.do_not_disturb_on_outlined,
                                color: Colors.white,
                              )),
                          Text("1",
                              style: const TextStyle(color: Colors.white)),
                          IconButton(
                              onPressed: () {

                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                              )),
                        ],
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
