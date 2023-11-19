import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/views/HomePage/homepage.dart';
import 'package:pharmacy/widgets/Custom_Button.dart';
import 'package:pharmacy/widgets/custom_text_field.dart';

class LogInInfo extends StatelessWidget {
  const LogInInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity:0.3,
            fit: BoxFit.cover,
            image: NetworkImage(
              'assets/assets/images/bills.jpg',
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 200, left: 100, top: 100),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login To Your Account!',
                  style: TextStyle(
                      color: kMainColor, fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  label: 'Email',
                  suffixIcon: Icon(Icons.email,color: kMainColor,),
                ),
                CustomTextField(
                  label: 'Password',
                  isPassword: true,
                  suffixIcon:  Icon(
                    Icons.lock,
                    color: kMainColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(buttonText: 'LogIn', isLoading: false,
                onTap: (){
                  Get.to(HomePage());
                },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
