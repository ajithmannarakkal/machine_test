import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:machine_test/app_routes.dart';

import 'login_model.dart';
import 'package:http/http.dart' as http;

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    // TODO: implement dependencies
  }
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool rememberMe = false.obs;

  Future<LoginModel> login() async {
    var url = 'https://fakestoreapi.com/auth/login';
    var body = jsonEncode({
      'username': usernameController.text,
      'password': passwordController.text
    });
    final response = await http.post(Uri.parse(url),
        body: body, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      Get.toNamed(AppRoutes.productScreen);
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      Get.toNamed(AppRoutes.productScreen);
      // Get.snackbar('Alert', 'Login Failed',snackPosition: SnackPosition.BOTTOM);
      throw Exception('error');
    }
  }
}
