import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipshop/components/custom_textField.dart';
import 'package:shipshop/constant.dart';
import 'package:shipshop/modules/products/details/details.dart';
import 'package:shipshop/modules/search/search_controller.dart';


class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchController controller = Get.put<SearchController>(SearchController());
    var price;
    return Scaffold(
      backgroundColor: const Color(0x0f916BBF),
      appBar: AppBar(
        title: const Text(
          'Search',
        ),
        backgroundColor: const Color(0xef3D2C8D),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Column(
          children: [
            defaultField(
              functionSup: (value) {
                price = value;
                controller.price = price;
                controller.changeValue();
              },
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              type: TextInputType.number,
              labelText: "Enter the products price",
              prefix: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return const LinearProgressIndicator(
                  color: Color(0xffC996CC),
                  backgroundColor: Color(0x0f916BBF),
                );
              }
              return Expanded(
                child: ListView.separated(
                  itemCount: controller.searchList.length,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                    child: Divider(
                      color: Colors.black26,
                      thickness: 0.5,
                    ),
                  ),
                  itemBuilder: (context, index) => Row(
                    children: [
                      const SizedBox(
                        width: 9.0,
                      ),
                      CircleAvatar(
                        child: Container(
                          height: 200.0,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            //  radius: 250.0,
                            backgroundImage:
                                AssetImage('assets/images/images_4.jfif'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${controller.searchList[index].name}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text(
                            'Old Price: ${controller.searchList[index].price}',
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0x5f000000),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: const Color(0x9f3D2C8D),
                        child: IconButton(
                          color: white,
                          onPressed: () {
                            var id = controller.searchList[index].id;
                            var name = controller.searchList[index].name;
                            Get.to(const Details(), arguments: [id,name]);
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
