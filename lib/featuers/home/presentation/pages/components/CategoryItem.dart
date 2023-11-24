import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/CategoryEntity.dart';

class CategoryItem extends StatelessWidget {
  CategoryEntity categoryEntity;

  CategoryItem(this.categoryEntity);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child:
              CircleAvatar(
                foregroundColor: Colors.blueAccent,
            backgroundImage: NetworkImage(
              categoryEntity.image ?? "",
            ),
            radius: 50.r,
          ),
        ),
        Text(
          categoryEntity.name ?? "",
          textAlign: TextAlign.center,
          style: AppStyles.h3.copyWith(color: Colors.black),
        )
      ],
    );
  }
}
