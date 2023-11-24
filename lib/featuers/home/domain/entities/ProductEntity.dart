import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  ProductEntity({
    this.results,
    this.data,
  });

  num? results;
  List<ProductDataEntity>? data;

  @override
  List<Object?> get props => [data];
}

class ProductDataEntity extends Equatable {
  ProductDataEntity({
    this.sold,
    this.images,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.brand,
    this.ratingsAverage,
  });

  num? sold;
  List<String>? images;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  dynamic brand;
  num? ratingsAverage;

  @override
  List<Object?> get props => [id];
}
