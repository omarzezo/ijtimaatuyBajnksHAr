import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/View/ForgotPasswordScreen.dart';
import 'package:itimaaty/View/HomeScreen.dart';
import 'package:itimaaty/View/ResetPasswordScreen.dart';
import 'package:itimaaty/View/SignInScreen.dart';
import 'package:itimaaty/View/WelcomeBackScreen.dart';
import 'package:itimaaty/View/WelcomeScreen.dart';
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
  void initState() {
    super.initState();


    // setState(() {
    //   helper.onLocaleChanged = onLocaleChange;
    //
    //   _specificLocalizationDelegate = SpecificLocalizationDelegate(new Locale("en"));
    //
    //   if(_specificLocalizationDelegate==null){
    //     _specificLocalizationDelegate = SpecificLocalizationDelegate(new Locale("en"));
    //     print("CheckForLanguage>>"+"1");
    //   }
    // });
    setState(() {
      if(SharedPreferencesHelper.getLoggedToken()!=null) {
        SharedPreferencesHelper.getLoggedToken().then((value) {
          print("valuevalue>>"+value.toString());
          if (value != null) {
            if(value=="null"){
              // isLoged = true;
              setState(() {
                child = SignInScreen();
              });
            }else{
              isLoged = true;
              setState(() {
                child = HomeScreen();
              });
            }

            print("herrrrr1");
          } else {
            print("herrrrr2");
            setState(() {
              child = SignInScreen();
            });

          }
        });
      }else{
        print("herrrrr3");
        setState(() {
          child = SignInScreen();
        });
      }
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

