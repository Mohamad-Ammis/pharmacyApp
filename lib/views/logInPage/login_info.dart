import 'package:awesome_dialog/awesome_dialog.dart';
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
          padding: const EdgeInsets.only(right: 300, left: 100, top: 100),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const
                Text(
                  'Login To Your Account!',
                  style: TextStyle(
                      color: kMainColor, fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextField(
                  label: 'Email',
                  prefixIcon: Icon(Icons.email,color: kMainColor,),
                  filled: true,
                  filledColor: Color(0xffEBEBEB),
                ),
                const CustomTextField(
                  label: 'Password',
                  isPassword: true,
                  prefixIcon:  Icon(
                    Icons.lock,
                    color: kMainColor,
                  ),
                  filled: true,
                  filledColor: Color(0xffEBEBEB),
                  suffixIcon: Icon(Icons.remove_red_eye_sharp,color: Color.fromARGB(255, 172, 172, 172),),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(buttonText: 'Login', isLoading: false,
                onTap: ()async{
                  AwesomeDialog(
                    width: 500,
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Login Success',
            titleTextStyle: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
            desc: 'Welcome in Our World',
            ).show();
            await Future.delayed(const Duration(seconds: 3));
            Get.to(const HomePage());
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
