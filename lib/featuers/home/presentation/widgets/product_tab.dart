import 'package:e_commerce/featuers/home/presentation/pages/components/product_Item.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/ProductEntity.dart';

class ProductTab extends StatelessWidget {
  List<ProductDataEntity> products;

  ProductTab(this.products);

  @override
  Widget build(BuildContext context) {
    print(products);
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 3),
        itemBuilder: (context, index) => ProductItem(products[index]),
        itemCount: products.length,
      ),
    );
  }
}
