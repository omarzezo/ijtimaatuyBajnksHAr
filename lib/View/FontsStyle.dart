import 'package:flutter/material.dart';
import 'package:itimaaty/Utils/AppColors.dart';

grayTextColorStyleMedium(double fontSize){
  return TextStyle(
    color: grayTextColor ,
    fontFamily: "medium",
    fontSize: fontSize,
  );
}
grayTextColorStyleBlack(double fontSize){
  return TextStyle(
    color: grayTextColor ,
    fontFamily: "black",
    fontSize: fontSize,
  );
}
blueColorBoldStyle(double fontSize){
  return TextStyle(
    color: blueColor ,
    fontFamily: "black",
    fontSize: fontSize,
    // fontWeight: FontWeight.bold
  );
}
blueColorStyleMedium(double fontSize){
  return TextStyle(
    color: blueColor.withOpacity(1) ,
    fontFamily: "medium",
    fontSize: fontSize,
    // fontWeight: FontWeight.bold
  );
}

blueColorStyleMediumWithColor(double fontSize,Color color){
  return TextStyle(
    color: color,
    fontFamily: "medium",
    fontSize: fontSize,
    // fontWeight: FontWeight.bold
  );
}

blueColorStyleregular(double fontSize){
  return TextStyle(
    color: blueColor ,
    fontFamily: "regular",
    fontSize: fontSize,
    // fontWeight: FontWeight.bold
  );
}

yellowColorStyleRegular(double fontSize){
  return TextStyle(
      color: yellowColor ,
      fontFamily: "regular",
      fontSize: fontSize,
      fontWeight: FontWeight.bold
  );
}
yellowColorStyleBold(double fontSize){
  return TextStyle(
    color: yellowColor ,
    fontFamily: "black",
    fontSize: fontSize,
    // fontWeight: FontWeight.bold
  );
}
yellowColorStyleMedium(double fontSize){
  return TextStyle(
    color: yellowColor.withOpacity(1) ,
    fontFamily: "medium",
    fontSize: fontSize,
    // fontWeight: FontWeight.bold
  );
}




whiteColorStyle(double fontSize) {
  return TextStyle(
      color: whiteColor,
      fontFamily: "regular",
      fontSize: fontSize,
      fontWeight: FontWeight.bold
  );
}

