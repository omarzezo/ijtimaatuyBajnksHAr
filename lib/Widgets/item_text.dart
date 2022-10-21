import 'package:flutter/material.dart';
import 'package:itimaaty/View/FontsStyle.dart';

bool selectItems = true;

Widget itemBuild({
  String  text,
  IconData icon,
  Color colorText,
  Color colorIcon,
   Border  border ,
  Color  colorContainer,
}) => Container(
  alignment: Alignment.center,
  height: 50,
  decoration:  BoxDecoration(
    border: border,
    color: colorContainer,
  ),
  child: Row(
    // mainAxisAlignment: MainAxisAlignment.start,
    children:  [
      const SizedBox(
        width: 30,
      ),

      Icon(icon,color: colorIcon,size: 22,),
      const SizedBox(
        width: 15,
      ),
      Container(
          margin: EdgeInsets.only(top:0),
          child: Center(child: Text(text,style:  blueColorStyleMediumWithColor(22,colorText),))),
    ],
  ),
);
