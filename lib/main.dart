import 'package:flutter/material.dart';
import 'package:pharmacy/views/logInPage/login_body.dart';
import 'package:get/get.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
         //   textTheme: GoogleFonts.notoSerifTextTheme(Theme.of(context).textTheme),
            ),
        home:const  LogInBody(),
        
        );
  }
}
