import 'package:flutter/material.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/views/logInPage/login_info.dart';
import 'package:pharmacy/views/logInPage/login_style.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      body: Stack(
        children: [
          Positioned(
            left: -120,
            top: -50,
            child: Image.network(
              'assets/assets/images/dots.png',
              width:300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
            decoration: const BoxDecoration(
              color:kBackGroundColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          child: Stack(
            children: [
              Row(
                children: [
                  LogInInfo(),
                  LogInStyle()
                ],
              ),
              Positioned(
                      right: 220,
                      bottom: 0,
                      child: Image.network(
                        'assets/assets/images/doctor.png',
                        width: 450,
                        opacity:const  AlwaysStoppedAnimation(1),
                      ),
                    ),
            ],
          ),
          ),
        ],
      ),
    );
  }
}