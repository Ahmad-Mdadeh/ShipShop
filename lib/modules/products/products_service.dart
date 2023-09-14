
import 'package:http/http.dart' as http;
import 'package:shipshop/models/products.dart';
import 'package:shipshop/setting/server_set.dart';

class ProductsService {
  String message ="";
  var url = Uri.parse(ServerSet.domainNameServer + ServerSet.products);

  Future<List<Products>> getProducts(String token) async {
    var response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var products = productsFromJson(response.body);
      return products;
    } else {
      return [];
    }

  }


}
