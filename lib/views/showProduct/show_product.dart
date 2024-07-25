import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/views/showProduct/show_product_info.dart';
import 'package:flutter_application_2/views/showProduct/show_product_style.dart';

class ShowProduct extends StatelessWidget {
  const ShowProduct({super.key, this.product});
  final Product? product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShowProductStyle(
            product: product!,
          ),
          ShowProductInfo(product: product!)
        ],
      ),
    );
  }
}
