import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../main.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 101,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Dawiny",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      shared.clear();
                      Get.offAllNamed('/LogInPage');
                    },
                    icon: const Icon(
                      FontAwesomeIcons.doorOpen,
                      color: Colors.black,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
