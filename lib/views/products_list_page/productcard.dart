import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/constans.dart';
import 'package:pharmacy/controller/homepage/delete_prod.dart';
import 'package:pharmacy/controller/homepage/get_all_products.dart';
import 'package:pharmacy/models/product.dart';
import 'package:pharmacy/views/products_list_page/product_list.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final cont=Get.put(GetAllProducts());
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(0.7))
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 180,
            height: 200,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.7))
            ]),
            clipBehavior: Clip.hardEdge,
            child:widget.product.image!=null? Image.network(
              '${kImageUrl}${widget.product.image}',
              fit: BoxFit.fill,
            ):Image.asset('assets/images/43.jpg',
                    fit: BoxFit.fill,
                  ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            width: 150,
            height: 200,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.7))
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 70,
                          child: Text(
                            widget.product.brandName!,
                            style: TextStyle(
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Stock = ${widget.product.stock!}",
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ],
                    ),
                    IconButton(onPressed:(

                    )async{
                     await  DeleteProduct().deleteProduct(kTokenTest, widget.product.id.toString());
                      cont.products!.remove(widget.product);
                      cont.update();
                    },icon: Icon(Icons.delete_forever, color: Colors.red),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r"$" '${widget.product.price!}',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100)),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/ShowProduct', arguments: widget.product);
                        },
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
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
