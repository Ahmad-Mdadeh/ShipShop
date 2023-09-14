
import 'package:http/http.dart' as http;
import 'package:shipshop/models/add_categories.dart';
import 'package:shipshop/setting/server_set.dart';


class AddCategoriesService {
    var url = Uri.parse(ServerSet.domainNameServer + ServerSet.storeCate);

  Future<String> getupDate(String token,String name) async {
    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },

      body:{
        "name":"",
      },

    );
    print(response.body);
    if (response.statusCode == 200) {
      var addCate = addCategoriesFromJson(response.body);
      return addCate.message;
    }else {
      return 'false';
    }

  }
}
