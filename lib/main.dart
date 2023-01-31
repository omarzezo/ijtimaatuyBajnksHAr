import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/View/HomeScreenNew.dart';
import 'package:itimaatysoharsohar/View/SignInScreen.dart';
// import 'package:pspdfkit_flutter/pspdfkit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'View/SplashScreen.dart';
import 'cubit/User/cubit.dart';
import 'cubit/User/states.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  configLoading();
  // Widget widget=SplashScreen();
  runApp(MyApp());
}
// void configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 500)
//     ..indicatorType = EasyLoadingIndicatorType.wave
//     ..loadingStyle = EasyLoadingStyle.custom
//     ..indicatorSize = 38.0
//     ..radius = 0.0
//     ..progressWidth=0.2
//     ..progressColor = yellowColor
//     ..backgroundColor = Colors.transparent
//     ..boxShadow = <BoxShadow>[]
//     ..maskType=EasyLoadingMaskType.none
//     ..indicatorColor = yellowColor
//     ..textColor = Colors.white
//     ..maskColor = Colors.transparent
//     ..userInteractions = false
//     ..dismissOnTap = false
//     ..customAnimation = CustomAnimation();
// }

Future<void> configLoading() async {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..textColor=whiteColor
    ..progressColor = Colors.black
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.black
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();

  // if (Platform.isAndroid) {
  //   await Pspdfkit.setLicenseKey(Constants.android);
  // } else if (Platform.isIOS) {
  //   await Pspdfkit.setLicenseKey(Constants.ios);
  // }
}

class MyApp extends StatelessWidget {
  // final Widget startWidget;


  @override
  Widget build(BuildContext context) {

    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),

      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            title: 'Ijtimaati 4.0',
            themeMode: ThemeMode.light,
            // routes: <String, WidgetBuilder>{
            //   '/home': (BuildContext context) => new HomeScreenNew(),
            //   '/login': (BuildContext context) => new SignInScreen(false)
            // },
            // builder: EasyLoading.init(),
            builder: EasyLoading.init(
              builder: (context, child) {
                return ResponsiveWrapper.builder(
                    child,
                    maxWidth: 1400,
                    minWidth: 480,
                    defaultScale: true,
                    breakpoints: [
                      ResponsiveBreakpoint.resize(480, name: MOBILE),
                      ResponsiveBreakpoint.autoScale(800, name: TABLET),
                      ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                    ],
                    background: Container(color: Color(0xFFF5F5F5)));
              },
            ),
            home:ResponsiveVisibility(
              // replacement:SplashScreen(TABLET),
              replacement:SplashScreen(),
              hiddenWhen: const [Condition.largerThan(name: MOBILE)],child:
            // SplashScreen(MOBILE),
            SplashScreen(),
            ),
          );
        },
      ),

    );
  }
}


class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
      Widget child,
      AnimationController controller,
      AlignmentGeometry alignment,
      ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}