import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shipshop/models/user.dart';
import 'package:shipshop/setting/server_set.dart';
import 'package:shipshop/setting/user_set.dart';


class LoginService {
  var url = Uri.parse(ServerSet.domainNameServer + ServerSet.login);
  String message="";
  String token="";

  Future<bool> login(User user) async {
    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'email': user.email,
        'password': user.password,
      },
    );
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      token = jsonResponse['access_token'];
      print(token+"fffffffffffffffffffff");
      UserSet.user_token = token;
      // if (CheckBox) {
      //   SecureStorage storage = SecureStorage();
      //   await storage.save('token', UserSet.user_token);
      // }
      return true;
    } else if (response.statusCode == 422) {
      message = jsonResponse['errors'];
      return false;
    } else {
      return false;
    }
  }
}
