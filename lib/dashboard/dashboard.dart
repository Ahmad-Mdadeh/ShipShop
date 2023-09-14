import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipshop/modules/categories/categories.dart';
import 'package:shipshop/modules/products/add/add.dart';
import 'package:shipshop/modules/products/products.dart';
import 'package:shipshop/modules/setting/setting.dart';
import 'package:shipshop/navigation/custom_animated_bottom_bar.dart';


import 'dashboard_controller.dart';

class MyDashBoard extends StatelessWidget {
  const MyDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4C3f91),
          title: const Text('HOME'),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('/search');
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.currentIndex,
            children: [
              Products(),
              Categories(),
              Add(),
              Setting(),
            ],
          ),
        ),
        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 55,
          backgroundColor: Colors.white,
          selectedIndex: controller.currentIndex,
          showElevation: true,
          curve: Curves.fastOutSlowIn,
          onItemSelected: controller.changeCurrentIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.storefront),
              title: const Text('Home'),
              activeColor: const Color(0xff6E3CBC),
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.apps),
              title: const Text('Categories'),
              activeColor: Colors.deepPurpleAccent,
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.add),
              title: const Text('Add'),
              activeColor: const Color(0xff7267CB),
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
              activeColor: const Color(0xff98bae7),
              inactiveColor: Colors.grey,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }
}
