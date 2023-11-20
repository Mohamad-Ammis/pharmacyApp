import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/login_controller.dart';

class CustomPasswordTextField extends StatelessWidget {
  const CustomPasswordTextField(
      {super.key,
      this.initialValue,
      this.hintText,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.label});
  final String? hintText;
  final String? initialValue;
  final int maxLines;
  final String? label;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child:GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller){
        return TextFormField(
        validator: (data) {
          if (data?.isEmpty ?? true) {
            return 'required field';
          }
          return null;
        },
        obscureText: controller.obscureText,
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxLines,
        cursorColor: kMainColor,
        initialValue: initialValue,
        decoration: InputDecoration(
          suffixIcon:GestureDetector(
            onTap: (){
              controller.showPassword();
            },
            child:const  Icon(Icons.remove_red_eye_sharp),
          ),
          hintText: hintText,
          enabledBorder: buildBorder(color: kBorderColor),
          focusedBorder: buildBorder(color: kMainColor),
          border: buildBorder(color: kBorderColor),
          label: Text(
            label!,
            style:const  TextStyle(color: kMainColor),
          ),
        ),
      );
      }),
    );
  }
}

OutlineInputBorder buildBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(8),
  );
}
