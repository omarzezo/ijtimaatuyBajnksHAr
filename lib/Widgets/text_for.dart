import 'package:flutter/material.dart';
import 'package:itimaaty/View/FontsStyle.dart';

Widget textFormField
({

  IconData  icon,
   dynamic  Function() validator,
   Function() onTap,
  String hintText,
   bool  secureText,
  Function() onPressButton,
  Color colorIcon,

}) => 
Container(
  width: 400,
      height: 60,
      child: TextFormField(
        onTap: onTap,
        obscureText: secureText,
        validator: validator(),
        decoration: InputDecoration(fillColor: Colors.white,
        suffixIcon: IconButton(onPressed:onPressButton , icon:  Icon(icon,color: colorIcon,size: 18,),splashRadius: 5,),
        hintText: hintText,
        filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)
          ),
        ),
      ),
    );


Widget customText ({ String  text, Color color,double size }) => 
    Text(text,style: blueColorStyleMediumWithColor(18, color),);