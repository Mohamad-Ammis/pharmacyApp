import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/homepage/get_all_products.dart';
import 'package:pharmacy/models/product.dart';
import 'package:pharmacy/views/products_list_page/productcard.dart';

class ProductList extends StatelessWidget {
  ProductList({
    super.key,
    required this.type,
  });
  final String type;
  final getProductController = Get.put(GetAllProducts());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future:type=="All Products"? getProductController.getAllProducts(kTokenTest):getProductController.getMostCommonProducts(kTokenTest),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            dynamic products=snapshot.data['products'];
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 42, vertical: 16),
                  color: Colors.white,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        type,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      //Text('View All'),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 40),
                      child: ListView.builder(
                        itemCount: products.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductCard(product: Product.fromJson(products[index]),);
                          })),
                ),
              ],
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(120.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
        }));
  }
}
