import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/widgets/custom_card/custom_card.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';

void addToCartBottomSheet(BuildContext context,List<Product>product) {
  Get.bottomSheet(DraggableScrollableSheet(
          initialChildSize: 1.0,
          builder: (context, scrollController) {
            return Container(
                height: 400,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  color: Color.fromARGB(255, 223, 223, 223),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: ListView.builder(
                              controller: scrollController,
                              itemCount: product.length,
                              itemBuilder: (context, index) {
                                return CustomCard(product: product[index], suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined)), isOrder: false,);
                                // return CustomCard(
                                //   img: Image.asset(
                                //     'assets/images/pillsone.png',
                                //     fit: BoxFit.fill,
                                //   ),
                                //   desc: 'Stock = 2003\nAnyThing : AnyThing',
                                //   productName: 'Ammis Vitamin',
                                //   icon: IconButton(
                                //     onPressed: () {},
                                //     icon: Icon(
                                //       Icons.shopping_cart_outlined,
                                //       color: Colors.black,
                                //     ),
                                //   ),
                                //   imgColor: kSecondryColor,
                                //   price: '',
                                //   hasStock: false,
                                //   hasPrice: false,
                                // );
                              })),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 16, left: 8, right: 8),
                      child: CustomButton(
                        color: Colors.black,
                        onTap: () {
                          Get.toNamed('/cartpage');
                        },
                        width: MediaQuery.of(context).size.width,
                        buttonText: 'Check Out',
                        isLoading: false,
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    )
                  ],
                ));
          })
      // enterBottomSheetDuration: const Duration(milliseconds: 300),
      // exitBottomSheetDuration: const Duration(milliseconds: 300),

      // ));
      );
}
