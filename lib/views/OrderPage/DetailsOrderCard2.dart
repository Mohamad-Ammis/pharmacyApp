import 'package:flutter/material.dart';

class DetailsOrderCard extends StatelessWidget {
  const DetailsOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 300,
      height: 350,
      // clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          //image
          Container(
            width: 300,
            height: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 0,
                      color: Colors.black.withOpacity(0.2))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Image.asset(
              'assets/images/item.png',
              fit: BoxFit.fill,
            ),
          ),
          //info
          Container(
            padding: EdgeInsets.all(8),
            height: 100,
            width: 300,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 0,
                  color: Colors.black.withOpacity(0.2))
            ], color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      " Vitamin",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$213",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity = 123",
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: Colors.white,
                            )))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pharmacy/constans.dart';

// import 'package:pharmacy/controller/details_order_controller.dart';

// class DetailsOrderCard extends StatelessWidget {
//   int index;
//   DetailsOrderCard({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(DetailsOrderController());
//     return Container(
//       height: 300,
//       width: double.infinity,

//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//               color: Colors.grey, blurRadius: 5, offset: const Offset(0, -1)),
//         ],
//         color: Color.fromARGB(255, 221, 210, 247),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Expanded(
//         child: Column(children: [
//           Container(
//             width: double.infinity,
//             height: 178,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10))),
//             child: Image.asset(
//               controller.listDetailsOrder[index].image,
//               fit: BoxFit.contain,
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             height: 59,
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10))),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(left: 12, bottom: 3, top: 6),
//                       child: Text(
//                         controller.listDetailsOrder[index].name,
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w300),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 10),
//                       child: Text(
//                           "Amount:  ${controller.listDetailsOrder[index].amount}"),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10, bottom: 8),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text("\$${controller.listDetailsOrder[index].price}"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ]),
//       ),
      // child: Row(
      //   children: [
      //     Expanded(
      //       flex: 2,
      //       child: Container(
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(10),
      //                 bottomLeft: Radius.circular(10))),
      //         child: Image.asset(
      //           controller.listDetailsOrder[index].image,
      //           fit: BoxFit.contain,
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       flex: 3,
      //       child: Container(
      //         padding: EdgeInsets.only(left: 6, right: 12),
      //         decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.only(
      //                 topRight: Radius.circular(10),
      //                 bottomRight: Radius.circular(10))),
      //         child: Column(
      //           children: [
      //             SizedBox(height: 12),
      //             Spacer(),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text("Name:"),
      //                 Text(controller.listDetailsOrder[index].name),
      //               ],
      //             ),

      //             Spacer(),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text("Amount:"),
      //                 Text("${controller.listDetailsOrder[index].amount}"),
      //               ],
      //             ),

      //             Spacer(),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text("Price:"),
      //                 Text("\$${controller.listDetailsOrder[index].price}"),
      //               ],
      //             ),
      //             Spacer(),
      //             SizedBox(height: 12),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
//     );
//   }
// }
