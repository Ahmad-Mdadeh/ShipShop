import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shipshop/models/user.dart';
import 'package:shipshop/setting/server_set.dart';

class RegisterService {
  var url = Uri.parse(ServerSet.domainNameServer + ServerSet.register);
  String message="";

  Future<bool> register(User user) async {
    var response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'c_password': user.passwordConfirmation,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
