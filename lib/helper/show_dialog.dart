import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showSuccessDialog(BuildContext context, String title, String desc) {
  AwesomeDialog(
    width: 500,
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.rightSlide,
    title: title,
    titleTextStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    desc: desc,
  ).show();
}

showErrorDialog(BuildContext context, String title, String desc) {
  AwesomeDialog(
    width: 500,
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    headerAnimationLoop: false,
    title: title,
    desc:
        desc,
    btnOkOnPress: () {},
    btnOkIcon: Icons.cancel,
    btnOkColor: Colors.red,
  ).show();
}
