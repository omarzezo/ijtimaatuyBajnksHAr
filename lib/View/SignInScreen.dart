import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/LoginRequestModel.dart';
import 'package:itimaatysoharsohar/Models/LoginResponseModel.dart';
import 'package:itimaatysoharsohar/Models/SsoRequestModel.dart';
import 'package:itimaatysoharsohar/Repository/UserRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/View/AllMeetingsScreen.dart';
import 'package:itimaatysoharsohar/View/FontsStyle.dart';
import 'package:itimaatysoharsohar/View/ForgotPasswordScreen.dart';
import 'package:itimaatysoharsohar/View/HomeScreen.dart';
import 'package:itimaatysoharsohar/View/HomeScreenNew.dart';
import 'package:itimaatysoharsohar/View/MotherScreen.dart';
import 'package:itimaatysoharsohar/View/TwoFactorAuthenticationScreen.dart';
import 'package:itimaatysoharsohar/View/WebViewScreen.dart';
import 'package:itimaatysoharsohar/View/WelcomeScreen.dart';
import 'package:itimaatysoharsohar/cubit/User/user_cubit.dart';
import 'package:itimaatysoharsohar/cubit/User/user_states.dart';
import 'package:url_launcher/url_launcher.dart';

import '../LocalDb/DbHelper.dart';
import '../LocalDb/OrganizationLocalModel.dart';
import 'CreateMeetingScreen.dart';
import 'ParentLibraryScreen.dart';

class SignInScreen extends StatefulWidget {
 bool isback;
 SignInScreen(this.isback);

  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  // var cubit;
  double width;
  double height;

  bool _passwordVisible= false;
  bool error= false;

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var emailControllerInsidePop = TextEditingController();
  var passwordController = TextEditingController();
  String companyName="";
  String logo="";
  String baseUrl="";
  BuildContext mCtx;

  @override
  void initState() {

    // print("orgIs>>"+Constants.org);
    setState(() {
      SharedPreferencesHelper.setDomainName("ijtimaati").then((value) {
        SharedPreferencesHelper.getOrg().then((value) {
          setState(() {
            companyName=value;
          });
          SharedPreferencesHelper.getOrgLogo().then((value) {
            setState(() {
              logo=value;
            });
          }).then((value) {
              String baseUri= Constants.BASE_URL;
              setState(() {
                baseUrl=baseUri;
              });
          });
        });
      });
    });

    // emailController.text="said.sale7@gmail.com";
    // passwordController.text='123123';

    // emailController.text="said.saleh@live.com";
    // passwordController.text='123123';

    // emailController.text="Ahmed@ijtimaati.com";
    // passwordController.text='Oman@2021';

    // emailController.text="mazin@ijtimaati.com";
    // passwordController.text='Oman@1234';
    //
    // emailController.text="zezoomar674@yahoo.com";
    // passwordController.text='123456';

    // emailController.text="Ibrahim@ijtimaati.com";
    // passwordController.text='Oman@2022';
    // passwordController.text='Ibrahim@123';

    // emailController.text="amani@ijtimaati.com";
    // passwordController.text='Oman@1234';
  }

  void checkPreviousSessionAndRedirect(BuildContext context) async {
      Navigator.pushNamedAndRemoveUntil(
          context, "/home", (Route<dynamic> route) => false);
  }

