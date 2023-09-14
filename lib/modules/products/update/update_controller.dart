import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shipshop/models/update.dart';
import 'package:shipshop/modules/products/update/update_service.dart';
import 'package:shipshop/setting/user_set.dart';


class UpDateController extends GetxController {
  var id;
  late String nameEn;
  late String nameAR;
  late String price;
  String message="";
  var isLoading = true.obs;

  UpDateService service = UpDateService();

  @override
  void onInit() {
    id = Get.arguments;
    nameEn = '';
    nameAR = '';
    price = '';
    super.onInit();
  }


  Future<void> saveCheng() async {
    UpDate update = UpDate(nameEn: nameEn, nameAr: nameAR, price: price);
    var saveUpDate = await service.getupDate(UserSet.user_token, update, id);
    if (nameEn == '' || nameEn == '' || price == '') {
      EasyLoading.showError(
        'Please make sure the info is correct',
        duration: const Duration(seconds: 1),
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );
    } else {
      EasyLoading.showSuccess(
        saveUpDate,
        duration: const Duration(seconds: 1),
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: true,
      );
      Get.offNamed('/myDashBoard');
      isLoading(false);
    }
  }

}
