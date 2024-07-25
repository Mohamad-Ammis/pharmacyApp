import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/NewHomePage/Components/category_card.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({
    super.key,
  });
  final List categoryNames = const [
    'Oral',
    'External',
    'Injectable',
    'Intravenous',
    'Vaccines',
    'Sterilizers',
    'Other'
  ];
  final List categoryImages = const [
    "assets/categoryImage/oral.jpg",
    "assets/categoryImage/external.png",
    "assets/categoryImage/inject.jpg",
    "assets/categoryImage/intravenous.jpg",
    "assets/categoryImage/vacc.jpg",
    "assets/categoryImage/ster.jpg",
    "assets/categoryImage/other.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: ListView.builder(
                itemCount: min(categoryNames.length, categoryImages.length),
                itemBuilder: (context, index) {
                  return CategoryCard(
                      images2: categoryImages,
                      categoryNames: categoryNames,
                      index: index);
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
