import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';

import '../../constans.dart';

class ShowProductStyle extends StatelessWidget {
  const ShowProductStyle({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: 400,
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    color: Colors.white,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(
                        color: kSecondryColor,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(75))),
                  )
                ],
              ),
              Center(
                child: product.image != null
                    ? Image.network(
                        '${kImageUrl}${product.image}',
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        'assets/images/pillsone.png',
                        fit: BoxFit.fill,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
