import 'package:flutter/material.dart';
import 'package:flutter_application_2/NewHomePage/Components/home_page_card.dart';
import 'package:flutter_application_2/controller/FavoritePage/favorite_controllers.dart';
import 'package:flutter_application_2/controller/home_pages_controllers/getAllProducts.dart';
import 'package:flutter_application_2/models/product.dart';
import'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ViewAll extends StatefulWidget {
  ViewAll(
      {super.key,
      required this.products,
      required this.nullableData,
      required this.isCategory,
      required this.appBarTitle});
  final bool nullableData;
  final bool isCategory;
  final dynamic products;
  final String appBarTitle;
  @override
  State<ViewAll> createState() => _ViewAllState();
  List<bool> selectedCategory = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> apiCategory = [
    'oral_use',
    'external_use',
    'injectable',
    'Intravenous_fluids',
    'vaccines_and_serums',
    'sterilizers',
    'other'
  ];
  List<String> selectedApiCategory = [];
  bool isSelected = false;
}

class _ViewAllState extends State<ViewAll> {
  List<Product> filterList = [];
  bool emptySearch = false;
  bool showFilter = false;
  int counter = 0;
  List<String> category = [
    'Oral Use',
    'External Use',
    'Injectable',
    'Intravenous Fluids',
    'Vaccines & Serums',
    'Sterilizers',
    'Other'
  ];
  final controller = Get.put(GetAllProducts());
  //final favoriteController=Get.lazyPut(()=>FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(widget.appBarTitle),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/cartpage');
              },
              icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // search bar
          Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(left: 10, right: 40, top: 0, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    margin: EdgeInsets.only(left: 30, top: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey, width: 0.2)),
                    child: TextField(
                      onChanged: (data) {
                        filterList = [];
                        //add specified items to list
                        if (widget.selectedApiCategory.isNotEmpty) {
                          for (var i = 0; i < widget.products.length; i++) {
                            if (widget.products[i]['brand_name']
                                    .toString()
                                    .toLowerCase()
                                    .contains(data.toLowerCase()) &&
                                widget.selectedApiCategory.contains(widget
                                    .products[i]['category']['category_name']
                                    .toString())) {
                              filterList
                                  .add(Product.fromJson(widget.products[i]));
                              emptySearch = false;
                            }
                            if (filterList.isEmpty) {
                              emptySearch = true;
                            }
                          }
                        } else {
                          for (var i = 0; i < widget.products.length; i++) {
                            if (widget.products[i]['brand_name']
                                .toString()
                                .toLowerCase()
                                .contains(data.toLowerCase())) {
                              filterList
                                  .add(Product.fromJson(widget.products[i]));
                              emptySearch = false;
                            }
                            if (filterList.isEmpty) {
                              emptySearch = true;
                            }
                          }
                        }
                        setState(() {});
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.2)),
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: widget.isCategory == false
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              if (counter.isEven) {
                                showFilter = true;
                              } else {
                                showFilter = false;
                              }
                              counter++;
                            });
                          },
                          icon: const Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ))
                      : Container(),
                )
              ],
            ),
          ),
          showFilter
              ? Container(
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChoiceChip(
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            backgroundColor: Colors.black,
                            selectedColor: Colors.black,
                            checkmarkColor: Colors.white,
                            label: Text(category[index]),
                            selected: widget.selectedCategory[index],
                            onSelected: (value) {
                              setState(() {
                                widget.selectedCategory[index] = value;
                                if (value) {
                                  widget.selectedApiCategory
                                      .add(widget.apiCategory[index]);
                                } else {
                                  widget.selectedApiCategory
                                      .remove(widget.apiCategory[index]);
                                }
                                filterList = [];
                                //add specified items to list
                                if (widget.selectedApiCategory.isNotEmpty) {
                                  for (var i = 0;
                                      i < widget.products.length;
                                      i++) {
                                    if (widget.selectedApiCategory.contains(
                                        widget.products[i]['category']['category_name']
                                            .toString())) {
                                      filterList.add(
                                          Product.fromJson(widget.products[i]));
                                      emptySearch = false;
                                    }
                                    if (filterList.isEmpty) {
                                      emptySearch = true;
                                    }
                                  }
                                }
                                setState(() {});
                              });
                            },
                          ),
                        );
                      }),
                )
              : Container(),
          widget.nullableData
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top:80.0),
                    child: Column(
                      children: [
                        Center(child: Lottie.asset('assets/lottie/boo.json')),
                        Text('This Category is Empty Check it later')
                      ],
                    ),
                  ))
              : Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: emptySearch
                                ? Padding(
                                  padding: const EdgeInsets.only(top:70.0),
                                  child: Column(
                                    children: [
                                      Center(child: Lottie.asset('assets/lottie/search.json')),
                                      Text('No Result to Show')
                                    ],
                                  ),
                                )
                                : filterList.isEmpty
                                    ? GridView.custom(
                                        gridDelegate:
                                            SliverWovenGridDelegate.count(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 0,
                                          crossAxisSpacing: 0,
                                          pattern: const [
                                            WovenGridTile(0.60),
                                            WovenGridTile(
                                              5 / 7,
                                              crossAxisRatio: 1,
                                              alignment:
                                                  AlignmentDirectional.center,
                                            ),
                                          ],
                                        ),
                                        childrenDelegate:
                                            SliverChildBuilderDelegate(
                                                childCount: widget
                                                    .products.length as int,
                                                (context, index) => GridTile(
                                                      child: HomePageCard(
                                                        product:
                                                            Product.fromJson(
                                                                widget.products[
                                                                    index]),
                                                      ),
                                                    )),
                                      )
                                    : GridView.custom(
                                        gridDelegate:
                                            SliverWovenGridDelegate.count(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 0,
                                          crossAxisSpacing: 0,
                                          pattern: const [
                                            WovenGridTile(0.60),
                                            WovenGridTile(
                                              5 / 7,
                                              crossAxisRatio: 1,
                                              alignment:
                                                  AlignmentDirectional.center,
                                            ),
                                          ],
                                        ),
                                        childrenDelegate:
                                            SliverChildBuilderDelegate(
                                                childCount: filterList.length,
                                                (context, index) => GridTile(
                                                      child: HomePageCard(
                                                        product:
                                                            filterList[index],
                                                      ),
                                                    )),
                                      )),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

