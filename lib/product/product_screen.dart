import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/product/product_controller.dart';

import '../app_routes.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: const Text('Products'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: GetBuilder<ProductController>(builder: (logic) {
        return logic.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: logic.productModel?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisExtent: 300,
                      mainAxisSpacing: 25,
                      childAspectRatio: 45 / 35),
                  itemBuilder: (BuildContext context, index) {
                    var product = logic.productModel?[index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.productDetailsScreen,
                            arguments: product?.id);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            children: [
                              Image.network(product?.image ?? '',
                              fit: BoxFit.fitWidth,
                                height: 220,
                              ),
                              SizedBox(height: 5,),
                              Text(product?.title ?? '',
                              maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 2,),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text('₹ ${product?.price}')),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
      }),
    );
  }
}
