import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:machine_test/product/product_model.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController());
  }
}

class ProductController extends GetxController {
  static ProductController get to => Get.find();
  @override
  Future<void> onInit() async {
    super.onInit();
    productModel = await fetchProducts();
  }

  List<ProductModel>? productModel;
RxBool isLoading=false.obs;


  Future<List<ProductModel>> fetchProducts() async {
    isLoading.value=true;
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      isLoading.value=false;
      final List<ProductModel> products = (json.decode(response.body) as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
      print(response);
      update();
      return products;
    } else {
      isLoading.value=false;
      throw Exception('error');
    }
  }
}
