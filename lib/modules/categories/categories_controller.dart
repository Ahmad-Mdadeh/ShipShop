


import 'package:get/get.dart';
import 'package:shipshop/models/categories.dart';
import 'package:shipshop/modules/categories/categories_service.dart';
import 'package:shipshop/setting/user_set.dart';

class CategoriesController extends GetxController {

  List<Categories> categoriesList= [];
  CategoriesService service = CategoriesService();
  var isLoading = true.obs;
  var get = true.obs ;
  String name="";



  Future checkCategories() async {
    categoriesList = await service.categories(UserSet.user_token);
    isLoading(false);
  }

}
