import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/View/FontsStyle.dart';
import 'package:itimaatysoharsohar/View/ResetPasswordScreen.dart';
import 'package:itimaatysoharsohar/View/SignInScreen.dart';
import 'package:itimaatysoharsohar/View/WelcomeScreen.dart';
import 'package:itimaatysoharsohar/cubit/User/user_cubit.dart';
import 'package:itimaatysoharsohar/cubit/User/user_states.dart';

class CheckYourMailScreen extends StatefulWidget {
String email;
CheckYourMailScreen(this.email);

  @override
  CheckYourMailScreenState createState() => CheckYourMailScreenState();
}

class CheckYourMailScreenState extends State<CheckYourMailScreen> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  double width;
  double height;

  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) async {
          if (state is ForgotPasswordSuccessState) {

            if (state.forgotPasswordResponseModel!=null) {
              print("EmailIs>>"+state.forgotPasswordResponseModel.message);
              if(state.forgotPasswordResponseModel.message=="Reset link send to your email,please check it"){
                // navigateTo(context, WelcomeScreen(widget.email));
              }else{

              }
              // navigateTo(context, WelcomeScreen(state.loginModel.name));
              // CacheHelper.saveData(
              //   key: 'token',
              //   value: state.loginModel.data.token,
              // ).then((value) {
              //   token = state.loginModel.data.token;
              //
              //   navigateAndFinish(context, HomeLayout());
              // });

            } else {

              // flutterToast(
              //   message: state.loginModel.message,
              //   state: ToastStates.ERROR,
              // );

            }
          }else{
            hasNetwork().then((value) {
              if(value){
                // if(EasyLoading.isShow){
                //   EasyLoading.showError("Check Network");
                // }
              }else{
                print("errorHere");
              }
            });


          }
        },
        builder: (context, state) {
          var cubit = UserCubit.get(context);

          return  Scaffold(
            // resizeToAvoidBottomInset: true,
            backgroundColor: grayColor,
            body: Container(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height:60,),
                        Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 24),
                                  width: 26,
                                  height: 26,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Image.asset("assets/images/back.webp",fit: BoxFit.cover,width: 26,)),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              flex: 27,
                              child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  margin:EdgeInsets.only(top: 8),child:
                              Text(AppLocalizations.of(context).lblCheckMail,
                                style: blueColorBoldStyle(width<600?22:28),)),
                            ),),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 14),
                          height: 0.3,color: grayTextColor,),
                        const SizedBox(height:60,),
                        Center(child: Image.asset("assets/images/checked.webp",fit: BoxFit.fill,
                          width: width<600?70:80,height: width<600?70:80,)),
                        const SizedBox(height:24,),

                        Center(child: Text(AppLocalizations.of(context).lblEmailedYou,style: grayTextColorStyleMedium(width<600?16:22),)),


                        const SizedBox(height:10,),

                        Center(child: Text(widget.email,style: yellowColorStyleMedium(width<600?18:24),)),

                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
                              height: 140,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(top: 4,bottom: 2),
                                      width: MediaQuery.of(context).size.width,
                                      // height: 43.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        gradient: LinearGradient(
                                          // Where the linear gradient begins and ends
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          // Add one stop for each color. Stops should increase from 0 to 1
                                          stops: [0.1, 0.9],
                                          colors: [
                                            yellowColor,
                                            yellowColor,
                                          ],
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        child: Text(
                                          AppLocalizations.of(context).lblSignIn,
                                          style: whiteColorStyle(width<600?16:24),
                                        ),
                                        style: ButtonStyle(
                                            foregroundColor: MaterialStateProperty.all<Color>(yellowColor),
                                            backgroundColor: MaterialStateProperty.all<Color>(yellowColor),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30),
                                                    side: BorderSide(color: yellowColor)
                                                )
                                            )
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          // navigateTo(context, WelcomeScreen("userName"));
                                          // navigateTo(context, ResetPasswordScreen("userName"));
                                          navigateTo(context, SignInScreen(false));
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height:24,),
                                  Text(AppLocalizations.of(context).lblDidNot,style:
                                  grayTextColorStyleMedium(width<600?16:22),),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(AppLocalizations.of(context).lblCheckSpam,style:
                                      grayTextColorStyleMedium(width<600?16:22),),
                                      InkWell(
                                        onTap: () {
                                          cubit.forgetPasswordFunc(
                                            email: widget.email,
                                          );
                                        },
                                          child:
                                          Text(AppLocalizations.of(context).lblResendLink,style:
                                          blueColorBoldStyle(width<600?16:22),)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height:40,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}