import 'package:get/get.dart';
import 'package:machine_test/app_routes.dart';
import 'package:machine_test/login/login_controller.dart';
import 'package:machine_test/login/login_screen.dart';
import 'package:machine_test/product/product_controller.dart';
import 'package:machine_test/product/product_screen.dart';
import 'package:machine_test/product_details/product_details_controller.dart';
import 'package:machine_test/product_details/product_details_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.loginScreen,
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.productScreen,
        page: () => ProductScreen(),
        binding: ProductBinding()),
    GetPage(
        name: AppRoutes.productDetailsScreen,
        page: () => ProductDetailsScreen(),
        binding: ProductDetailsBinding())
  ];
}
