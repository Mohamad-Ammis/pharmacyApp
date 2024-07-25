import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';

class ShowProductInfoTitle extends StatelessWidget {
  const ShowProductInfoTitle({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.brandName!,
            style: TextStyle(
                fontSize: product.brandName!.length < 20 ? 30 : 26,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Stock = ${product.stock.toString()}",
            style: const TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
