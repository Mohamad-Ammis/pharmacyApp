import 'package:flutter/material.dart';

import 'Components/home_category_list.dart';
import 'Components/home_page_app_bar.dart';
import 'Components/most_common_list.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //bottomNavigationBar: HomeBottomBar(),
      appBar: HomePageAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          HomeCategoryList(),
          const SizedBox(height: 15),
          MostCommonList(type: "All Products"),
          const SizedBox(height: 15),
          MostCommonList(type: "The Most Common"),
          const SizedBox(height: 15),
          MostCommonList(type: "Recently Added"),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
          )
        ]),
      ),
    );
  }
}

// class Page1 extends StatelessWidget {
//   const Page1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       backgroundColor: const Color.fromARGB(255, 231, 231, 231).withOpacity(0.1),
//       appBar:HomePageAppBar(),
//       body:SingleChildScrollView(
//         child: Column(children: [
//           HomeCategoryList(title: 'Categories'),
//           const SizedBox(height:15),
//           MostCommonList(type:"Recently Added"),
//           const SizedBox(height:15),
//           MostCommonList(type:"The Most Common"),
//         ]),
//       ),
//     );
//   }
// }
