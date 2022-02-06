import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';
import 'package:itimaaty/Repository/UserRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/ProfileScreen.dart';
import 'package:itimaaty/View/SignInScreen.dart';
import 'package:itimaaty/Widgets/text_for.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {

  @override
  _EditProfileState createState() => _EditProfileState();
}

DateTime dateTime;

class _EditProfileState extends State<EditProfile> {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var positionController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var emailController = TextEditingController();
 String image;
 String birthDate="";

  File logoFile;
  MultipartFile logoFileUpload;
  PickedFile pickedFileImage =null;
  File _image = null;
  String userImage="";
  String token;

  void getProfileData(String token) {
    // load();
    UserRepository allProductsRepository = new UserRepository();
    Future<LoginResponseModel> allList = allProductsRepository.getProfileData(token);
    allList.then((loginModel) {
      setState(() {
        if(loginModel!=null){
          // showSuccess();
          image=loginModel.image;
          print("image>>"+image.toString());
          nameController.text=loginModel.name!=null?loginModel.name:"";
          phoneNumberController.text=loginModel.phone!=null?loginModel.phone:"";
          positionController.text=loginModel.position!=null?loginModel.position:"";
          emailController.text=loginModel.email!=null?loginModel.email:"";
          birthDate=loginModel.birthdate!=null?loginModel.birthdate:"";
        }else{
          showError();
          print("dddddddd");
          navigateAndFinish(context, SignInScreen());
        }
      });

    });
  }

  void updateProfile(MultipartFile file){
    UserRepository userRepository =new UserRepository();
    load();
    Future<Response> data =userRepository.updateProfile(token,logoFileUpload,
    nameController.text,
    emailController.text,
    phoneNumberController.text,
    positionController.text,
    birthDate);

    data.then((value) {
      if(value!=null){
        if(value.statusCode==200) {
          showSuccess();
          setState(() {
            Navigator.pop(context);
            navigateTo(context, ProfileScreen());
            print("data>>" + value.statusCode.toString());
          });
        }
      }else{
        showError();
        if(value==null){
          // navigateAndFinish(context, SignInScreen());
        }
      }
    });
  }

