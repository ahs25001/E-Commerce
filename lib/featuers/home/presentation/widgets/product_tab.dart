import 'package:flutter/material.dart';

import '../../domain/entities/ProductEntity.dart';

class ProductTab extends StatelessWidget {
  List<ProductDataEntity> products;

  ProductTab(this.products);

  @override
  Widget build(BuildContext context) {
    print(products);
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Text(
            products[index].title ?? "",
            style: TextStyle(color: Colors.black, fontSize: 30),
          );
        },
      ),
    );
  }
}
