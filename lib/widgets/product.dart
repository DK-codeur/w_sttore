import 'package:flutter/material.dart';
import 'package:w_store/data/datas.dart';
import 'package:w_store/widgets/product_item.dart';

class Product extends StatelessWidget {
  const Product({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height:  230,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 4 / 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10
            ),
            // padding: EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            children: Datas.productList.map((product) => ProductItem(
              product: product,
            )).toList()
        ),
      ),
    );
  }
  }
