import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SubCategoryItem extends StatelessWidget {
  CategoryEntity? categoryEntity;

  SubCategoryItem(this.categoryEntity);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18.r),
            child:Image.asset("assets/images/R.jpg",width: 90.w,height: 90.h)
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          flex: 1,
          child: Text(
            categoryEntity?.name ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3.copyWith(color: Colors.black,fontSize: 16.sp),
          ),
        ),
      ],
    );
  }
}
