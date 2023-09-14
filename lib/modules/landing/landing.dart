import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shipshop/components/custom_button.dart';
import 'package:shipshop/constant.dart';


class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6E3CBC),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: gradientBackColor,
        child: Column(
          children: [
            const SizedBox(
              height: 75.0,
            ),
            const Image(
              image: AssetImage('assets/images/shopping.png'),
              fit: BoxFit.cover,
              width: 200.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "WELCOME",
              style: TextStyle(
                fontSize: 80.0,
                color: Colors.white,
                fontFamily: 'ChristmasDream',
              ),
            ),
            const SizedBox(
              height: 225.0,
            ),
           defaultButton(
              width: MediaQuery.of(context).size.width*.9,
              text: "Sing in",
              function: () {
                Get.offAllNamed('/login');
              },
            ),
            const SizedBox(
              height: 17.0,
            ),
            defaultButton(
              width: MediaQuery.of(context).size.width*.9,
              text: "Register",
              function: () {
                Get.offAllNamed('/register');
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "costumer serves",
                  style: TextStyle(
                    color: white,
                  ),
                ),
                TextButton(
                  onPressed: () {

                  },
                  child: const Text(
                    "Click here",
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
    );
  }
}
