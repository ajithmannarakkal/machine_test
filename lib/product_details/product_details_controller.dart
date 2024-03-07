import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test/product_details/product_details_model.dart';

class ProductDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductDetailsController());
  }
}

class ProductDetailsController extends GetxController {
  static ProductDetailsController get to => Get.find();
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    productDetailsModel = await fetchProductDetails();
  }

  ProductDetailsModel? productDetailsModel;
  RxInt cartCount = 0.obs;
  RxBool isLoading=false.obs;

  Future<ProductDetailsModel> fetchProductDetails() async {
    isLoading.value=true;
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/${Get.arguments}'));
    update();
    if (response.statusCode == 200) {
      isLoading.value=false;
      print(response);
      return ProductDetailsModel.fromJson(jsonDecode(response.body));
    } else {
      isLoading.value=false;
      throw Exception('error');
    }
  }
}
