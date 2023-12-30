import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/views/HomePage/homepage.dart';
import 'package:pharmacy/views/logInPage/loginpage.dart';
import 'package:pharmacy/views/showProductPage/show_product_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences shared;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  shared=await SharedPreferences.getInstance();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/LogInPage',
      getPages: [
        GetPage(name: '/ShowProduct', page: () => const ShowProductPage()),
        GetPage(name: '/LogInPage', page: () => const LogInPage(),),
        GetPage(name: '/HomePage', page: () => const HomePage(),),
      ],
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}