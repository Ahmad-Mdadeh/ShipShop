import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shipshop/dashboard/dashboard.dart';
import 'package:shipshop/getx_bindings/dashboard_binding.dart';
import 'package:shipshop/getx_bindings/details_binding.dart';
import 'package:shipshop/getx_bindings/landing_binding.dart';
import 'package:shipshop/getx_bindings/login_binding.dart';
import 'package:shipshop/getx_bindings/search_binding.dart';
import 'package:shipshop/getx_bindings/update_binding.dart';
import 'package:shipshop/modules/products/details/details.dart';
import 'package:shipshop/modules/products/update/update.dart';
import 'package:shipshop/modules/register/register.dart';
import 'package:shipshop/modules/search/search.dart';
import 'getx_bindings/register_binding.dart';
import 'modules/landing/landing.dart';
import 'modules/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/myDashBoard',
      getPages: [
        GetPage(
            name: '/landing',
            page: () => const Landing(),
            binding: LandingBinding()),
        GetPage(name: '/login', page: () => Login(), binding: LoginBinding()),
        GetPage(
            name: '/register',
            page: () => Register(),
            binding: RegisterBinding()),
        GetPage(
            name: '/myDashBoard',
            page: () => const MyDashBoard(),
            binding: DashboardBinding()),
        GetPage(
            name: '/details',
            page: () => const Details(),
            binding: DetailsBinding()),
        GetPage(
            name: '/search', page: () => Search(), binding: SearchBinding()),
        GetPage(
            name: '/update',
            page: () => const UpDate(),
            binding: UpDateBinding()),
      ],
      builder: EasyLoading.init(),
    );
  }
}
