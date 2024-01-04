import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/add_product_controller.dart';
import 'package:pharmacy/views/HomePage/homepage.dart';
import 'package:pharmacy/views/addproductPage/CateField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmacy/widgets/custom_text_field.dart';

final formkey = GlobalKey<FormState>();
String? category;
String? categoryId;
//File? image;

class AddProductBody extends StatefulWidget {
  AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody> {
  String? scName;
  String? scNameAr;
  String? brandName;
  String? brandNameAr;
  String? manufacturer;
  String? manufacturerAr;
  String? price;
  String? stock;
  String? exDate;
  String? desc;
  String? descAr;
  DateTime? ExpirationDate;
  DateTime expirDate = DateTime.now();
  final controller = Get.put(AddProductController());
  TextEditingController date = TextEditingController();
  List<int>? _selectedfile;
  Uint8List? _bytesdata;
  fetchimage() async {
    html.FileUploadInputElement uploadinput = html.FileUploadInputElement();
    uploadinput.multiple = true;
    uploadinput.draggable = true;
    uploadinput.click();

    uploadinput.onChange.listen((event) {
      final files = uploadinput.files;
      final file = files![0];
      final reader = html.FileReader();
      reader.onLoadEnd.listen((event) {
        setState(() {
          _bytesdata =
              Base64Decoder().convert(reader.result.toString().split(",").last);
          _selectedfile = _bytesdata;
        });
      });
      reader.readAsDataUrl(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.fromLTRB(10, 12, 5, 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Text(
                      "Add Product",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Form(
                  key: formkey,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 190,
                                    child: Text("Scientific Name"),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    width: 190,
                                    child: Text('BrandName'),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 190,
                                    child: CustomTextField(
                                      onChanged: (data) {
                                        scName = data;
                                      },
                                      validator: (data) {
                                        if (data!.isEmpty) {
                                          return "Required Field";
                                        } else if (data.length < 3) {
                                          return " Must be At Least 3 Characters";
                                        } else if (!RegExp(r'^[a-zA-Z]+$')
                                            .hasMatch(data)) {
                                          return ' Must be Contain Only Characters';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    width: 190,
                                    child: CustomTextField(
                                      onChanged: (data) {
                                        brandName = data;
                                      },
                                      validator: (data) {
                                        if (data!.isEmpty) {
                                          return "Required Field";
                                        } else if (data.length < 3) {
                                          return " Must be At Least 3 Characters";
                                        } else if (!RegExp(r'^[a-zA-Z]+$')
                                            .hasMatch(data)) {
                                          return ' Must be Contain Only Characters';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              // Spacer(),
                              // SizedBox(height: 6),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: Text("Category"),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: CateField(),
                                  ),
                                ],
                              ),
                              // Spacer(),
                              // SizedBox(height: 6),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: Text("Manfuncturer"),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: CustomTextField(
                                      onChanged: (data) {
                                        manufacturer = data;
                                      },
                                      validator: (data) {
                                        if (data!.isEmpty) {
                                          return "Required Field";
                                        } else if (data.length < 3) {
                                          return " Must be At Least 3 Characters";
                                        } else if (!RegExp(r'^[a-zA-Z]+$')
                                            .hasMatch(data)) {
                                          return ' Must be Contain Only Characters';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                    width: 160,
                                    child: Text("ExpirationDate"),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    width: 100,
                                    child: Text('Stock'),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    width: 100,
                                    child: Text('Price'),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    width: 160,
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              
                                            });
                                            showDatePicker(
                                                    context: context,
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime(2050),
                                                    initialDate: ExpirationDate??DateTime.now())
                                                .then((value) {
                                              setState(() {
                                              ExpirationDate =value;
                                                print(ExpirationDate);
                                              });
                                            });
                                          },
                                          child: Text(
                                            ExpirationDate==null?DateTime.now()
                                                .toString()
                                                .substring(0, 10):ExpirationDate.toString()
                                                    .substring(0, 10),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 100,
                                    child: CustomTextField(
                                      onChanged: (data) {
                                        stock = data;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Required Field";
                                        } else if (int.tryParse(value) ==
                                            null) {
                                          return "Only Numbers Are Allowed";
                                        } else if (!RegExp(r'^[0-9]+$')
                                            .hasMatch(value)) {
                                          return "Only Positive Numbers Are Allowed";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 100,
                                    child: CustomTextField(
                                      onChanged: (data) {
                                        price = data;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Required Field";
                                        } else if (int.tryParse(value) ==
                                            null) {
                                          return "Only Numbers Are Allowed";
                                        } else if (!RegExp(r'^[0-9]+$')
                                            .hasMatch(value)) {
                                          return "Only Positive Numbers Are Allowed";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: Text("Description"),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    height: 100,
                                    child: CustomTextField(
                                      onChanged: (data) {
                                        desc = data;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Required Field";
                                        } else if (value.length < 3) {
                                          return " Must be At Least 3 Characters";
                                        } else if (RegExp(r'^-?[0-9]+$')
                                            .hasMatch(value)) {
                                          return ' Must be Contain Characters';
                                        } else {
                                          return null;
                                        }
                                      },
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: Text('الاسم العلمي'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: CustomTextField(
                                      onChanged: (data) {
                                        scNameAr = data;
                                      },
                                      validator: (data) {
                                        if (data!.isEmpty) {
                                          return "Required Field";
                                        } else if (data.length < 3) {
                                          return " Must be At Least 3 Characters";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: Text('الاسم التجاري'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: CustomTextField(
                                      onChanged: (data) {
                                        brandNameAr = data;
                                      },
                                      validator: (data) {
                                        if (data!.isEmpty) {
                                          return "Required Field";
                                        } else if (data.length < 3) {
                                          return " Must be At Least 3 Characters";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: Text('الشركة المصنعة'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: CustomTextField(
                                      onChanged: (data) {
                                        manufacturerAr = data;
                                      },
                                      validator: (data) {
                                        if (data!.isEmpty) {
                                          return "Required Field";
                                        } else if (data.length < 3) {
                                          return " Must be At Least 3 Characters";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    child: Text('الوصف'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 400,
                                    height: 100,
                                    child: CustomTextField(
                                      onChanged: (data) {
                                        descAr = data;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Required Field";
                                        } else if (value.length < 3) {
                                          return " Must be At Least 3 Characters";
                                        } else if (RegExp(r'^-?[0-9]+$')
                                            .hasMatch(value)) {
                                          return ' Must be Contain Characters';
                                        } else {
                                          return null;
                                        }
                                      },
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, right: 80),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 8),
                                              child: Text("Add Image"),
                                            ),
                                          ],
                                        ),
                                      )),
                                  GetBuilder<AddProductController>(
                                    builder: (controller) => _bytesdata == null
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    DottedBorder(
                                                      color: kMainColor,
                                                      strokeWidth: 2,
                                                      borderType:
                                                          BorderType.RRect,
                                                      dashPattern: const <double>[
                                                        5,
                                                        2.5
                                                      ],
                                                      radius:
                                                          const Radius.circular(
                                                              20),
                                                      child: InkWell(
                                                        onTap: () {
                                                          //   controller.getImage(
                                                          //       ImageSource
                                                          //           .gallery);
                                                          fetchimage();
                                                        },
                                                        child: Container(
                                                          height: 250,
                                                          width: 350,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xfff5f6fa),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Spacer(),
                                                              // Image.asset(
                                                              //   'assets/images/photo_2024-01-03_13-32-54.jpg',
                                                              //   height: 100,
                                                              //   width: 100,
                                                              //   opacity:
                                                              //       const AlwaysStoppedAnimation(
                                                              //           0.5),
                                                              // ),
                                                              Spacer(),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            40),
                                                                child: Expanded(
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          // controller.getImage(ImageSource.gallery);
                                                                          fetchimage();
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .file_upload_outlined,
                                                                          size:
                                                                              30,
                                                                          color:
                                                                              kMainColor,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                8.0),
                                                                        child: Text(
                                                                            "Select image from gallery"),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 16, right: 0),
                                                height: 270,
                                                width: 350,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.2),
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      child: Image.memory(
                                                        _bytesdata!,
                                                        fit: BoxFit.fitHeight,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                if (formkey.currentState!
                                                        .validate() &&
                                                    _selectedfile!=null
                                                  ) {

                                                  print('before');
                                                  await controller.addProduct(
                                                      scName!,
                                                      scNameAr!,
                                                      brandName!,
                                                      brandNameAr!,
                                                      manufacturer!,
                                                      manufacturerAr!,
                                                      price!,
                                                      stock!,
                                                      ExpirationDate.toString()
                                                          .substring(0, 10),
                                                      desc!,
                                                      descAr!,
                                                      _selectedfile!);
                                                  print('after addprod');
                                                  setState(() {
                                                    selectedsa=0;
                                                  });
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: kMainColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40,
                                                    vertical: 8),
                                                child: Text(
                                                  "Submit",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
