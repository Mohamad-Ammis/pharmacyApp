import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/cartPageController/cart_controller.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'CartAppBar.dart';
import 'CartBottomNavBar.dart';
import 'CartItem.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CartAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Expanded(child: CartItem()),
          CartBottomNavBar()
        ],
      ),
      // bottomNavigationBar: const CartBottomNavBar(),
    );
  }
}
