import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/login_controller.dart';
import 'package:pharmacy/core/enums/device_type.dart';
import 'package:pharmacy/helper/get_device_type.dart';
import 'package:pharmacy/views/logInPage/login_form.dart';


class LogInInfo extends StatelessWidget {
  LogInInfo({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(

        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color:Colors.white,
          image: DecorationImage(
            opacity: 0.7,
            fit: BoxFit.cover,
            image: NetworkImage(
              'assets/assets/images/bills.jpg',
            ),
          ),
        ),
        child: Padding(
          padding: getDeviceType(MediaQuery.of(context)) == DeviceType.desktop
              ? MediaQuery.of(context).size.width > 1024 &&
                      MediaQuery.of(context).size.width < 1100
                  ? const EdgeInsets.only(right: 200, left: 50, top: 100)
                  : const EdgeInsets.only(right: 300, left: 80, top: 100)
              :const EdgeInsets.only(
                  left: 40,
                  right: 40,
                  top: 100,
                ),
          child:LoginForm()
        ),
      ),
    );
  }
}
