import 'package:flutter/material.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/core/enums/device_type.dart';
import 'package:pharmacy/helper/get_device_type.dart';
import 'package:pharmacy/views/HomePage/add_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      Expanded(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(child: Text('One')),
            color: Colors.amber.shade100),
      ),
      Expanded(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(child: Text('Two')),
            color: Colors.pink.shade100),
      ),
      AddProduct(),
           Expanded(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(child: Text('four')),
            color: Colors.green.shade100),
      ),
    ];
    return Scaffold(
      bottomNavigationBar: 
      getDeviceType(MediaQuery.of(context))==DeviceType.Mobile
          ? BottomNavigationBar(
              currentIndex: selectedIndex,
              unselectedItemColor: Colors.green,
              selectedItemColor: Colors.blue,
              onTap: changeDestination,
              items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.history), label: 'History'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_box_rounded), label: 'AddProduct'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings')
                ])
          : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              selectedIconTheme: IconThemeData(color: kMainColor),
              backgroundColor: kMainColor,
              unselectedIconTheme: IconThemeData(color: Colors.white),
              indicatorColor: Colors.white,
              onDestinationSelected: changeDestination,
              selectedIndex: selectedIndex,
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.history), label: Text('History')),
                NavigationRailDestination(
                    icon: Icon(Icons.add_box_rounded),
                    label: Text('Add Product')),
                NavigationRailDestination(
                    icon: Icon(Icons.settings), label: Text('Settings'))
              ],
            ),
          screens[selectedIndex],
        ],
      ),
    );
  }

  void Function(int)? changeDestination(int index) {
    setState(() {
      selectedIndex = index;
    });
    return null;
  }
}
