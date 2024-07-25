import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/Auth_controllers/register_controller.dart';
import 'package:flutter_application_2/controller/cartPageController/cart_controller.dart';
import 'package:get/get.dart';

import '../../main.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  String? name;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;
  final formkey = GlobalKey<FormState>();
  final registerController = Get.put(RegisterController());
  var pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: w,
      body: Stack(children: [
        Positioned(
          left: -140,
          top: -420,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [bg, bg],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
        ),
        Form(
          key: formkey,
          child: GetBuilder<CartController>(
            init: CartController(),
            builder: (controller) => ListView(children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                margin: EdgeInsets.fromLTRB(20, 120, 20, 5),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required Field";
                    } else if (value.length < 3) {
                      return "Name Must be At Least 3 Characters";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (data) {
                    name = data;
                  },
                  keyboardType: TextInputType.text,
                  cursorColor: bg,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: b,
                      ),
                      label: Text(
                        "Name",
                        style: TextStyle(color: gr),
                      ),
                      errorBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: r)),
                      focusedErrorBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: r)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: gr,
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: gr,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: bg, width: 2)),
                      focusColor: gr),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required Field";
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                        .hasMatch(value)) {
                      return "Enter correct email";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (data) {
                    email = data;
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: bg,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: b,
                      ),
                      label: Text(
                        "Email",
                        style: TextStyle(color: gr),
                      ),
                      errorBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: r)),
                      focusedErrorBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: r)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: gr,
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: gr,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: bg, width: 2)),
                      focusColor: gr),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required Field";
                    } else if (int.tryParse(value) == null) {
                      return "Only Numbers Are Allowed";
                    } else if (value.length != 10) {
                      return "Phone Number Must be 10 digits";
                    } else if (value.indexOf('09') != 0) {
                      return "Enter correct phone number";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (data) {
                    phone = data;
                  },
                  keyboardType: TextInputType.phone,
                  cursorColor: bg,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_android_outlined,
                        color: b,
                      ),
                      label: Text(
                        "Phone number",
                        style: TextStyle(color: gr),
                      ),
                      errorBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: r)),
                      focusedErrorBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: r)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: gr,
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: gr,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: bg, width: 2)),
                      focusColor: gr),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "Required Field";
                    } else if (data.length < 8) {
                      return "Password Must be At Least 8 Characters";
                    } else if (RegExp(r'^-?[0-9]+$').hasMatch(data)) {
                      return 'Password Should Contain Numbers & Characters';
                    } else if (RegExp(r'^[a-z]+$').hasMatch(data)) {
                      return 'Password Should Contain Numbers & Characters';
                    } else {
                      pass = data;
                      return null;
                    }
                  },
                  onChanged: (data) {
                    password = data;
                  },
                  obscureText: controller.togglePassword,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: bg,
                  decoration: InputDecoration(
                      errorBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: r)),
                      focusedErrorBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: r)),
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: b,
                      ),
                      label: Text(
                        "Password",
                        style: TextStyle(color: gr),
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: gr,
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: gr,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: bg, width: 2)),
                      focusColor: gr,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.togglePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () {
                          controller.togglePas();
                        },
                      ),
                      suffixIconColor: b),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "Required Field";
                    } else if (data.length < 8) {
                      return "Password Must be At Least 8 Characters";
                    } else if (RegExp(r'^-?[0-9]+$').hasMatch(data)) {
                      return 'Password Should Contain Numbers & Characters';
                    } else if (RegExp(r'^[a-z]+$').hasMatch(data)) {
                      return 'Password Should Contain Numbers & Characters';
                    } else if (data != pass) {
                      return "Password and Confirm password aren\'t the same";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (data) {
                    confirmPassword = data;
                  },
                  obscureText: controller.togglePassword1,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: bg,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: b,
                      ),
                      label: Text(
                        "Confirm Password",
                        style: TextStyle(color: gr),
                      ),
                      errorBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: r)),
                      focusedErrorBorder:
                          OutlineInputBorder(borderSide: BorderSide(color: r)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: gr,
                      )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: gr,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: bg, width: 2)),
                      focusColor: gr,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.togglePassword1
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () {
                          controller.togglePas1();
                        },
                      ),
                      suffixIconColor: b),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 20, 30, 5),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [b, b],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: bg,
                  child: InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        await registerController.register(
                            phone!, password!, confirmPassword!, name!, email!);
                        Get.offAllNamed('/login');
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    //splashColor: Colors.amber,
                    child: Center(
                      child: Text(
                        "CREATE AN ACCOUNT",
                        style: TextStyle(color: b, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ALREADY HAVE AN ACCOUNT? ",
                    style: TextStyle(
                        fontSize: 11, color: gr, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    child: Text(
                      "SIGN IN ",
                      style: TextStyle(
                          fontSize: 11, color: b, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ]),
          ),
        )
      ]),
    );
  }
}
