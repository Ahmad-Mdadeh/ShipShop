import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shipshop/modules/products/delete/delete_service.dart';
import 'package:shipshop/setting/user_set.dart';


class DeleteController extends GetxController {
  DeleteService service = DeleteService();
  int id = 0;


  checkDelete() async {
   var delete = await service.getDelete(UserSet.user_token, id);
    EasyLoading.showSuccess(
      delete,
      duration: const Duration(seconds: 1),
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true,
    );
    Get.offAllNamed('/myDashBoard');
  }
}
