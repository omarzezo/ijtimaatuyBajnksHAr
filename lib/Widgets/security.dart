import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Repository/UserRepository.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Widgets/text_for.dart';

import 'CustomSwitch.dart';


class Security extends StatefulWidget {

  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  bool isSwitched ;

  void authFactor(){
    SharedPreferencesHelper.getLoggedToken().then((valueToken) {
      UserRepository userRepository =new UserRepository();
      load();
      Future<Response> response = userRepository.authFactor(valueToken);
      response.then((value) {
        if(value.statusCode==200){
          showSuccess();
          SharedPreferencesHelper.setTowFactor(isSwitched);
        }else{
          showError();
        }
      });
    });

  }
  @override
  void initState() {
    SharedPreferencesHelper.getTowFactor().then((value) {
      if(value!=null){
        setState(() {
          isSwitched=value;
          // authFactor();
        });
      }else{
        setState(() {
          isSwitched=false;
          // authFactor();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:  20.0 , right: 20.0,bottom: 600),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: 
            [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(text:AppLocalizations.of(context).lblTwoFactorAuthentication ,size: 18),
                const SizedBox(height: 10,),
                customText(text: AppLocalizations.of(context).lblYouWillRecieve,color: Colors.grey),
            ],),
            Container(
              // width: 50,
              // height: 30,
              // decoration: BoxDecoration(
              //   color: Colors.yellow,
              //   borderRadius: BorderRadius.circular(40),
              // ),

              // دي باكدج جاهزه للزرار بالشكل الموجود بالظبط 
              
              child:
              isSwitched!=null?CustomSwitch(
                value: isSwitched,
                onChanged: (bool val){
                  setState(() {
                    isSwitched = val;
                    if(val){
                      SharedPreferencesHelper.setTowFactor(true).then((value) {
                        authFactor();
                      });
                      // virtual=1;
                    }else{
                      SharedPreferencesHelper.setTowFactor(false).then((value) {
                        authFactor();
                      });
                    }
                  });
                },
              ):Container(),
              
              // ودا الي موجود من غير باكدج وانا مهندلة شويه سواء  حابب تشفله ابقي زيل الكومنت بتاعت الكونتينر هيبقي نفس الشكل الباكدج الجهزة دي 

              // Switch(
              //   value: true,
              //   onChanged: (value) {},
              //   activeColor: Colors.white,
              //   focusColor: Colors.white,
              //   inactiveTrackColor: Colors.white,
              //   activeTrackColor: Colors.yellow,
              //   inactiveThumbColor: Colors.yellow,
              // ),
            )
          ],
        ),
      ),
    );
  }
}
