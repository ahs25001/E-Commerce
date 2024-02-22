import 'package:e_commerce/featuers/home/presentation/pages/components/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/ProductEntity.dart';
import '../bloc/home_bloc.dart';

class FavoritesTab extends StatelessWidget {
  List<ProductDataEntity> products;

  FavoritesTab(this.products);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Expanded(
          child: (state.homeScreenStatus == HomeScreenStatus.getWishListLoading)
              ? AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                      color: AppColors.blue,
                      size: 90.sp,
                    ),
                  ),
                )
              : ListView.separated(
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      WishListItem(products[index]),
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 3.h,
                      color: Colors.transparent,
                    );
                  },
                ),
        );
      },
    );
  }
}
