import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/AddMeetingRequestModel.dart';
import 'package:itimaaty/Models/add_meeting_response_model.dart';
import 'package:itimaaty/Models/committee_response_model.dart';
import 'package:itimaaty/Repository/MeetingRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Utils/GetLocation.dart';
import 'package:itimaaty/Utils/LocationClass.dart';
import 'package:itimaaty/View/DrawerWidget.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/Widgets/CustomSwitch.dart';
import 'package:itimaaty/cubit/User/user_cubit.dart';
import 'package:itimaaty/cubit/User/user_states.dart';
import 'package:intl/intl.dart';

import '../Utils/Constants.dart';
import 'SignInScreen.dart';

class CreateMeetingScreen extends StatefulWidget {


  @override
  CreateMeetingScreenState createState() => CreateMeetingScreenState();
}

class CreateMeetingScreenState extends State<CreateMeetingScreen> {

  List<int> hoursList =[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23];
  List<int> minutesList =[0,15,30,45];
  bool selectedMinutes=false;
  var formKey = GlobalKey<FormState>();
  var meetingController = TextEditingController();
  var descriptionController = TextEditingController();
  var locationController = TextEditingController();
  bool isSwitched =false;
  double width;
  double height;
  DateTime selectedDate = DateTime.now();
  DateTime selectedTime = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd h:mm a','en');
  // final DateFormat timeFormat = DateFormat('HH:mm a');
  final DateFormat timeFormat = DateFormat('h:mm','en');
  String dateTimeValue;
  String timeValueInitiate="01:00";
  int timeValueHours=1;
  int timeValueMinutes=0;
  String token;
  String committeeId;
  int virtual=0;
  // String location;
  MeetingRepository meetingRepository =new MeetingRepository();
  List<CommitteeResponseModelData> allCommitteList = [];
  CommitteeResponseModelData committeeResponseModelData;
  AddMeetingRequestModel addMeetingRequestModel =new AddMeetingRequestModel();
  int _selectedIndex = 0;
  int _selectedIndexMinutes = 0;
  bool isExpanded=false;
  // LatLng position;

