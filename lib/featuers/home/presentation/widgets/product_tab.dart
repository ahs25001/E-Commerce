import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/featuers/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/featuers/home/presentation/pages/components/product_Item.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/ProductEntity.dart';

class ProductTab extends StatelessWidget {
  List<ProductDataEntity> products;

  ProductTab(this.products);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                HomeBloc.get(context).add(BackToCategoriesTabEvent());
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.blue,
              )),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 3),
              itemBuilder: (context, index) => ProductItem(
                  products[index],
                  HomeBloc.get(context)
                          .state
                          .wishListIds
                          ?.contains(products[index].id) ??
                      false),
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
