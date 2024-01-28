import 'package:equatable/equatable.dart';

class CartProductEntity extends Equatable {
  CartProductEntity({
    this.numOfCartItems,
    this.data,
  });

  num? numOfCartItems;
  DataEntity? data;

  @override
  List<Object?> get props => [data, numOfCartItems];
}

class DataEntity extends Equatable {
   DataEntity({
    this.id,
    this.products,
    this.totalCartPrice,
  });

   String? id;
   List<ProductsEntity>? products;
   num? totalCartPrice;

  @override
  List<Object?> get props => [id];
}

class ProductsEntity extends Equatable {
  ProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  ProductEntity? product;
  num? price;

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class ProductEntity extends Equatable {
  ProductEntity({
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
  });

  String? id;
  String? title;
  num? quantity;
  String? imageCover;

  @override
  List<Object?> get props => [id];
}
