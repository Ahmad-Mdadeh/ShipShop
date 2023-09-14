import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipshop/components/custom_button.dart';
import 'package:shipshop/components/custom_textField.dart';
import 'package:shipshop/constant.dart';
import 'package:shipshop/modules/products/add/add_controller.dart';


class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    AddController controller =AddController();
    return Scaffold(
      body: Obx((){
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
              strokeWidth: 3,
            ),
          );
        }
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Add Products',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'HelloSnow',
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 78.0,
                      backgroundColor: const Color(0x2f000000),
                      child: Container(
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Obx(() {
                          if (controller.selectedImagePath == '') {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Selected image',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: white,
                                  ),
                                ),
                              ],
                            );
                          }
                          return CircleAvatar(
                            backgroundImage: FileImage(
                              File(controller.selectedImagePath.value),
                            ),
                          );
                        }),
                      ),
                    ),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.deepPurple,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'Choose picture from :',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: SizedBox(
                              height: 140.0,
                              child: Column(
                                children: [
                                  const Divider(
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xffC996CC),
                                    ),
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.image,
                                        color: white,
                                      ),
                                      title: const Text(
                                        'Gallery',
                                        style: TextStyle(
                                          color: white,
                                        ),
                                      ),
                                      onTap: () {
                                        controller.getImage(ImageSource.gallery);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xffC996CC),
                                    ),
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.camera,
                                        color: white,
                                      ),
                                      title: const Text(
                                        'Camera',
                                        style: TextStyle(
                                          color: white,
                                        ),
                                      ),
                                      onTap: () {
                                        controller.getImage(ImageSource.camera);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                defaultField(
                  type: TextInputType.text,
                  labelText: 'Enter the new nameEn',
                  function: (value) {
                    controller.nameEn = value;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultField(
                  type: TextInputType.text,
                  labelText: 'Enter the new nameAr',
                  function: (value) {
                    controller.nameAr = value;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultField(
                  type: TextInputType.text,
                  labelText: 'Enter the new descriptionEn',
                  function: (value) {
                    controller.descriptionEn = value;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultField(
                  type: TextInputType.text,
                  labelText: 'Enter the new descriptionAr',
                  function: (value) {
                    controller.descriptionAr = value;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultField(
                    type: TextInputType.number,
                    labelText: 'Enter the new price',
                    function: (value) {
                      controller.price = value;
                    }),
                const SizedBox(
                  height: 10.0,
                ),
                defaultField(
                    type: TextInputType.datetime,
                    labelText: 'Enter the new exp_date',
                    function: (value) {
                      controller.exp_date = value;
                    }),
                const SizedBox(
                  height: 10.0,
                ),
                defaultField(
                    type: TextInputType.number,
                    labelText: 'Enter the new quantity',
                    function: (value) {
                      controller.quantity = value;
                    }),
                const SizedBox(
                  height: 10.0,
                ),
                defaultField(
                    type: TextInputType.number,
                    labelText: 'Enter the new categories id',
                    function: (value) {
                      controller.categor_id = value;
                    }),
                const SizedBox(
                  height: 35,
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
      })
    );
  }
}
