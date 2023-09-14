import 'package:get/get.dart';
import 'package:shipshop/models/user.dart';
import 'login_service.dart';

class LoginController extends GetxController {
  late String email;
  late String password;
  late bool checkLogin;
  late RxBool isPassword;
  late RxBool isCheckBox;
  late LoginService service;

  @override
  void onInit() {
    email = '';
    password = '';
    isPassword = true.obs;
    isCheckBox = false.obs;
    service = LoginService();
    super.onInit();
  }

  void showPassword() {
    isPassword(!(isPassword.value));
  }

  void  chengCheckBox() async {
    isCheckBox(!(isCheckBox.value));

  }

  Future<void> loginOnClick() async {
    User user = User(
      email: email,
      password: password,
    );
    checkLogin = await service.login(user);
    // message = service.message;
    //
    // if (message is List) {
    //   String temp = '';
    //   for (String s in message) temp += s + '\n';
    //   message = temp;
    // }
  }
}
