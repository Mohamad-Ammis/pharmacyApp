import 'package:flutter/material.dart';

OutlineInputBorder buildBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(8),
  );
}
