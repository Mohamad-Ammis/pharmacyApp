import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/models/product.dart';
import 'package:pharmacy/widgets/custom_button.dart';

class ShowProductPage extends StatefulWidget {
  const ShowProductPage({super.key});

  @override
  State<ShowProductPage> createState() => _ShowProductPageState();
  
}

class _ShowProductPageState extends State<ShowProductPage> {
  late final Product product;
  @override
  void initState() {
    super.initState();
  product =Get.arguments;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Show Product',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 20,
                        spreadRadius: 5,
                        color: Colors.blueGrey)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              width: 450,
              height: 450,
              child: Image.asset(
                'assets/images/43.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 400,
              height: 450,
              decoration: const BoxDecoration(
                color: Color(0xff31525B),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 5,
                      color: Colors.blueGrey)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.brandName!,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          r'$' '${product.price!}',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About This Product",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        TextFormField(
                          initialValue:
                              "Scientific Name : ${product.scientificName!} \nScientific Name Ar: ${product.scientificNameAr!} \nBrand Name : ${product.brandName!} \nBrand Name Ar: ${product.brandNameAr!} \nCategory : ${product.category!} \nPrice : \$${product.price!} \nDescription : ${product.description!} \n      ",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                          readOnly: true,
                          maxLines: 9,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                    Spacer(),
                    Center(child: CustomButton(buttonText: 'Edit', isLoading: false,color: Colors.white,width: 250,textColor:Colors.black,)),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
