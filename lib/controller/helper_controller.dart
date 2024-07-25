import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/controller/home_pages_controllers/getAllProducts.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:get/get.dart';

class HelperController extends GetxController {
  Map<int,bool>favProducts={};
  final controller =Get.put(GetAllProducts());
  void initFavProducts()async{
    dynamic data=await controller.getAllProducts(token!);
    data=data['products'];
    List<Product> products=[];
    for (var i = 0; i < data.length; i++) {
      products.add(Product.fromJson(data[i]));
    }
    for (var i = 0; i < products.length; i++) {
      favProducts.addAll({products[i].id!:products[i].isFavorite!});
    }
    print(favProducts);
  }

  Color favoriteIconColor = Colors.black;
  bool isFavorited = false;
  bool changeFavoriteIconColor(int counter) {
    if (counter.isOdd) {
      favoriteIconColor = Colors.black;
      update();
      return false;
    } else {
      favoriteIconColor = Colors.red;
      update();
      return true;
    }
  }
}