  void openBottomSheet(BuildContext mContext){
    showModalBottomSheet(
        isScrollControlled: true,
        // padding: MediaQuery.of(context).viewInsets,
        isDismissible: true,
        context: mContext,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return StatefulBuilder( builder: (BuildContext context, StateSetter setStateee /*You can rename this!*/) {
            return SingleChildScrollView(
              // height: MediaQuery.of(mContext).size.height,
              // width: MediaQuery.of(mContext).size.width,
              // color: Colors.transparent,
              child:Padding(
                padding:  EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(mContext).size.width/2-100,
                    height: MediaQuery.of(mContext).size.width/3-40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 2),
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0))),
                    child:Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(mContext).lblSignInSso,style: blueColorStyleMedium(16),),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close,color: Colors.black,)),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top:20,left: 16,right:16),
                              child: Text(AppLocalizations.of(mContext).lblEmail,style: blueColorStyleMedium(18),)),
                          const SizedBox(height:6),
                          Container(
                            width: MediaQuery.of(mContext).size.width/2-150,
                            // width: 100,
                            // height: 50,
                            // width: width/2+80,
                            margin: EdgeInsets.only(left: 16,right:16),
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
                                controller: emailControllerInsidePop,
                                style: blueColorStyleMedium(18),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                validator:(input) =>
                                input.isNotEmpty?isEmail(input.toString()) ? null :
                                AppLocalizations.of(mContext).lblEmailNot:
                                AppLocalizations.of(mContext).lblPleaseEnterEmail,
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 16,right:16,top: 20),
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            width: MediaQuery.of(mContext).size.width/2-150,
                            // padding: EdgeInsets.only(top: 4,bottom: 2),
                            // width: MediaQuery.of(context).size.width,
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
                                AppLocalizations.of(mContext).lblLogin,
                                style: whiteColorStyle(18),
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

                                if(emailControllerInsidePop.text.isNotEmpty){
                                  load();
                                  // Navigator.pop(context);
                                  UserRepository respo = new UserRepository();
                                  SsoRequestModel model= new SsoRequestModel(emailControllerInsidePop.text);
                                  respo.getSSoData(baseUrl, model).then((value) async {
                                    // print("valuevalue>>"+value.toString());
                                    if(value!=null){
                                      showSuccess();
                                      if(value.message=="success"){
                                        // print("value.message>>"+value.message.toString());
                                        String  secret = await Navigator.of(mContext).push(MaterialPageRoute(builder: (context) =>WebViewScreen(value.redirect)));

                                        if(secret!=null){
                                          load();
                                          respo.userPostSecret(baseUrl, secret).then((loginModel) {
                                            if(loginModel!=null){
                                              showSuccess();
                                              if(loginModel.token!=null) {
                                                SharedPreferencesHelper.setLoggedToken(loginModel.token).then((value) async {
                                                  var dbHelper = DbHelper();

                                                  SharedPreferencesHelper.getDomainName().then((value) async {

                                                    var result = await dbHelper.updateWithName(
                                                        loginModel.token,
                                                        loginModel.name,
                                                        loginModel.image!=null?loginModel.image:"",
                                                        value,
                                                        emailControllerInsidePop.text,
                                                        passwordController.text.isEmpty?"":passwordController.text
                                                    );

                                                    SharedPreferencesHelper.setLoggedUserName(loginModel.name).then((value) {
                                                      SharedPreferencesHelper.setUserImageUrl(loginModel.image!=null?loginModel.image:"").then((value) {
                                                        // navigateTo(context, MotherScreen(null));
                                                        saveUser(loginModel).then((value) {
                                                          // navigateAndFinish(context, HomeScreen());
                                                          // checkPreviousSessionAndRedirect(mCtx);
                                                          // Navigator.of(context).popUntil(ModalRoute.);

                                                          navigateAndFinish(mContext, HomeScreenNew());
                                                        });
                                                      });
                                                    });
                                                  });

                                                });
                                              }else{
                                                print("hhhhhhhhhhhhhhhhhhh");
                                                navigateTo(context, TwoFactorAuthenticationScreen());
                                              }
                                            }else{
                                              showError();
                                            }
                                          });
                                          // cubit.userPostSecret(
                                          //   baseUrl: baseUrl,
                                          //   secret: secret,
                                          // );
                                        }
                                        // launch(value.redirect);                          //vhS6xRinmJgHLA8P1kE5
                                      }
                                    }else{
                                      showError();
                                      showErrorWithMsg(AppLocalizations.of(mContext).lblInvalidCredentials);
                                    }
                                  });
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },);
        });
  }

  void showSSoDialog(BuildContext mContext){
    showDialog(
      context: mContext,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(10.0))),
            child: Container(
              width: MediaQuery.of(mContext).size.width/2-100,
              height: MediaQuery.of(mContext).size.width/3-40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 2),
                  borderRadius:
                  BorderRadius.all(Radius.circular(10.0))),
              child:Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(mContext).lblSignInSso,style: blueColorStyleMedium(16),),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close,color: Colors.black,)),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top:20,left: 16,right:16),
                        child: Text(AppLocalizations.of(mContext).lblEmail,style: blueColorStyleMedium(18),)),
                    const SizedBox(height:6),
                    Container(
                      width: MediaQuery.of(mContext).size.width/2-150,
                      // width: 100,
                      // height: 50,
                      // width: width/2+80,
                      margin: EdgeInsets.only(left: 16,right:16),
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
                          controller: emailControllerInsidePop,
                          style: blueColorStyleMedium(18),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          validator:(input) =>
                          input.isNotEmpty?isEmail(input.toString()) ? null :
                          AppLocalizations.of(mContext).lblEmailNot:
                          AppLocalizations.of(mContext).lblPleaseEnterEmail,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 16,right:16,top: 20),
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      width: MediaQuery.of(mContext).size.width/2-150,
                      // padding: EdgeInsets.only(top: 4,bottom: 2),
                      // width: MediaQuery.of(context).size.width,
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
                          AppLocalizations.of(mContext).lblLogin,
                          style: whiteColorStyle(18),
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
                          if(emailControllerInsidePop.text.isNotEmpty){
                            load();
                            // Navigator.pop(context);
                            UserRepository respo = new UserRepository();
                            SsoRequestModel model= new SsoRequestModel(emailControllerInsidePop.text);
                            respo.getSSoData(baseUrl, model).then((value) async {
                              // print("valuevalue>>"+value.toString());
                              if(value!=null){
                                showSuccess();
                                if(value.message=="success"){
                                  // print("value.message>>"+value.message.toString());
                                  String  secret = await Navigator.of(mContext).push(MaterialPageRoute(builder: (context) =>WebViewScreen(value.redirect)));

                                 if(secret!=null){
                                   load();
                                   respo.userPostSecret(baseUrl, secret).then((loginModel) {
                                     if(loginModel!=null){
                                       showSuccess();
                                       if(loginModel.token!=null) {
                                         SharedPreferencesHelper.setLoggedToken(loginModel.token).then((value) async {
                                           var dbHelper = DbHelper();

                                           SharedPreferencesHelper.getDomainName().then((value) async {

                                             var result = await dbHelper.updateWithName(
                                                 loginModel.token,
                                                 loginModel.name,
                                                 loginModel.image!=null?loginModel.image:"",
                                                 value,
                                                 emailControllerInsidePop.text,
                                                 passwordController.text.isEmpty?"":passwordController.text
                                             );

                                             SharedPreferencesHelper.setLoggedUserName(loginModel.name).then((value) {
                                               SharedPreferencesHelper.setUserImageUrl(loginModel.image!=null?loginModel.image:"").then((value) {
                                                 // navigateTo(context, MotherScreen(null));
                                                 saveUser(loginModel).then((value) {
                                                   // navigateAndFinish(context, HomeScreen());
                                                   // checkPreviousSessionAndRedirect(mCtx);
                                                   // Navigator.of(context).popUntil(ModalRoute.);

                                                   navigateAndFinish(mContext, HomeScreenNew());
                                                 });
                                               });
                                             });
                                           });

                                         });
                                       }else{
                                         print("hhhhhhhhhhhhhhhhhhh");
                                         navigateTo(context, TwoFactorAuthenticationScreen());
                                       }
                                     }else{
                                       showError();
                                     }
                                   });
                                   // cubit.userPostSecret(
                                   //   baseUrl: baseUrl,
                                   //   secret: secret,
                                   // );
                                 }
                                 // launch(value.redirect);                          //vhS6xRinmJgHLA8P1kE5
                                }
                              }else{
                                showError();
                                showErrorWithMsg(AppLocalizations.of(mContext).lblInvalidCredentials);
                              }
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
  // void getLoginData(LoginRequestModel loginRequestModel) {
  //   load();
  //   UserRepository allProductsRepository = new UserRepository();
  //   Future<LoginResponseModel> allList = allProductsRepository.getLoginData(baseUrl,loginRequestModel);
  //   allList.then((loginModel) {
  //     setState(() {
  //       if(loginModel!=null){
  //         // error=false;
  //         showSuccess();
  //         SharedPreferencesHelper.setLoggedToken(loginModel.token).then((value) {
  //           SharedPreferencesHelper.setLoggedUserName(loginModel.name).then((value) {
  //             SharedPreferencesHelper.setUserImageUrl(loginModel.image!=null?loginModel.image:"").then((value) {
  //               // navigateTo(context, MotherScreen(null));
  //               print("TokenIssssss>>"+loginModel.token);
  //               navigateTo(context, HomeScreen());
  //               // navigateTo(context, ParentLibraryScreen());
  //               // navigateTo(context, CreateMeetingScreen());
  //             });
  //           });
  //         });
  //       }else{
  //         // setState(() {
  //         //   error=true;
  //         // });
  //         showError();
  //         print("dddddddd");
  //         navigateAndFinish(context, SignInScreen());
  //       }
  //     });
  //
  //   });
  // }

  Future checkLoggedUser(){
    print("kjkhhhhhhhhh");
    bool check;
    String  token="";
    SharedPreferencesHelper.getDomainName().then((domain) async {
      var dbHelper = DbHelper();
      var orgainzationsFuture = dbHelper.getOrganizations();
      orgainzationsFuture.then((orgainzations) {
        setState(() {
          for(int i=0;i<orgainzations.length;i++){
            OrganizationLocalModel leave =orgainzations[i];
            if(domain==leave.domain){
              if(leave.email==emailController.text && leave.password==passwordController.text){
                token=leave.userToken;
                 check=true;
                 break;
              }else{
                check=false;
              }
            }
          }
          // orgainzationsCount = data.length;
          // print(""+"countIs>>"+orgainzationsCount.toString());
        });
      }).then((value){
        if(check){
          SharedPreferencesHelper.setLoggedToken(token).then((value) {
            navigateAndFinish(context, HomeScreenNew());
          });

        }else{
          setState(() {
            error=true;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mCtx=context;
     width = MediaQuery.of(context).size.width;
     height = MediaQuery.of(context).size.height;
     // print("width>>"+width.toString());



   return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (context, state)  {
          if (state is LoginSuccessState) {
            error=false;
            if (state.loginModel!=null) {
              setState(() {
                if(state.loginModel.token!=null) {
                  print("TokenIssssss>>" + state.loginModel.token);
                  SharedPreferencesHelper.setLoggedToken(state.loginModel.token).then((value) async {
                    var dbHelper = DbHelper();

                    SharedPreferencesHelper.getDomainName().then((value) async {
                      // var result = await dbHelper.updateWithName(OrganizationLocalModel(
                      //     domain: value,
                      //     userToken: state.loginModel.token
                      // ));
                      var result = await dbHelper.updateWithName(
                          state.loginModel.token,
                          state.loginModel.name,
                          state.loginModel.image!=null?state.loginModel.image:"",
                          value,
                        emailController.text,
                        passwordController.text
                      );

                      SharedPreferencesHelper.setLoggedUserName(state.loginModel.name).then((value) {
                        SharedPreferencesHelper.setUserImageUrl(state.loginModel.image!=null?state.loginModel.image:"").then((value) {
                          // navigateTo(context, MotherScreen(null));
                          saveUser(state.loginModel).then((value) {
                            print("userIdIS>>" + state.loginModel.id.toString());
                            // navigateAndFinish(context, HomeScreen());
                            navigateAndFinish(context, HomeScreenNew());
                          });
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
              // setState(() {
              //   error=true;
              // });
              // flutterToast(
              //   message: state.loginModel.message,
              //   state: ToastStates.ERROR,
              // );

            }
          }else{
            if(state  is LoginErrorState){
              error=true;
            }
            // setState(() {
            //
            // });
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
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height:30,),
                   if(widget.isback) IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back),color: Colors.black,iconSize: 30,),
                    const SizedBox(height:10,),
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
                          width: width<600?60:70,
                          height: width<600?60:70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // color: greenColor,
                            // boxShadow: [
                            //   BoxShadow(color: greenColor, spreadRadius: 3),
                            // ],
                          ),
                          padding: EdgeInsets.only(left: 2,right: 2,top: 2,bottom: 2),
                          child:logo!=null? CachedNetworkImage(
                              // width: double.infinity,
                              // height: 245,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Image.asset(
                                    "assets/images/loade_color.gif",
                                    width: 100, height: 100,),
                              imageUrl:
                              logo ,
                          ):Align(
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/ic_extra.webp",width: 26,height: 26,color: Colors.white,),
                    )

                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Image.asset("assets/images/ic_extra.webp",width: 26,height: 26,color: Colors.white,),
                          // ),
                        ),
                        const SizedBox(width: 14,),
                        Container(
                            margin: EdgeInsets.only(top: 4),
                            // child: Text(AppLocalizations.of(context).lblCompanyName,style: blueColorBoldStyle(width<600?18:26),)),
                            child: Text(companyName!=null?companyName:"",style: blueColorBoldStyle(width<600?18:26),)),
                      ],
                    ),
                    const SizedBox(height:0,),
                    Center(child: Text(AppLocalizations.of(context).lblManageClinic,style: grayTextColorStyleMedium(width<600?16:22),)),


                    const SizedBox(height:20,),

                    error?Container(
                      // width: width/2+80,
                      margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
                      decoration: BoxDecoration(
                          color: Color(0xfffff1f0),
                          borderRadius: new BorderRadius.circular(10.0),
                          border: Border.all(
                              color: grayRoundedColor,// set border color
                              width: 1.0
                          )
                      ),
                      // height: 56,
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 12),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context).lblInvalidCredentials,
                          style: blueColorStyleMedium(width<600?14:20),
                        ),
                      ),
                    ):Container(),

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
                          input.isNotEmpty?isEmail(input.toString()) ? null :
                          AppLocalizations.of(context).lblEmailNot:
                          AppLocalizations.of(context).lblPleaseEnterEmail,
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
                              return AppLocalizations.of(context).lblPleaseEnterPassword;
                            }
                            // else if (value.length<6) {
                            //   return AppLocalizations.of(context).lblPasswordNotLess;
                            // }
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Container(
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
                                    child: ElevatedButton(
                                      child: Text(
                                        AppLocalizations.of(context).lblLogin,
                                        style: whiteColorStyle(width<600?16:26),
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
                                        if (formKey.currentState.validate()) {
                                          // LoginRequestModel loginRequestModel =new LoginRequestModel( emailController.text, passwordController.text);
                                          // getLoginData(loginRequestModel);
                                          hasNetwork().then((value) {
                                            if(value){
                                              cubit.userLoginFunc(
                                                baseUrl: baseUrl,
                                                email: emailController.text,
                                                password: passwordController.text,
                                              );
                                            }else{
                                              checkLoggedUser();
                                            }
                                          });

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

                          Container(
                            margin: EdgeInsets.only(top:20,left: width/4-14,right: width/4-14),
                            // height: 120,
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
                                      Colors.black,
                                      Colors.black,
                                    ],
                                  ),
                                ),
                                child: ElevatedButton(
                                  child: Text(
                                    AppLocalizations.of(context).lblSignInSso,
                                    style: whiteColorStyle(width<600?16:26),
                                  ),
                                  style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              side: BorderSide(color: Colors.black)
                                          )
                                      )
                                  ),
                                  onPressed: () {
                                    openBottomSheet(context);
                                    // showSSoDialog(context);
                                  },
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height:100,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}