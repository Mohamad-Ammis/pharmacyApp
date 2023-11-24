import 'package:flutter/material.dart';
import 'package:pharmacy/core/enums/device_type.dart';
import 'package:pharmacy/helper/get_device_type.dart';

EdgeInsets responsivePaddingOfForm(BuildContext context) {
  return  getDeviceType(MediaQuery.of(context)) == DeviceType.desktop
      ? const EdgeInsets.symmetric(vertical: 0, horizontal: 200)
      : const EdgeInsets.symmetric(vertical: 0, horizontal: 50);
}
