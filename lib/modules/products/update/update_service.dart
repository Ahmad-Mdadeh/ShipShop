
import 'package:http/http.dart' as http;
import 'package:shipshop/models/message.dart';
import 'package:shipshop/models/update.dart';
import 'package:shipshop/setting/server_set.dart';


class UpDateService {
  String message ="" ;


  Future<String> getupDate(String token,UpDate update,id) async {
    var url = Uri.parse('${ServerSet.domainNameServer}${ServerSet.upDate}$id');
    var response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },

      body:{
        "name_en": update.nameEn,
        "name_ar": update.nameAr,
        "price": update.price,
      },

    );


    if (response.statusCode == 200) {
      var upDate = messageFromJson(response.body);
      return upDate.message;
    }else {
      return 'false';
    }

  }
}
