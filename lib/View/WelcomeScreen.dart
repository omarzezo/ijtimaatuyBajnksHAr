import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/cubit/User/user_cubit.dart';
import 'package:itimaaty/cubit/User/user_states.dart';

class WelcomeScreen extends StatefulWidget {
  String userName;
  WelcomeScreen(this.userName);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {

  bool _passwordVisible= false;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
              navigateTo(context, WelcomeScreen(state.loginModel.name));
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
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20),
                              width: 26,
                            height: 26,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset("assets/images/back.png",fit: BoxFit.cover,width: 26,)),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin:EdgeInsets.only(top: 8,right: 100),child:
                                Text(AppLocalizations.of(context).lblWelcome+", "+ widget.userName,style: blueColorBoldStyle(width<600?22:26),),),
                              ),
                            )
                            ],
                        ),
                        const SizedBox(height:20,),
                        Container(
                          margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
                          height: 0.3,color: grayTextColor,),
                        const SizedBox(height:30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
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
                                child: Image.asset("assets/images/ic_extra.png",width: 26,height: 26,color: Colors.white,),
                              ),
                            ),
                            const SizedBox(width: 14,),
                            Container(
                                margin:EdgeInsets.only(top: 4),child: Text(AppLocalizations.of(context).lblCompanyName,
                              style: blueColorBoldStyle(width<600?18:24),)),
                          ],
                        ),
                        const SizedBox(height:50,),

                        Center(
                          child: Text(AppLocalizations.of(context).lblLetsComplete,style:
                          grayTextColorStyleMedium(width<600?16:22),),
                        ),


                        const SizedBox(height:20,),
                        Container(
                          margin: EdgeInsets.only(left: width/4-14,right: width/4-14,top: 20),
                          child: Text(AppLocalizations.of(context).lblEmail,style:
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
                              controller: emailController,
                              style:  blueColorStyleMedium(width<600?14:20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              validator:(input) =>
                              input.isNotEmpty?isEmail(input.toString()) ? null : "Email is not Correct":"Please Enter Email",
                            ),
                          ),
                        ),
                        const SizedBox(height:20,),
                        Container(
                            margin: EdgeInsets.only(left: width/4-14,right: width/4-14,top: 20),
                            child: Text(AppLocalizations.of(context).lblPassword,style: blueColorStyleMedium(width<600?14:20))),
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
                              style:blueColorStyleMedium(width<600?14:20),
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
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
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
                                      AppLocalizations.of(context).lblCompleteProfile,
                                      style: whiteColorStyle(width<600?16:22),
                                    ),
                                    // textColor: Colors.white,
                                    // color: Colors.transparent,
                                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(30.0),
                                                side: BorderSide(color: Colors.transparent),
                                            ),
                                        )
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState.validate()) {
                                        cubit.userLoginFunc(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                  ),
                                ),
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