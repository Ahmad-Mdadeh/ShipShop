import 'package:get/get.dart';
import 'package:shipshop/modules/search/search_service.dart';
import 'package:shipshop/setting/user_set.dart';


class SearchController extends GetxController {
  SearchService service = SearchService();
  var isLoading = true.obs;
  var price;

  RxList searchList = [].obs;
  RxBool get = true.obs;





  Future<void> changeValue() async {
    if (price != '') {
      searchList.value = await service.getSearch(UserSet.user_token, price);
      isLoading(false);
    }
  }
}
