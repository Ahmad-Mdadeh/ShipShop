import 'package:http/http.dart' as http;
import 'package:shipshop/setting/server_set.dart';

class SplashService {
  var url = Uri.parse(ServerSet.domainNameServer + ServerSet.checkValidity);
  String message ="";
  String  token ="";

  Future<bool> checkValid(String token) async {
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }
}
