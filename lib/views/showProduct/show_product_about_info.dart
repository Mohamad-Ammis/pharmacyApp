import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:get/get.dart';

class ShowProductAboutInfo extends StatelessWidget {
  const ShowProductAboutInfo({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About".tr,
            style: const TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          TextFormField(
            scrollPadding: const EdgeInsets.all(0),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            maxLines: 5,
            initialValue:
                "${product.description}\nScientific Name=${product.scientificName}\nBrand Name=${product.brandName}\nStock=${product.stock}\nManfacture Name=${product.manufacturer}\nPrice=${product.price}  ",
            readOnly: true,
            style: const TextStyle(
              color: Color.fromARGB(255, 146, 146, 146),
            ),
          )
        ],
      ),
    );
  }
}
