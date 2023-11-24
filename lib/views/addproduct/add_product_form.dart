import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/add_product_controller.dart';
import 'package:pharmacy/helper/add_form_responsive_padding.dart';
import 'package:pharmacy/views/addproduct/add_ar_form.dart';
import 'package:pharmacy/views/addproduct/add_en_form.dart';

class AddProductForm extends StatelessWidget {
  AddProductForm({super.key});
  final AddProductController controller=Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return Padding(
                //all form
                padding:
                    responsivePaddingOfForm(context),
                child: LayoutBuilder(builder: (context, constraints) {
                  controller.localWidth = constraints.maxWidth;
                  return GetBuilder<AddProductController>(
                      init: AddProductController(),
                      builder: (controller) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey.shade100,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: controller.nextToArabicForm
                                ? AddProductARForm()
                                : AddProductENForm()
                          ),
                        );
                      });
                }),
              );
  }
}