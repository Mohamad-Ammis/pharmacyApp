import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/add_product_controller.dart';
import 'package:pharmacy/core/enums/device_type.dart';
import 'package:pharmacy/helper/get_device_type.dart';
import 'package:pharmacy/helper/show_dialog.dart';
import 'package:pharmacy/widgets/custom_button.dart';
import 'package:pharmacy/widgets/custom_text_field.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        var width = constraints.maxWidth;
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                //top title
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade100,
                      border: Border.all(color: kBorderColor,width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Add Product',
                      style: TextStyle(fontSize: 32, color: kMainColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: getDeviceType(MediaQuery.of(context))==DeviceType.Desktop?
                EdgeInsets.symmetric(vertical: 0, horizontal: 200):
                EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                child: LayoutBuilder(builder: (context, constraints) {
                  var localWidth = constraints.maxWidth;
                  return GetBuilder<AddProductController>(
                    init: AddProductController(),
                    builder: (controller){
                    return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade100,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: controller.nextToArabicForm
                          ? SingleChildScrollView(
                            child: Form(
                              key: controller.formKey,
                                autovalidateMode: controller.autovalidateMode,
                              child: Column(
                              
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: (localWidth / 2.1) - 10,
                                          child: CustomTextField(
                                            label: 'الاسم العلمي',
                                            initialValue: '',
                                          ),
                                        ),
                                        SizedBox(
                                          width: (localWidth / 2.1) - 10,
                                          child: CustomTextField(
                                            label: 'الاسم التجاري',
                                            initialValue: '',
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomTextField(
                                      label: 'الوصف',
                                      maxLines: 3,
                                    ),
                                    CustomTextField(
                                      label: 'الشركة المصنعة',
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: localWidth / 6,
                                          child: CustomButton(
                                            
                                            buttonText: 'Back',
                                            isLoading: false,
                                            onTap: () {
                                              controller.nextToArabicForm=!controller.nextToArabicForm;
                                              controller.update();
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: localWidth / 6,
                                          child: CustomButton(
                                            buttonText: 'Submit',
                                            isLoading: false,
                                            onTap: ()async{
                                              
                                                if(controller.validateInput()){
                                                  showSuccessDialog(
                                                      context,
                                                      'Product Added',
                                                      'We Have A Great Work To Do');
                                                  await Future.delayed(
                                                      const Duration(seconds: 2));
                                                  Get.offAllNamed('/HomePage');
                                                }
                                                else{
                                                  
                                                }
                                              
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                            ),
                          )
                          : SingleChildScrollView(
                            child: Form(
                                key: controller.formKey,
                                autovalidateMode: controller.autovalidateMode,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: (localWidth / 2.1) - 10,
                                          child: CustomTextField(
                                            label: 'Scientific Name',
                                          ),
                                        ),
                                        SizedBox(
                                          width: (localWidth / 2.1) - 10,
                                          child: CustomTextField(
                                            label: 'Brand Name',
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomTextField(
                                      label: 'Description',
                                      maxLines: 2,
                                    ),
                                    CustomTextField(
                                      label: 'Manufacturer',
                                    ),
                                   Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: (localWidth / 2.1) - 10,
                                          child: CustomTextField(
                                            label: 'Stock',
                                          ),
                                        ),
                                        SizedBox(
                                          width: (localWidth / 2.1) - 10,
                                          child: CustomTextField(
                                            label: 'Price',
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomTextField(
                                      label: 'Expiration Date',
                                      suffixIcon: Icon(Icons.star_border_purple500_rounded,color: Colors.red,),
                                    ),
                                    SizedBox(
                                      width:getDeviceType(MediaQuery.of(context))==DeviceType.Desktop? localWidth / 5 :localWidth/3,
                                      child: CustomButton(
                                        buttonText: 'Next',
                                        isLoading: false,
                                        onTap: () {
                                          
                                            if(controller.validateInput()){
                                            controller.nextToArabicForm = !controller
                                            .nextToArabicForm;}
                                            else{
                                            }
                                          // }
                                          // );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ),
                    ),
                  );
                  }); 
                }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
