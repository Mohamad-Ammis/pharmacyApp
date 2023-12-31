import 'package:flutter/material.dart';
import 'package:pharmacy/models/product.dart';
import 'package:pharmacy/views/OrderPage/DetailsOrderCard.dart';

class ViewAllPage extends StatelessWidget {
  const ViewAllPage({super.key, required this.products, required this.title});
  final dynamic products;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(title),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.9,),
                itemCount: products.length,
            itemBuilder: (context,index){
              return  DetailsOrderCard(product: Product.fromJson(products[index]), haveQuantity: false,);
            }),
      ),
    );
  }
}
