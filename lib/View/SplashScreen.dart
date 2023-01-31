import 'dart:async';
import 'package:flutter/material.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/View/InitializationScreen.dart';



class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
      Timer(Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => InitializationScreen()
          ),
        );
      });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grayColor,
        body: LayoutBuilder(builder: (context, constraints) {
          if(constraints.maxWidth<600){
            return SingleChildScrollView(
                child: Container(
                  height:  MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.white,
                  child: Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[
                      Container(
                        child:Image.asset(
                          "assets/images/logo_for_splash.png",
                          height:  160,
                          width: (MediaQuery.of(context).size.width/2)+60,
                        ),
                      )

                    ]
                    ),
                  ),
                ));
          }else{
            return SingleChildScrollView(
                child: Container(
                  height:  MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.white,
                  child: Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[
                      Container(
                        child:Image.asset(
                          "assets/images/logo_for_splash.png",
                          height:  120,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      )

                    ]
                    ),
                  ),
                ));
          }
        },)

        );
  }
}

