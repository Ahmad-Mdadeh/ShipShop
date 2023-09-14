import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipshop/constant.dart';
import 'package:shipshop/modules/products/delete/delete_controller.dart';
import 'package:shipshop/modules/products/details/details_controller.dart';
import 'package:shipshop/modules/products/update/update.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    DeleteController controllerDel = DeleteController();
    DetailsController controller = DetailsController();
    int id = 0;

    if (controller.get.value) {
      controller.checkProducts();
      controller.get(true);
    }

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: const Color(0xff4C3f91),
        title: Text(
          '${controller.name}',
          style: const TextStyle(
            fontSize: 25.0,
          ),
        ), ///////// name products
      ),
      body: Column(
        children: [
          const SizedBox(height: 15.0,),
          Stack(
            children: [
              CircleAvatar(
                radius: 103.0,
                backgroundColor: Colors.blueGrey,
                child: Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/pic1.jpg'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 13.0,
          ),
          const Text(
            'Details :',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'HelloSnow',
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                  strokeWidth: 3,
                ),
              );
            }
            return Container(
              height: 230.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff916BBF),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Name : ',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            '${controller.Details.nameEn}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        child: Divider(
                          color: Colors.black26,
                          thickness: 0.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Price : ',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            '${controller.Details.price}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        child: Divider(
                          color: Colors.black26,
                          thickness: 0.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'DescriptionAr : ',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            '${controller.Details.descriptionAr}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        child: Divider(
                          color: Colors.black26,
                          thickness: 0.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'ExpDate : ',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            '${controller.Details.expDate}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        child: Divider(
                          color: Colors.black26,
                          thickness: 0.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Quantity : ',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            '${controller.Details.quantity}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        child: Divider(
                          color: Colors.black26,
                          thickness: 0.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Categories id : ',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            '${controller.Details.categorId}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        child: Divider(
                          color: Colors.black26,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 1,
                ),
                itemCount: 1,
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xff916BBF),
                      child: IconButton(
                        onPressed: () {
                          id = controller.id;

                          Get.to(const UpDate(), arguments: id);
                        },
                        icon: const Icon(
                          Icons.edit,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text('Edit'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xff916BBF),
                      child: IconButton(
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
                                            'Are you sure to delete the products ?'),
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
                                    controllerDel.id = controller.id;
                                    id = controller.id;
                                    controllerDel.checkDelete();
                                  },
                                  child: const Text('yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    id = controller.id;
                                    Get.back();
                                    // print('no');
                                  },
                                  child: const Text('No'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text('Delete'),
                  ],
                ),
                SizedBox(
                  width: 45.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircleAvatar(
                        backgroundColor: Color(0xff916BBF),
                        foregroundColor: Colors.white,
                        child: Icon(Icons.thumb_up_alt),
                      ),
                      Text('Like'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
