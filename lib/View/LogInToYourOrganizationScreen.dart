import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimaaty/LocalDb/DbHelper.dart';
import 'package:itimaaty/LocalDb/OrganizationLocalModel.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/MyOrganizationsResponseModel.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/CheckYourMailScreen.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/HomeScreenNew.dart';
import 'package:itimaaty/cubit/Organization/organization_cubit.dart';
import 'package:itimaaty/cubit/Organization/organization_states.dart';
import 'package:itimaaty/cubit/User/user_cubit.dart';
import 'package:itimaaty/cubit/User/user_states.dart';

import '../LocalDb/SharedPreferencesHelper.dart';
import '../Utils/Constants.dart';
import 'HomeScreen.dart';
import 'SignInScreen.dart';

class LogInToYourOrganizationScreen extends StatefulWidget {

  @override
  LogInToYourOrganizationScreenState createState() => LogInToYourOrganizationScreenState();
}

class LogInToYourOrganizationScreenState extends State<LogInToYourOrganizationScreen> {

  var formKey = GlobalKey<FormState>();
  var igtimaatiURLController = TextEditingController();
  var dbHelper = DbHelper();
  List orgainzations;
  int orgainzationsCount = 0;
  double width;
  double height;
  bool error= false;

  @override
  void initState() {
    print("hiiiiiiOmar");
    getProducts();
  }

  void getProducts() async {
    var orgainzationsFuture = dbHelper.getOrganizations();
    orgainzationsFuture.then((data) {
      setState(() {

        this.orgainzations = data;
        orgainzationsCount = data.length;
        print(""+"countIs>>"+orgainzationsCount.toString());
      });
    });
  }

  void addProduct(String name , String logo) async {
    var result = await dbHelper.insert(OrganizationLocalModel(
      domain: igtimaatiURLController.text,
      name: name,
      logo: logo,
      link: Constants.BASE_URL,
    ));
    getProducts();
  }

