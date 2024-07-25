import 'package:flutter/material.dart';
import 'package:flutter_application_2/NewHomePage/view_all_page.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/controller/home_pages_controllers/getAllProducts.dart';
import 'package:flutter_application_2/main.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    required this.images2,
    required this.categoryNames,
    required this.index,
  });

  final List images2;
  final List categoryNames;
  final int index;
  var gerCategoryProducrController = Get.put(GetAllProducts());
  final List<String> apiCategoriesNames = const [
    "oral_use",
    "external_use",
    "injectable",
    "Intravenous_fluids",
    "vaccines_and_serums",
    "sterilizers",
    "other"
  ];
  final List<String> viewAllNames = const [
    'Oral Use',
    'External Use',
    'Injectable',
    'Intravenous Fluids',
    'Vaccines & Serums',
    'Sterilizers',
    'Other'
  ];
  late bool nullableData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        dynamic data = await gerCategoryProducrController.getByCategory(
           token!,
            apiCategoriesNames[index]);
        dynamic categoryProducts = data['products'];
        categoryProducts == null ? nullableData = true : nullableData = false;
        Get.to(ViewAll(
          products: categoryProducts,
          nullableData: nullableData,
          isCategory: true,
          appBarTitle: viewAllNames[index],
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: MediaQuery.of(context).size.width * 0.155,
              height: MediaQuery.of(context).size.width * 0.155,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        images2[index],
                      ))),
            ),
            SizedBox(height: 4),
            Center(
                child: Text(categoryNames[index],
                    style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w500)))
          ],
        ),
      ),
    );
  }
}
