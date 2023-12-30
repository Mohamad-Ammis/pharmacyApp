import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/login_controller.dart';
import 'package:pharmacy/core/enums/device_type.dart';
import 'package:pharmacy/helper/add_form_responsive_padding.dart';
import 'package:pharmacy/helper/get_device_type.dart';
import 'package:pharmacy/widgets/custom_button.dart';
import 'package:pharmacy/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final LoginController controller=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    BuildContext con=context;
    controller.con=context;
    return  GetBuilder<LoginController>(
              init: LoginController(),
              builder: (context) {
                return Padding(
                  padding: responsivePaddingOfForm(con),
                  child: Form(
                    key: controller.formKey,
                    autovalidateMode: controller.autovalidateMode,
                    child: Padding(
                      padding: const EdgeInsets.all(100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                            'Login To Your Account!',
                            style: TextStyle(
                                color: kMainColor,
                                fontSize:getDeviceType(MediaQuery.of(con))==DeviceType.desktop? 40:32,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextField(
                            onChanged: (data) {
                        controller.phone = data;
                      },
                      validator:(data){
                        if(data!.isEmpty){
                          return 'Required Field';
                        }
                        else if (int.tryParse(data) == null) {
                          return 'Only Numbers Are Allowed';
                        }
                        else if (data.length != 10) {
                          return "Phone Number Must be 10 digits";
                        }
                        else{return null;}
                      } ,
                            label: 'phone',
                            keyboardType: TextInputType.number,
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: kMainColor,
                            ),
                            filled: true,
                            filledColor: const Color(0xffEBEBEB),
                          ),
                            CustomTextField(
                              validator:(data){
                                if(data!.isEmpty){
                                  return "Required Field";
                                }
                                else if(data.length<8){
                                  return "Password Must be At Least 8 Characters";
                                }
                                else if (RegExp(r'^-?[0-9]+$').hasMatch(data)) {
                                  return 'Password Should Contain Numbers & Characters';
                                }
                                else if(RegExp(r'^[a-z]+$').hasMatch(data)){
                                  return 'Password Should Contain Numbers & Characters';
                                }
                                else
                                return null;
                              },
                            onChanged: (data){
                              controller.password=data;
                            },
                            label: 'Password',
                            isPassword: true,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: kMainColor,
                            ),
                            filled: true,
                            filledColor: Color(0xffEBEBEB),
                            suffixIcon: Icon(
                              Icons.remove_red_eye_sharp,
                              color: Color.fromARGB(255, 172, 172, 172),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            buttonText: 'Login',
                            isLoading: false,
                            onTap: () async {
                              if (controller.validateInput()) {
                                controller.login(controller.phone.toString(),controller.password.toString());
                              } else {
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
  }
}