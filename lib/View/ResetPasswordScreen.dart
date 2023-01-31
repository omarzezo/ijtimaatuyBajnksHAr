import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/View/FontsStyle.dart';
import 'package:itimaatysoharsohar/cubit/User/user_cubit.dart';
import 'package:itimaatysoharsohar/cubit/User/user_states.dart';

import 'WelcomeScreen.dart';

class ResetPasswordScreen extends StatefulWidget {
  String userName;
  ResetPasswordScreen(this.userName);

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {

  bool _passwordVisible= false;
  bool retypePasswordVisible= false;
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var retypePasswordController = TextEditingController();
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
          if (state is LoginSuccessState) {

            if (state.loginModel!=null) {
              print("EmailIs>>"+state.loginModel.email);
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
            resizeToAvoidBottomInset: false,
            backgroundColor: grayColor,
            body: Container(
              // margin: EdgeInsets.only(left: 24,right: 24),
              child: Column(
                children: [
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
                                child: Image.asset("assets/images/back.png",fit: BoxFit.cover,width: 26,)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        flex: 27,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Text(AppLocalizations.of(context).lblWelcome+", "+ widget.userName,
                                style: blueColorBoldStyle(width<600?22:30),)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 14),
                    height: 0.3,color: grayTextColor,),

                  Expanded(
                    child: SingleChildScrollView(
                      // reverse: true, // this is new
                      // physics: BouncingScrollPhysics(),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height:30,),
                          Center(
                            child: Text(AppLocalizations.of(context).lblLetsComplete,style:
                            grayTextColorStyleMedium(width<600?16:22),),
                          ),


                          const SizedBox(height:20,),

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
                                style: blueColorStyleMedium(width<600?14:20),
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
                              ),
                            ),
                          ),
                          const SizedBox(height:16,),
                          Container(
                            margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
                            child: Text(AppLocalizations.of(context).lblRetypePassword,style:
                            blueColorStyleMedium(width<600?14:20),),
                          ),
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
                                style: blueColorStyleMedium(width<600?14:20),
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
                                controller: retypePasswordController,
                                obscureText: !retypePasswordVisible,//This will obscure text dynamically
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      retypePasswordVisible ? Icons.visibility : Icons.visibility_off,
                                      size: 20,
                                      color: blueColor,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        retypePasswordVisible = !retypePasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(top:200,left: width/4-14,right: width/4-14),
                              height: 50,
                              child: InkWell(
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
                                      AppLocalizations.of(context).lblResetPassword,
                                      style: whiteColorStyle(width<600?16:22),
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

                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Expanded(
                          //   child: ,
                          // ),
                          const SizedBox(height:40,),
                          Padding( // this is new
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}