import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';
import 'package:itimaaty/Models/change_password_request_model.dart';
import 'package:itimaaty/Models/change_password_response_model.dart';
import 'package:itimaaty/Repository/UserRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/View/SignInScreen.dart';
import 'package:itimaaty/Widgets/change_password.dart';
import 'package:itimaaty/Widgets/item_text.dart';
import 'package:itimaaty/Widgets/EditProfile.dart';
import 'package:itimaaty/Widgets/security.dart';
import 'package:itimaaty/Widgets/text_for.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DrawerWidget.dart';
import 'FontsStyle.dart';


class ProfileScreen extends StatefulWidget {

  @override
  ProfileScreenState createState() => ProfileScreenState();
}


class ProfileScreenState extends State<ProfileScreen> {

  // List<bool> isSelect = [true, false, false, false];

  Widget child = EditProfile();
  int currentIndex = 0;
  bool selectItem = true;
  bool selectItem2 = false;
  bool selectItem3 = false;
  bool selectItem4 = false;
  bool selectItem5 = false;

  GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool _passwordVisible= false;
  bool newPasswordVisible= false;
  bool retypePasswordVisible= false;
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var retypePasswordController = TextEditingController();
  BuildContext mContext;

  void changeScreen(int index) async {
    setState(() {
      currentIndex = index;
      if (currentIndex == 0) {
        child=EditProfile();
        selectItem=true;
        selectItem2=false;
        // selectItem3=false;
        selectItem4=false;
        selectItem5=false;
      }else if (currentIndex == 1) {
        // child=ChangePassword();
        _passwordVisible= false;
        newPasswordVisible= false;
        retypePasswordVisible= false;
        passwordController.text='';
        newPasswordController.text='';
        retypePasswordController.text='';

        // child=changePassword();
        selectItem5=false;
        selectItem=false;
        selectItem2=true;
        // selectItem3=false;
        selectItem4=false;
      }
      // else if (currentIndex == 2) {
      //   child=Signature();
      //   selectItem=false;
      //   selectItem2=false;
      //   selectItem3=true;
      //   selectItem4=false;
      // }
      else if (currentIndex == 3) {
        child= Security(baseUrl);
        // child= Text("gfgfggfhfh");
        selectItem=false;
        selectItem2=false;
        // selectItem3=false;
        selectItem4=true;
        selectItem5=false;
      }
    });

  }

  void getChangePassword(String baseUrl,String token) {
    load();
    UserRepository userRepository = new UserRepository();
    ChangePasswordRequestModel changePasswordRequestModel =new ChangePasswordRequestModel(
        oldPassword: passwordController.text,
        password: newPasswordController.text
    );

    Future<ChangePasswordResponseModel> allList = userRepository.getChangePassword(baseUrl,token,changePasswordRequestModel);
    allList.then((loginModel) {
      setState(() {
        if(loginModel!=null){
          // showSuccess();
          EasyLoading.showSuccess('Your Password has been changing Successfully!');
          changeScreen(0);
          // navigateTo(context, ProfileScreen());
        }else{
          showError();
          print("dddddddd");
          // navigateAndFinish(context, SignInScreen());
        }
      });
    });
  }

  String baseUrl="";

