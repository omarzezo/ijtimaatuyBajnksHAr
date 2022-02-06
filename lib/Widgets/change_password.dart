import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';
import 'package:itimaaty/Models/change_password_request_model.dart';
import 'package:itimaaty/Models/change_password_response_model.dart';
import 'package:itimaaty/Repository/UserRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/ProfileScreen.dart';
import 'package:itimaaty/View/SignInScreen.dart';
import 'package:itimaaty/Widgets/text_for.dart';

class ChangePassword extends StatefulWidget {

  BuildContext mContext;
  ChangePassword(this.mContext);
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  var formKey = GlobalKey<FormState>();
  bool _passwordVisible= false;
  bool newPasswordVisible= false;
  bool retypePasswordVisible= false;
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var retypePasswordController = TextEditingController();

  BuildContext mContext;

  void getChangePassword(String token) {
    load();
    UserRepository userRepository = new UserRepository();
    ChangePasswordRequestModel changePasswordRequestModel =new ChangePasswordRequestModel(
     oldPassword: passwordController.text,
      password: newPasswordController.text
    );

    Future<ChangePasswordResponseModel> allList = userRepository.getChangePassword(token,changePasswordRequestModel);
    allList.then((loginModel) {
      setState(() {
        if(loginModel!=null){
          // showSuccess();
          EasyLoading.showSuccess('Your Password has been changing Successfully!');
          Navigator.of(widget.mContext);
          // navigateTo(context, ProfileScreen());
        }else{
          showError();
          print("dddddddd");
          // navigateAndFinish(context, SignInScreen());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mContext=context;
    return Scaffold(
      body: Center(
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

                    customText(text: 'Current Password'),
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
                          style: blueColorStyleMedium(18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 1,),
                    const SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    children: [
                      customText(text: 'New Password'),
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
                                return "Please Enter Password";
                              }else if (value.length<6) {
                                return "Password not less than 6 digits";
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
                      customText(text: 'Retype Password'),
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
                                return "Please Enter Password";
                              }else if (value.length<6) {
                                return "Password not less than 6 digits";
                              }else if (newPasswordController.text!=value) {
                                return "Password not Equal";
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
                                  getChangePassword(value);
                                });
                              }
                            } ,
                            child: customText(text: 'Save Changes',color: Colors.white),)),

                    const SizedBox(height: 30,),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


