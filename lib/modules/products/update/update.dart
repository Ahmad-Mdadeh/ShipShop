import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipshop/components/custom_button.dart';
import 'package:shipshop/components/custom_textField.dart';
import 'package:shipshop/modules/products/update/update_controller.dart';


class UpDate extends StatelessWidget {
  const UpDate({super.key});

  @override
  Widget build(BuildContext context) {
    UpDateController controller = Get.put<UpDateController>(UpDateController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit product data'),
        backgroundColor: const Color(0xff4C3f91),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defaultField(
              type: TextInputType.text,
              labelText: 'Enter the new nameEn',
              function: (value){
                controller.nameEn = value ;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            defaultField(
              type: TextInputType.text,
              labelText: 'Enter the new nameAr',
              function: (value){
                controller.nameAR = value;
              }
            ),
            const SizedBox(
              height: 20.0,
            ),
            defaultField(
              type: TextInputType.number,
              labelText: 'Enter the new price',
              function: (value){
                controller.price = value;
              }
            ),
            const SizedBox(
              height: 40.0,
            ),
            defaultButton(
              function: () {
                controller.saveCheng();
              },
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
