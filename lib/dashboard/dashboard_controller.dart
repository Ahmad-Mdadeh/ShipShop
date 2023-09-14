import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 0;

  void changeCurrentIndex (index){
    currentIndex = index;
    update();
  }


}