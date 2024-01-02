import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy/views/NavBar/navbar_item.dart';
import 'package:pharmacy/views/addproductPage/add_product_body.dart';
import 'package:pharmacy/views/orderpage/allOrdersPage.dart';
import 'package:pharmacy/views/products_list_page/products_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedsa = 0;
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
        Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Container(
              //margin: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height,
              width: 101.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 200,
                    child: Column(
                      children: icon
                          .map(
                            (e) => NavBarItem(
                              icon: e,
                              selected: selected[icon.indexOf(e)],
                              onTap: () {
                                setState(() {
                                  select(icon.indexOf(e));
                                  selectedsa = icon.indexOf(e);
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        pages[selectedsa]
      ]),
    );
  }
}
