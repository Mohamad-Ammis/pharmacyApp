import 'package:flutter/material.dart';
import 'package:pharmacy/constans.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField(
      {super.key,
      this.isPassword,
      this.keyboardType,
      this.suffixIcon,
      this.prefixIcon,
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
  final bool? isPassword;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        validator: (data) {
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
        obscureText: isPassword??false,
        decoration: InputDecoration(
          suffixIcon:suffixIcon,
          prefixIcon: prefixIcon, 
          hintText: hintText,
          enabledBorder: buildBorder(color:kBorderColor),
          focusedBorder: buildBorder(color: kMainColor),
          border: buildBorder(color: kBorderColor),
          label: Text(
            label!,
            style: TextStyle(color: kMainColor),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color,width: 1.3),
    borderRadius: BorderRadius.circular(16),
  );
}
