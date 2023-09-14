import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipshop/constant.dart';
import 'package:shipshop/modules/categories/get_categories/get_gategories_controller.dart';
import 'package:shipshop/modules/products/details/details.dart';


class GetCategories extends StatelessWidget {
  const GetCategories({super.key});

  @override
  Widget build(BuildContext context) {
    GetCategoriesController controller = GetCategoriesController();
    if (controller.get.value) {
      controller.checkCategories();
      controller.get(true);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.name}',style: const TextStyle(
          fontSize: 25.0,
        ),),
        backgroundColor: const Color(0xff4C3f91),
      ),
      body: Obx((){
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
              strokeWidth: 3,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ListView.separated(
            itemCount: controller.getCategoriesList.length,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                child: Divider(
                  color: Colors.black26,
                  thickness: 0.5,
                ),
              ),
            ),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 33.0,
                        backgroundColor: Colors.blueGrey,
                        child: Container(
                          height: 60.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/images.jpeg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    controller.getCategoriesList[index].nameEn,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: const Color(0xefC996CC),
                    child: IconButton(
                      color: white,
                      onPressed: () {
                        var id = controller.getCategoriesList[index].id;
                        var name = controller.getCategoriesList[index].nameEn;
                        Get.to(Details(),arguments: [id,name]);
                        },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      })

    );
  }
}
