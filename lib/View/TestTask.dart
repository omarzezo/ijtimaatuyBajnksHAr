import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/my_library_response_model.dart';
import 'package:itimaaty/Repository/LibraryRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/Widgets/MyExpanation.dart';
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


