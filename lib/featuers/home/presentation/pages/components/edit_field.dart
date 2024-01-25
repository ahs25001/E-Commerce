import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_styles.dart';

class EditField extends StatelessWidget {
  String title;
  String content;
  Function onEditIconTab;

  EditField(
      {required this.title,
      required this.content,
      required this.onEditIconTab});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.h2.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(color: Colors.black)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                content,
                style: AppStyles.h2
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w300),
              ),
              IconButton(
                  onPressed: () {
                    onEditIconTab();
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 20.sp,
                  ))
            ],
          ),
        ),
        SizedBox(height: 24.h,)
      ],
    );
  }
}
