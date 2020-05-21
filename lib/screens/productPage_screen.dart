import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/material.dart';
import '../shared/colors.dart';
import '../shared/helpers.dart';

class ProductPageScreen extends StatefulWidget {
  ProductPageScreen({Key key}) : super(key: key);

  static const routeName = '/productPage';

  @override
  _ProductPageScreenState createState() => _ProductPageScreenState();
}

class _ProductPageScreenState extends State<ProductPageScreen> with TickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;
  int quantity = 1;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));

    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: animation.value,
                    child: child,
                  );
                },

                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container( // image
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromRGBO(242, 242, 242, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      ),
                      height: MediaQuery.of(context).size.height / 2.2,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/shooe_tilt_1.png'
                      )
                    ),

                    Container( //appBar
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: iconStyle(
                              Icons.arrow_back_ios,
                                color: Colors.black54, 
                                size: 15, padding: 12, 
                            ),
                          ),

                          InkWell(
                            onTap: () {},
                            child: iconStyle(Icons.favorite_border,
                              color: CustomColors.red,
                              size: 15,
                              padding: 12,
                            ),
                          )

                        ],
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 10,),

              Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "NIKE AIR MAX 1", 
                      style: TextStyle(
                        fontSize: 25,
                        // fontFamily: 'CenturyGhotic',
                        color: CustomColors.black.withAlpha(180),
                        fontWeight: FontWeight.w800
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.star,
                                color: CustomColors.yellowColor, size: 17),
                            Icon(Icons.star,
                                color: CustomColors.yellowColor, size: 17),
                            Icon(Icons.star,
                                color: CustomColors.yellowColor, size: 17),
                            Icon(Icons.star,
                                color: CustomColors.yellowColor, size: 17),
                            Icon(Icons.star_border, size: 17),
                          ],
                        ),
                        new SizedBox(height: 8.0,),

                        Row(
                          children: <Widget>[
                            Text(
                              "1000",
                              style: TextStyle(
                                fontSize: 25,
                                color: CustomColors.red
                              ),
                            ),
                            Text(
                              " FCFA",
                              style: TextStyle(
                                fontSize: 15,
                                
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                    new SizedBox(height: 15.0),

                    new Divider(indent: 5,),

                    new SizedBox(height: 20.0),

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          '- Quantité -',
                          style: TextStyle(
                            fontFamily: 'CenturyGhotic',
                          ),
                        ),
                      ],
                    ),

                    new SizedBox(height: 20.0),

                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          
                          Container(
                            width: 55,
                            height: 55,
                            child: OutlineButton(
                              onPressed: () {
                                setState(() {
                                  if(quantity == 1) return; //no decre if qte ==1
                                  quantity -= 1; 
                                });
                              },
                              child: Icon(Icons.remove),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              quantity.toString(), 
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.orange
                              )
                            ), //print qte val
                          ),

                          Container(
                            width: 55,
                            height: 55,
                            child: OutlineButton(
                              onPressed: () {
                                setState(() {
                                  quantity += 1;
                                });
                              },
                              child: Icon(Icons.add),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15)
                                )
                              ),
                            ),
                          ),

                          
                        ],
                      )
                    ),

                    new SizedBox(height: 20.0),
                    Divider(),
                    new SizedBox(height: 20.0),

                    Text(
                      'Plus d\'info.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'CenturyGhotic',
                        fontWeight: FontWeight.w700,
                        color: CustomColors.darkgrey
                      ),
                    ),
                    new SizedBox(height: 20.0),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          colorWidget(CustomColors.yellowColor, isSelected: true),
                          SizedBox(
                            width: 30,
                          ),
                          colorWidget(CustomColors.lightBlue),
                          SizedBox(
                            width: 30,
                          ),
                          colorWidget(CustomColors.black),
                          SizedBox(
                            width: 30,
                          ),
                          colorWidget(CustomColors.red),
                          SizedBox(
                            width: 30,
                          ),
                          colorWidget(CustomColors.skyBlue),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 60.0, left: 8.0),
                      child: Text(
                        "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'CenturyGhothic',
                          color: CustomColors.lightblack
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          EdgeAlert.show(
            context, 
            title: 'Succès', 
            description: 'Ajouter au panier avec succes !',  
            backgroundColor: Colors.green, duration: 2
          );
        },
        tooltip: 'Ajouter au panier',
        elevation: 25,
        backgroundColor: CustomColors.orange,
        child: Icon(
          Icons.add_shopping_cart
        )
      ),
    );
  }

  // Fut

}