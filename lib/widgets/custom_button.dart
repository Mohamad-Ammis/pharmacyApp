import 'package:flutter/material.dart';
import 'package:pharmacy/constans.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.color,
      required this.buttonText,
      this.onTap,
      required this.isLoading});
  final String buttonText;
  final void Function()? onTap;
  final bool isLoading;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
            gradient:color==null ? const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
              
              kMainColor,
              Color.fromARGB(255, 121, 126, 197),
            ]):null),
        child: Center(
          child: isLoading
              ?  const CircularProgressIndicator(
                  color: Colors.grey,
                )
              : Text(
                  buttonText,
                  style:  const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
