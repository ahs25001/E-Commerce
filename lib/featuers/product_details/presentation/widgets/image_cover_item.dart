import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';

class CoverImageItem extends StatelessWidget {
  String imageLink;

  CoverImageItem(this.imageLink);

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
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.blue,
                  )))
        ],
      ),
    );
  }
}
