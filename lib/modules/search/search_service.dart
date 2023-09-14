
import 'package:http/http.dart' as http;
import 'package:shipshop/models/search.dart';
import 'package:shipshop/setting/server_set.dart';

class SearchService {


  Future<List<Datum>> getSearch(String token, price) async {
    var url = Uri.parse('${ServerSet.domainNameServer}${ServerSet.search}$price');
    var response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // print(response.body);
    // print(response.statusCode);
    // print('${price}');

    if (response.statusCode == 200) {
       var search = searchFromJson(response.body);
      return search.data;
    } else {
      return [];
    }
  }
}
