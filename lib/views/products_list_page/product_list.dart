import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/homepage/get_all_products.dart';
import 'package:pharmacy/main.dart';
import 'package:pharmacy/models/product.dart';
import 'package:pharmacy/views/products_list_page/productcard.dart';
import 'package:pharmacy/views/viewall/view_all_page.dart';
class ProductList extends StatelessWidget {
  ProductList({
    super.key,
    required this.type,
  });
  final String type;
  final getProductController = Get.put(GetAllProducts());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetAllProducts>(
      init: GetAllProducts(),
      builder: (controller){
      return FutureBuilder<dynamic>(
        future:type=="All Products"? getProductController.getAllProducts(shared.getString('token').toString()):getProductController.getMostCommonProducts(shared.getString('token').toString()),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
             controller.products=snapshot.data['products'];
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 42, vertical: 16),
                  color: Colors.white,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        type,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(ViewAllPage(products: controller.products,title: type,));
                        },
                        child: Text('View All')),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 40),
                      child: ListView.builder(
                        itemCount: controller.products!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductCard(product: Product.fromJson(controller.products![index]),);
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
    });
  }
}
