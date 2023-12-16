import 'package:e_commerce/featuers/home/presentation/pages/components/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/ProductEntity.dart';

class FavoritesTab extends StatelessWidget {
  List<ProductDataEntity> products;
  FavoritesTab(this.products);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: products.length,
          itemBuilder: (context, index) => WishListItem(products[index]), separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 3.h,
             color: Colors.transparent,
          );
      },),
    );
  }
}
