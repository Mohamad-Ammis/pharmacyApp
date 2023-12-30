import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(0.7))
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 180,
            height: 200,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.7))
            ]),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(
              'assets/images/43.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            width: 150,
            height: 200,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.7))
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.brandName!,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Stock = ${product.stock!}",
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r"$" '${product.price!}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color:Colors.black,
                          borderRadius: BorderRadius.circular(100)),
                      child: GestureDetector(
                        onTap:(){ 
                          Get.toNamed('/ShowProduct',arguments: product);
                        },
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      
                    )
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