  Future<void> callDateTime() async {
    final selectedDate = await selectDateTime(context);
    if (selectedDate == null) return;
    print(selectedDate);
    final selectedTime = await selectTime(context);
    if (selectedTime == null) return;
    print("selectedTimeis>>"+selectedTime.toString());

    setState(() {
      this.selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,

      );
      dateTimeValue=dateFormat.format(this.selectedDate);
      // print("dateFormat>>"+dateFormat.format(this.selectedDate));
      // dateFormat.format(selectedDate);
    });
  }

  void getAllCommites(String baseUrl,String token) {
    print("tokenISSSS>"+token.toString());
    this.token=token;
    load();
    meetingRepository = new MeetingRepository();
    Future<String> allList = meetingRepository.getAllCommittes(baseUrl,token);
    allList.then((string) {
      setState(() {
        if (string != null) {
          showSuccess();
          final jsonData = jsonDecode(string);
          CommitteeResponseModel value =  CommitteeResponseModel.fromJson(jsonData);
          allCommitteList = value.data;
        }else{
          showError();
          if(string==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });
  }

  void addMeeting(String token) {
    print(""+selectedTime.hour.toString());
    print(""+selectedTime.minute.toString());
    load();
    addMeetingRequestModel=new AddMeetingRequestModel(
        title: meetingController.text,
    description: descriptionController.text,
    startDate: dateTimeValue,
    duration: (((timeValueHours)*60)+timeValueMinutes).toString(),
      committeeId: committeeId,
      location: locationController.text,
      virtual: virtual
    );
    meetingRepository = new MeetingRepository();
    Future<AddMeetingResponseModel> response = meetingRepository.addMeeting(baseUrl,token,addMeetingRequestModel);
    response.then((value) {
      setState(() {
        if (value != null) {
          showSuccess();
          Navigator.pop(context,true);
          // allCommitteList = value.data;
        }else{
          showError();
        }
      });
    });
  }


  // Future<String> getAddress(LatLng latLng)async{
  //   // var address = await Geocoder.local.findAddressesFromCoordinates(new Coordinates(latLng.latitude, latLng.longitude)) ;
  //   List<Placemark> placemarks = await Geolocator().placemarkFromCoordinates(latLng.latitude, latLng.longitude);
  //
  //   return placemarks.first.name ;
  //   // return placemarks.first.country ;
  //   // return address.first.addressLine ;
  // }

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }
  _onSelectedMinutes(int index) {
    setState(() => _selectedIndexMinutes = index);
  }
  String userToken;
  String baseUrl;



  @override
  void initState() {
    SharedPreferencesHelper.getLoggedToken().then((value) {
      userToken=value;

    }).then((value) {
        String baseUri= Constants.BASE_URL;
        setState(() {
          baseUrl=baseUri;
        });
        getAllCommites(baseUrl,userToken);
    });
  }

  Widget appBAr (BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
            const SizedBox(width: 10,),
            Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(AppLocalizations.of(context).lblCreateMeeting,style: blueColorBoldStyle(22),))
          ],
        ),
        InkWell(
          onTap: () {
          Navigator.pop(context,false);
          },
          child: Container(
            margin: EdgeInsets.only(left: 8,right: 8,top: 4),
            padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 6),
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
                  fontSize: width<600?14:18,
                  fontFamily: 'black',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff617287)
              ),),
            ),
          ),
        )
      ],
    );
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
              // navigateTo(context, WelcomeScreen(state.loginModel.name));
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
            body: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 16,right: 16,top: 60),
                    child: appBAr(context)),
                Expanded(
                  child: Container(
                    // padding: ,
                    child: SingleChildScrollView(
                      child: Form(
                         key: formKey,
                        child: Container(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/3-100,right: MediaQuery.of(context).size.width/3-100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[


                              const SizedBox(height:30,),
                              Text(AppLocalizations.of(context).lblMeetingTitle,style: blueColorStyleMedium(width<600?14:24),),
                              const SizedBox(height:6,),
                              Container(
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
                                    controller: meetingController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    validator:(value) {
                                      if (value.isEmpty) {
                                        return "Please Enter Title";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),

                              const SizedBox(height:20,),
                              Text(AppLocalizations.of(context).lblCommittee,style: blueColorStyleMedium(width<600?14:22),),
                              const SizedBox(height:6,),
                              Container(
                                width: MediaQuery.of(context).size.width,
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
                                child:DropdownButton<CommitteeResponseModelData>(
                                  isExpanded: true,
                                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                                  iconSize: 22,
                                  elevation: 16,
                                  style: blueColorStyleMedium(width<600?16:22),
                                  underline: Container(
                                    height: 0,
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (CommitteeResponseModelData value) {
                                    setState(() {
                                      committeeResponseModelData=value;
                                      committeeId=value.id.toString();
                                    });
                                  },
                                  value: committeeResponseModelData,
                                  items: allCommitteList.map((CommitteeResponseModelData value) {
                                    return DropdownMenuItem<CommitteeResponseModelData>(
                                      value: value,
                                      child: Text(value.name),
                                    );
                                  }).toList(),
                                ),
                              ),


                              const SizedBox(height:20,),
                              Text(AppLocalizations.of(context).lblDescription,style: blueColorStyleMedium(width<600?14:22),),
                              const SizedBox(height:6,),
                              Container(
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
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "Please Enter Description";
                                    //   }
                                    //   return null;
                                    // },
                                    keyboardType: TextInputType.text,
                                    controller: descriptionController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),


                              const SizedBox(height:20,),
                              Text(AppLocalizations.of(context).lblDate,style: blueColorStyleMedium(width<600?14:22),),
                              const SizedBox(height:6,),
                              InkWell(
                                onTap: ()  {
                                callDateTime();
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: grayRoundedColor,// set border color
                                          width: 1.0
                                      )
                                  ),
                                  // height: 56,
                                  padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(dateTimeValue!=null?dateTimeValue:"",style:blueColorStyleMedium(width<600?16:20) ,),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.calendar_today,size: 16,color: grayTextColor,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height:20,),
                              Text(AppLocalizations.of(context).lblDuration,style: blueColorStyleMedium(width<600?14:22),),
                              const SizedBox(height:6,),
                              InkWell(
                                onTap: () {
                                  // callTime();
                                  setState(() {
                                    isExpanded=!isExpanded;
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: grayRoundedColor,// set border color
                                          width: 1.0
                                      )
                                  ),
                                  // height: 56,
                                  padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(""+timeValueHours.toString()+" : "+timeValueMinutes.toString(),style:blueColorStyleMedium(width<600?16:22) ,),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.timer,size: 16,color: grayTextColor,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height:20,),
                             isExpanded? Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color:Colors.white,
                                    borderRadius: new BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: yellowColor,// set border color
                                        width: 2.0
                                    ),
                                ),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: hoursList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          timeValueHours=hoursList[index];
                                          _onSelected(index);
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 8),
                                          decoration: BoxDecoration(
                                            color: _selectedIndex==index?yellowColor: Colors.white,
                                            borderRadius: new BorderRadius.circular(10.0),
                                            border: Border.all(
                                                color: yellowColor,// set border color
                                                width: 1.0
                                            ),
                                          ),
                                        margin: EdgeInsets.only(bottom: 10,top: 20,right: 10,left: 10),
                                        child: Center(
                                          child: Text((index==0||index==1||index==2||index==3||index==4||index==5
                                              ||index==6||index==7||index==8
                                          )?"0"+hoursList[index].toString():hoursList[index].toString(),
                                          style: TextStyle(
                                            color:_selectedIndex==index?Colors.white: Colors.black,
                                            fontSize: width<600?16:22,
                                            fontFamily: 'regular'
                                          ),),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ):Container(),
                              isExpanded? const SizedBox(height:20,):Container(),
                              isExpanded? Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: new BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: yellowColor,// set border color
                                      width: 1.0
                                  ),
                                ),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: minutesList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          timeValueMinutes=minutesList[index];
                                          _onSelectedMinutes(index);
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 12,right: 12,top: 10,bottom: 6),
                                        decoration: BoxDecoration(
                                          color: _selectedIndexMinutes==index?yellowColor: Colors.white,
                                          borderRadius: new BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: yellowColor,// set border color
                                              width: 1.0
                                          ),
                                        ),
                                        margin: EdgeInsets.only(bottom: 10,top: 20,right: 10,left: 10),
                                        child: Center(
                                          child: Text(index==0?"0"+minutesList[index].toString():minutesList[index].toString(),
                                            style: TextStyle(
                                                color:_selectedIndexMinutes==index?Colors.white: Colors.black,
                                                fontSize: width<600?16:22,
                                                fontFamily: 'regular'
                                            ),),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ):Container(),

                              isExpanded? const SizedBox(height:20,):Container(),
                              Text(AppLocalizations.of(context).lblLocation,style: blueColorStyleMedium(width<600?14:22),),
                              const SizedBox(height:6,),
                              Row(
                                children: [
                                  Expanded(
                                    flex:5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: grayRoundedColor,// set border color
                                              width: 1.0
                                          )
                                      ),
                                      // height: 56,
                                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                      child: Center(
                                        child: TextFormField(
                                          // validator: (value) {
                                          //   if (value.isEmpty) {
                                          //     return "Please Enter Location";
                                          //   }
                                          //   return null;
                                          // },
                                          keyboardType: TextInputType.text,
                                          controller: locationController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 18,),
                                  Expanded(
                                    flex:1,
                                    child: InkWell(
                                      onTap: () async{
                                        //       this.position = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => GetLocation()));
                                        // if (position != null) {
                                        //   print("loaction is in : : ${position.latitude},${position.longitude}");
                                        //   String address = await getAddress(position);
                                        //   locationController.text = await getAddress(position);
                                        //   setState(() {
                                        //     print("address${address}");
                                        //     // this.address = address;
                                        //   });
                                        // }

                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: new BorderRadius.circular(10.0),
                                            border: Border.all(
                                                color: grayRoundedColor,// set border color
                                                width: 1.0
                                            )
                                        ),
                                        // height: 56,
                                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                                        child:Align(
                                          alignment: Alignment.center,
                                          child: Icon(Icons.map,size: 16,color: grayTextColor,),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Divider(color: Colors.grey,height: 0.4,),
                              const SizedBox(height: 30,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.only(left: 8,right: 8,top: 4),
                                        padding: EdgeInsets.only(left: 8,right: 8,top: 7,bottom: 3),
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
                                          child: Icon(Icons.architecture_sharp,size:20 ,),
                                        ),
                                      ),
                                      const SizedBox(width: 14,),
                                      Container(
                                          margin: EdgeInsets.only(top:6),
                                          child: Text(AppLocalizations.of(context).lblSetAs,style: blueColorBoldStyle(width<600?14:24),))
                                    ],
                                  ),
                                  CustomSwitch(
                                    value: isSwitched,
                                    onChanged: (bool val){
                                      setState(() {
                                        isSwitched = val;
                                        if(val){
                                          virtual=1;
                                        }else{
                                          virtual=0;
                                        }
                                      });
                                    },
                                  )
                                ],
                              ),


                              const SizedBox(height: 30,),

                              Container(
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
                                        AppLocalizations.of(context).lblCreate,
                                        style: whiteColorStyle(width<600?16:22),
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
                                          if(committeeId!=null){
                                            if(dateTimeValue!=null ){
                                              addMeeting(token);
                                            }else{

                                            }
                                          }else{

                                          }
                                        }
                                      },
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}