import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/featuers/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/featuers/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../product_details/presentation/pages/productDeteailsScreen.dart';

class ProductItem extends StatelessWidget {
  final ProductDataEntity productDataEntity;
final bool inWishList;
  const ProductItem(this.productDataEntity, this.inWishList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
          side: BorderSide(color: AppColors.blue, width: 2.w)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(18.r)),
                  child: CachedNetworkImage(
                    width: 220.w,
                    height: 148.h,
                    fit: BoxFit.fill,
                    imageUrl: productDataEntity.imageCover ?? "",
                    placeholder: (context, url) =>
                        LoadingAnimationWidget.fourRotatingDots(
                            color: AppColors.blue, size: 40.sp),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (!inWishList) {
                        HomeBloc.get(context).add(
                            AddToWishListEvent(productDataEntity.id ?? ""));
                      }
                      else{
                        HomeBloc.get(context).add(RemoveWishListEvent(productDataEntity.id??""));
                      }
                    },
                    icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: (!inWishList)
                            ? Icon(
                                Icons.favorite_border,
                                color: AppColors.blue,
                              )
                            : Icon(
                                Icons.favorite,
                                color: AppColors.blue,
                              )))
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetails(
                              productDataEntity: productDataEntity,
                              fromWishTab: false,
                            )));
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(productDataEntity),));,
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productDataEntity.title ?? "",
                    style: AppStyles.titleProductStyle,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    productDataEntity.description ?? "",
                    maxLines: 1,
                    style: AppStyles.titleProductStyle,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    " ${AppStrings.eGP} ${productDataEntity.price}",
                    style: AppStyles.titleProductStyle,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        " ${AppStrings.review} (${productDataEntity.ratingsAverage})",
                        style: AppStyles.titleProductStyle,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            HomeBloc.get(context).add(AddToCartEvent(productDataEntity.id??""));
                          },
                          child: Icon(
                            Icons.add_circle_outlined,
                            size: 33.sp,
                            color: AppColors.blue,
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
