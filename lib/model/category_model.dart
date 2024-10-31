class CategoryModel {
  List<Datum> data;
  String message;

  CategoryModel({
    required this.data,
    required this.message,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int id;
  String name;

  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
