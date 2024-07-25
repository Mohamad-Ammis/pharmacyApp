import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';

class CustomCardInfo extends StatelessWidget {
  const CustomCardInfo(
      {super.key,
      required this.product});
 final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //title
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  product.brandName??'',
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),

            //subtitle
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.07,
              child:product.stock!=null? Text(
                'Stock = ${product.stock}',
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ):product.quantity!=null?
              Text(
                'Quantity = ${product.quantity}',
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontSize: 12,
                ),
            ):const Text('')
            )
          ],
        ),
             Container(
                padding: const EdgeInsets.only(bottom: 8),
                width: MediaQuery.of(context).size.width * 0.5,
                //height: MediaQuery.of(context).size.width * 0.13,
                child: Text(
                  r'Price = $''${product.price}',
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            //: Container(),
      ],
    );
  }
}
