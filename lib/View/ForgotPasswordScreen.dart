import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/CheckYourMailScreen.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/cubit/User/user_cubit.dart';
import 'package:itimaaty/cubit/User/user_states.dart';

class ForgotPasswordScreen extends StatefulWidget {

String email;
ForgotPasswordScreen(this.email);

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  bool _passwordVisible= false;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  double width;
  double height;

  @override
  void initState() {
    emailController.text=widget.email;
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
                Navigator.pop(context);
                navigateTo(context, CheckYourMailScreen(emailController.text));
              }else{

              }
              //
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
            body: SingleChildScrollView(
              reverse: true, // this is new
              physics: BouncingScrollPhysics(),
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
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 24),
                              width: 26,
                              height: 26,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  child: Image.asset("assets/images/back.png",fit: BoxFit.cover,width: 26,),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            flex: 26,
                            child:Align(
                              alignment: Alignment.center,
                              child: Container(
                                  margin: EdgeInsets.only(top: 6),
                                  child: Text(AppLocalizations.of(context).lblForgetPassword,style: blueColorBoldStyle(width<600?22:28),)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        height: 0.2,color: grayTextColor,),
                      const SizedBox(height:34,),
                      Center(child: Text(AppLocalizations.of(context).lblWillSend,style: grayTextColorStyleMedium(width<600?16:22),)),


                      const SizedBox(height:16,),
                      Container(
                          margin: EdgeInsets.only(top:20,left: width/4-14,right: width/4-14),
                          child: Text(AppLocalizations.of(context).lblEmail,style: blueColorStyleMedium(width<600?14:22),)),
                      const SizedBox(height:10,),
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
                        padding: EdgeInsets.fromLTRB(16, 10, 16, 6),
                        child: Center(
                          child: TextFormField(
                            controller: emailController,
                            style: blueColorStyleMedium(width<600?14:22),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            validator:(input) =>
                            input.isNotEmpty?isEmail(input.toString()) ? null : "Email is not Correct":"Please Enter Email",
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
                                child: FlatButton(
                                  child: Text(
                                    AppLocalizations.of(context).lblSendInstructions,
                                    style: whiteColorStyle(width<600?16:24),
                                  ),
                                  textColor: Colors.white,
                                  color: Colors.transparent,
                                  shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      cubit.forgetPasswordFunc(
                                        email: emailController.text,
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
                      Padding( // this is new
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                      ),

                    ],
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