import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shipshop/modules/categories/delete_categories/delete_categories_service.dart';
import 'package:shipshop/setting/user_set.dart';


class DeleteCategoriesController extends GetxController {
  DeleteCategoriesService service = DeleteCategoriesService();
  int id =0 ;





  checkDelete() async {
    var deleteCate = await service.getDeleteCategories(UserSet.user_token, id);
    EasyLoading.showSuccess(
      deleteCate,
      duration: const Duration(seconds: 1),
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true,
    );
    }
}
