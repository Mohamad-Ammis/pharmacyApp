import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/add_product_controller.dart';

class AddProductHeader extends StatelessWidget {
  AddProductHeader({super.key});
  final AddProductController controller=Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return Container(
                  width: controller.fullScreenWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                      border: Border.all(color: kBorderColor, width: 0.5)),
                  child:const  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Add Product',
                      style: TextStyle(fontSize: 32, color: kMainColor),
                    ),
                  ),
                );
  }
}