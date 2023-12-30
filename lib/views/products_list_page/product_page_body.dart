import 'package:flutter/material.dart';
import 'package:pharmacy/views/products_list_page/product_list.dart';
import 'package:pharmacy/views/products_list_page/products_appBar.dart';

class ProductsPageBody extends StatelessWidget {
  const ProductsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width - 101,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          //AppBar
          const ProductsAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductList(
                    type: 'All Products',
                  ),
                  ProductList(
                    type: 'Most Common',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
