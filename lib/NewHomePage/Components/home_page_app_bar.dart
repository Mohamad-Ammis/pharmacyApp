import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      title: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: const Text(
          'DawaTech',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed('/FavoritePage');
          },
          icon: const Icon(
            Icons.favorite_border_outlined,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            Get.toNamed('/cartpage');
          },
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
