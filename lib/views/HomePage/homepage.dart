import 'package:flutter/material.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/widgets/custom_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool isExpanded = false;
  final List<Widget> screens = [
    Container(
      child: Text('one'),
      color: Colors.pink,
    ),
    Container(
      child: Text('two'),
    ),
    Expanded(
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 200),
          child: Column(
            children: [
              Row(children: [
                SizedBox(width:200,
                  child: CustomTextField(
                      label: 'Scientific Name',
                    ),
                ),
                  SizedBox(width:200,
                    child: CustomTextField(
                      label: 'Brand Name',
                    ),
                  ),
              ],),
              CustomTextField(
                label: 'asd',
              ),
              CustomTextField(
                label: 'asd',
              ),
              CustomTextField(
                label: 'asd',
              )
            ],
          ),
        ),
      ),
    ),
    Container(
      child: Text('one'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
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
              selectedIconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Color.fromARGB(95, 0, 0, 0),
              unselectedIconTheme: IconThemeData(color: Colors.white),
              indicatorColor: kMainColor,
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
