import 'dart:convert';

class SubCategoryModel {
  List<subCategoryDetail> data;
  String message;

  SubCategoryModel({
    required this.data,
    required this.message,
  });

  factory SubCategoryModel.fromRawJson(String str) => SubCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
    data: List<subCategoryDetail>.from(json["data"].map((x) => subCategoryDetail.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class subCategoryDetail {
  int id;
  String name;
  Category category;

  subCategoryDetail({
    required this.id,
    required this.name,
    required this.category,
  });

  factory subCategoryDetail.fromRawJson(String str) => subCategoryDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory subCategoryDetail.fromJson(Map<String, dynamic> json) => subCategoryDetail(
    id: json["id"],
    name: json["name"],
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category.toJson(),
  };
}

class Category {
  int id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
