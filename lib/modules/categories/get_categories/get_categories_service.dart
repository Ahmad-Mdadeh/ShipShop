
import 'package:http/http.dart' as http;
import 'package:shipshop/models/get_categories.dart';
import 'package:shipshop/setting/server_set.dart';

class GetCategoriesService {


  Future<List<Product>> getCategories(String token , id) async {
  var url = Uri.parse('${ServerSet.domainNameServer}${ServerSet.getCategories}$id');
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );


    if (response.statusCode == 200) {
      var categories = getCategoriesFromJson(response.body);
      return categories.data.products;
    }else{
      return [];
    }
  }
}
