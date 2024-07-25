import 'package:flutter/material.dart';
import 'package:flutter_application_2/NewHomePage/Components/home_page_card.dart';
import 'package:flutter_application_2/NewHomePage/view_all_page.dart';
import 'package:flutter_application_2/constans.dart';
import 'package:flutter_application_2/controller/FavoritePage/favorite_controllers.dart';
import 'package:flutter_application_2/controller/helper_controller.dart';
import 'package:flutter_application_2/controller/home_pages_controllers/getAllProducts.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MostCommonList extends StatefulWidget {
  final String? type;
  MostCommonList({required this.type, super.key});

  @override
  State<MostCommonList> createState() => _MostCommonListState();
}

class _MostCommonListState extends State<MostCommonList> {
  
  final controller = Get.put(HelperController());
  final getcontroller = Get.put(GetAllProducts());
Stream<dynamic> productsStream() async* {
    
      while(true){
      print('before recall the stream');
        await Future.delayed(Duration(milliseconds: 500));
      dynamic data = await getcontroller.getAllProducts( token!);
      print(' recall the stream done');
      yield data;
    
      }
  }
Stream<dynamic> mostCommonProductsStream() async* {
    while (!FavoriteController().hasListeners) {
      await Future.delayed(Duration(milliseconds: 500));
      print('before recall the stream');
      dynamic data =await  getcontroller.getMostCommonProducts( token!);
      print(' recall the stream done');
      yield data;
    }
  }
  late bool nullableData = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future:
         widget.type=="All Products"
              ? getcontroller.getAllProducts(
     token!)
              : getcontroller.getMostCommonProducts(
                  token!) ,
        builder: ((context, snapshot) {
          
          if (snapshot.hasData) {
  dynamic products = snapshot.data!['products'];
  print('insnap');
  print(snapshot.data);
  return snapshot.hasData
      ? Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      widget.type!,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewAll(
                                products: products,
                                nullableData: nullableData,
                                isCategory: false,
                                appBarTitle: widget.type ?? 'All Products',
                              )));
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 18,
                          //letterSpacing: 1.3,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //list of HomePageCard
            
            
                    SizedBox(
                                 height: MediaQuery.of(context).size.height * 0.32,
                                 width: MediaQuery.of(context).size.width,
                                 child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: ((context, index) => HomePageCard(
                            product: Product.fromJson(products[index]),
                          ))),
                               )
                 
               
            
          ],
        )
      : Container();
}
else{
  return Padding(
    padding: const EdgeInsets.all(80.0),
    child: Center(child:Lottie.asset("assets/lottie/loading_hand.json")),
  );
}
        }));
  }
}