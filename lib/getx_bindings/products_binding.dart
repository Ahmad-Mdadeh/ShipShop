import 'package:get/get.dart';
import 'package:shipshop/modules/products/products_controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductsController>(ProductsController());

  }

}