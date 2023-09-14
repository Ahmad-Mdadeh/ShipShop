import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipshop/constant.dart';
import 'package:shipshop/models/add_products.dart';
import 'package:shipshop/modules/products/add/add_service.dart';
import 'package:shipshop/setting/user_set.dart';


class AddController extends GetxController {
  AddService service = AddService();
  RxBool isLoading = false.obs;
  RxBool get = true.obs;
  bool load = false;
  RxString selectedImagePath = ''.obs;
  final picker = ImagePicker();
  File file = File('');

  String? nameEn;
  String? nameAr;
  String? price;
  String? descriptionAr;
  String? descriptionEn;
  String? exp_date;
  String? quantity;
  String? categor_id;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getImage(ImageSource src) async {
    final pickedFile = await picker.pickImage(source: src);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      file = File(selectedImagePath.value);
      // String base = base64Encode(file.readAsBytesSync());
      // String imageName = selectedImagePath.value.split('/').last;
      Get.back();
      load = true;
    } else {
      Get.snackbar(
        'Error',
        'Pleas select image',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.deepPurple,
        colorText: white,
        duration: const Duration(seconds: 2),
      );
      Get.back();
    }
  }

  Future<void> saveCheng() async {
    Add add = Add(
      descriptionAr: descriptionAr,
      descriptionEn: descriptionAr,
      nameAr: nameAr,
      nameEn: nameEn,
      price: price,
      expDate: exp_date,
      quantity: quantity,
      categorId: categor_id,
    );
    if (nameEn == null ||
        descriptionAr == null ||
        nameAr == null ||
        price == null ||
        exp_date == null ||
        quantity == null ||
        categor_id == null) {
      EasyLoading.showError(
        'Please make sure the info is correct',
        duration: const Duration(seconds: 1),
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );
    } else {
      var saveUpDate = await service.getAdd(UserSet.user_token, add, file);
      isLoading(false);
      EasyLoading.showSuccess(
        'Add successfully',
        duration: const Duration(seconds: 1),
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );
    }
  }
}
