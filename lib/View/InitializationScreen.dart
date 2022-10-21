import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/View/ForgotPasswordScreen.dart';
import 'package:itimaaty/View/HomeScreen.dart';
import 'package:itimaaty/View/HomeScreenNew.dart';
import 'package:itimaaty/View/ResetPasswordScreen.dart';
import 'package:itimaaty/View/SignInScreen.dart';
import 'package:itimaaty/View/WelcomeBackScreen.dart';
import 'package:itimaaty/View/WelcomeScreen.dart';
import '../LocalDb/DbHelper.dart';
import '../LocalDb/OrganizationLocalModel.dart';
import '../Localizations/localization/LanguageVM.dart';
import '../Localizations/localization/LocaleHelper.dart';
import '../Localizations/localization/localizations.dart';
import 'CheckYourMailScreen.dart';
import 'ChosesScreen.dart';
import 'LogInToYourOrganizationScreen.dart';
import 'SignInToYourOrganizationScreen.dart';


class InitializationScreen extends StatefulWidget {


  @override
  InitializationScreenState createState() => InitializationScreenState();
}

class InitializationScreenState extends State<InitializationScreen> {

  SpecificLocalizationDelegate _specificLocalizationDelegate =  SpecificLocalizationDelegate(new Locale("en"));
  LanguageVM LanguageData = new LanguageVM();

 Widget child=Container();
  bool isLoged=false;

  var dbHelper = DbHelper();
  List orgainzations=[];

 bool logged=false;
  Future<bool> query(String name) async {
    // bool logged = false;
    if (SharedPreferencesHelper.getDomainName() != null) {
      SharedPreferencesHelper.getDomainName().then((value) {
        var orgainzationsFuture = dbHelper.getOrganizations();
        orgainzationsFuture.then((data) {
          setState(() {
            this.orgainzations = data;
            for(int i=0;i<orgainzations.length;i++){
              OrganizationLocalModel localModel =orgainzations[i];
              if(value==localModel.domain){
                if(localModel.userToken!=null && localModel.userToken.isNotEmpty){
                  setState(() {
                    print("userToken11>>"+"tokenIsNull");
                    logged=true;
                  });
                  break;
                }else{
                  print("userToken22>>"+"tokenIsNull");
                  setState(() {
                    logged = false;
                  });
                  // break;
                }

              }
            }
          });
        });
      });
    }else{
      setState(() {
        logged=false;
      });
    }
    // if(orgainzations!=null){
    //   for(int i=0;i<orgainzations.length;i++){
    //     OrganizationLocalModel localModel =orgainzations[i];
    //     print("mm>>"+localModel.name.toString());
    //     if(name==localModel.domain){
    //       logged=true;
    //       break;
    //     }else{
    //       logged=false;
    //     }
    //   }
    // }
    return logged;
  }

  void initState() {
    super.initState();

    setState(() {

   query("name").then((valueCheck) {
     if(valueCheck){
       SharedPreferencesHelper.getAlreadySignInOrganization().then((value) {
         if(value!=null){
           if(value){
             if (SharedPreferencesHelper.getLoggedToken() != null) {
               SharedPreferencesHelper.getLoggedToken().then((value) {
                 print("valuevalue>>" + value.toString());
                 if (value != null) {
                   if (value == "null") {
                     // isLoged = true;
                     setState(() {
                       child = SignInScreen(false);
                     });
                   } else {

                     if(valueCheck==true){
                       setState(() {
                         isLoged = true;
                         child = HomeScreenNew();
                         print("ffffffffffff1");
                       });
                     }else{
                       setState(() {
                         isLoged = false;
                         print("ffffffffffff2");
                         child = SignInScreen(false);
                       });
                     }

                   }
                   print("herrrrr1");
                 } else {
                   print("herrrrr2");
                   setState(() {
                     child = SignInScreen(false);
                   });
                 }
               });
             } else {
               print("herrrrr3");
               setState(() {
                 child = SignInScreen(false);
               });
             }
           }else{
             setState(() {
               print("Org444444");
               // child = SignInToYourOrganizationScreen();
               child = SignInScreen(false);
             });
           }
         }else{
           setState(() {
             print("Org6666666");
             child = SignInScreen(false);
           });
         }

       });
     }else{
       SharedPreferencesHelper.getAlreadySignInOrganization().then((value) {
         if(value!=null){
           if(value){
             if (SharedPreferencesHelper.getLoggedToken() != null) {
               SharedPreferencesHelper.getLoggedToken().then((value) {
                 print("valuevalue>>" + value.toString());
                 if (value != null) {
                   if (value == "null") {
                     // isLoged = true;
                     setState(() {
                       child = SignInScreen(false);
                     });
                   } else {

                       setState(() {
                         isLoged = true;
                         child = HomeScreenNew();
                         print("ffffffffffff1");
                       });

                   }
                   print("herrrrr1");
                 } else {
                   print("herrrrr2");
                   setState(() {
                     child = SignInScreen(false);
                   });
                 }
               });
             } else {
               print("herrrrr3");
               setState(() {
                 child = SignInScreen(false);
               });
             }
           }else{
             setState(() {
               print("Org444444");
               child = SignInScreen(false);
             });
           }
         }else{
           setState(() {
             print("Org6666666");
             child = SignInScreen(false);
           });
         }

       });
     }
   });





      helper.onLocaleChanged = onLocaleChange;
      if(SharedPreferencesHelper.getLanguageCode()!=null) {
        // if(SharedPreferencesHelper.getLanguageCode.) {
        SharedPreferencesHelper.getLanguageCode().then((value) {
          if (value == null) {
            _specificLocalizationDelegate =
                SpecificLocalizationDelegate(new Locale("en"));
            print("CheckForLanguage>>" + "null");
          } else if (value == "ar") {
            _specificLocalizationDelegate =
                SpecificLocalizationDelegate(new Locale("ar"));
            print("CheckForLanguage>>" + "ar");
          } else if (value == "en") {
            _specificLocalizationDelegate =
                SpecificLocalizationDelegate(new Locale("en"));
            print("CheckForLanguagevvv>>" + value.toString());
            print("CheckForLanguage>>" + "en");
          }
        });
        // }else{
        //   _specificLocalizationDelegate =
        //       SpecificLocalizationDelegate(new Locale("ar"));
        // }
      }else{
        _specificLocalizationDelegate =
            SpecificLocalizationDelegate(new Locale("en"));
      }
    });
  }

  onLocaleChange(Locale locale){
    setState((){
      _specificLocalizationDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        new FallbackCupertinoLocalisationsDelegate(),
        _specificLocalizationDelegate
      ],

      supportedLocales: [Locale('en'),Locale('ar')],
      locale: _specificLocalizationDelegate.overriddenLocale ,
      // home:MotherPage(),
      // home:WelcomeScreen("Omar"),
      // home:SignInScreen(),
      // home:ForgotPasswordScreen(),
      // home:ResetPasswordScreen("omar"),
      // home:CheckYourMailScreen("omar"),
      // home:SignInToYourOrganizationScreen(),
      // home:LogInToYourOrganizationScreen(),
      // home:WelcomeBackScreen(),
      // home:ChosesScreen(),
      home:child,
      // home:WelcomeScreen("Omar"),
    );
  }
}

