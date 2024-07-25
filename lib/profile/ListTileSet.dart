import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListTileSet extends StatelessWidget {
  const ListTileSet({
    Key? key,
    required this.title,
    required this.route,
  }) : super(key: key);
  final String title;
  final String route;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(route);
      },
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_right),
    );
  }
}
