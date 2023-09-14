import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipshop/constant.dart';
import 'package:shipshop/modules/categories/categories_controller.dart';
import 'package:shipshop/modules/categories/delete_categories/delete_categories_controller.dart';
import 'package:shipshop/modules/categories/get_categories/get_categories.dart';


class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesController controller = CategoriesController();
    DeleteCategoriesController controllerDel = DeleteCategoriesController();

    if (controller.get.value) {
      controller.checkCategories();
    }
    return Obx(() {
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
          itemCount: controller.categoriesList.length,
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
                          backgroundImage:
                              AssetImage('assets/images/images.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  controller.categoriesList[index].name,
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.black12,
                                ),
                                child: Column(
                                  children: const [
                                    Text(
                                        'Are you sure to delete the Categories ?'),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                child: Divider(
                                  color: Colors.black26,
                                  thickness: 0.5,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                var id = controller.categoriesList[index].id;
                                controllerDel.id = id;
                                controllerDel.checkDelete();
                                controller.isLoading.value = true;
                                controller.checkCategories();
                                Get.back();
                              },
                              child: const Text('yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back();
                                // print('no');
                              },
                              child: const Text('No'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xefC996CC),
                  child: IconButton(
                    color: white,
                    onPressed: () {
                      var id = controller.categoriesList[index].id;
                      var name = controller.categoriesList[index].name;
                      Get.to(const GetCategories(), arguments: [id, name]);
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
