import 'package:flutter/material.dart';
import 'package:pharmacy/constans.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonText,
      this.onTap,
      required this.isLoading});
  final String buttonText;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kMainColor,
            gradient: const LinearGradient(colors: [
              kMainColor,
              Color.fromARGB(255, 39, 42, 80),
            ])),
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
