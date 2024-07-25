import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.textStyle,
      this.color,
      this.width,
      required this.buttonText,
      this.onTap,
      required this.isLoading,
      this.borderRadius,
      this.height});
  final String buttonText;
  final void Function()? onTap;
  final bool isLoading;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 60,
        width: width ?? 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
            color: color,
            gradient: color == null
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                        Colors.blue,
                        Color.fromARGB(255, 121, 126, 197),
                      ])
                : null),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.grey,
                )
              : Text(
                  buttonText,
                  style: textStyle,
                ),
        ),
      ),
    );
  }
}
