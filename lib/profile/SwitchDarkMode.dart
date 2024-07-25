import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class SwitchDarkMode extends StatelessWidget {
  const SwitchDarkMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: controller.selectedSwitch,
      onChanged: (_) {
        controller.changeSwitch();
        if (Get.isDarkMode) {
          Get.changeTheme(ThemeData.light());
        } else {
          Get.changeTheme(ThemeData.dark());
        }
      },
      title: Text(
        "Dark Mode",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      activeTrackColor: b,
      inactiveTrackColor: bg,
      inactiveThumbColor: b,
      thumbIcon: MaterialStatePropertyAll(
          Icon(controller.selectedSwitch ? Icons.brightness_3 : Icons.sunny)),
    );
  }
}
