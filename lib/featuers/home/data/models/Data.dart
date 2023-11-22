import 'package:e_commerce/featuers/home/domain/entities/CategoryEntity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
      super.id,
      super.name,
      super.slug,
      super.image,
      this.createdAt, 
      this.updatedAt,});

  CategoryModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}