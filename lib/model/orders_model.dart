import 'dart:convert';


class OrdersModel {
  List<DetailsOrder> data;
  String message;

  OrdersModel({
    required this.data,
    required this.message,
  });

  factory OrdersModel.fromRawJson(String str) => OrdersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    data: List<DetailsOrder>.from(json["data"].map((x) => DetailsOrder.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class DetailsOrder {
  int id;
  Peoduct peoduct;
  User user;
  int quantity;

  DetailsOrder({
    required this.id,
    required this.peoduct,
    required this.user,
    required this.quantity,
  });

  factory DetailsOrder.fromRawJson(String str) => DetailsOrder.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailsOrder.fromJson(Map<String, dynamic> json) => DetailsOrder(
    id: json["id"],
    peoduct: Peoduct.fromJson(json["peoduct"]),
    user: User.fromJson(json["user"]),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "peoduct": peoduct.toJson(),
    "user": user.toJson(),
    "quantity": quantity,
  };
}

class Peoduct {
  int id;
  String name;
  SubCategory subCategory;
  String image;
  int price;
  int evaluation;
  int discount;

  Peoduct({
    required this.id,
    required this.name,
    required this.subCategory,
    required this.image,
    required this.price,
    required this.evaluation,
    required this.discount,
  });

  factory Peoduct.fromRawJson(String str) => Peoduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Peoduct.fromJson(Map<String, dynamic> json) => Peoduct(
    id: json["id"],
    name: json["name"],
    subCategory: SubCategory.fromJson(json["sub-category"]),
    image: json["image"],
    price: json["price"],
    evaluation: json["evaluation"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "sub-category": subCategory.toJson(),
    "image": image,
    "price": price,
    "evaluation": evaluation,
    "discount": discount,
  };
}

class SubCategory {
  int id;
  String name;
  User category;

  SubCategory({
    required this.id,
    required this.name,
    required this.category,
  });

  factory SubCategory.fromRawJson(String str) => SubCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    name: json["name"],
    category: User.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category.toJson(),
  };
}

class User {
  int id;
  String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
