// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/views/CartScreen/cart_card.dart';
import 'package:get/get.dart';

import '../../controller/cartPageController/cart_controller.dart';
import '../../main.dart';
import 'package:lottie/lottie.dart';


class CartItem extends StatelessWidget {
  CartItem({super.key});
  final cartController = Get.put(CartController(),permanent: true);
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    cartController.addCounterList(cartProducts.length);
    cartController.initTotalPrice();
    return GetBuilder<CartController>(
        builder: (controller) =>cartProducts.isNotEmpty? ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                products=cartProducts;
                print('Cart Builder\n');
                // controller.addCounterList(products.length);
                // controller.initTotalPrice();
                // controller.getTotal();
                return CartCard(
                    product:products[index], index: index,);
              },
            ): Column(
              children: [
                Center(child: Lottie.asset("assets/lottie/spider.json")),
                Text('Your Cart is Empty')
              ],
            ),
            );

    // return GetBuilder<MyController>(
    //     init: MyController(),
    //     builder: (controller) {

    //     });
    // ))
  }
}
