import 'package:http/http.dart' as http;
import 'package:shipshop/models/delete_categories.dart';
import 'package:shipshop/setting/server_set.dart';


class DeleteCategoriesService {


  Future<String> getDeleteCategories(String token, id) async {
    var url = Uri.parse('${ServerSet.domainNameServer}${ServerSet.deleteCate}$id');
    var response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );


    if (response.statusCode == 200) {
      var delete = deleteCategoriesFromJson(response.body);
      return delete.message;
    }else {
      return '';
    }

  }
}
