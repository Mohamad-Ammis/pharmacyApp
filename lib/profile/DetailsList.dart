import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/profile/ListTileSet.dart';
import 'package:flutter_application_2/profile/driver.dart';

class DetailsList extends StatelessWidget {
  const DetailsList({
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
              Icon(
                Icons.grading,
                color: kSecondryTextColor,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "General ",
                style: TextStyle(
                    color: kSecondryTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        ListTileSet(title: "My Order", route: "/MyOrder"),
        driverr(),
        ListTileSet(title: "Favorites", route: "/FavoritePage"),
        driverr(),
        ListTileSet(title: "Notifications", route: "FavoritePage"),
        ListTileSet(title: "Our Statistics", route: "/ReportsPage"),
      ],
    );
  }
}
