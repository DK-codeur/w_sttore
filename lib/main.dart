import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:w_store/screens/productPage_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

import './screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  SystemChrome.setSystemUIOverlayStyle( 
    SystemUiOverlayStyle(
      statusBarColor: Colors.white
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'W-store',
      theme: ThemeData(
        primaryColor: Colors.white,
        // textTheme: GoogleFonts.robotoCondensedTextTheme(
        //   Theme.of(context).textTheme,
        // ),
      ),
      home: HomeScreen(),
      routes: {
        ProductPageScreen.routeName: (_) => ProductPageScreen()
      },
      
    );
  }
}



