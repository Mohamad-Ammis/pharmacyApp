import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/Auth_controllers/login_controller.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import '../../controller/cartPageController/cart_controller.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final formkey = GlobalKey<FormState>();
  final loginController = Get.put(LoginController());
  String? phone;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: w,
      body: Form(
        key: formkey,
        child: Stack(children: [
          Positioned(
            left: -140,
            top: -400,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [bg, bg],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
            ),
          ),
          GetBuilder<CartController>(
            init: CartController(),
            builder: (controller) => ListView(children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              Container(
                margin: EdgeInsets.fromLTRB(20, 200, 20, 10),
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
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: r),
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
                      focusColor: gr),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
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
                    } else
                      return null;
                  },
                  onChanged: (data) {
                    password = data;
                  },
                  obscureText: controller.togglePassword,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: bg,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: b,
                      ),
                      label: Text(
                        "Password",
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
                margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [b, b],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: bg,
                  child: InkWell(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        //Get.offAllNamed('/MainPage');
                        print("ks a");
                        await loginController.login(phone!, password!);
                        //intro.setString('showintro', 'no');
                      }
                    },
                    borderRadius: BorderRadius.circular(20),
                    //splashColor: Colors.amber,
                    child: Center(
                      child: Text(
                        "SIGN IN",
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
                    "DON'T HAVE AN ACCOUNT? ",
                    style: TextStyle(
                        fontSize: 11, color: gr, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                    child: Text(
                      "SIGN UP ",
                      style: TextStyle(
                          fontSize: 11, color: b, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
