import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/views/CartScreen/CartItem.dart';
import 'package:get/get.dart';

import '../../controller/cartPageController/cart_controller.dart';
import '../../../main.dart';

class CartCard extends StatelessWidget {
   CartCard(
      {super.key, required this.product, required this.index,});
      final Product product;
      final int index;

  final  controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: w,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: gr, blurRadius: 5, offset: const Offset(0, -1)),
        ],
      ),
      child: Row(
        children: [
          Container(
            
            color: bg,
            //margin: EdgeInsets.only(right: 15),
            child: product.image!=null? Image.network(
              '${kImageUrl}${product.image}',
              fit: BoxFit.fill,
              width: 80,
              height: 80,
            ):Image.asset('assets/prodImage/pillsone.png',
                    fit: BoxFit.fill,
                                  width: 80,
              height: 88,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Text(
                    product.brandName!,
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold, color: b),
                  ),
                ),
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: b),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                    child: InkWell(
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: () {
                        controller.remove(index);
                      },
                    )),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: w,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: gra, spreadRadius: 0, blurRadius: 2)
                          ]),
                      child: InkWell(
                        child: const Icon(
                          CupertinoIcons.minus,
                          size: 15,
                        ),
                        onTap: () {
                          controller.decrement(index);
                          //totalPrice = controller.getTotal(index) - price;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        "${controller.counters[index]}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: b),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: w,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: gra, spreadRadius: 0, blurRadius: 2)
                          ]),
                      child: InkWell(
                        child: const Icon(
                          CupertinoIcons.plus,
                          size: 15,
                        ),
                        onTap: () {
                          controller.increment(index);
                          //controller.total += price;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
