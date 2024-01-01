import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/add_product_controller.dart';
import 'package:pharmacy/views/addproductPage/add_product_body.dart';

List<String> listCategory = [
  'oral_use',
  'external_use',
  'injectable',
  'Intravenous_fluids',
  'vaccines_and_serums',
  'sterilizers',
  'other'
];
var ValueChoose;

class CateField extends StatefulWidget {
   CateField({super.key,});

  @override
  State<CateField> createState() => _CateFieldState();
}

class _CateFieldState extends State<CateField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (value) {
        if (value == null) {
          return "Required Field";
        } else {
          return null;
        }
      },
      icon: Icon(Icons.arrow_drop_down),
      hint: Text("Select Category"),
      items: listCategory.map((valueItem) {
        return DropdownMenuItem(child: Text(valueItem), value: valueItem);
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          ValueChoose = newValue!;
          category=newValue.toString();
        });
      },
      value: ValueChoose,
      dropdownColor: Color.fromARGB(255, 221, 208, 249),
      focusColor: Color.fromRGBO(255, 255, 255, 0.5),
      decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0xFFc65c55),
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFc65c55))),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: kBorderColor,
          )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: kBorderColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: kMainColor, width: 2)),
          focusColor: kMainColor),
    );
  }
}
