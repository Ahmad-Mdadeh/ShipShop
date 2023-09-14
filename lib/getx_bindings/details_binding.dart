import 'package:get/get.dart';
import 'package:shipshop/modules/products/details/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DetailsController>(DetailsController());

  }

}