  Future<bool> query(String name) async {
    bool m = false;
    if(orgainzations!=null){
      for(int i=0;i<orgainzations.length;i++){
        OrganizationLocalModel localModel =orgainzations[i];
        print("mm>>"+localModel.name.toString());
        if(name==localModel.domain){
          m=true;
          break;
        }else{
          m=false;
        }
      }
    }
    return m;
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    Widget leaveRow(OrganizationLocalModel leave,int index) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(10.0),
            border: Border.all(
                color: grayRoundedColor,// set border color
                width: 1.0
            )
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:CachedNetworkImage(
                      height:width<600?40: 60,
                      width:width<600?40: 50,
                      fit: BoxFit.fill,
                      imageUrl: leave.logo
                  )
        // Image.network(
        //             // "https://www.bhaktiphotos.com/wp-content/uploads/2018/04/Mahadev-Bhagwan-Photo-for-Devotee.jpg",
        //             leave.logo,
        //             height:width<600?40: 60,
        //             width:width<600?40: 50,
        //             fit: BoxFit.fill,
        //           ),
                ),
                const SizedBox(width: 14,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(leave.name,style: blueColorBoldStyle(width<600?16:20),),
                    const SizedBox(height: 2,),
                    Text(leave.link!=null?leave.link:"",style: grayTextColorStyleMedium(width<600?14:18),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Container(
              // padding: EdgeInsets.only(top: 4,bottom: 2),
              width: MediaQuery.of(context).size.width,
              // height: 43.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.9],
                  colors: [
                    yellowLightColor,
                    yellowLightColor,
                  ],
                ),
              ),
              child: ElevatedButton(
                child: Text(
                  AppLocalizations.of(context).lblLaunch,
                  style: whiteColorStyle(width<600?16:22),
                ),
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all<TextStyle>(whiteColorStyle(width<600?16:22)),
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
                  var orgainzationsFuture = dbHelper.getOrganizations();
                  orgainzationsFuture.then((data) {
                    setState(() {
                      this.orgainzations = data;
                      for(int i=0;i<orgainzations.length;i++){
                        OrganizationLocalModel localModel =orgainzations[i];
                        print("mm>>"+localModel.name.toString());
                        if(leave.domain==localModel.domain){
                          if(localModel.userToken!=null&&localModel.userToken.isNotEmpty){
                            print("userToken>>"+"tokenIsNotNull");
                            SharedPreferencesHelper.setLoggedToken(leave.userToken).then((value) {
                              SharedPreferencesHelper.setDomainName(leave.domain).then((value) {
                                // navigateAndFinish(context, HomeScreen());
                                navigateAndFinish(context, HomeScreenNew());
                              });
                            });
                          }else{
                            print("userToken>>"+"tokenIsNull");
                            // SharedPreferencesHelper.setLoggedToken(leave.userToken).then((value) {
                            SharedPreferencesHelper.setOrg(leave.name).then((value){
                              SharedPreferencesHelper.setOrgLogo(leave.logo).then((value){
                                SharedPreferencesHelper.setDomainName(leave.domain).then((value) {
                                  navigateAndFinish(context, SignInScreen(false));
                                });
                              });
                            });

                            // });
                            // Navigator.of(context).push(createRoute(SignInScreen()));
                          }
                          break;
                        }else{
                        }
                      }
                    });
                  });

                  // SharedPreferencesHelper.setLoggedToken(leave.userToken).then((value) {
                  //   SharedPreferencesHelper.setDomainName(leave.domain).then((value) {
                  //     navigateAndFinish(context, HomeScreen());
                  //   });
                  // });

                  // if (formKey.currentState.validate()) {
                  //   cubit.userLoginFunc(
                  //     email: emailController.text,
                  //     password: passwordController.text,
                  //   );
                  // }
                },
              ),
            ),
            const SizedBox(height: 8,),
          ],
        ),
      );
    }

    final makeBody = Container(
        margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
        child:
        Expanded(
          child: SizedBox(
            child: orgainzations!=null? orgainzations.isNotEmpty?ListView.builder(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: orgainzations.length,
              itemBuilder: (context, index) {
                return leaveRow(orgainzations[index],index);
              },
            ):Center(
              child: Text("No Organizations",style: TextStyle(
                  color: blueColor,
                  fontSize: width<600?16:22,
                  fontWeight: FontWeight.bold,
                  fontFamily:'black'
              ),),
            ):Container(),
          ),
        )

    );

    return BlocProvider(
      create: (BuildContext context) => OrganizationCubit(),
      child: BlocConsumer<OrganizationCubit, OrganizationStates>(
        listener: (context, state) async {
          if (state is OrganizationSuccessState) {

            if (state.organizationModel!=null) {
              print("EmailIs>>"+state.organizationModel.name);
              query(igtimaatiURLController.text).then((value) {
                print("valueIs>>"+value.toString());
                if(value==false){
                  error=false;
                  addProduct(state.organizationModel.name, state.organizationModel.logo);
                }else{
                  error=true;
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
          var cubit = OrganizationCubit.get(context);

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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height:60,),
                          Center(child: Text(AppLocalizations.of(context).lblSignInToYour,style: blueColorBoldStyle(width<600?22:30),)),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 0.3,color: grayTextColor,),

                          const SizedBox(height:40,),
                          Center(child: Text(AppLocalizations.of(context).lblEnterYour,style: grayTextColorStyleMedium(width<600?16:22),)),


                          const SizedBox(height:30,),
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
                                AppLocalizations.of(context).lblAlready,
                                style: blueColorStyleMedium(width<600?14:20),
                              ),
                            ),
                          ):Container(),
                          const SizedBox(height:30,),
                          Container(
                              margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
                              child: Text(AppLocalizations.of(context).lblIgtimaatiURL,style: blueColorStyleMedium(width<600?14:20),)),
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
                            padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                            child: Center(
                              child: TextFormField(
                                controller: igtimaatiURLController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please Enter Domain";
                                    }
                                    return null;
                                    // value.isNotEmpty?null:"Please Enter User Name";
                                  }
                              ),
                            ),
                          ),
                          const SizedBox(height:40,),
                          Container(
                            margin: EdgeInsets.only(left: width/4-14,right: width/4-14),
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
                                AppLocalizations.of(context).lblContinue,
                                style: whiteColorStyle(width<600?16:22),
                              ),
                              style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(yellowColor),
                                  backgroundColor: MaterialStateProperty.all<Color>(yellowColor),
                                  textStyle: MaterialStateProperty.all<TextStyle>(whiteColorStyle(width<600?16:22)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          side: BorderSide(color: yellowColor)
                                      )
                                  )
                              ),
                              onPressed: () {
                                if (formKey.currentState.validate()) {

                                  cubit.getOrganizationFunc(igtimaatiURLController.text);
                                }
                              },
                            ),
                          ),
                          const SizedBox(height:60,),
                          Center(child: Text(AppLocalizations.of(context).lblAlready,style: grayTextColorStyleMedium(width<600?16:22),)),
                          // const SizedBox(height:20,),
                          makeBody
                        ],
                      ),
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