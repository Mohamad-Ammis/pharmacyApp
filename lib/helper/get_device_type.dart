import 'package:flutter/material.dart';
import 'package:pharmacy/core/enums/device_type.dart';

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  //Orientation orientation = mediaQueryData.orientation;
  double width = 0;
  //if (orientation == Orientation.landscape) {
  // width = mediaQueryData.size.height;
  //} else {
  width = mediaQueryData.size.width;
  //}

  if (width >= 1024) {
    return DeviceType.desktop;
  } else if (width >= 640) {
    return DeviceType.tablet;
  } else {
    return DeviceType.mobile;
  }
}
