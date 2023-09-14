// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.expDate,
    required this.imgUrl,
    required this.quantity,
    required this.categorId,
  });

  int id;
  String name;
  int price;
  String description;
  DateTime expDate;
  String imgUrl;
  int quantity;
  int categorId;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        expDate: DateTime.parse(json["exp_date"]),
        imgUrl: json["img_url"],
        quantity: json["quantity"],
        categorId: json["categor_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "exp_date":
            "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
        "img_url": imgUrl,
        "quantity": quantity,
        "categor_id": categorId,
      };

}
