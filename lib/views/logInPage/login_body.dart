import 'package:flutter/material.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/core/enums/device_type.dart';
import 'package:pharmacy/helper/get_device_type.dart';
import 'package:pharmacy/views/logInPage/login_info.dart';
import 'package:pharmacy/views/logInPage/login_style.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 235, 235, 235),
      body: Stack(
        children: [
          //style dots 
          Positioned(
            left: -120,
            top: -50,
            child: Image.network(
              'assets/assets/images/dots.png',
              width:300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          if(getDeviceType(MediaQuery.of(context))==DeviceType.mobile)
          Positioned(
            right: -120,
            bottom: -50,
            child: Image.network(
              'assets/assets/images/dots.png',
              width:300,
              opacity: const AlwaysStoppedAnimation(1),
            ),
          ),
          //finish style dots
          Container(
            clipBehavior: Clip.hardEdge,
            margin:getDeviceType(MediaQuery.of(context))==DeviceType.mobile? const EdgeInsets.symmetric(vertical: 40, horizontal: 0):
            const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
            decoration: const BoxDecoration(
              color:kBackGroundColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children:[ 
                  LogInInfo(),
                  if(getDeviceType(MediaQuery.of(context))!=DeviceType.mobile)const LogInStyle(),
                ],
              ),
              if(getDeviceType(MediaQuery.of(context)) == DeviceType.desktop)
              Positioned(
                      right: 150,
                      bottom: 0,
                      child: Image.network(
                        'assets/assets/images/doctor.png',
                        width:MediaQuery.of(context).size.width>1024&&MediaQuery.of(context).size.width<1100? 350:450,
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