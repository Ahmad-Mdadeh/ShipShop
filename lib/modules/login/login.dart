import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shipshop/components/custom_button.dart';
import 'package:shipshop/components/custom_textField.dart';
import 'package:shipshop/constant.dart';
import 'package:shipshop/modules/login/login_controller.dart';


class Login extends StatelessWidget {
 final  LoginController controller = Get.find();
  final formKey = GlobalKey<FormState>();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xef3D2C8D),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: gradientBackColor,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                const Image(
                  image: AssetImage('assets/images/shopping.png'),
                  width:double.infinity,
                  height: 200.0,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SizedBox(
                      width: 150.0,
                      child: Divider(
                        color: Color(0x55ffffff),
                        thickness: 1.5,
                      ),
                    ),
                    Text(
                      "Sing in",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      child: Divider(
                        color: Color(0x55ffffff),
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        EasyLoading.showError(
                          ' Not available now !',
                          maskType: EasyLoadingMaskType.black,
                        );
                      },
                      child: const Image(
                        image: AssetImage('assets/images/Facebook.png'),
                        width: 35.0,
                      ),
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        EasyLoading.showError(
                          ' Not available now !',
                          maskType: EasyLoadingMaskType.black,
                        );
                      },
                      child: const Image(
                        image: AssetImage('assets/images/Gmail.png'),
                        width: 35.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: defaultField(
                    style: const TextStyle(
                      color: white,
                      fontWeight: FontWeight.w300,
                    ),
                    labelStyle: const TextStyle(
                      color: Color(0xeeffffff),
                      fontWeight: FontWeight.w100,
                    ),
                    function: (value) {
                      controller.email = value;
                    },
                    type: TextInputType.emailAddress,
                    labelText: "Email Address",
                    prefix: const Icon(
                      Icons.email,
                      color: Color(0xbbffffff),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Obx(() {
                    return defaultField(
                      style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.w300,
                      ),
                      labelStyle: const TextStyle(
                        color: Color(0xeeffffff),
                        fontWeight: FontWeight.w100,
                      ),
                      function: (value) {
                        controller.password = value;
                      },
                      isPassword: controller.isPassword.value,
                      type: TextInputType.visiblePassword,
                      labelText: "Password",
                      prefix: const Icon(
                        Icons.lock,
                        color: Color(0xbbffffff),
                      ),
                      suffix: IconButton(
                        onPressed: () {
                          controller.showPassword();
                        },
                        icon: Icon(
                          controller.isPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        color: const Color(0xbbffffff),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.chengCheckBox();
                        },
                        icon: Icon(
                          controller.isCheckBox.value
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: white,
                        ),
                      ),
                      const Text(
                        'Keep me in Sing in',
                        style: TextStyle(
                          color: white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultButton(
                      text: 'Sing in',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          chengLogin();
                        }

                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don 't have email address?",
                      style: TextStyle(
                        color: white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed('/register');
                      },
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void chengLogin() async {
    EasyLoading.show(
      status: ('Loading...'),
      maskType: EasyLoadingMaskType.black,
    );
    await controller.loginOnClick();
    if (controller.checkLogin) {
      EasyLoading.showToast(
        ('Login successfully'),
        maskType: EasyLoadingMaskType.black,
        duration: const Duration(seconds: 1),
        dismissOnTap: true,
        toastPosition: EasyLoadingToastPosition.bottom,
      );
      Get.offNamed('/myDashBoard');
      // } else {
      //   EasyLoading.showToast(
      //     (controller.message),
      //     maskType: EasyLoadingMaskType.black,
      //     duration: Duration(seconds: 1),
      //     dismissOnTap: true,
      //     toastPosition: EasyLoadingToastPosition.bottom,
      //   );
    }
  }
}
