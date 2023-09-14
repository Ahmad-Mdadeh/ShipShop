
import 'package:http/http.dart' as http;
import 'package:shipshop/models/delete.dart';
import 'package:shipshop/setting/server_set.dart';


class DeleteService {
  String message ="";


  Future<String>  getDelete(String token, id) async {
  var url = Uri.parse('${ServerSet.domainNameServer}${ServerSet.delete}$id');
    var response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );


    if (response.statusCode == 200) {
      var delete = deleteFromJson(response.body);
      return delete.message;
    }else {
      return '';
    }

  }
}
