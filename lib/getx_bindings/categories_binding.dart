import 'package:get/get.dart';
import 'package:shipshop/modules/categories/categories_controller.dart';

class CategoriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CategoriesController>(CategoriesController());
  }
}
