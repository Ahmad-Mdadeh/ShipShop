import 'package:get/get.dart';
import 'package:shipshop/modules/products/details/details_service.dart';
import 'package:shipshop/setting/user_set.dart';


class DetailsController extends GetxController {
  var id;
  var name;
  var Details;
  var get = true.obs;
  var isLoading = true.obs;
  var argument = Get.arguments;
  DetailsService service = DetailsService();


  Future checkProducts() async {
    id = argument [0];
    name = argument[1];
    Details = await service.getDetails(UserSet.user_token, id);
    isLoading(false);
  }
}
