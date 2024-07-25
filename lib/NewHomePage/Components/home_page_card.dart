import 'package:flutter/material.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/controller/FavoritePage/favorite_controllers.dart';
import 'package:flutter_application_2/controller/home_pages_controllers/getAllProducts.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/views/CartScreen/CartItem.dart';
import 'package:flutter_application_2/views/showProduct/show_product.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePageCard extends StatefulWidget {
  HomePageCard({super.key, required this.product});
  final Product product;

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  int counter = 0;
  late bool ispressed;
  final favoriteController = Get.put(FavoriteController());
  @override
  void initState() {
    super.initState();
        ispressed = widget.product.isFavorite!;
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
        init: FavoriteController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            //card
            child: GestureDetector(
              onTap: () {
                Get.to(
                  ShowProduct(
                    product: widget.product,
                  ),
                );
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                //height: MediaQuery.of(context).size.height * 0.21,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 1.5,
                      blurRadius: 8,
                      offset: Offset(1, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    //card image
                    Expanded(
                      // height: MediaQuery.of(context).size.height * 0.28,
                      // width: MediaQuery.of(context).size.width * 0.52,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          child: widget.product.image!=null? Image.network(
              '${kImageUrl}${widget.product.image}',
              fit: BoxFit.fill,
            ):Image.asset('assets/images/pillsone.png',
                    fit: BoxFit.fill,
                    width: 180,
                  ),
                        ),
                      ),
                    ),

                    ///info
                    Padding(
                      padding: const EdgeInsets.only(top: 6, left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            //width: MediaQuery.of(context).size.width * 0.42 - 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.product.brandName.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  widget.product.category.toString(),
                                  style: TextStyle(fontSize: 7.5),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                r'$' +
                                    widget.product.price
                                        .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () async {

                                      print('sdfkdfkldsf $ispressed');
                                      await controller.handleFavoritesProduct(
                                          widget.product.id!, token!);
                                      // if(ispressed==false){
                                      //   ispressed=true;
                                      // }
                                      // else{
                                      //   ispressed=false;
                                      // }
                                      ispressed=await controller.isFavoritesProduct(widget.product.id!, token!);
                                      print('sdfkdfkldsf $ispressed');
                                      setState(() {
                                      });
                                    },
                                    child: 
                                    //print(ispressed);
                                        !ispressed
                                          ? Icon(
                                              Icons.favorite_outline_rounded,
                                              color: Colors.black,
                                            )
                                          : Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )
                                    
                                    
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
