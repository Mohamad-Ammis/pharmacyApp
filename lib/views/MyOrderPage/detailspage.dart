import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/views/MyOrderPage/components/timelinetile.dart';
import 'package:flutter_application_2/widgets/custom_card/custom_card.dart';

class MyOrderDetails extends StatelessWidget {
  const MyOrderDetails({super.key,required this.orderProducts,required this.orderDetails});
  final dynamic orderProducts;
  final dynamic orderDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Color.fromARGB(255, 243, 235, 248),
        title: Text('Order Details'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: Color.fromARGB(255, 243, 235, 248),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListView(
                  //scrollDirection: Axis.horizontal,
                  children:  [
                    CustomTimeLineTile(
                      isFirst: true,
                      isLast: false,
                      isPast: true,
                      eventCard: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Placed",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text('Your Order is Preapring',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                    CustomTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast:  orderDetails['status'] == 'sent' ? true :orderDetails['status'] == 'received'?true: false,
                      eventCard: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Sending",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text('Your Order Is In The way to You',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                    CustomTimeLineTile(
                      isFirst: false,
                      isLast: true,
                      isPast:  orderDetails['status'] == 'received' ? true :false,
                      eventCard: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Received",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'Order Has Been recived',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2 - 20, bottom: 10),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Container(
                padding: EdgeInsets.only(top: 10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 243, 235, 248),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 3,
                          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2))
                    ],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                    )),
                child: ListView.builder(
                  itemCount: orderProducts.length,
                  itemBuilder: (context, index) {
                    return CustomCard(product: Product.fromJsonOrder(orderProducts[index]), suffixIcon:null, isOrder: true ,);
                })),
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: Stepper(
      //        // type: StepperType.horizontal,
      //         steps: getSteps(),
      //         controlsBuilder: (context, details) {
      //           return Row(children: [
      //             Container(),
      //           ],);
      //         },
      //         elevation: 0,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  // List<Step> getSteps() =>[
  //   Step(title: Text('Preparing'), content: Container(child: Text("Preparing"),)),
  //   Step(title: Text('Checking'), content: Container(child:Text("Checking"))),
  //   Step(title: Text('Rejected'), content: Container(child: Text("Rejected"),))
  // ];
}
