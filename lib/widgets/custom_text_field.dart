import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/login_controller.dart';
import 'package:pharmacy/helper/build_border.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField(
      {super.key,
      this.isPassword,
      this.keyboardType,
      this.suffixIcon,
      this.prefixIcon,
      this.floatingLabelBehavior,
      this.initialValue,
      this.hintText,
      this.maxLines = 1,
      this.onSaved,
      this.filled,
      this.filledColor,
      this.onChanged,
      this.validator,
      this.label});
  final String? hintText;
  final String? initialValue;
  final int maxLines;
  final String? label;
  final bool? isPassword;
  final bool? filled;
  final Color? filledColor;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller){
        return  TextFormField(
        validator:validator?? (data) {
          if (data?.isEmpty ?? true) {
            return 'required field';
          }
          return null;
        },
        keyboardType: keyboardType ,
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxLines,
        cursorColor: kMainColor,
        initialValue: initialValue,
        obscureText: isPassword==true?controller.obscureText:false,
        decoration: InputDecoration(
          
          filled: filled??false,
          fillColor: filledColor??Colors.white,
          suffixIcon: isPassword==true ? IconButton(onPressed: (){
            controller.showPassword();
          }, icon: suffixIcon!):suffixIcon ,
          prefixIcon: prefixIcon, 
          hintText: hintText,
          floatingLabelBehavior: floatingLabelBehavior??FloatingLabelBehavior.auto,
          enabledBorder: buildBorder(color:kBorderColor),
          focusedBorder: buildBorder(color: kMainColor),
          border: buildBorder(color: kBorderColor),
          label: Text(
            label??'',
            style:const  TextStyle(color: kMainColor),
          ),
        ),
      );
      })  ,
          );
  }
}

