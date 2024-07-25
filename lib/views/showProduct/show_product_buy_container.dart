import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:get/get.dart';

import '../../controller/showProductController/show_product_controller.dart';

class ShowProductBuyContainer extends StatelessWidget {
  const ShowProductBuyContainer({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowProductController>(
      init: ShowProductController(),
      builder: (controller) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.remove,
                  size: 24,
                ),
                onPressed: () {
                  controller.buyCounterDecreament();
                  //cartController.counters[cartProducts.indexOf(product)]=controller.buyCounter;
                },
              ),
            ),
            Text(
              controller.buyCounter.toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  size: 24,
                ),
                onPressed: () {
                  controller.buyCounterIncreament();
                 // cartController.counters[cartProducts.indexOf(product)] =controller.buyCounter;
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
