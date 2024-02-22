import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/featuers/home/presentation/pages/components/Category_item_list.dart';
import 'package:e_commerce/featuers/home/presentation/pages/components/Sub_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/CategoryEntity.dart';
import '../bloc/home_bloc.dart';

class CategoriesTab extends StatelessWidget {
  List<CategoryEntity> categories;
  List<CategoryEntity> subCategoryEntities;
  CategoryEntity? selectedCategory;
  int selectedIndex;

  CategoriesTab(
      {required this.categories,
      required this.selectedCategory,
      required this.selectedIndex,
      required this.subCategoryEntities});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(selectedCategory?.name ?? ""),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: AppColors.backGroundList,
                    child: ListView.builder(
                        // scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => HomeBloc.get(context).add(
                                SelectCategoryFromListEvent(
                                    index, categories[index])),
                            child: CategoryItemList(
                                categories[index].name ?? "",
                                index == selectedIndex),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: CachedNetworkImage(
                          imageUrl: selectedCategory?.image ?? "",
                          width: 267.w,
                          height: 114.h,
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              LoadingAnimationWidget.fourRotatingDots(
                            color: AppColors.blue,
                            size: 50.sp,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BlocConsumer<HomeBloc, HomeState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return (state.homeScreenStatus ==
                                  HomeScreenStatus.getSubCategoryLoading)
                              ? Expanded(
                                child: AlertDialog(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    title: Center(
                                      child:
                                          LoadingAnimationWidget.fourRotatingDots(
                                        color: AppColors.blue,
                                        size: 80.sp,
                                      ),
                                    ),
                                  ),
                              )
                              : Expanded(
                                  child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) => InkWell(
                                      onTap: () => HomeBloc.get(context)
                                          .add(SelectSubCategoryEvent(index)),
                                      child: SubCategoryItem(
                                          subCategoryEntities[index])),
                                  itemCount: subCategoryEntities.length,
                                ));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
