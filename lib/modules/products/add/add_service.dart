import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shipshop/models/add_products.dart';
import 'package:shipshop/setting/server_set.dart';


class AddService {
  var url = Uri.parse(ServerSet.domainNameServer + ServerSet.store);
  String message = "";
  String token="";

  Future getAdd(String token, Add add, File file) async {
    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body:
        {
          "name_en": add.nameEn,
          "name_ar": add.nameAr,
          "price": add.price,
          "exp_date": add.expDate,
          "description_en": add.descriptionEn,
          "description_ar": add.descriptionAr,
          //"img_url": await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
          "img_url": "add.imgUrl",
          "quantity": add.quantity,
          "categor_id": add.categorId,
        },

    );
    print(response.body);
    if (response.statusCode == 200) {
      var addProducts = addFromJson(response.body);
      return addProducts;
    } else {
      return "false";
    }
  }
}