  openDialog() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: Color(0x00ffffff),
        builder: (BuildContext context) {
          return Center(
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width/4,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(14)),
                border: Border.all(
                  width: 0.4,
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                      });
                      Navigator.pop(context);
                      // getImageFromGallery();
                      checkAndRequestCameraPermissionss();
                    },
                    color: yellowColor,
                    child: Text("الاستوديو",style: blueColorStyleMediumWithColor(18, Colors.white)),
                  ),
                  // MARK:- camera option
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImageFromCamera();
                      // _pick(ImageSource.camera, callback);
                    },
                    color: yellowColor,
                    child: Text("الكاميرا",style: blueColorStyleMediumWithColor(18, Colors.white)),
                  )
                ],
              ),
            ),
          );
        });
  }

  checkAndRequestCameraPermissionss() async {
    final picker = ImagePicker();

    try {
      final image = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 75,
        maxHeight: 300,
        maxWidth: 400,
      );
      print("ImageIs>>"+image.toString());
      setState(() {
        logoFile = File(image.path);
        _image=logoFile;
        var fileName = (image.path.split('/').last);
        MultipartFile.fromFile(image.path, filename: fileName).then((value) {
          logoFileUpload=value;
          print("logoFileUpload>>"+logoFileUpload.toString());
          if(logoFileUpload!=null) {
            // userRepository=new UserRepository();
            // userRepository.upload(logoFile);
            // uploadFile(logoFileUpload);
          }
        });
      });
      // logoFile = await FlutterExifRotation.rotateImage(path: image.path);
      setState(() {
        if(logoFile!=null){
          setState(() {
            _image=logoFile;
          });
        }
      });

    } catch (e) {
      // print(e.code);
    }
  }

  Future getImageFromCamera() async {
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: ImageSource.camera , imageQuality: 40);
    final File file = File(image.path);
    if(file!=null) {
      setState(()  {
        _image=file;
        var fileName = (image.path.split('/').last);
        MultipartFile.fromFile(image.path, filename: fileName).then((value) {
          logoFileUpload=value;
          print("logoFileUpload>>"+logoFileUpload.toString());
          if(logoFileUpload!=null) {
            // userRepository=new UserRepository();
            // userRepository.upload(logoFile);
            // updateProfile(logoFileUpload);
          }
        });
      });
    }
    if(image == null){
      print("null Image");
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferencesHelper.getLoggedToken().then((value) {
      token=value;
      getProfileData(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // const SizedBox(height: 30,),
                Container(
                  // height: 100,
                  // width: 100,
                  child: InkWell(
                    onTap: () {
                      openDialog();
                    },
                    child: Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                           CircleAvatar(
                            backgroundImage:
                            _image!=null?
                            new FileImage(_image) :
                            NetworkImage(
                             image!=null?image:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                            ),
                            backgroundColor: Colors.white,maxRadius: 50,
                            child:image!=null? null:Icon(Icons.person,color: Colors.grey,size: 60,),
                           ),
                          Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber
                            ),
                            child: IconButton(onPressed: (){}, icon: const Icon(Icons.edit,size: 15,),color: Colors.white,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    customText(text: AppLocalizations.of(context).lblName),
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
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).lblPleaseEnterName;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24,),

                Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    customText(text: AppLocalizations.of(context).lblPosition),
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
                      child: TextFormField(
                        controller: positionController,
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return "Please Enter Position";
                        //   }
                        //   return null;
                        // },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24,),
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    customText(text: AppLocalizations.of(context).lblPhoneNumber),
                    const SizedBox(height: 1,),
                    Container(
                      width: (MediaQuery.of(context).size.width- (MediaQuery.of(context).size.width/4))/2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(10.0),
                          border: Border.all(
                              color: grayRoundedColor,// set border color
                              width: 1.0
                          )
                      ),
                      child: TextFormField(
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppLocalizations.of(context).lblPleasePhoneNumber;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 24,),

                InkWell(
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2025)).then((date) {
                      setState(() {
                        dateTime = date;
                        birthDate =getFormattedDateProfile(dateTime);
                        print("datekkkk>"+birthDate.toString());
                      });
                    } );
                  },
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(text: AppLocalizations.of(context).lblDateOfBirth),
                      const SizedBox(height: 1,),
                      Stack(
                        alignment:AppLocalizations.of(context).locale=="en"? Alignment.centerRight:Alignment.centerLeft,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 16,bottom: 30,left: 10,right: 10),
                            width: (MediaQuery.of(context).size.width- (MediaQuery.of(context).size.width/4))/2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: grayRoundedColor,// set border color
                                    width: 1.0
                                )
                            ),
                            child: Text(birthDate),
                          ),
                          // DateRangePickerDialog(firstDate: DateTime(1950), lastDate: DateTime(2020)),
                          Positioned(
                              top: 5,
                              child: IconButton(
                                splashRadius: 5,
                                splashColor: Colors.white,
                                onPressed: (){
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1990),
                                      lastDate: DateTime(2025)).then((date) {
                                        setState(() {
                                          dateTime = date;
                                          birthDate =getFormattedDateProfile(dateTime);
                                          print("datekkkk>"+birthDate.toString());
                                        });
                                  } );
                              }, icon: const Icon(Icons.date_range,color: Colors.grey,),))
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24,),

                Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    customText(text: AppLocalizations.of(context).lblEmail),
                    const SizedBox(height: 1,),
                    Container(
                      width: (MediaQuery.of(context).size.width- (MediaQuery.of(context).size.width/4))/2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(10.0),
                          border: Border.all(
                              color: grayRoundedColor,// set border color
                              width: 1.0
                          )
                      ),
                      child: TextFormField(
                        controller: emailController,
                        validator:(input) =>
                        input.isNotEmpty?isEmail(input.toString()) ?
                        null : AppLocalizations.of(context).lblEmailNot:AppLocalizations.of(context).lblPleaseEnterEmail,

                        decoration: InputDecoration(fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Container(
                    width: (MediaQuery.of(context).size.width- (MediaQuery.of(context).size.width/4))/4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        print("kkkkkkkkkkkkkk");
                        if (formKey.currentState.validate()) {
                         // if(logoFileUpload!=null){
                           updateProfile(logoFileUpload);
                         // }else{
                         //   showErrorWithMsg("please Choose Image");
                         // }
                        }
                    } ,
                      child: customText(text: AppLocalizations.of(context).lblSaveChanges,color: Colors.white),)),

                const SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
