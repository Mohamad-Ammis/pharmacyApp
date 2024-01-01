
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/views/orderpage/detailsBody.dart';
import 'package:pharmacy/views/orderpage/dividerr.dart';

class OrderCard extends StatefulWidget {
  OrderCard({
    super.key,
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool submit = false;
  bool onPress = false;
  String paid = 'Unpaid';
  String Status = 'Preparing';
  String apiStatus = 'Preparing';
  String apiPayment = 'Unpaid';
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Expanded(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 12),
                    Container(width: 150, child: Text("Ahmad")),
                    SizedBox(width: 80),
                    Container(width: 150, child: Text("4332")),
                    SizedBox(width: 60),
                    Container(width: 150, child: Text("\$7890}")),
                    SizedBox(width: 25),
                    Container(width: 130, child: Text("28/1/2024")),
                    SizedBox(width: 10),
                    Container(
                        width: 135,
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (Status == 'Preparing') {
                                  Status = 'Sent';
                                  apiStatus = 'Sent';
                                  submit = true;
                                } else if (Status == 'Sent' &&
                                    submit == false) {
                                  Status = 'Received';
                                  apiStatus = 'Received';
                                  submit = true;
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text(Status),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                          // DropdownButton(
                          //   dropdownColor: Color.fromARGB(255, 221, 208, 249),
                          //   focusColor: Color.fromRGBO(255, 255, 255, 0.5),
                          //   elevation: 0,
                          //   // icon: Visibility(
                          //   //     visible: true,
                          //   //     child: Icon(Icons.arrow_downward)),
                          //   underline: SizedBox(),
                          //   borderRadius: BorderRadius.circular(8),
                          //   value: stateChoose,
                          //   onChanged: (newValue) {
                          //     setState(() {
                          //       stateChoose = newValue as String;

                          //       submit = true;
                          //     });
                          //   },
                          //   items: listState.map((valueItem) {
                          //     return DropdownMenuItem(
                          //       value: valueItem,
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(left: 10),
                          //         child: Text(valueItem),
                          //       ),
                          //     );
                          //   }).toList(),
                          // ),
                        )),
                    SizedBox(width: 28),
                    Container(
                        width: 150,
                        child: Container(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              if (paid == 'Unpaid') {
                                paid = 'Paid';
                                apiPayment = 'Paid';
                                // submit = true;
                              }
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                Text(
                                  paid,
                                  style: TextStyle(
                                      color: paid == 'Unpaid'
                                          ? Colors.red
                                          : Colors.green),
                                ),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        )
                           
                            )),
                    SizedBox(width: 20),
                    Container(
                      child: !submit
                          ? InkWell(
                              onTap: () {
                                Get.to(DetailsOrderBody());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.purple),
                                    borderRadius: BorderRadius.circular(8)),
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "View Details",
                                    style: TextStyle(color: Colors.purple),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  submit = !submit;
                                  print("${apiPayment}\n ${apiStatus}");
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 8),
                                child: Text(
                                  "Submit",
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              dividerr(),
            ],
          ),
        ),
      ),
    ));
  }
}
