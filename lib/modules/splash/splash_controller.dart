import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shipshop/modules/splash/splash_service.dart';
import 'package:shipshop/native_storage/secure_storage.dart';
import 'package:shipshop/setting/user_set.dart';


class SplashController extends GetxController {
  late bool validityToken;
  // SecureStorage storage = SecureStorage();
  SplashService service = SplashService();

  @override
  void onInit() async {
    await checkToken();
    validityToken = false;
    super.onInit();
  }



  Future<void> checkToken() async {
    String token = "";
    // String? token = await storage.read('token');
    if (token != null) {
      await validToken(token);
      if (validityToken) {
        UserSet.user_token = token;
        Get.offAllNamed('/myDashBoard');
      }
    } else{
      EasyLoading.showError('Login Error..');
      Get.offNamed('/login');
    }
  }

  Future<void> validToken(String token) async {
    validityToken = await service.checkValid(token);
  }
}
