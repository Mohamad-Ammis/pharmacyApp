import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/views/showProduct/show_product_buy_container.dart';

class ShowProductPriceAndBuy extends StatelessWidget {
  const ShowProductPriceAndBuy({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffD8DDEB),
                ),
                borderRadius: BorderRadius.circular(16)),
            child:  ShowProductBuyContainer(product: product,),
          ),
          Text(
            r'$' + product.price.toString(),
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
