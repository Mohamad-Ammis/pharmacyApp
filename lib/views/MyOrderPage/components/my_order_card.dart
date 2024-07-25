import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/MyOrderPage/detailspage.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class MyOrderCard extends StatelessWidget {
  const MyOrderCard({
    super.key,
    required this.status,
    required this.orderDetails,
    required this.orderProducts,
    required this.orderBill,
  });
  final String status;
  final dynamic orderDetails;
  final dynamic orderProducts;
  final dynamic orderBill;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Get.to(() => MyOrderDetails(
              orderProducts: orderProducts,
              orderDetails: orderDetails,
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 2,
                  spreadRadius: 4,
                  color: Colors.blueGrey.withOpacity(0.3))
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Container(
                      child: status.toString() == 'sent'
                          ? Lottie.asset('assets/lottie/order_sending.json',
                              fit: BoxFit.fill)
                          : status.toString() == 'received'
                              ? Lottie.asset('assets/lottie/order_received.json',
                                  fit: BoxFit.fill)
                              : Lottie.asset('assets/lottie/preparing.json',
                                  fit: BoxFit.fill)),
                  status.toString() == 'sent'
                      ? Text(
                          'Sending',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 51, 92),
                              fontWeight: FontWeight.bold),
                        )
                      : status.toString() == 'received'
                          ? Text(
                              'Received',
                              style: TextStyle(
                                  color: Colors.red, fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'Pending',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.8),
                  ]))
                  //color: kSecondryColor,
                  ,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 8, left: 8, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orderDetails['created_at']
                                  .toString()
                                  .substring(0, 10),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Spacer(),
                            IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                   Get.to(() => MyOrderDetails(
                                        orderProducts: orderProducts,
                                        orderDetails: orderDetails,
                                      ));
                                },
                                icon: Icon(
                                  Icons.arrow_circle_right,
                                  size: 30,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        // SizedBox(height: 16,)
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Items Count',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(orderProducts.length.toString(),
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(r'$' "${orderBill['total'].toString()}",
                                  style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => MyOrderDetails(
                                      orderProducts: orderProducts,
                                      orderDetails: orderDetails,
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Details",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
