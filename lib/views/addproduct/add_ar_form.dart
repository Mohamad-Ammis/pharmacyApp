import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/add_product_controller.dart';
import 'package:pharmacy/helper/show_dialog.dart';
import 'package:pharmacy/widgets/custom_button.dart';
import 'package:pharmacy/widgets/custom_text_field.dart';

class AddProductARForm extends StatelessWidget {
  AddProductARForm({super.key});
  final AddProductController controller=Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        autovalidateMode: controller.autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: (controller.localWidth / 2.1) - 10,
                  child:const CustomTextField(
                    label: 'الاسم العلمي',
                    initialValue: '',
                  ),
                ),
                SizedBox(
                  width: (controller.localWidth / 2.1) - 10,
                  child:const CustomTextField(
                    label: 'الاسم التجاري',
                    initialValue: '',
                  ),
                ),
              ],
            ),
            const CustomTextField(
              label: 'الوصف',
              maxLines: 3,
            ),
            const CustomTextField(
              label: 'الشركة المصنعة',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: controller.localWidth / 6,
                  child: CustomButton(
                    buttonText: 'Back',
                    isLoading: false,
                    onTap: () {
                      controller.nextToArabicForm =
                          !controller.nextToArabicForm;
                      controller.update();
                    },
                  ),
                ),
                SizedBox(
                  width: controller.localWidth / 6,
                  child: CustomButton(
                    buttonText: 'Submit',
                    isLoading: false,
                    onTap: () async {
                      if (controller.validateInput()) {
                        showSuccessDialog(context, 'Product Added',
                            'We Have A Great Work To Do');
                        await Future.delayed(const Duration(seconds: 2));
                        Get.offAllNamed('/HomePage');
                      } else {}
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}