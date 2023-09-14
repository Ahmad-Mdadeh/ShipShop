// To parse this JSON data, do
//
//     final add = addFromJson(jsonString);

import 'dart:convert';

import 'dart:io';


Add addFromJson(String str) => Add.fromJson(json.decode(str));

String addToJson(Add data) => json.encode(data.toJson());

class Add {
  Add({
     this.nameEn,
     this.nameAr,
     this.price,
     this.descriptionEn,
     this.descriptionAr,
     this.expDate,
     this.imgUrl,
     this.quantity,
     this.categorId,
  });

  String ? nameEn;
  String ? nameAr;
  String ? price;
  String ? descriptionEn;
  String ? descriptionAr;
  String ? expDate;
  File ? imgUrl;
  String ? quantity;
  String ? categorId;

  factory Add.fromJson(Map<String, dynamic> json) => Add(
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        price: json["price"],
        descriptionEn: json["description_en"],
        descriptionAr: json["description_ar"],
        expDate: json["exp_date"],
        imgUrl: json["img_url"],
        quantity: json["quantity"],
        categorId: json["categor_id"],
      );

  Map<String, dynamic> toJson() => {
        "name_en": nameEn,
        "name_ar": nameAr,
        "price": price,
        "description_en": descriptionEn,
        "description_ar": descriptionAr,
        "exp_date": expDate,
        "img_url": imgUrl,
        "quantity": quantity,
        "categor_id": categorId,
      };
}
