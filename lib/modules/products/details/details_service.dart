
import 'package:http/http.dart' as http;
import 'package:shipshop/models/details.dart';
import 'package:shipshop/setting/server_set.dart';

class DetailsService {
  String message =" ";
  var nop ;
  bool ? check ;

  Future<dynamic> getDetails(String token, id) async {
    var url = Uri.parse('${ServerSet.domainNameServer}${ServerSet.details}$id');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      check = true ;
      var details = detailsFromJson(response.body);
      return details.data;
    } else {
      return nop;
    }
  }
}
