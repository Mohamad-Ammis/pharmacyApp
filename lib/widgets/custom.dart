import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pharmacy/controller/login_controller.dart';

class custom extends StatelessWidget {
  const custom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller){
      
    return TextFormField(
        obscureText:controller.obscureText,
      decoration: InputDecoration(
        label: Text('asdasd'),
        suffixIcon: IconButton(onPressed: (){
          controller.showPassword();
          print('asdasd');
        }, icon: Icon(Icons.fit_screen)),
      ),
    );
    });
  }
}