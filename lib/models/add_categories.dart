// To parse this JSON data, do
//
//     final addCategories = addCategoriesFromJson(jsonString);

import 'dart:convert';

AddCategories addCategoriesFromJson(String str) => AddCategories.fromJson(json.decode(str));

String addCategoriesToJson(AddCategories data) => json.encode(data.toJson());

class AddCategories {
  AddCategories({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory AddCategories.fromJson(Map<String, dynamic> json) => AddCategories(
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
  required  this.name,
  });

  String name;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
