import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/featuers/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/CategoryEntity.dart';
import '../pages/components/CategoryItem.dart';

class HomeTab extends StatelessWidget {
  List<CategoryEntity>? categoryEntity;
  List<CategoryEntity>? brandsEntity;

  HomeTab(this.categoryEntity, this.brandsEntity);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text(
            AppStrings.categorise,
            style: AppStyles.h2.copyWith(color: Colors.black),
          ),
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
                return InkWell(
                    onTap: () => HomeBloc.get(context).add(
                        SelectCategoryFromHomeEvent(
                            selectedIndex: index,
                           // selectedCategory: categoryEntity![index],
                            tabIndex: 1)),
                    child: CategoryItem(categoryEntity![index]));
              },
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            AppStrings.brands,
            style: AppStyles.h2.copyWith(color: Colors.black),
          ),
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
