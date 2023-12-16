import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/featuers/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/featuers/product_details/presentation/bloc/product_deteils_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';

class CoverImageItem extends StatelessWidget {
  String imageLink;
  String id;

  CoverImageItem(
      {required this.imageLink,  required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.blue, width: 2.w),
          borderRadius: BorderRadius.circular(28.r)),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 300.h,
              fit: BoxFit.cover,
              imageUrl: imageLink ?? "",
              placeholder: (context, url) =>
                  LoadingAnimationWidget.fourRotatingDots(
                      color: AppColors.blue, size: 40.sp),
            ),
          ),
          IconButton(
              onPressed: () {
                if (!(ProductDetailsBloc.get(context).state.wishListIds?.contains(id)??false)) {
                  ProductDetailsBloc.get(context)
                      .add(AddToWishListFromDetailsEvent(id));
                }
                else{
                  ProductDetailsBloc.get(context).add(DeleteFromWishListEvent(id));
                  HomeBloc.get(context)..add(RemoveWishListEvent(id))..add(GetWishListEvent());
                }
              },
              icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: (!(ProductDetailsBloc.get(context).state.wishListIds?.contains(id)??false))
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
    );
  }
}
