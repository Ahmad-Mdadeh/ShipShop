import 'package:get/get.dart';
import 'package:shipshop/modules/products/delete/delete_controller.dart';

class DeleteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DeleteController>(DeleteController());

  }

}