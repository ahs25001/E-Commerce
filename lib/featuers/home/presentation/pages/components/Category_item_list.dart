import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemList extends StatelessWidget {
  String title;
  bool isSelected;

  CategoryItemList(this.title, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      color: (isSelected)?Colors.white:Colors.transparent,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: (isSelected) ? AppColors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(20.r)
            ),
          
            height:40,
            width: 10,
          ),
          SizedBox(width: 10.w,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 4.h),
            color: (isSelected) ? Colors.white : Colors.transparent,
            child: Text(
              overflow: TextOverflow.ellipsis,
              textScaleFactor: .95,
              title,
              style: AppStyles.h3.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }
}
