import 'package:get/get.dart';
import 'package:shipshop/models/user.dart';
import 'package:shipshop/modules/register/register_service.dart';


class RegisterController extends GetxController {
  String name = '';
  String email = '';
  String password = '';
  String passwordConfirm = '';
  RxBool isPassword = true.obs;
  RxBool isPasswordConf = true.obs;
  bool checkRegister = false;
  String message ="";

  RegisterService service = RegisterService();

  void showPassword() {
    isPassword(!(isPassword.value));
  }

  void showPasswordConf() {
    isPasswordConf(!(isPasswordConf.value));
  }

  Future<void> registerOnClick() async {
    User user = User(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirm,
    );

    checkRegister = await service.register(user);
  }
}
