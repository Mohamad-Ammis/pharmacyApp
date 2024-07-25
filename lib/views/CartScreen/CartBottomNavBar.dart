import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:get/get.dart';

import '../../controller/cartPageController/cart_controller.dart';
import '../../main.dart';
import 'CartItem.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(spreadRadius: 0,blurRadius: 0,color: Color.fromARGB(255, 252, 252, 252))
      ]),
      child: GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Summary",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold, color: b),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total price",
                      style: TextStyle(fontSize: 18, color: gr),
                    ),
                    Text(
                      "\$${controller.totalPrice.toStringAsFixed(4)}",
                      style: TextStyle(fontSize: 18, color: gr),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Discount count",
                      style: TextStyle(fontSize: 18, color: gr),
                    ),
                    Text(
                      "-\$${(controller.totalPrice * 0.1).toStringAsFixed(1).toString()}",
                      style: TextStyle(fontSize: 18, color: gr),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Final Price",
                      style: TextStyle(fontSize: 18, color: gr),
                    ),
                    Text(
                      "\$${(controller.totalPrice * 0.9).toStringAsFixed(1).toString()}",
                      style: TextStyle(fontSize: 18, color: gr),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async{
                      dynamic result =controller.initApiRes();
                      bool isOk =await controller.createOrder(result, token!);
                      if(isOk){
                      Get.offAllNamed('/MainPage');
                      cartProducts.clear();
                      controller.totalPrice=0.0;
                      }
                      else{}
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: b,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold, color: w),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
