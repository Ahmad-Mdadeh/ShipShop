// To parse this JSON data, do
//
//     final upDate = upDateFromJson(jsonString);

import 'dart:convert';

UpDate upDateFromJson(String str) => UpDate.fromJson(json.decode(str));

String upDateToJson(UpDate data) => json.encode(data.toJson());

class UpDate {
  UpDate({
    required this.nameEn,
    required this.nameAr,
    required this.price,
  });

  String nameEn;
  String nameAr;
  String price;

  factory UpDate.fromJson(Map<String, dynamic> json) => UpDate(
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name_en": nameEn,
        "name_ar": nameAr,
        "price": price,
      };
}
