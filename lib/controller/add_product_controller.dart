
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmacy/constans.dart';
import 'package:http/http.dart'as http;
import 'package:pharmacy/views/addproductPage/add_product_body.dart';
import 'package:file_picker/file_picker.dart';
class AddProductController extends GetxController {
  Future<void> addProduct(
      String scName,
  String scNameAr,
  String brandName,
  String brandNameAr,
  String manufacturer,
  String manufacturerAr,
  String price,
  String stock,
  String exDate,
  String desc,
  String descAr,
  var _selectedfile

  )async {
    var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer $kTokenTest'
};
try{
  var request = http.MultipartRequest(
          'POST', Uri.parse('http://localhost:8000/api/v1/products'));
      request.fields.addAll({
        'scientific_name': scName,
        'scientific_name_ar': scNameAr,
        'brand_name': brandName,
        'brand_name_ar': brandNameAr,
        'category': category!,
        'manufacturer': manufacturer,
        'manufacturer_ar': manufacturerAr,
        'price': price,
        'stock': stock,
        'expiration_date': exDate,
        'description': desc,
        'description_ar': descAr,
        'category_id': categoryId!
      });
//request.files.add(await http.MultipartFile.fromPath('image', path.path));
      request.headers.addAll(headers);
      print('ok');
      request.files.add(http.MultipartFile.fromBytes('image', _selectedfile!,
          contentType: MediaType('image', 'JPG'), filename: "any_name"));
      print('opp');

      http.StreamedResponse response = await request.send();
      var test = await http.Response.fromStream(response);
      print(test.body);
      if (response.statusCode == 200) {
        print('done');
        // print(await response.stream.bytesToString());
      } else {
        print('error');
// final respStr = await response.stream.bytesToString();
//   print(respStr);
      }

}
catch(e){
  print(e.toString());
}
  }
  bool nextToArabicForm = false;
  GlobalKey<FormState> formKey = GlobalKey();
  double localWidth = 0;
  double fullScreenWidth = 0;
  bool isNext = false;
  bool isConfirm = false;
  
  var selectedImagePath1 = '';
  String? ValueChoose;
  bool newCate = false;
  int selectedIndex = 0;
  List<String> listCategory = [
    'oral use',
    'external use',
    'injectable',
    'intravenous fluids',
    'vaccines and serums',
    'sterilizers',
    'other'
  ];

  void changeCate() {
    newCate = !newCate;
    update();
  }
  var selectedImagePath = '';
  // void getImage(ImageSource imageSource) async {
  //   final PickedFile = await ImagePicker().pickImage(source: imageSource);
  //   if (PickedFile != null) {
  //     selectedImagePath = PickedFile.path;
  //     image= File(PickedFile.path);
  //   }
  //   update();
  // }

  // void getImage1(ImageSource imageSource) async {
  //   final PickedFile = await ImagePicker().pickImage(source: imageSource);
  //   if (PickedFile != null) {
  //     selectedImagePath1 = PickedFile.path;
  //     // selectedImageSize = ((File(selectedImagePath)).lengthSync() / 1024 / 1024)
  //     //         .toStringAsFixed(2) +
  //     //     "Mb";
  //   }
  //   update();
  // }

  void ChangeNext() {
    isNext = !isNext;
    update();
  }

  void ChangeConfirm() {
    isConfirm = !isConfirm;
    update();
  }

  Widget customRadio(String txt, int index) {
    return OutlinedButton(
        onPressed: () => changeIndex(index),
        child: Text(txt),
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                  color: selectedIndex == index ? Colors.cyan : Colors.grey))),
        ));
  }

  void changeIndex(int index) {
    selectedIndex = index;
    update();
  }

  Widget custmRadio(String txt, int index) {
    return OutlinedButton(
        onPressed: () => changeIndex(index),
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                  color: selectedIndex == index ? kMainColor : kBorderColor))),
        ),
        child: Text(
          txt,
          style: TextStyle(
              color: selectedIndex == index ? kMainColor : kBorderColor),
        ));
  }

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool validateInput() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      update();
      return true;
    } else {
      autovalidateMode = AutovalidateMode.always;
      update();
      return false;
    }
  }
}
