import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/views/NavBar/navbar_item.dart';
import 'package:pharmacy/views/addproductPage/add_product_body.dart';
import 'package:pharmacy/views/orderpage/allOrdersPage.dart';
import 'package:pharmacy/views/products_list_page/products_page.dart';
int selectedsa = 0;
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}


List<bool> selected = [true, false, false, false, false];
List pages = [
  const Expanded(child: ProductsPage()),
  AddProductBody(),
  AllOrderPage(),
  Expanded(
      child: Container(
    color: Colors.white,
  )),
  Expanded(
      child: Container(
    color: Colors.green,
  )),
  Expanded(
      child: Container(
    color: Colors.black,
  )),
];

class _HomePageState extends State<HomePage> {
  List<IconData> icon = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.plus,
    FontAwesomeIcons.boxOpen,
    // Icons.abc_sharp,
    // Icons.deblur
  ];

  void select(int n) {
    for (int i = 0; i < 5; i++) {
      if (i == n) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        NavigationRail(
          elevation: 10,
          groupAlignment: 0.01,
          backgroundColor: kMainColor,
          onDestinationSelected: (newIndex ){
            setState(() {
              selectedsa = newIndex;
            });
          },
          destinations: [
            
          NavigationRailDestination(
            padding: EdgeInsets.only(bottom: 20),
            icon: Icon(
                FontAwesomeIcons.house,
              ), label: Text(''),),
              NavigationRailDestination(
                padding: EdgeInsets.only(bottom: 20),
                icon: Icon(
                  FontAwesomeIcons.plus,
                ),
                label: Text(''),
              ),
              NavigationRailDestination(
                padding: EdgeInsets.only(bottom: 20),
                icon: Icon(
                  FontAwesomeIcons.boxOpen,
                ),
                label: Text(''),
              ),
        ], selectedIndex: selectedsa),
      pages[selectedsa],
      
      ]),
    );
  }
}
