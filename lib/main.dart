import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/app_pages.dart';

import 'app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginScreen,
      getPages: AppPages.pages,
    );
  }
}

