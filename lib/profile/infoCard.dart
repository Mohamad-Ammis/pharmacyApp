// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Icon(
          Icons.person,
          weight: 20,
          size: 35,
          color: Colors.black,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(color: w, fontSize: 20),
      ),
    );
  }
}
