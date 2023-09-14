import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shipshop/components/custom_button.dart';
import 'package:shipshop/constant.dart';
import 'package:shipshop/modules/register/register_controller.dart';

import '../../components/custom_textField.dart';





class Register extends StatelessWidget {
   final formKey = GlobalKey<FormState>();
 final  RegisterController controller = Get.find();
  final bool isPassword = false;
  final bool isConfPassword = false;

  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xef3D2C8D),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: gradientBackColor,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Image(
                    image: AssetImage('assets/images/shopping.png'),
                    fit: BoxFit.cover,
                    width: 200.0,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: 150.0,
                        child: Divider(
                          color: Color(0x55ffffff),
                          thickness: 1.5,
                        ),
                      ),
                      const Text(
                        "Sing in",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      const SizedBox(
                        width: 150.0,
                        child: Divider(
                          color: Color(0x55ffffff),
                          thickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60.0,
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
                      prefix: const Icon(
                        Icons.person,
                        color: Color(0x99ffffff),
                      ),
                      function: (value) {
                        controller.name = value;
                      },
                      labelText: "User Name",
                      type: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
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
                      prefix: const Icon(
                        Icons.email,
                        color: Color(0x99ffffff),
                      ),
                      function: (value) {
                        controller.email = value;
                      },
                      labelText: "Email Address",
                      type: TextInputType.emailAddress,
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
                        isPassword: controller.isPassword.value,
                        type: TextInputType.visiblePassword,
                        labelText: "Password",
                        function: (value) {
                          controller.password = value;
                        },
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
                        isPassword: controller.isPasswordConf.value,
                        type: TextInputType.visiblePassword,
                        labelText: "Confirm Password",
                        function: (value) {
                          controller.passwordConfirm = value;
                        },
                        prefix: const Icon(
                          Icons.lock,
                          color: Color(0xbbffffff),
                        ),
                        suffix: IconButton(
                          onPressed: () {
                            controller.showPasswordConf();
                          },
                          icon: Icon(
                            controller.isPasswordConf.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          color: const Color(0xbbffffff),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        ChengRegister();
                      }
                    },
                    text: "Sing in",
                    width: MediaQuery.of(context).size.width * .9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account ?",
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offNamed('/login');
                        },
                        child: const Text(
                          "Sing in",
                          style: TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void ChengRegister() async {
    EasyLoading.show(
      status: ('Loading...'),
      maskType: EasyLoadingMaskType.black,
    );
    await controller.registerOnClick();
    if (controller.checkRegister) {
      EasyLoading.showToast(
        ('Register successfully'),
        maskType: EasyLoadingMaskType.black,
        duration: const Duration(seconds: 1),
        dismissOnTap: true,
        toastPosition: EasyLoadingToastPosition.bottom,
      );
      Get.offAllNamed('/myDashBoard');
    // } else {
    //   EasyLoading.showToast(
    //     ('false'),
    //     maskType: EasyLoadingMaskType.black,
    //     duration: Duration(seconds: 10),
    //     dismissOnTap: true,
    //     toastPosition: EasyLoadingToastPosition.bottom,
    //   );
    }
  }
}