// // all thing we write in search field is stored in query by default
// class CustomSearch extends SearchDelegate {
//   CustomSearch(this.productsData);
//   final dynamic productsData;
//   List<Product> resultList = [];
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: Icon(Icons.close))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, null);
//         },
//         icon: Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return resultList.length == 0
//         ? Center(
//             child: Text("Enter Name You Need to Search"),
//           )
//         : Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: GridView.custom(
//               gridDelegate: SliverWovenGridDelegate.count(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 0,
//                 crossAxisSpacing: 0,
//                 pattern: [
//                   WovenGridTile(0.60),
//                   WovenGridTile(
//                     5 / 7,
//                     crossAxisRatio: 1,
//                     alignment: AlignmentDirectional.center,
//                   ),
//                 ],
//               ),
//               childrenDelegate: SliverChildBuilderDelegate(
//                   childCount: resultList.length,
//                   (context, index) => GridTile(
//                         child: HomePageCard(
//                           product: resultList[index],
//                         ),
//                       )),
//             ),
//           );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<Product> allProductList = [];
// //get the product to list to handle it easiest
//     for (var i = 0; i < productsData.length; i++) {
//       allProductList.add(Product.fromJson(productsData[i]));
//     }
//     //show all if query is empty
//     if (query == '') {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: GridView.custom(
//           gridDelegate: SliverWovenGridDelegate.count(
//             crossAxisCount: 2,
//             mainAxisSpacing: 0,
//             crossAxisSpacing: 0,
//             pattern: [
//               WovenGridTile(0.60),
//               WovenGridTile(
//                 5 / 7,
//                 crossAxisRatio: 1,
//                 alignment: AlignmentDirectional.center,
//               ),
//             ],
//           ),
//           childrenDelegate: SliverChildBuilderDelegate(
//               childCount: productsData.length as int,
//               (context, index) => GridTile(
//                     child: HomePageCard(
//                       product: Product.fromJson(productsData[index]),
//                     ),
//                   )),
//         ),
//       );
//     }
// //show what u search
//     else {
//       //list which contains the seach items
//       List<Product> filterList = [];
//       //add specified items to list
//       for (var i = 0; i < allProductList.length; i++) {
//         if (allProductList[i]
//             .brandName
//             .toString()
//             .toLowerCase()
//             .contains(query.toLowerCase())) {
//           filterList.add(allProductList[i]);
//         }
//       }
//       resultList = filterList;
//       //show the filtered item
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: GridView.custom(
//           gridDelegate: SliverWovenGridDelegate.count(
//             crossAxisCount: 2,
//             mainAxisSpacing: 0,
//             crossAxisSpacing: 0,
//             pattern: [
//               WovenGridTile(0.60),
//               WovenGridTile(
//                 5 / 7,
//                 crossAxisRatio: 1,
//                 alignment: AlignmentDirectional.center,
//               ),
//             ],
//           ),
//           childrenDelegate: SliverChildBuilderDelegate(
//               childCount: filterList.length,
//               (context, index) => GridTile(
//                     child: HomePageCard(
//                       product: filterList[index],
//                     ),
//                   )),
//         ),
//       );
//     }
//   }
// }
