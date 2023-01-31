import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/LoginResponseModel.dart';
import 'package:itimaatysoharsohar/Models/auth_verification_response_model.dart';
import 'package:itimaatysoharsohar/Repository/UserRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/View/FontsStyle.dart';
import 'package:itimaatysoharsohar/View/HomeScreenNew.dart';
import 'package:itimaatysoharsohar/Widgets/text_for.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Utils/Constants.dart';
import 'HomeScreen.dart';

class TwoFactorAuthenticationScreen extends StatefulWidget {

  @override
  TwoFactorAuthenticationScreenState createState() => TwoFactorAuthenticationScreenState();
}


class TwoFactorAuthenticationScreenState extends State<TwoFactorAuthenticationScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
   // StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  String baseUrl = "";

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  BuildContext mContext;
  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
      String baseUri= Constants.BASE_URL;
      setState(() {
        baseUrl=baseUri;
      });

    super.initState();
  }

  void authVerification(String code){
  UserRepository userRepository =new UserRepository();
  load();
  AuthVerificationResponseModel authVerificationResponseModel =new AuthVerificationResponseModel(code: code);
  Future<LoginResponseModel> authVerficationResponse = userRepository.authVerfication(baseUrl,authVerificationResponseModel);
  authVerficationResponse.then((loginModel) {
    if(loginModel!=null){
      showSuccess();
      SharedPreferencesHelper.setLoggedToken(loginModel.token).then((value) {
        SharedPreferencesHelper.setLoggedUserName(loginModel.name).then((value) {
          SharedPreferencesHelper.setUserImageUrl(loginModel.image!=null?loginModel.image:"").then((value) {
            saveUser(loginModel).then((value) {
              print("TokenIssssss>>"+loginModel.token);
              Navigator.pop(mContext);
              // navigateTo(mContext, HomeScreen());
              navigateTo(mContext, HomeScreenNew());
            });

          });
        });
      });
    }else{
      showError();
    }
  });
  }



  @override
  Widget build(BuildContext context) {
    mContext=context;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width/1,
        // color: Colors.amber,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // customText(text: 'Two Factor Authentication',size: 22,color: Colors.black),
                   Text(AppLocalizations.of(context).lbTwoFactor,style: blueColorBoldStyle(22)),
                    const SizedBox(height: 20,),
                    const Divider(color: Colors.grey,),
                  ],),
              ),),


            Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width /2,
                  height: MediaQuery.of(context).size.height /5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              child: Image.asset("assets/images/ic_extra.webp",width: 26,height: 26,color: Colors.white,),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Text(AppLocalizations.of(context).lblCompanyName,style: blueColorBoldStyle(20)),

                        ],),
                      // Divider(color: Colors.grey,endIndent: MediaQuery.of(context).size.width/2,thickness: 3,),
                      const SizedBox(height: 25,),
                      Container(width: MediaQuery.of(context).size.width/2,color: Colors.grey.shade300,height: 1,),
                      const SizedBox(height: 30,),
                      Text(AppLocalizations.of(context).lblManageClinic,
                          style: blueColorStyleMedium(18)),

                      const SizedBox(height: 30,),

                      PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: const TextStyle(
                          // color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: false,
                        obscuringCharacter: '*',
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v?.length  == 3) {
                            return "";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                            activeColor: Colors.amber,
                            selectedFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            borderWidth: 1,
                            fieldHeight: 65,
                            fieldWidth: 65,
                            selectedColor: Colors.amber,
                            inactiveColor: Colors.grey,
                            activeFillColor: Colors.white
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        textStyle: const TextStyle(fontSize: 20, height: 1.6,color: Colors.amber),
                        // errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.white,
                            blurRadius: 0,
                          )
                        ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onTap: () {
                          print("Pressed");
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          return true;
                        },
                      ),

                      const Spacer(),

                      InkWell(
                        onTap: () {
                          print("txt>>"+textEditingController.text.toString());
                          authVerification(textEditingController.text!=null?textEditingController.text:"");
                        },
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 10,top: 12),
                          margin: const EdgeInsets.only(bottom: 20),
                          width: MediaQuery.of(context).size.width/2,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(AppLocalizations.of(context).lblConfirm,style: blueColorStyleMediumWithColor(20, Colors.white))),
                          ),
                      ),
                    ],
                  ),)),
            Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width/1,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      TextButton(onPressed: (){}, child:
                Text(AppLocalizations.of(context).lbDidNot,style: blueColorStyleMediumWithColor(20, grayTextColor))
                     ,),
                      Text(AppLocalizations.of(context).lbCheckYourSpam,style: blueColorStyleMediumWithColor(20, grayTextColor))
                    ],
                  ),)),
          ],
        ),
      ),
    );
  }
}
