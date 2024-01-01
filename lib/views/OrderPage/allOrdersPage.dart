import 'package:flutter/material.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/views/orderpage/OrderCard.dart';

class AllOrderPage extends StatefulWidget {
  AllOrderPage({super.key});

  @override
  State<AllOrderPage> createState() => _AllOrderPageState();
}

class _AllOrderPageState extends State<AllOrderPage> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.red,
        padding: EdgeInsets.fromLTRB(10, 12, 5, 8),
        child: Expanded(
          child: Container(
            // color: Colors.blue,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Orders",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Container(
                      
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: kMainColor)),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 12),
                        Text("Customer Name"),
                        Spacer(),
                        Text("Order Number"),
                        Spacer(),
                        Text("Amount"),
                        Spacer(),
                        Text("Date"),
                        Spacer(),
                        Text("Status"),
                        Spacer(),
                        Text("Paiement"),
                        Spacer(),
                        Container(
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Expanded(child: OrderCard()),
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
