import 'package:flutter/material.dart';
import 'package:pharmacy/views/addproduct/add_product_form.dart';
import 'package:pharmacy/views/addproduct/add_product_header.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          //header
          Padding(
            //top title
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: AddProductHeader(),
          ),
          //addFormBody
          AddProductForm(),
        ],
      ),
    );
  }
}