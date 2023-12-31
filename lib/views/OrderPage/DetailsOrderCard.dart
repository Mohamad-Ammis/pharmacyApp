
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/models/product.dart';
import 'package:pharmacy/views/showProductPage/show_product_page.dart';

class DetailsOrderCard extends StatelessWidget {
  const DetailsOrderCard({super.key, required this.product, required this.haveQuantity});
  final Product product;
  final bool haveQuantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 300,
      height: 350,
      // clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          //image
          Container(
            width: 300,
            height: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 0,
                      color: Colors.black.withOpacity(0.2))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Image.asset(
              'assets/images/43.jpg',
              fit: BoxFit.fill,
            ),
          ),
          //info
          Container(
            padding: EdgeInsets.all(8),
            height: 100,
            width: 300,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.2))
            ], color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        product.brandName!,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "\$${product.price!}",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    haveQuantity? Text(
                      "Quantity = ${product.quantity!} ",
                      style: TextStyle(fontSize: 14),
                    ): Text(
                            "Stock = ${product.stock!} ",
                            style: TextStyle(fontSize: 14),
                          ),
                    Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              Get.toNamed("/ShowProduct",arguments: product);
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: Colors.white,
                            )))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
