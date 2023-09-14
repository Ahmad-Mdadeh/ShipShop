// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  Search({
    required this.data,
  });

  List<Datum> data;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    required this.price,
    this.description,
    this.expDate,
    this.imgUrl,
    this.quantity,
    this.categorId,
  });

  int? id;
  String? name;
  int price;
  String? description;
  DateTime? expDate;
  dynamic? imgUrl;
  int? quantity;
  int? categorId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"] == null ? null : json["description"],
        expDate: DateTime.parse(json["exp_date"]),
        imgUrl: json["img_url"],
        quantity: json["quantity"],
        categorId: json["categor_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description == null ? null : description,
        "exp_date":
            "${expDate?.year.toString().padLeft(4, '0')}-${expDate?.month.toString().padLeft(2, '0')}-${expDate?.day.toString().padLeft(2, '0')}",
        "img_url": imgUrl,
        "quantity": quantity,
        "categor_id": categorId,
      };
}