  @override
  void initState() {
    super.initState();
    Constants.draweItem="Profile";
      String baseUri= Constants.BASE_URL;
      setState(() {
        baseUrl=baseUri;
      });
      changeScreen(0);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKeyDrawer,
      backgroundColor: grayColor,
      drawer: DrawerWidget(10),
      body: Column(
        children: [
          Expanded(
            flex:2,
            child: Container(
              // height: 120,
              margin: EdgeInsets.only(left: 14,right: 14,top: 30),
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            print("sddsd");

                            if (scaffoldKeyDrawer.currentState.isDrawerOpen) {
                              scaffoldKeyDrawer.currentState.openEndDrawer();
                            } else {
                              scaffoldKeyDrawer.currentState.openDrawer();
                            }
                          },
                          child: Icon(Icons.menu,color: Colors.black,size: 26,)),
                      Container(
                        child: Text(
                          AppLocalizations.of(context).lblProfilee,
                          style: blueColorBoldStyle(26),
                        ),margin: EdgeInsets.only(top: 0,left: 16,right: 16),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context,false);
                    },
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.only(left: 8,right: 8,top: 4),
                      padding: EdgeInsets.only(left: 14,right: 14,top: 0,bottom: 0),
                      decoration: BoxDecoration(
                          color: Color(0xffeaeaea),
                          // color: Colors.red,
                          border: Border.all(
                              color: Color(0xffeaeaea),
                              width: 0.6
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(9))
                      ),
                      child: Center(
                        child: Text(AppLocalizations.of(context).lblCancel,style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'black',
                            fontWeight: FontWeight.bold,
                            color: Color(0xff617287)
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 20,),
          Expanded(
              flex:9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 0),
                    color: Colors.white,
                    width: (MediaQuery.of(context).size.width/4)+60,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                print("ddddd");
                                selectItem = !selectItem;
                                changeScreen(0);
                              });
                            },
                            child: itemBuild(
                              text: AppLocalizations.of(context).lblEditProfile,
                              icon: Icons.person_outline,
                              border: Border(
                                right: BorderSide(
                                    color: (selectItem == false)
                                        ? Colors.white
                                        : Colors.amber,
                                    width: 2),
                              ),
                              colorContainer: (selectItem == false)
                                  ? Colors.white
                                  : Colors.amber.withOpacity(0.1),
                              colorIcon:
                              (selectItem == false) ? Colors.grey : Colors.amber,
                              colorText:
                              (selectItem == false) ? Colors.grey : Colors.amber,
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                selectItem2 = !selectItem2;
                                changeScreen(1);
                              });
                            },
                            child: itemBuild(
                              text:AppLocalizations.of(context).lblChangePassword,
                              icon: Icons.lock_open,
                              border: Border(
                                right: BorderSide(
                                    color: (selectItem2 == false)
                                        ? Colors.white
                                        : Colors.amber,
                                    width: 2),
                              ),
                              colorContainer: (selectItem2 == false)
                                  ? Colors.white
                                  : Colors.amber.withOpacity(0.1),
                              colorIcon:
                              (selectItem2 == false) ? Colors.grey : Colors.amber,
                              colorText:
                              (selectItem2 == false) ? Colors.grey : Colors.amber,
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                selectItem4 = !selectItem4;
                                changeScreen(3);
                              });
                            },
                            child: itemBuild(
                              text: AppLocalizations.of(context).lblSecurity,
                              icon: Icons.vpn_key,
                              border: Border(
                                right: BorderSide(
                                    color: (selectItem4 == false)
                                        ? Colors.white
                                        : Colors.amber,
                                    width: 2),
                              ),
                              colorContainer: (selectItem4 == false)
                                  ? Colors.white
                                  : Colors.amber.withOpacity(0.1),
                              colorIcon:
                              (selectItem4 == false) ? Colors.grey : Colors.amber,
                              colorText:
                              (selectItem4 == false) ? Colors.grey : Colors.amber,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2+50,bottom: 20),
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: () async{
                                load();
                                setState(()  {
                                  selectItem5 = !selectItem5;
                                  selectItem=false;
                                  selectItem2=false;
                                  selectItem4=false;
                                });
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                // await prefs.clear();
                                // await Future.delayed(Duration(seconds: 2));
                                SharedPreferencesHelper.setLoggedToken("null").then((value) {
                                  removeUser();
                                  showSuccessMsg("Sign out Successfully!");
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => SignInScreen(false),
                                    ),
                                        (Route route) => false,
                                  );
                                });
                              },
                              child: itemBuild(
                                text: AppLocalizations.of(context).lblSignOut,
                                icon: Icons.logout,
                                border: Border(
                                  right: BorderSide(
                                      color: (selectItem5 == false)
                                          ? Colors.white
                                          : Colors.amber,
                                      width: 2),
                                ),
                                colorContainer: (selectItem5 == false)
                                    ? Colors.white
                                    : Colors.amber.withOpacity(0.1),
                                colorIcon:
                                (selectItem5 == false) ? Colors.grey : Colors.amber,
                                colorText:
                                (selectItem5 == false) ? Colors.grey : Colors.amber,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30,)
                        ],
                      ),
                    ),
                  ),


                  // دا الجزء الي هيتعرض فيه الداتا او الصفحات بتاع كل كليك الخاص بكل زرار
                  Expanded(
                      child: Container(
                        color: Colors.grey.shade100,
                        child: currentIndex==1?
                        Center(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 30,),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start ,
                                    children: [

                                      customText(text: AppLocalizations.of(context).lblCurrentPassword),
                                      Container(
                                        width:(MediaQuery.of(context).size.width- (MediaQuery.of(context).size.width/4))/2,
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
                                              }else if (value.length<6) {
                                                return AppLocalizations.of(context).lblPasswordNotLess;
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
                                                    print("ddddd");
                                                    _passwordVisible = !_passwordVisible;
                                                  });
                                                },
                                              ),
                                            ),
                                            style: blueColorStyleMedium(18),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 1,),
                                      const SizedBox(height: 30,),
                                      Column(
                                        crossAxisAlignment:CrossAxisAlignment.start ,
                                        children: [
                                          customText(text: AppLocalizations.of(context).lblNewPassword),
                                          const SizedBox(height: 1,),
                                          Container(
                                            width:(MediaQuery.of(context).size.width- (MediaQuery.of(context).size.width/4))/2,
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
                                                  }else if (value.length<6) {
                                                    return AppLocalizations.of(context).lblPasswordNotLess;
                                                  }
                                                  return null;
                                                  // value.isNotEmpty?null:"Please Enter User Name";
                                                },
                                                keyboardType: TextInputType.text,
                                                controller: newPasswordController,
                                                obscureText: !newPasswordVisible,//This will obscure text dynamically
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixIcon: IconButton(
                                                    icon: Icon(
                                                      newPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                                      size: 20,
                                                      color: blueColor,
                                                    ),
                                                    onPressed: () {
                                                      // Update the state i.e. toogle the state of passwordVisible variable
                                                      setState(() {
                                                        newPasswordVisible = !newPasswordVisible;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                style: blueColorStyleMedium(18),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 30,),
                                      Column(
                                        crossAxisAlignment:CrossAxisAlignment.start ,
                                        children: [
                                          customText(text: AppLocalizations.of(context).lblRetypePassword),
                                          const SizedBox(height: 1,),
                                          Container(
                                            width:(MediaQuery.of(context).size.width- (MediaQuery.of(context).size.width/4))/2,
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
                                                  }else if (value.length<6) {
                                                    return AppLocalizations.of(context).lblPasswordNotLess;
                                                  }else if (newPasswordController.text!=value) {
                                                    return AppLocalizations.of(context).lblPasswordNotEqual;
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
                                                style: blueColorStyleMedium(18),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 200,),
                                      Container(
                                          width:(MediaQuery.of(context).size.width- (MediaQuery.of(context).size.width/4))/2,
                                          // height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.amber
                                          ),
                                          child: MaterialButton(
                                            onPressed: (){
                                              if (formKey.currentState.validate()) {
                                                SharedPreferencesHelper.getLoggedToken().then((value) {
                                                  getChangePassword(baseUrl,value);
                                                });
                                              }
                                            } ,
                                            child: customText(text: AppLocalizations.of(context).lblSaveChanges,color: Colors.white),)),

                                      const SizedBox(height: 30,),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ):child,
                      )),
                ],
              )
          ),
        ],
      ),
    );
  }
}
