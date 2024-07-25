import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/views/showProduct/show_product_about_info.dart';
import 'package:flutter_application_2/views/showProduct/show_product_cart_fav_buttons.dart';
import 'package:flutter_application_2/views/showProduct/show_product_info_title.dart';
import 'package:flutter_application_2/views/showProduct/show_product_price_buy.dart';

class ShowProductInfo extends StatelessWidget {
  const ShowProductInfo({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            ShowProductInfoTitle(product: product),
            //price and buy
            ShowProductPriceAndBuy(product: product),
            //about
            ShowProductAboutInfo(product: product),
            //add to cart and favorite
            ShowProductCartAndFavButtons(product: product),
          ],
        ),
      ),
    );
  }
}
