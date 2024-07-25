import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class PrivacyPolicy extends StatelessWidget implements PreferredSizeWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bg,
        leading: InkWell(
          onTap: () {
            Get.offAllNamed('/profilePage');
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: b,
          ),
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: b),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12, top: 12, right: 10),
        child: Text(
          "A properly written Privacy Policy tells customers what data you collect about them when they engage with your business (e.g., through your website) or purchase one of your products/services, and why you're collecting that information. It also lets people know how long their information will be stored, who can access these records and more.",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
