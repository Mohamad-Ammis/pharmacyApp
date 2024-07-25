// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../main.dart';

class Data {
  final String title;
  final String description;
  final String imageUrl;
  Data({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

int currentIndex = 0;

class PView extends StatefulWidget {
  PView({super.key});
  @override
  State<PView> createState() => _PViewState();
}

class _PViewState extends State<PView> {
  final List<Data> myData = [
    Data(
        title: "Welcome to Pharmacy App",
        description: "Your pharmacy is now an app! Order medications simply!",
        imageUrl: "images/anim1.json"),
    Data(
        title: "Easy to use",
        description:
            "By simply clicking on the medication you can determine the amount you need",
        imageUrl: "images/anim2.json"),
    Data(
        title: "All the time",
        description: "You can take medications at any time",
        imageUrl: "images/anim4.json"),
    Data(
        title: "Professional medicine ",
        description: "Healthy products with premium quality and the best p",
        imageUrl: "images/anim3.json"),
  ];
  final PageController controller = PageController(initialPage: currentIndex);
  Widget getStarted(int ind) {
    if (ind == 3)
      return Container(
          child: Stack(
        children: [
          Positioned(
            left: -110,
            top: 500,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [bg, bg],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
            ),
          ),
          Positioned(
            left: 2,
            top: 710,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(30, 20, 30, 30),
              //width: MediaQuery.of(context).size.width * 0.33,
              // height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                      colors: [b, b],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: b,
                child: InkWell(
                  onTap: () {
                    Get.toNamed('/login');
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: w, fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ));
    else if (ind == 0)
      return Container(
        child: Stack(
          children: [
            Positioned(
              left: -120,
              top: 520,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [bg, bg],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.8),
              child: InkWell(
                onTap: () {
                  setState(() {
                    currentIndex++;
                    controller.animateToPage(currentIndex,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bg,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: gr, offset: Offset(3, 3), blurRadius: 10)
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 42,
                    color: b,
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment(0.85, -0.88),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                      onTap: () {
                        Get.offAllNamed('/login');
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 18,
                            color: b,
                            fontWeight: FontWeight.bold),
                      )),
                )),
          ],
        ),
      );
    else
      return Container(
        child: Stack(
          children: [
            Positioned(
              left: -120,
              top: 520,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [bg, bg],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.8),
              child: InkWell(
                onTap: () {
                  setState(() {
                    currentIndex++;
                    controller.animateToPage(currentIndex,
                        duration: Duration(milliseconds: 1),
                        curve: Curves.easeIn);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: bg,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: gr, offset: Offset(3, 3), blurRadius: 10)
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 42,
                    color: b,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }

  Widget dotIndicator(int ind) {
    if (ind != 3) {
      return Row(
        children: [
          Align(
            alignment: Alignment(0, 0.6),
            child: PageViewDotIndicator(
              currentItem: currentIndex,
              count: myData.length,
              unselectedColor: b,
              selectedColor: bg,
              size: Size(22, 20),
              unselectedSize: Size(10, 10),
              boxShape: BoxShape.circle,
            ),
          ),
        ],
      );
    } else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Builder(builder: (context) {
            return PageView(
              controller: controller,
              children: myData
                  .map((item) => Container(
                        color: w,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              SizedBox(height: 80),
                              Lottie.asset(item.imageUrl,
                                  width: 300, height: 300),
                              SizedBox(height: 40),
                              Text(
                                item.title,
                                style: TextStyle(
                                    color: b,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Text(
                                item.description,
                                style: TextStyle(
                                  color: b,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              onPageChanged: (val) {
                setState(() {
                  currentIndex = val;
                });
              },
            );
          }),
          getStarted(currentIndex),
          dotIndicator(currentIndex),
        ],
      ),
    );
  }
}
