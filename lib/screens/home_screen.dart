import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:w_store/shared/colors.dart';
import 'package:w_store/shared/my_flutter_app.dart';
import 'package:w_store/widgets/category_item.dart';
import 'package:w_store/widgets/main_drawer.dart';
import 'package:w_store/widgets/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff7f7f7),
        leading: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: RotatedBox(
              quarterTurns: 4,
              child: IconButton(
                icon : Icon(Icons.sort, color: Colors.black54,), 
                onPressed: () {
                  _keyScaffold.currentState.openEndDrawer();
                },
              ),
          ),
        ),

        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'W',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: CustomColors.orange,
                  fontWeight: FontWeight.w700,
                  fontSize: 21.0
                )
              ),
              TextSpan(
                text: '-store ',
                style: TextStyle(
                  fontFamily: 'CenturyGhotic',
                  letterSpacing: 1.8,
                  color: CustomColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                )
              )
            ]
          )
        ),
        centerTitle: true,

        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon : Icon(MyFlutterApp.shopping_bag, color: Colors.black54),
          )
        ],

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(38.0),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.8,            
                  decoration: BoxDecoration(
                    color: CustomColors.lightGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),

                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 12),
                      Icon(Icons.search),
                      SizedBox(width: 12),
                      Text(
                        'Rechercher...',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          // color: whiteColor,
                          fontSize: 12.8,
                          letterSpacing: 1.5
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
          ),
        ),
      ),

      endDrawer: MainDrawer(),

      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container( //Caroussel
              height: 170.0,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
              alignment: Alignment.center,
              child: new ClipRRect(
                borderRadius: new BorderRadius.circular(11.0),
                child: Carousel(
                  images: [
                    AssetImage('assets/images/slide-1.jpg'),
                    AssetImage('assets/images/slide-2.jpg'),
                    AssetImage('assets/images/slide-6.jpg'),
                    // ExactAssetImage("assets/images/LaunchImage.jpg")
                  ],
                  
                  animationCurve: Curves.linearToEaseOut,
                  autoplayDuration: const Duration(seconds: 6),
                  animationDuration: const Duration(milliseconds: 800),
                  dotPosition: DotPosition.bottomCenter,
                  dotIncreasedColor: Colors.white60,
                  dotColor: CustomColors.grey,
                  dotVerticalPadding: 25.0,
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  borderRadius: false,
                ),
              ),
            ),

            new Container(
              height: 35,
              margin: EdgeInsets.symmetric(horizontal: 7.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 246, 247, 1),
                borderRadius: BorderRadius.circular(7.0)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      'Hot Category',
                      style: TextStyle(
                        fontFamily: 'CenturyGhotic',
                        color: CustomColors.lightblack,
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                      )
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: CustomColors.lightblack,),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                  CategoryItem(),
                ],
              ),
            ),

            new Container(
              height: 35,
              margin: EdgeInsets.symmetric(horizontal: 7.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 246, 247, 1),
                borderRadius: BorderRadius.circular(7.0)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      'Hot Product',
                      style: TextStyle(
                        fontFamily: 'CenturyGhotic',
                        color: CustomColors.lightblack,
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                      )
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: CustomColors.lightblack,),
                  ],
                ),
              ),
            ),

            Product()

          ],
        )
      ),
    );
  }
}