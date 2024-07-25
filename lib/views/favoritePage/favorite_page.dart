import 'package:flutter/material.dart';
import 'package:flutter_application_2/NewHomePage/Components/home_page_card.dart';
import 'package:flutter_application_2/controller/FavoritePage/favorite_controllers.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/views/favoritePage/empty_favorite_body.dart';
import 'package:flutter_application_2/views/showProduct/show_product.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../constans.dart';
import '../../widgets/custom_card/custom_card.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final controller = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kSecondryColor,
          title: const Text('Favorites'),
          centerTitle: true,
      ),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: kSecondryColor,
                  ),
                ),
              )
            ],
          ),
          GetBuilder<FavoriteController>(builder: (controller){

          return
              FutureBuilder<dynamic>(
                future:controller.getFavoriteProducts(token!) 
              , builder: (context,snapshot){
                if(snapshot.hasData){
                dynamic products=snapshot.data['products'];
                  return GetBuilder<FavoriteController>(builder: (controller) {
                  return products.length==0 ?EmptyFavoriteBody(): ListView.builder(
                      itemCount: products.length ,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(ShowProduct(
                              product: Product.fromJsonFav(products[index]),
                            ));
                          },
                          
                           child: CustomCard(product: Product.fromJsonFav(products[index],), suffixIcon: IconButton(onPressed: ()async{
                            await controller.handleFavoritesProduct(
                                          Product.fromJsonFav(
                                            products[index],
                                          ).id!,  token!);
                                          controller.update();
                           }, icon: Icon(Icons.favorite,color: Colors.red,)), isOrder: false,
                        ));
                      });
                         }
                         );}
                else{
                  return Center(child: Lottie.asset("assets/lottie/loading_hand.json"));
                }
              }
              
              );
          })
              
        ],
      ),
    );
  }
}
