import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/FavoritePage/favorite_controllers.dart';
import 'package:flutter_application_2/controller/helper_controller.dart';
import 'package:flutter_application_2/controller/cartPageController/cart_controller.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:get/get.dart';

import '../../helper/cart_bottom_sheet.dart';
import '../../main.dart';
import '../../widgets/custom_button.dart';

class ShowProductCartAndFavButtons extends StatefulWidget {
  const ShowProductCartAndFavButtons({super.key, required this.product});
  final Product product;

  @override
  State<ShowProductCartAndFavButtons> createState() =>
      _ShowProductCartAndFavButtonsState();
}

class _ShowProductCartAndFavButtonsState
    extends State<ShowProductCartAndFavButtons> {
  bool ispressed = false;

  final controller = Get.put(HelperController());
  final favController = Get.put(FavoriteController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    ispressed = widget.product.isFavorite ?? false;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: const Color(0xffD8DDEB)),
                  borderRadius: BorderRadius.circular(24)),
              child: IconButton(
                  onPressed: () async {
              ;
                  },
                  icon: !ispressed
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ))),
          CustomButton(
            onTap: () {
              if (!cartProducts.contains(widget.product)) {
                cartProducts.add(widget.product);
              }
              addToCartBottomSheet(context, cartProducts);

              // print(fetchData());
            },
            buttonText: 'AddToCart'.tr,
            isLoading: false,
            width: MediaQuery.of(context).size.width / 1.5,
            color: Colors.black,
            borderRadius: 18,
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
