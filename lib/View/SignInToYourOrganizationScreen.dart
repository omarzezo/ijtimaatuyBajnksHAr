import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimaaty/LocalDb/DbHelper.dart';
import 'package:itimaaty/LocalDb/OrganizationLocalModel.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/View/CheckYourMailScreen.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/cubit/Organization/organization_cubit.dart';
import 'package:itimaaty/cubit/Organization/organization_states.dart';
import 'package:itimaaty/cubit/User/user_cubit.dart';
import 'package:itimaaty/cubit/User/user_states.dart';

import 'LogInToYourOrganizationScreen.dart';

class SignInToYourOrganizationScreen extends StatefulWidget {


  @override
  SignInToYourOrganizationScreenState createState() => SignInToYourOrganizationScreenState();
}

class SignInToYourOrganizationScreenState extends State<SignInToYourOrganizationScreen> {

  double width;
  double height;

  List orgainzations;
  int orgainzationsCount = 0;
  bool _passwordVisible= false;
  var formKey = GlobalKey<FormState>();
  var igtimaatiURLController = TextEditingController();
  var dbHelper = DbHelper();

  @override
  void initState() {
    Constants.draweItem="Organizations";
  }

  Future<bool> query(String name) async {
    bool m = false;
    if(orgainzations!=null){
      for(int i=0;i<orgainzations.length;i++){
        OrganizationLocalModel localModel =orgainzations[i];
        if(name==localModel.name){
          m=true;
          break;
        }else{
          m=false;
        }
      }
    }
    return m;
  }
  void getProducts(String name , String logo) async {
    var orgainzationsFuture = dbHelper.getOrganizations();
    orgainzationsFuture.then((data) {
      setState(() {
        this.orgainzations = data;
        orgainzationsCount = data.length;
        query(name).then((value) {
          // print("valueIs>>"+value.toString());
          if(value==false){
            addProduct(name, logo);
          }else{
            Navigator.of(context).push(createRoute(LogInToYourOrganizationScreen()));
          }
        });
      });
    });
  }


  void addProduct(String name , String logo) async {
    dbHelper.insert(OrganizationLocalModel(
      name: name,
      logo: logo,
    ));
    Navigator.of(context).push(createRoute(LogInToYourOrganizationScreen()));
    // Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (BuildContext context) => OrganizationCubit(),
      child: BlocConsumer<OrganizationCubit, OrganizationStates>(
        listener: (context, state) async {
          if (state is OrganizationSuccessState) {

            if (state.organizationModel!=null) {
              print("EmailIs>>"+state.organizationModel.name);
              // setState(() {
              //
              // });
            await  getProducts(state.organizationModel.name, state.organizationModel.logo);
              // navigateTo(context, LogInToYourOrganizationScreen());
              // Navigator.pop(context);

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
            resizeToAvoidBottomInset: false,
            backgroundColor: grayColor,
            body: Container(
              child: SingleChildScrollView(
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
                        Center(child: Text(AppLocalizations.of(context).lblSignInToYour,style: blueColorBoldStyle(width<600?22:30),)),
                        Container(
                          margin: EdgeInsets.only(top: 14),
                          height: 0.3,color: grayTextColor,),
                        const SizedBox(height:34,),
                        Center(child: Text(AppLocalizations.of(context).lblEnterYour,style: grayTextColorStyleMedium(width<600?16:20),)),


                        const SizedBox(height:16,),
                        Container(
                            margin: EdgeInsets.only(top:20,left: width/4-14,right: width/4-14),
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
                                      AppLocalizations.of(context).lblContinue,
                                      style: whiteColorStyle(width<600?16:22),
                                    ),
                                    textColor: Colors.white,
                                    color: Colors.transparent,
                                    shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      if (formKey.currentState.validate()) {
                                        cubit.getOrganizationFunc(igtimaatiURLController.text);
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
            ),
          );
        },
      ),
    );
  }

}