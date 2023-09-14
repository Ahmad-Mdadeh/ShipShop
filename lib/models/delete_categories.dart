// To parse this JSON data, do
//
//     final deleteCategories = deleteCategoriesFromJson(jsonString);

import 'dart:convert';

DeleteCategories deleteCategoriesFromJson(String str) => DeleteCategories.fromJson(json.decode(str));

String deleteCategoriesToJson(DeleteCategories data) => json.encode(data.toJson());

class DeleteCategories {
  DeleteCategories({
    required this.message,
  });

  String message;

  factory DeleteCategories.fromJson(Map<String, dynamic> json) => DeleteCategories(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
