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
          child: CircleAvatar(
            backgroundImage: NetworkImage(categoryEntity.image??"",),
            radius: 50.r,
            // child:CachedNetworkImage(
            //   imageUrl:
            //   placeholder: (context, url) => CircularProgressIndicator(),
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            // ),
          ),
        ),
        Text(categoryEntity.name??"")
      ],
    );
  }
}
