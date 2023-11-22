import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  CategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  CategoryEntity.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? slug;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name,id];

}