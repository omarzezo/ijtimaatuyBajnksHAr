// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:itimaaty/Localizations/localization/localizations.dart';
// import 'package:itimaaty/Models/MyOrganizationsResponseModel.dart';
// import 'package:itimaaty/Utils/AppColors.dart';
// import 'package:itimaaty/Utils/CommonMethods.dart';
// import 'package:itimaaty/View/CheckYourMailScreen.dart';
// import 'package:itimaaty/View/FontsStyle.dart';
// import 'package:itimaaty/View/MotherScreen.dart';
// import 'package:itimaaty/View/SignInScreen.dart';
// import 'package:itimaaty/View/SignInToYourOrganizationScreen.dart';
// import 'package:itimaaty/View/WelcomeBackScreen.dart';
// import 'package:itimaaty/View/WelcomeScreen.dart';
// import 'package:itimaaty/cubit/User/user_cubit.dart';
// import 'package:itimaaty/cubit/User/user_states.dart';
//
// class ChosesScreen extends StatefulWidget {
//   @override
//   ChosesScreenState createState() => ChosesScreenState();
// }
//
// class ChosesScreenState extends State<ChosesScreen> {
//   @override
//   void initState() {}
//
//   @override
//   Widget build(BuildContext context) {
//     Widget signInFlow() {
//       return InkWell(
//         onTap: () {
//           navigateTo(context, SignInScreen());
//         },
//         child: Container(
//           padding: EdgeInsets.only(top: 50, bottom: 50),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: new BorderRadius.circular(10.0),
//               border: Border.all(
//                   color: grayRoundedColor, // set border color
//                   width: 2.0)),
//           child: Center(
//               child: Text(
//             AppLocalizations.of(context).lblSignInFlow,
//             style: blueColorBoldStyle(22),
//           )),
//         ),
//       );
//     }
//
//     Widget newUserFlow() {
//       return InkWell(
//         onTap: () {
//           navigateTo(context, WelcomeScreen("Omar"));
//         },
//         child: Container(
//           padding: EdgeInsets.only(top: 50, bottom: 50),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: new BorderRadius.circular(10.0),
//               border: Border.all(
//                   color: grayRoundedColor, // set border color
//                   width: 2.0)),
//           child: Center(
//               child: Text(
//             AppLocalizations.of(context).lblNewUserFlow,
//             style: blueColorBoldStyle(22),
//           )),
//         ),
//       );
//     }
//
//     Widget orgSearchFlow() {
//       return InkWell(
//         onTap: () {
//           navigateTo(context, SignInToYourOrganizationScreen());
//         },
//         child: Container(
//           padding: EdgeInsets.only(top: 50, bottom: 50),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: new BorderRadius.circular(10.0),
//               border: Border.all(
//                   color: grayRoundedColor, // set border color
//                   width: 2.0)),
//           child: Center(
//               child: Text(
//             AppLocalizations.of(context).lblOrgSearchFlow,
//             style: blueColorBoldStyle(22),
//           )),
//         ),
//       );
//     }
//
//     Widget welcomeBackFlow() {
//       return InkWell(
//         onTap: () {
//           // navigateTo(context, WelcomeBackScreen());
//           navigateTo(context, MotherScreen(null));
//         },
//         child: Container(
//           padding: EdgeInsets.only(top: 50, bottom: 50),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: new BorderRadius.circular(10.0),
//               border: Border.all(
//                   color: grayRoundedColor, // set border color
//                   width: 2.0)),
//           child: Center(
//               child: Text(
//             AppLocalizations.of(context).lblWelcomeBackFlow,
//             style: blueColorBoldStyle(22),
//           )),
//         ),
//       );
//     }
//
//     return BlocProvider(
//       create: (BuildContext context) => UserCubit(),
//       child: BlocConsumer<UserCubit, UserStates>(
//         listener: (context, state) async {
//           if (state is ForgotPasswordSuccessState) {
//             if (state.forgotPasswordResponseModel != null) {
//               //
//               // CacheHelper.saveData(
//               //   key: 'token',
//               //   value: state.loginModel.data.token,
//               // ).then((value) {
//               //   token = state.loginModel.data.token;
//               //
//               //   navigateAndFinish(context, HomeLayout());
//               // });
//
//             } else {
//               // flutterToast(
//               //   message: state.loginModel.message,
//               //   state: ToastStates.ERROR,
//               // );
//
//             }
//           } else {
//             hasNetwork().then((value) {
//               if (value) {
//                 // if(EasyLoading.isShow){
//                 //   EasyLoading.showError("Check Network");
//                 // }
//               } else {
//                 print("errorHere");
//               }
//             });
//           }
//         },
//         builder: (context, state) {
//           var cubit = UserCubit.get(context);
//
//           return Scaffold(
//             // resizeToAvoidBottomInset: true,
//             backgroundColor: grayColor,
//             body: Container(
//               margin: EdgeInsets.only(left: 40, right: 40),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     const SizedBox(
//                       height: 60,
//                     ),
//                     signInFlow(),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     newUserFlow(),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     orgSearchFlow(),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     welcomeBackFlow(),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
