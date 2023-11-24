import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/add_product_controller.dart';
import 'package:pharmacy/views/addproduct/add_product_body.dart';


class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  final AddProductController controller = Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    //expanded to take full empty width
    return Expanded(
      //layoutBuilder to make all content responsive
      child: LayoutBuilder(builder: (context, constraints) {
      //full width to make the container of form width and we will use it in form and header
        controller.fullScreenWidth = constraints.maxWidth;
        return const AddProductBody();
      }),
    );
  }


}
