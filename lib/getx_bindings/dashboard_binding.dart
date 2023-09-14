import 'package:get/get.dart';
import 'package:shipshop/dashboard/dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());

  }

}