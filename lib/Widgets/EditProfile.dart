import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/LoginResponseModel.dart';
import 'package:itimaatysoharsohar/Models/UserProfileModel.dart';
import 'package:itimaatysoharsohar/Repository/UserRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/View/FontsStyle.dart';
import 'package:itimaatysoharsohar/View/ProfileScreen.dart';
import 'package:itimaatysoharsohar/View/SignInScreen.dart';
import 'package:itimaatysoharsohar/Widgets/text_for.dart';
import 'package:image_picker/image_picker.dart';

import '../LocalDb/DbHelper.dart';
import '../LocalDb/DecisionTableOffline.dart';
import '../LocalDb/OfflineDataLocalModel.dart';
import '../Utils/Constants.dart';

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
  String baseUrl="";
  String logoFileUploadString;
  String logoFileUploadStringFileName;
  PickedFile pickedFileImage =null;
  File _image = null;
  String userImage="";
  String token;
  LoginResponseModel model;
  var dbHelper = DbHelper();

  void getProfileData(String baseUrl,String token) {
    // load();
    UserRepository allProductsRepository = new UserRepository();
    Future<String> allList = allProductsRepository.getProfileData(baseUrl,token);
    allList.then((string) {
      setState(() {
        if(string!=null){
          LoginResponseModel loginModel =  LoginResponseModel.fromJson(json.decode(string));
          model=loginModel;
          addOrUpdateOfflineProfile(string);
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
          navigateAndFinish(context, SignInScreen(false));
        }
      });

    });
  }

  void updateProfile(MultipartFile file){
    UserRepository userRepository =new UserRepository();
    load();
    Future<Response> data =userRepository.updateProfile(baseUrl,token,logoFileUpload,
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
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                      });
                      Navigator.pop(context);
                      // getImageFromGallery();
                      checkAndRequestCameraPermissionss();
                    },
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(yellowColor),
                        backgroundColor: MaterialStateProperty.all<Color>(yellowColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: yellowColor)
                            )
                        )
                    ),
                    child: Text("الاستوديو",style: blueColorStyleMediumWithColor(18, Colors.white)),
                  ),
                  // MARK:- camera option
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImageFromCamera();
                      // _pick(ImageSource.camera, callback);
                    },
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(yellowColor),
                        backgroundColor: MaterialStateProperty.all<Color>(yellowColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: yellowColor)
                            )
                        )
                    ),
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
        logoFileUploadString=image.path;
        logoFileUploadStringFileName=fileName;
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
        logoFileUploadString=image.path;
        logoFileUploadStringFileName=fileName;
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

  Future<bool> addOrUpdateOfflineProfile(String string) async {
    var orgainzationsFuture = dbHelper.getOfflineData();
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        OfflineDataLocalModel localModel =data[i];
        if(localModel.url==baseUrl+Constants.PROFILE) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      print("inserstinserst>>"+m.toString());
      if(m){
        var result = await dbHelper.updateProfile(baseUrl+Constants.PROFILE,string);
      }else{
        var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          url: baseUrl+Constants.PROFILE,
          profile: string,
        ));
      }
    });
  }

  Future getOfflineProfile() async {
    // var orgainzationsFuture = dbHelper.getOfflineData();
    var orgainzationsFuture = dbHelper.getProfileColumn(baseUrl+Constants.PROFILE);
    orgainzationsFuture.then((data) {
      setState(()  {
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.PROFILE) {
            setState(() {
              LoginResponseModel loginModel =  LoginResponseModel.fromJson(json.decode(localModel.profile));
              model=loginModel;
              image=loginModel.image;
              nameController.text=loginModel.name!=null?loginModel.name:"";
              phoneNumberController.text=loginModel.phone!=null?loginModel.phone:"";
              positionController.text=loginModel.position!=null?loginModel.position:"";
              emailController.text=loginModel.email!=null?loginModel.email:"";
              birthDate=loginModel.birthdate!=null?loginModel.birthdate:"";
            });
            break;
          }
          // allFilterdMeetingList = allMeetingList;
        }
      });
    });
  }

  void updateOfflineProfile(String name,String email,String phone,String date,String position){
    UserRepository userRepository =new UserRepository();
    load();
    Future<Response> data =userRepository.updateProfile(baseUrl,token,logoFileUpload,
        name,
        email,
        phone,
        position,
        date);
    data.then((value) {
      if(value!=null){
        if(value.statusCode==200) {
          showSuccess();
          setState(() {
            dbHelper.deleteUserProfile(whereArgs:[baseUrl+Constants.PROFILE+"/Update"]);
            getProfileData(baseUrl, token);
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

  sendSavedToApi(){
    var orgainzationsFuture = dbHelper.getUserProfile(baseUrl+Constants.PROFILE+"/Update");
    bool m=false;
    orgainzationsFuture.then((data) async {
      if(data.isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          DecisionTableOffline localModel = data[i];
          if (localModel.url == baseUrl + Constants.PROFILE + "/Update") {
            m = true;
            UserProfileModel userProfileModel = UserProfileModel.fromJson(json.decode(localModel.userProfile));
            print("userProfileModel>>" + userProfileModel.image.toString());
            print("userProfileModel>>" + userProfileModel.name.toString());
            MultipartFile.fromFile(userProfileModel.image, filename: userProfileModel.fileName).then((value) {
              setState(() {
                logoFileUpload = value;
              });
            });
            updateOfflineProfile(userProfileModel.name, userProfileModel.email,
                userProfileModel.phone, userProfileModel.date,
                userProfileModel.position);
            break;
          } else {
            m = false;
            getProfileData(baseUrl, token);
          }
        }
      }else{
        getProfileData(baseUrl, token);
      }
    });
  }


  Future<bool> addOrUpdateProfileForSave() async {
    var orgainzationsFuture = dbHelper.getUserProfile(baseUrl+Constants.PROFILE+"/Update");
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        DecisionTableOffline localModel =data[i];
        if(localModel.url == baseUrl+Constants.PROFILE+"/Update") {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      if(m){
        print("Updatettt>>"+m.toString());
         await dbHelper.updateUserProfile(baseUrl+Constants.PROFILE+"/Update",fillString()).then((value) {
           // LoginResponseModel loginModel =  LoginResponseModel();
           model.name=nameController.text;
           model.email=emailController.text;
           model.phone=phoneNumberController.text;
           model.position=positionController.text;
           model.birthdate=dateOfBirthController.text;
           String jsonUser = jsonEncode(model);
           addOrUpdateOfflineProfile(jsonUser);
         });
      }else{
        print("Insertttt>>"+m.toString());
        var result = await dbHelper.insertRequestsData(DecisionTableOffline(
          url: baseUrl+Constants.PROFILE+"/Update",
          userProfile: fillString(),
        )).then((value) {
          model.name=nameController.text;
          model.email=emailController.text;
          model.phone=phoneNumberController.text;
          model.position=positionController.text;
          model.birthdate=birthDate;
          String jsonUser = jsonEncode(model);
          addOrUpdateOfflineProfile(jsonUser);
        });
      }
    });
  }

  String fillString(){
    UserProfileModel userProfileModel=new UserProfileModel(
        image: logoFileUploadString,
        name: nameController.text,
        fileName: logoFileUploadStringFileName,
        position: positionController.text,
        phone: phoneNumberController.text,
        date: birthDate,
        email: emailController.text);
    String str = jsonEncode(userProfileModel);
    return str;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferencesHelper.getLoggedToken().then((tok) {
      token=tok;
        String baseUri= Constants.BASE_URL;
        setState(() {
          baseUrl=baseUri;
        });
        hasNetwork().then((hasNet) {
          if(hasNet) {
            sendSavedToApi();
            // getProfileData(baseUrl, tok);
          }else{
            getOfflineProfile();
          }
        });


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
                  child:Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        InkWell(
                          onTap: () {
                            openDialog();
                            print("hhhhhhh");
                          },
                          child:_image==null?
                          ClipOval(
                            child: CachedNetworkImage(
                                width: 110,
                                height: 110,
                                fit: BoxFit.cover,
                                imageUrl: image!=null?image:
                                "https://upload.wikimedia.org/wikipedia/commons"
                                    "/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"),
                          ):
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
                        ),
                        InkWell(
                          onTap: () {
                            // openDialog();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber
                            ),
                            child: IconButton(onPressed: (){
                              openDialog();
                            }, icon: const Icon(Icons.edit,size: 15,),color: Colors.white,),
                          ),
                        ),
                      ],
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
                          hasNetwork().then((value) {
                            if(value){
                              updateProfile(logoFileUpload);
                            }else{
                              addOrUpdateProfileForSave();
                              showSuccessMsg(AppLocalizations.of(context).lblSaveSuccessfuly);
                            }
                          });

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
