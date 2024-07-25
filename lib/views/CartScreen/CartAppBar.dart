import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: w,
      leading: InkWell(
        onTap: () {
          Get.offAllNamed('/MainPage');
        },
        child: Icon(
          Icons.arrow_back,
          size: 30,
          color: b,
        ),
      ),
      centerTitle: true,
      title: Text(
        "My Cart",
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: b),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
