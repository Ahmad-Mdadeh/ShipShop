import 'package:get/get.dart';
import 'package:shipshop/modules/products/add/add_controller.dart';

class AddBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AddController>(AddController());

  }

}