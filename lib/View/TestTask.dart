import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/my_library_response_model.dart';
import 'package:itimaatysoharsohar/Repository/LibraryRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/Widgets/MyExpanation.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'DrawerWidget.dart';
import 'FontsStyle.dart';

class TestTask extends StatefulWidget {
  @override
  BasicTilePageTest createState() => BasicTilePageTest();

}


class BasicTilePageTest extends State<TestTask> {


  bool solution(String firstnum, String secondnum, String thirdnum) {

    List firstNameList=[];
    String firstCollect="";
    // firstnum.de
    if(firstnum.startsWith('0') || secondnum.startsWith('0') || thirdnum.startsWith('0')){
      print("first>>"+"false");
    }else{
      firstnum.runes.forEach((int rune) {
        var character=new String.fromCharCode(rune);

        firstNameList.add(character);
        print("character>>"+firstNameList.toString());

      });
      print("character>>"+firstNameList.toString());

      for(int i=0;i<firstNameList.length;i++){
        // var result = firstnum.substring(3);
         firstCollect=firstCollect+firstNameList[i].toString();
        print("firstCollect>>"+firstCollect.toString());
      }


      print("first>>"+"true");
      return true;
    }

  }

  @override
  void initState() {
    solution("10534", "67", "1120");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grayColor,
        drawer: DrawerWidget(5),
        body:Column(
          children: [
            const SizedBox(
              height: 50,
            ),

          ],
        )


    );
  }
}


