
import 'package:flutter/material.dart';
import 'package:w_store/data/product.dart';
import 'package:w_store/screens/productPage_screen.dart';
import 'package:w_store/shared/colors.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  ProductItem({Key key, this.product}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  Product model;
  @override
  void initState() {
    model = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductPageScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.background,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xfff8f8f8), 
              blurRadius: 15, 
              spreadRadius: 10
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 0),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(model.isliked ? Icons.favorite : Icons.favorite_border, color: model.isliked ? CustomColors.red : CustomColors.iconColor,),
                onPressed: (){
                  setState(() {
                    model.isliked = !model.isliked ;
                  });
                }
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 15),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 37,
                      backgroundColor: CustomColors.orange.withAlpha(40),
                    ),
                    Image.asset(
                      model.image,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                // SizedBox(height: 5),
                Text(
                  model.name,
                  style: TextStyle(
                    fontSize: 15,
                    
                  ),
                ),
                Text(
                  model.category,
                  style: TextStyle(
                    fontSize: 13,
                    color: CustomColors.subTitleTextColor,
                  ),
                ),
                Text(
                  '${model.price.toInt()} FCFA',
                  style: TextStyle(
                    fontSize: 12.3,
                    color: CustomColors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
