import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/orderpage/change_order_state.dart';
import 'package:pharmacy/controller/orderpage/getallOrders.dart';
import 'package:pharmacy/views/orderpage/detailsBody.dart';
import 'package:pharmacy/views/orderpage/dividerr.dart';

class OrderCard extends StatefulWidget {
  OrderCard({
    super.key,
    required this.Orderdata,
    required this .paid,
    required this .Status, required this.index
  });
  @override
  String paid;
    String Status;
  final dynamic Orderdata;
  final int index;
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool submit = false;
  bool onPress = false;
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
                    Container(
                        width: 150,
                        child:
                            Text(widget.Orderdata['user']['name'].toString())),
                    SizedBox(width: 80),
                    Container(
                        width: 150,
                        child: Text(widget.Orderdata['id'].toString())),
                    SizedBox(width: 60),
                    Container(
                        width: 150,
                        child:
                            Text(widget.Orderdata['bill']['total'].toString())),
                    SizedBox(width: 25),
                    Container(
                        width: 130,
                        child: Text(widget.Orderdata['created_at']
                            .toString()
                            .substring(0, 10))),
                    SizedBox(width: 10),
                    Container(
                        width: 135,
                        child: Container(
                          child: InkWell(
                            onTap: () async{
                              setState(() {
                                if (widget.Status == 'pending') {
                                  widget.Status = 'sent';
                                  apiStatus = 'sent';
                                  submit = true;
                                } else if (widget.Status == 'sent' &&
                                    submit == false) {
                                  widget.Status = 'received';
                                  apiStatus = 'received';
                                  submit = true;
                                }
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text(widget.Status),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                        )),
                    SizedBox(width: 28),
                    Container(
                        width: 150,
                        child: Container(
                            child: InkWell(
                          onTap: () {
                              if (widget.paid == 'Unpaid') {
                              
                                ChangeOrderState().payOrder(kTokenTest,
                                  widget.Orderdata['id'].toString());
                              
                              }
                            setState(() {
                              if (widget.paid == 'Unpaid') {
                                widget.paid = 'Paid';
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
                                  widget.paid,
                                  style: TextStyle(
                                      color: widget.paid == 'Unpaid'
                                          ? Colors.red
                                          : Colors.green),
                                ),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ))),
                    SizedBox(width: 20),
                    Container(
                      child: !submit
                          ? InkWell(
                              onTap: () {
                                Get.to(DetailsOrderBody(orderData:widget.Orderdata,i: widget.index,));
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
                              onTap: () async{
                                if(apiStatus=='sent'){
                                  await  ChangeOrderState().sendOrder(kTokenTest, widget.Orderdata['id'].toString());
                                }
                                else if(apiStatus=='received'){
                                  await  ChangeOrderState().receivedOrder(kTokenTest, widget.Orderdata['id'].toString());
                                }
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
