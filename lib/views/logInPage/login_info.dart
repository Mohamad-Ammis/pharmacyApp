import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/login_controller.dart';
import 'package:pharmacy/helper/show_dialog.dart';
import 'package:pharmacy/widgets/Custom_Button.dart';
import 'package:pharmacy/widgets/custom_text_field.dart';

class LogInInfo extends StatelessWidget {
   LogInInfo({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
  BuildContext con =context;
    return Expanded(
      flex: 2,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.3,
            fit: BoxFit.cover,
            image: NetworkImage(
              'assets/assets/images/bills.jpg',
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 300, left: 100, top: 100),
          child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (context) {
                return Form(
                  key: controller.formKey,
                  autovalidateMode: controller.autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login To Your Account!',
                        style: TextStyle(
                            color: kMainColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                       CustomTextField(
                        label: 'Email',
                        onSaved: (data){
                          controller.email=data;
                        },
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Icons.email,
                          color: kMainColor,
                        ),
                        filled: true,
                        filledColor: Color(0xffEBEBEB),
                      ),
                      const CustomTextField(
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
                          if(controller.validateInput()){
                          showSuccessDialog( con, 'Login Success', "Welcome To Our World");
                          await Future.delayed(Duration(seconds: 3));
                          Get.offAllNamed('/HomePage');
                          }else{}
                        },
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
