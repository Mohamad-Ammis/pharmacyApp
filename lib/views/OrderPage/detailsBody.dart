import 'package:flutter/material.dart';
import 'package:pharmacy/models/product.dart';
import 'package:pharmacy/views/orderpage/DetailsOrderCard.dart';

class DetailsOrderBody extends StatelessWidget {
  const DetailsOrderBody({super.key,required this.orderData, required this.i});
  final orderData;
  final int i;
  @override
  Widget build(BuildContext context) {
    dynamic prod=orderData['products'];
    print(prod);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Text(
                            "Order Details",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w200),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "costumer name",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              "#4552",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, bottom: 25),
                      child: Row(children: [Text("Order Details (6)")]),
                    ),
                    Expanded(
                      child: GridView.builder(
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.8),
                itemCount: prod.length,
            itemBuilder: (context,index){
              return DetailsOrderCardApi(product: Product.fromJsonOrder(prod[index]), haveQuantity: true, isOrder: true,);
            }),
                    ),
                    // Expanded(
                    //   child: GridView.builder(
                    //       itemCount: 8,
                    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 6,
                    //         crossAxisSpacing: 10,
                    //         mainAxisSpacing: 10,
                    //       ),
                    //       itemBuilder: (context, index) {
                    //         return Container(
                    //           height: 200,
                    //           width: double.infinity,
                    //           color: Colors.orange,
                    //         );
                    //       }),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
