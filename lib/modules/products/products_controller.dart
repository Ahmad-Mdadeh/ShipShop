
import 'package:get/get.dart';
import 'package:shipshop/modules/products/products_service.dart';

import '../../setting/user_set.dart';

class ProductsController extends GetxController {
  List productsList= [];
  ProductsService service = ProductsService();
  var isLoading = true.obs;
  var get = true.obs ;



  Future checkProducts() async {
    productsList = await service.getProducts(UserSet.user_token);
    isLoading(false);
  }
}
