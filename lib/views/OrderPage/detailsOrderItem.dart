import 'package:flutter/material.dart';
import 'package:pharmacy/views/orderpage/DetailsOrderCard2.dart';
class DetailsOrderItem extends StatelessWidget {
  const DetailsOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.8,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return DetailsOrderCard();
      },
    );
  }
}
