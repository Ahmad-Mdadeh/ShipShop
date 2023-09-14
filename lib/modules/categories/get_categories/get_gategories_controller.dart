import 'package:get/get.dart';
import 'package:shipshop/models/get_categories.dart';
import 'package:shipshop/modules/categories/categories_controller.dart';
import 'package:shipshop/modules/categories/get_categories/get_categories_service.dart';
import 'package:shipshop/setting/user_set.dart';


class GetCategoriesController extends GetxController {
  List<Product> getCategoriesList = [];
  GetCategoriesService service = GetCategoriesService();
  CategoriesController controller = CategoriesController();
  var isLoading = true.obs;
  var get = true.obs;
  String name = "";
  int id = 0;

  var argument = Get.arguments;


  Future checkCategories() async {
    id = argument[0];
    name = argument[1];
    getCategoriesList = await service.getCategories(UserSet.user_token, id);
    isLoading(false);
  }
}
