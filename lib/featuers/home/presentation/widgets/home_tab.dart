import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/CategoryEntity.dart';
import '../pages/components/CategoryItem.dart';

class HomeTab extends StatelessWidget {
  List<CategoryEntity>? categoryEntity;
  List<CategoryEntity>? brandsEntity;

  HomeTab(this.categoryEntity,this.brandsEntity);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text("Categorise"),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4.h,
                  crossAxisSpacing: 10.w,
                  crossAxisCount: 2),
              itemCount: categoryEntity?.length ?? 0,
              itemBuilder: (context, index) {
                return CategoryItem(categoryEntity![index]);
              },
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text("Brands"),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4.h,
                  crossAxisSpacing: 10.w,
                  crossAxisCount: 2),
              itemCount: brandsEntity?.length ?? 0,
              itemBuilder: (context, index) {
                return CategoryItem(brandsEntity![index]);
              },
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
