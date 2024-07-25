import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';

import '../../constans.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({super.key, required this.product, required this.isOrder});
  final Product product;
  final bool isOrder;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.25,
        maxHeight: MediaQuery.of(context).size.width * 0.3,
      ),
      child: Container(
        color: isOrder? Color.fromARGB(255, 150, 202, 219) :kSecondryColor,
        //padding: const EdgeInsets.symmetric(vertical: 8),
        child: product.image != null
            ? Image.network(
                '${kImageUrl}${product.image}',
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/prodImage/pillsone.png',
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
