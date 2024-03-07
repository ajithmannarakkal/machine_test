import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/product_details/product_details_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0,
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Text(logic.productDetailsModel?.category ?? ''),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15, top: 10),
              child: InkWell(
                onTap: () {
                  logic.cartCount.value++;
                  logic.update();
                },
                child: Badge(
                    label: Text(logic.cartCount.value.toString()),
                    child: Icon(Icons.shopping_cart)),
              ),
            )
          ],
        ),
        body: logic.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(logic.productDetailsModel?.image ?? ""),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: Get.width * 0.65,
                          child: Text(logic.productDetailsModel?.title ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16))),
                      Text(
                        '₹ ${logic.productDetailsModel?.price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      )
                    ],
                  ),
                  const  SizedBox(
                    height: 15,
                  ),
                  Text('${logic.productDetailsModel?.description}',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.snackbar('Alert', 'Added to Cart',
                              snackPosition: SnackPosition.BOTTOM);
                        },
                        child: Container(
                          color: Colors.blueAccent,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Cart',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
      );
    });
  }
}
