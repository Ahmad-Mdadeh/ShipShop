import 'package:get/get.dart';
import 'package:shipshop/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());

  }

}