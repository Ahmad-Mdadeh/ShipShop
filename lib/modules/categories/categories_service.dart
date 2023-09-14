
import 'package:http/http.dart' as http;
import 'package:shipshop/models/categories.dart';
import 'package:shipshop/setting/server_set.dart';

class CategoriesService {


  var url = Uri.parse(ServerSet.domainNameServer + ServerSet.categories);

  Future<List<Categories>> categories(String token) async {
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    print(response.body);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      var categories = categoriesFromJson(response.body);
      return categories;
    }else{
      return [];
    }
  }
}
