import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipshop/modules/products/add/add_controller.dart';
import 'package:shipshop/modules/products/details/details.dart';
import 'package:shipshop/modules/products/products_controller.dart';

class Products extends StatelessWidget {
  Products({super.key});

  final List image = [
    "assets/images/pic1.jpg",
    "assets/images/pic1.jpg",
    "assets/images/pic1.jpg",
    "assets/images/pic1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    ProductsController controller = ProductsController();
    AddController controllerAdd = Get.put<AddController>(AddController());
    var id;

    if (controller.get.value) {
      controller.checkProducts();
      controller.get(true);
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
            items: const [
              Image(
                image: AssetImage('assets/images/images_1.jfif'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Image(
                image: AssetImage('assets/images/images_2.jfif'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Image(
                image: AssetImage('assets/images/images_3.jpg'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
            options: CarouselOptions(
              height: 200.0,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Obx(
            () {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator(
                  color: Colors.deepPurple,
                  strokeWidth: 3,
                );
              }
              return GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1,
                crossAxisCount: 2,
                children: List.generate(
                  controller.productsList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      id = controller.productsList[index].id;
                      var name = controller.productsList[index].name;
                      Get.to(const Details(), arguments: [id, name]);
                    },
                    child: Column(
                      children: [
                        controllerAdd.load
                            ? Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 53.0,
                                    backgroundColor: Colors.blueGrey,
                                    child: Container(
                                      height: 100.0,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: FileImage(
                                          File(controllerAdd
                                              .selectedImagePath.value),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 73.0,
                                    backgroundColor: Colors.white,
                                    child: Container(
                                      height: 140.0,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                          'assets/images/pic1.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          controller.productsList[index].name,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LuxuriousRomanRegular',
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
