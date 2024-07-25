import 'package:flutter/material.dart';
import 'package:flutter_application_2/profile/profilePage.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: unused_field
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: kToolbarHeight,
                ),

                const CircleAvatar(
                  radius: 70.0,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80",
                  ),
                  backgroundColor: Colors.transparent,
                ),

                const SizedBox(
                  height: 10,
                ),

                const Text(
                  "Alex Marshall",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 10,
                ),

                const Text(
                  "@alexaarshall",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 20,
                ),

                // Edit button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ProfilePage();
                      },
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 108, 108, 112),
                  ),
                  child: const Text(
                    "My profile",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // my offers
          _buildDrawerItem(
            "My offers",
            _selectedIndex == 0,
            () {
              // Update the state of the app
              _onItemTapped(0);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          // Dark mode
          _buildDrawerItem(
            "Dark mode",
            _selectedIndex == 0,
            () {
              // Update the state of the app
              _onItemTapped(0);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          // Language
          _buildDrawerItem(
            " Language",
            _selectedIndex == 0,
            () {
              // Update the state of the app
              _onItemTapped(0);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),

          // Favorite
          _buildDrawerItem(
            "Favorite",
            _selectedIndex == 0,
            () {
              // Update the state of the app
              _onItemTapped(0);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),

          // Settings
          _buildDrawerItem(
            "Settings",
            _selectedIndex == 0,
            () {
              // Update the state of the app
              _onItemTapped(1);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          // About Us
          _buildDrawerItem(
            "About Us",
            _selectedIndex == 0,
            () {
              // Update the state of the app
              _onItemTapped(2);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),

          // Logout
          _buildDrawerItem(
            "Logout",
            _selectedIndex == 0,
            () {
              // Update the state of the app
              _onItemTapped(3);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildDrawerItem(
    String title,
    bool isSelected,
    Function() onTap,
  ) {
    return ListTile(
      title: Text(title),
      selected: isSelected,
      onTap: () {
        onTap.call();
      },
    );
  }
}
