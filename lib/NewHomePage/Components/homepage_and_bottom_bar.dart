import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/home_pages_controllers/getAllProducts.dart';
import 'package:flutter_application_2/profile/profilePage.dart';
import 'package:flutter_application_2/views/MyOrderPage/my_order_page.dart';
import 'package:flutter_application_2/views/favoritePage/favorite_page.dart';

import '../home_page_body.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//app bar
class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({super.key});

  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2>
    with TickerProviderStateMixin {
  double horizontalPadding = 20.0;
  double horizontalMargin = 5;
  int noOfIcons = 4;

  //to set pages (search,notifications,profile,homePage)
  List pages = [
    const HomePageBody(),
    MyOrder(),
    FavoritePage(),
    //HomePageBody(),
    const ProfilePage(),
  ];

  late double position;
  int selected = 0;

  late AnimationController controller;
  late Animation<double> animation;
  NotchBottomBarController p2 = NotchBottomBarController(index: 0);

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 375));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    animation = Tween(
            begin: getEndPosition(
                0, horizontalPadding, horizontalMargin, noOfIcons),
            end: getEndPosition(
                0, horizontalPadding, horizontalMargin, noOfIcons))
        .animate(controller);
    position =
        getEndPosition(0, horizontalPadding, horizontalMargin, noOfIcons);
    super.didChangeDependencies();
  }

  double getEndPosition(int index, double horizontalPadding,
      double horizontalMargin, int noOfIcons) {
    double totalMargin = 2 * horizontalMargin;
    double totalPadding = 2 * horizontalPadding;
    double valueToOmit = totalMargin + totalPadding;

    return (((MediaQuery.of(context).size.width - valueToOmit) / noOfIcons) *
                index +
            horizontalPadding) +
        (((MediaQuery.of(context).size.width - valueToOmit) / noOfIcons) / 2) -
        70;
  }

  void animateDrop(int index) {
    animation = Tween(
            begin: position,
            end: getEndPosition(
                index, horizontalPadding, horizontalMargin, noOfIcons))
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.easeOutBack));
    controller.forward().then((value) {
      position =
          getEndPosition(index, horizontalPadding, horizontalMargin, noOfIcons);
      controller.dispose();
      controller = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 575));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: pages[selected]),
          Positioned(
              bottom: horizontalMargin,
              child: AnimatedNotchBottomBar(
                removeMargins: false,
                notchColor: Colors.black,
                color: Colors.black,
                notchBottomBarController: p2,
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    activeItem: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    //itemLabel: 'home',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      FontAwesomeIcons.boxOpen,
                      color: Colors.white,
                    ),
                    activeItem: Icon(
                      FontAwesomeIcons.boxOpen,
                      color: Colors.white,
                    ),
                    // itemLabel: 'notify',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      //size: 25,
                    ),
                    activeItem: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      //size: 25,
                    ),
                    //itemLabel: 'search',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      FontAwesomeIcons.person,
                      color: Colors.white,
                    ),
                    activeItem: Icon(
                      FontAwesomeIcons.person,
                      color: Colors.white,
                    ),
                    //  itemLabel: 'profile',
                  ),
                ],
                onTap: (int value) {
                  setState(() {
                    selected = value;
                  });
                },
                kIconSize: 25,
                kBottomRadius: 10,
              )),
        ],
      ),
    );
  }
}
