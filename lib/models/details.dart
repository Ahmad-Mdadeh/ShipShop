// To parse this JSON data, do
//
//     final details = detailsFromJson(jsonString);

import 'dart:convert';

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
  Details({
    required this.data,
  });

  Data data;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.nameAr,
    required this.nameEn,
    required this.price,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.expDate,
    required this.imgUrl,
    required this.quantity,
    required this.categorId,
  });

  String nameAr;
  String nameEn;
  var price;
  String descriptionAr;
  String descriptionEn;
  DateTime expDate;
  String imgUrl;
  int quantity;
  int categorId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        price: json["price"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        expDate: DateTime.parse(json["exp_date"]),
        imgUrl: json["img_url"],
        quantity: json["quantity"],
        categorId: json["categor_id"],
      );

  Map<String, dynamic> toJson() => {
        "name_ar": nameAr,
        "name_en": nameEn,
        "price": price,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "exp_date":
            "${expDate.year.toString().padLeft(4, '0')}-${expDate.month.toString().padLeft(2, '0')}-${expDate.day.toString().padLeft(2, '0')}",
        "img_url": imgUrl,
        "quantity": quantity,
        "categor_id": categorId,
      };
}
