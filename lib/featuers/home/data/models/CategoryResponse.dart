import 'Metadata.dart';
import 'Data.dart';

class CategoryResponse {
  CategoryResponse({
      this.results, 
      this.metadata, 
      this.data,});

  CategoryResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryModel.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;
  List<CategoryModel>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}