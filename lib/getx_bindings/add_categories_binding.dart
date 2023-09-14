import 'package:get/get.dart';
import 'package:shipshop/modules/categories/add_categories/add_categories_controller.dart';

class AddCategoriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AddCategoriesController>(AddCategoriesController());

  }

}