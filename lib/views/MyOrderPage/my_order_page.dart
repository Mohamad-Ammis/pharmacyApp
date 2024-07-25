import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/controller/myorder_controllers/my_order_controllet.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/views/MyOrderPage/components/my_order_card.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyOrder extends StatelessWidget {
  MyOrder({super.key});
  final myOrderController = Get.put(MyOrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "My Order",
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<dynamic>(
            future: myOrderController
                .getAllOrders(token!),
            builder: ((context, snapshot) {
              if (snapshot.hasData && snapshot.data['orders'] != null) {
                dynamic orderDetails = snapshot.data['orders'];
                return Padding(
                  padding: const EdgeInsets.only(bottom:110),
                  child:orderDetails.length!=0? ListView.builder(
                      itemCount: orderDetails.length,
                      itemBuilder: (context, index) {
                        return MyOrderCard(
                          status: orderDetails[index]['status'],
                          orderDetails: orderDetails[index],
                          orderProducts: orderDetails[index]['products'],
                          orderBill: orderDetails[index]['bill'],
                        );
                      }):Column(
                        children: [
                          Center(child: Lottie.asset("assets/lottie/emptyOrder.json")),
                          Text('Oops You Don\'t Have Any Order')
                        ],
                      ),
                );
              } else {
                return Center(
                  child: Lottie.asset("assets/lottie/loading_hand.json"),
                );
              }
            })));
  }
}
