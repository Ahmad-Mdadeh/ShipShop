// To parse this JSON data, do
//
//     final getCategories = getCategoriesFromJson(jsonString);

import 'dart:convert';

GetCategories getCategoriesFromJson(String str) =>
    GetCategories.fromJson(json.decode(str));

String getCategoriesToJson(GetCategories data) => json.encode(data.toJson());

class GetCategories {
  GetCategories({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory GetCategories.fromJson(Map<String, dynamic> json) => GetCategories(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.products,
  });

  int id;
  String name;
  List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.price,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.expDate,
    required this.imgUrl,
    required this.quantity,
    required this.categorId,
  });

  int id;
  String nameEn;
  String nameAr;
  int price;
  String descriptionEn;
  String descriptionAr;
  DateTime expDate;
  String imgUrl;
  int quantity;
  int categorId;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        price: json["price"],
        descriptionEn: json["description_en"],
        descriptionAr: json["description_ar"],
        expDate: DateTime.parse(json["exp_date"]),
        imgUrl: json["img_url"],
        quantity: json["quantity"],
        categorId: json["categor_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "price": price,
        "description_en": descriptionEn,
        "description_ar": descriptionAr,
        "exp_date":
            "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
        "img_url": imgUrl,
        "quantity": quantity,
        "categor_id": categorId,
      };
}
