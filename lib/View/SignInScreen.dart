import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/LoginRequestModel.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';
import 'package:itimaaty/Repository/UserRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/AllMeetingsScreen.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/ForgotPasswordScreen.dart';
import 'package:itimaaty/View/HomeScreen.dart';
import 'package:itimaaty/View/MotherScreen.dart';
import 'package:itimaaty/View/TwoFactorAuthenticationScreen.dart';
import 'package:itimaaty/View/WelcomeScreen.dart';
import 'package:itimaaty/cubit/User/user_cubit.dart';
import 'package:itimaaty/cubit/User/user_states.dart';

import 'CreateMeetingScreen.dart';
import 'ParentLibraryScreen.dart';

class SignInScreen extends StatefulWidget {

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {

  double width;
  double height;

  bool _passwordVisible= false;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    // emailController.text="said.sale7@gmail.com";
    // passwordController.text='123123';

    // emailController.text="said.saleh@live.com";
    // passwordController.text='123123';

    // emailController.text="Ahmed@ijtimaati.com";
    // passwordController.text='Oman@2020';
    //
    emailController.text="mazin@ijtimaati.com";
    passwordController.text='Oman@1234';
    //
    // emailController.text="zezoomar674@yahoo.com";
    // passwordController.text='123456';
  }

  void getLoginData(LoginRequestModel loginRequestModel) {
    load();
    UserRepository allProductsRepository = new UserRepository();
    Future<LoginResponseModel> allList = allProductsRepository.getLoginData(loginRequestModel);
    allList.then((loginModel) {
      setState(() {
        if(loginModel!=null){
          showSuccess();
          SharedPreferencesHelper.setLoggedToken(loginModel.token).then((value) {
            SharedPreferencesHelper.setLoggedUserName(loginModel.name).then((value) {
              SharedPreferencesHelper.setUserImageUrl(loginModel.image).then((value) {
                // navigateTo(context, MotherScreen(null));
                print("TokenIssssss>>"+loginModel.token);
                navigateTo(context, HomeScreen());
                // navigateTo(context, ParentLibraryScreen());
                // navigateTo(context, CreateMeetingScreen());
              });
            });
          });
        }else{
          showError();
          print("dddddddd");
          navigateAndFinish(context, SignInScreen());
        }
      });

    });
  }

  @override
  Widget build(BuildContext context) {
     width = MediaQuery.of(context).size.width;
     height = MediaQuery.of(context).size.height;
     // print("width>>"+width.toString());



   return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (context, state) async {
          if (state is LoginSuccessState) {

            if (state.loginModel!=null) {
              setState(() {
                if(state.loginModel.token!=null) {
                  print("TokenIssssss>>" + state.loginModel.token);
                  SharedPreferencesHelper.setLoggedToken(state.loginModel.token)
                      .then((value) {
                    SharedPreferencesHelper.setLoggedUserName(
                        state.loginModel.name).then((value) {
                      SharedPreferencesHelper.setUserImageUrl(
                          state.loginModel.image).then((value) {
                        // navigateTo(context, MotherScreen(null));
                        saveUser(state.loginModel).then((value) {
                          print("userIdIS>>" + state.loginModel.id.toString());
                          navigateTo(context, HomeScreen());
                        });
                      });
                    });
                  });
                }else{
                  print("hhhhhhhhhhhhhhhhhhh");
                  navigateTo(context, TwoFactorAuthenticationScreen());
                }
              });

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
              // margin: EdgeInsets.only(left: 24,right: 24),
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
                        // width<600?Text(AppLocalizations.of(context).lblSignIn,style: blueColorBoldStyle(30),):
                        Center(child: Text(AppLocalizations.of(context).lblSignIn,style: blueColorBoldStyle(width<600?22:34),)),
                        const SizedBox(height:10,),
                        Container(
                          margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
                          height: 0.3,color: grayTextColor,),
                        const SizedBox(height:30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: width<600?40:50,
                              height: width<600?40:50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: greenColor,
                                boxShadow: [
                                  BoxShadow(color: greenColor, spreadRadius: 3),
                                ],
                              ),
                              padding: EdgeInsets.only(left: 2,right: 2,top: 2,bottom: 2),
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset("assets/images/ic_extra.webp",width: 26,height: 26,color: Colors.white,),
                              ),
                            ),
                            const SizedBox(width: 14,),
                            Container(
                              margin: EdgeInsets.only(top: 4),
                                child: Text(AppLocalizations.of(context).lblCompanyName,style: blueColorBoldStyle(width<600?18:26),)),
                          ],
                        ),
                        const SizedBox(height:50,),
                        Center(child: Text(AppLocalizations.of(context).lblManageClinic,style: grayTextColorStyleMedium(width<600?16:22),)),


                        const SizedBox(height:20,),
                        Container(
                            margin: EdgeInsets.only(top:20,left: width/4-14,right: width/4-14),
                            child: Text(AppLocalizations.of(context).lblEmail,style: blueColorStyleMedium(width<600?14:20),)),
                        const SizedBox(height:6),
                        Container(
                          // width: width/2+80,
                          margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: grayRoundedColor,// set border color
                                  width: 1.0
                              )
                          ),
                          // height: 56,
                          padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                          child: Center(
                            child: TextFormField(
                              controller: emailController,
                              style: blueColorStyleMedium(width<600?14:20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              validator:(input) =>
                              input.isNotEmpty?isEmail(input.toString()) ? null : "Email is not Correct":"Please Enter Email",
                            ),
                          ),
                        ),
                        const SizedBox(height:30,),
                        Container(
                            margin: EdgeInsets.only(top:20,left: width/4-14,right: width/4-14),
                            child: Text(AppLocalizations.of(context).lblPassword,style: blueColorStyleMedium(width<600?14:20),)),
                        const SizedBox(height:6,),
                        Container(
                          margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: grayRoundedColor,// set border color
                                  width: 1.0
                              )
                          ),
                          // height: 56,
                          padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                          child: Center(
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please Enter Password";
                                }else if (value.length<6) {
                                  return "Password not less than 6 digits";
                                }
                                return null;
                                // value.isNotEmpty?null:"Please Enter User Name";
                              },
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              obscureText: !_passwordVisible,//This will obscure text dynamically
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    size: 20,
                                    color: blueColor,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              style: blueColorStyleMedium(width<600?14:20),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(top:20,left: width/4-14,right: width/4-14),
                              height: 120,
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
                                      child: FlatButton(
                                        child: Text(
                                          AppLocalizations.of(context).lblLogin,
                                          style: whiteColorStyle(width<600?16:26),
                                        ),
                                        textColor: Colors.white,
                                        color: Colors.transparent,
                                        shape:
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                        onPressed: () {
                                          if (formKey.currentState.validate()) {
                                            // LoginRequestModel loginRequestModel =new LoginRequestModel( emailController.text, passwordController.text);
                                            // getLoginData(loginRequestModel);
                                            cubit.userLoginFunc(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 16,),

                                  InkWell(
                                    onTap: () {
                                      navigateTo(context, ForgotPasswordScreen(emailController.text));
                                    },
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of(context).lblForgetPassword,
                                        style: grayTextColorStyleMedium(width<600?16:24),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )

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