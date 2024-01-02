import 'package:flutter/material.dart';
import 'package:pharmacy/views/products_list_page/product_page_body.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProductsPageBody(),
    );
  }
}
