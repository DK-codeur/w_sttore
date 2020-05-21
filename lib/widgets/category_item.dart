import 'package:flutter/material.dart';
import 'package:w_store/shared/colors.dart';

class CategoryItem extends StatelessWidget {

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10,),
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: CustomColors.background,
        border: Border.all(
            color:CustomColors.orange,
            width: 2 
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xfffbf2ef),
             blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(5,5)
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/jacket.png'),
          Container(
            child: Text(
              'Jacket',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}