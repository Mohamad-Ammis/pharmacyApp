import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/add_product_controller.dart';
import 'package:pharmacy/core/enums/device_type.dart';
import 'package:pharmacy/helper/get_device_type.dart';
import 'package:pharmacy/widgets/custom_button.dart';
import 'package:pharmacy/widgets/custom_text_field.dart';

class AddProductENForm extends StatelessWidget {
  AddProductENForm({super.key});
  final AddProductController controller = Get.put(AddProductController());
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
                  child: const CustomTextField(
                    label: 'Scientific Name',
                  ),
                ),
                SizedBox(
                  width: (controller.localWidth / 2.1) - 10,
                  child:const  CustomTextField(
                    label: 'Brand Name',
                  ),
                ),
              ],
            ),
            const CustomTextField(
              label: 'Description',
              maxLines: 2,
            ),
            const CustomTextField(
              label: 'Manufacturer',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: (controller.localWidth / 2.1) - 10,
                  child: const CustomTextField(
                    label: 'Stock',
                  ),
                ),
                SizedBox(
                  width: (controller.localWidth / 2.1) - 10,
                  child: const CustomTextField(
                    label: 'Price',
                  ),
                ),
              ],
            ),
            const CustomTextField(
              label: 'Expiration Date',
              suffixIcon: Icon(
                Icons.star_border_purple500_rounded,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: getDeviceType(MediaQuery.of(context)) == DeviceType.desktop
                  ? controller.localWidth / 5
                  : controller.localWidth / 3,
              child: CustomButton(
                buttonText: 'Next',
                isLoading: false,
                onTap: () {
                  if (controller.validateInput()) {
                    controller.nextToArabicForm = !controller.nextToArabicForm;
                  } else {}
                  // }
                  // );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
