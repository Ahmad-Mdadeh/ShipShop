import 'package:get/get.dart';
import 'package:shipshop/modules/landing/landing_controller.dart';

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LandingController>(LandingController());

  }

}