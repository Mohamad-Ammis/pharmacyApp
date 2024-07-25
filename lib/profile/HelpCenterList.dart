import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/controller/Auth_controllers/login_controller.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/profile/ListTileSet.dart';
import 'package:flutter_application_2/profile/driver.dart';
import 'package:get/get.dart';

class HelpCentreList extends StatelessWidget {
  const HelpCentreList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.pending_sharp,
                  color: kSecondryTextColor,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Help Center",
                style: TextStyle(
                    color: kSecondryTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        ListTileSet(title: "Privacy Policy", route: "/PrivacyPolicy"),
        driverr(),
        ListTileSet(title: "Terms Of Service", route: "/PrivacyPolicy"),
        driverr(),
        ListTile(
          onTap: () async{
            //sharedPref.clear();
            await LoginController().logout(token!);
            Get.offNamed('/login');
          },
          title: Text(
            "Sign Out",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          trailing: Icon(Icons.arrow_right),
        ),
      ],
    );
  }
}
