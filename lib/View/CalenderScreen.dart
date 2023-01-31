import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/MyCalenderClass.dart';
import 'package:itimaatysoharsohar/Models/calender_response_model.dart';
import 'package:itimaatysoharsohar/Models/news_response_model.dart';
import 'package:itimaatysoharsohar/Repository/CalenderRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/Widgets/HomeWidgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../Utils/Constants.dart';
import 'DrawerWidget.dart';
import 'FontsStyle.dart';
import 'SignInScreen.dart';

class CalenderScreen extends StatefulWidget {

  @override
  CalenderScreenState createState() => CalenderScreenState();
}

DateTime dateTime;

class CalenderScreenState extends State<CalenderScreen> {

  GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();

  CalenderRepository  calenderRepository ;
  List<NewsResponseModel> newsList;
  String token;
  MyCalenderClass myCalenderClass=new MyCalenderClass();
  List<MyCalenderClass> calenderList=[];
  CalenderResponseModel calenderResponseModel=new CalenderResponseModel();

  String getDoubleDigit(String value) {
    if (value.length >= 2) return value;
    return "0" + value;
  }

  Future<List<MyCalenderClass>> getCalender(String baseUrl ,String token,String date){
    load();
    calenderRepository=CalenderRepository();
    Future<CalenderResponseModel> newsData = calenderRepository.getCalennder(baseUrl,token,date);
    newsData.then((value) {
      if(value!=null) {
        showSuccess();
        setState(() {
          // print("oneIs>>"+value.one.toString());
          calenderResponseModel=value;
          for(int i=0;i<value.one.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.one[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.one[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.one[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.two.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.two[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.two[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.two[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.three.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.three[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.three[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.three[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.four.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.four[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.four[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.four[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.five.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.five[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.five[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.five[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.sex.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.sex[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.sex[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.sex[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.seven.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.seven[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.seven[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.seven[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.eight.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.eight[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.eight[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.eight[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.nine.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.nine[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.nine[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.nine[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.ten.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.ten[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.ten[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.ten[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.eleven.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.eleven[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.eleven[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.eleven[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.tweleve.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweleve[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweleve[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweleve[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.thirteen.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.thirteen[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.thirteen[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.thirteen[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.fourteen.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.fourteen[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.fourteen[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.fourteen[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.fifteen.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.fifteen[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.fifteen[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.fifteen[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.sixteen.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.sixteen[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.sixteen[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.sixteen[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.seventeen.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.seventeen[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.seventeen[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.seventeen[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.eighteen.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.eighteen[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.eighteen[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.eighteen[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.nineteen.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.nineteen[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.nineteen[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.nineteen[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.tweenty.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweenty[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweenty[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweenty[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.tweentyOne.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweentyOne[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweentyOne[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweentyOne[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.tweentyTwo.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweentyTwo[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweentyTwo[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweentyTwo[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.tweentyThree.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweentyThree[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweentyThree[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweentyThree[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.tweentyFour.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweentyFour[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweentyFour[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweentyFour[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.tweentyFive.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweentyFive[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweentyFive[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweentyFive[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.tweentySix.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweentySix[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweentySix[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweentySix[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.tweentySeven.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweentySeven[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweentySeven[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweentySeven[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          for(int i=0;i<value.tweentyEight.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweentyEight[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweentyEight[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweentyEight[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          if(value.tweentyNine!=null){
          for(int i=0;i<value.tweentyNine.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.tweentyNine[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.tweentyNine[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.tweentyNine[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          }
          if(value.thirty!=null&&value.thirty.isNotEmpty) {
            for (int i = 0; i < value.thirty.length; i++) {
              MyCalenderClass myCalenderClass = new MyCalenderClass();
              myCalenderClass.settitle(value.thirty[i].title);
              DateTime tempDate = new DateFormat("yyyy-MM-dd", 'en').parse(value.thirty[i].startDate);
              myCalenderClass.setDateTime(tempDate);
              myCalenderClass.setColor(checkColor(value.thirty[i].attendanceStatus));
              calenderList.add(myCalenderClass);
              // print("tempDateIs>>"+tempDate.toString());
            }
          }
          if(value.thirtyOne!=null&&value.thirtyOne.isNotEmpty) {
          for(int i=0;i<value.thirtyOne.length;i++){
            MyCalenderClass myCalenderClass=new MyCalenderClass();
            myCalenderClass.settitle(value.thirtyOne[i].title);
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(value.thirtyOne[i].startDate);
            myCalenderClass.setDateTime(tempDate);
            myCalenderClass.setColor(checkColor(value.thirtyOne[i].attendanceStatus));
            calenderList.add(myCalenderClass);
            // print("tempDateIs>>"+tempDate.toString());
          }
          }
          // print("calenderListSize>>>>"+calenderList.length.toString());
          return  calenderList;
        });
      }else{
        showError();
        if(value==null){
          navigateAndFinish(context, SignInScreen(false));
        }
      }
    });
  }

  Color checkColor(String attendence) {
    Color textColor=Color(0xff04D182);
    switch (attendence) {
      case "Going":
        textColor = Color(0xff04D182);
        break;
      case "Not Going":
        textColor = Color(0xffFF6A81);
        break;
      case "Maybe":
        textColor = Color(0xff7F8FA4);
        break;
      case "Pending":
        textColor = Color(0xffFEC20E);
        break;
      case "Not going":
        textColor = Color(0xffFF6A81);
        break;
    }

    void getAllList(DateTime dateTime){
      for(int i=0;i<calenderResponseModel.one.length;i++){
        DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(calenderResponseModel.one[i].startDate);
        if(dateTime==tempDate){

        }
      }
    }
      // if (attendence == "Going") {
      //   textColor = Color(0xff04D182);
      // } else if (attendence== "Not Going"||attendence == "Not going") {
      //   textColor = Color(0xffFF6A81);
      // } else if (attendence == "Maybe") {
      //   textColor = Color(0xff7F8FA4);
      // } else if (attendence == "Pending") {
      //   textColor = Color(0xffFEC20E);
      // } else {
      //   textColor = Color(0xff04D182);
      // }
      return textColor;
  }

  List<One> getList(String day){
    List<One> listReturned=[];
    List<dynamic> list=[];

    if(day=="1"){
    list = calenderResponseModel.one;
    }else if(day=="2"){
      list = calenderResponseModel.two;
    }else if(day=="3"){
      list = calenderResponseModel.three;
    }else if(day=="4"){
      list = calenderResponseModel.four;
    }else if(day=="5"){
      list = calenderResponseModel.five;
    }else if(day=="6"){
      list = calenderResponseModel.sex;
    }else if(day=="7"){
      list = calenderResponseModel.seven;
    }else if(day=="8"){
      list = calenderResponseModel.eight;
    }else if(day=="9"){
      list = calenderResponseModel.nine;
    }else if(day=="10"){
      list = calenderResponseModel.ten;
    }else if(day=="11"){
      list = calenderResponseModel.eleven;
    }else if(day=="12"){
      list = calenderResponseModel.tweleve;
    }else if(day=="13"){
      list = calenderResponseModel.thirteen;
    }else if(day=="14"){
      list = calenderResponseModel.fourteen;
    }else if(day=="15"){
      list = calenderResponseModel.fifteen;
    }else if(day=="16"){
      list = calenderResponseModel.sixteen;
    }else if(day=="17"){
      list = calenderResponseModel.seventeen;
    }else if(day=="18"){
      list = calenderResponseModel.eighteen;
    }else if(day=="19"){
      list = calenderResponseModel.nineteen;
    }else if(day=="20"){
      list = calenderResponseModel.tweenty;
    }else if(day=="21"){
      list = calenderResponseModel.tweentyOne;
    }else if(day=="22"){
      list = calenderResponseModel.tweentyTwo;
    }else if(day=="23"){
      list = calenderResponseModel.tweentyThree;
    }else if(day=="24"){
      list = calenderResponseModel.tweentyFour;
    }else if(day=="25"){
      list = calenderResponseModel.tweentyFive;
    }else if(day=="26"){
      list = calenderResponseModel.tweentySix;
    }else if(day=="27"){
      list = calenderResponseModel.tweentySeven;
    }else if(day=="28"){
      list = calenderResponseModel.tweentyEight;
    }else if(day=="29"){
      list = calenderResponseModel.tweentyNine;
    }else if(day=="30"){
      list = calenderResponseModel.thirty;
    }else if(day=="31"){
      list = calenderResponseModel.thirtyOne;
    }
    if(list!=null) {
      for (int i = 0; i < list.length; i++) {
        listReturned.add(One.fromJson(jsonDecode(json.encode(list[i]))));
      }
    }

    return listReturned;
  }

  String baseUrl="";

  @override
  void initState() {
    SharedPreferencesHelper.getLoggedToken().then((value) {
      token=value;
        String baseUri= Constants.BASE_URL;
        setState(() {
          baseUrl=baseUri;
        });
        getCalender(baseUrl,token,"2022/2");
    });
    super.initState();
  }

  Widget appointmentBuilder(BuildContext context,
      CalendarAppointmentDetails calendarAppointmentDetails) {
    final Appointment appointment = calendarAppointmentDetails.appointments.first;
    return Column(
      children: [
        Container(
            width: calendarAppointmentDetails.bounds.width,
            height: calendarAppointmentDetails.bounds.height / 2,
            color: appointment.color,
            child: Center(
              child: Icon(
                Icons.group,
                color: Colors.black,
              ),
            )),
        Container(
          width: calendarAppointmentDetails.bounds.width,
          height: calendarAppointmentDetails.bounds.height / 2,
          color: appointment.color,
          child: Text(
            appointment.subject +
                DateFormat(' (hh:mm a','en').format(appointment.startTime) +
                '-' +
                DateFormat('hh:mm a)','en').format(appointment.endTime),
            textAlign: TextAlign.center,style: TextStyle(fontSize: 10),
          ),
        )
      ],
    );
  }



  double width;
  double height;

  void openBottomSheet(List<One> oneList,String date){
    showModalBottomSheet(
        isScrollControlled: true,
        // isDismissible: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return StatefulBuilder( builder: (BuildContext context, StateSetter setStateee /*You can rename this!*/) {
            return Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    flex:4,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Expanded(
                    flex:2,
                    child: Container(
                      color: Colors.white,
                      // height: height,
                      // width: MediaQuery.of(context).size.width,
                      // color: Colors.transparent,
                      child: Column(
                        children: [
                          Container(height:40 ,),
                          Container(
                            margin:EdgeInsets.only(left: 20,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    child:Text(date.toString(),style: TextStyle(
                                      color: blueColor ,
                                      fontFamily: "black",
                                      fontSize: 24,
                                      // fontWeight: FontWeight.bold
                                    ),)
                                ),
                                InkWell(
                                    onTap:(){
                                      Navigator.pop(context);
                                    },child: Icon(Icons.clear,size: 30,color: grayTextColor,)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 14),
                            height: 0.3,color: grayTextColor,),
                          Expanded(
                            child: Container(
                              margin:EdgeInsets.only(left: 20,right: 20,bottom: 20),
                              child: SingleChildScrollView(
                                child: makeBodyForCalender(context, oneList),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },);
        });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: scaffoldKeyDrawer,
        backgroundColor: grayColor,
        drawer: DrawerWidget(3),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 14,right: 14,top:50),
              child: Row(
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
                      AppLocalizations.of(context).lblCalender,
                      style: blueColorBoldStyle(26),
                    ),margin: EdgeInsets.only(top: 8,left: 16,right: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    height: 1,color: grayTextColor,),
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height-100,
                  child: SfCalendar(
                    view: CalendarView.month,
                    showDatePickerButton: true,
                    dataSource: getCalendarDataSource(calenderList),
                    monthViewSettings: MonthViewSettings(
                        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                    // agendaItemHeight: 400,
                    //   appointmentDisplayCount: 7,
                    //  showAgenda: true,
                      agendaStyle: AgendaStyle(
                        appointmentTextStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'black'
                        ),
                      ),
                    ),
                    onTap: (calendarTapDetails) {
                      // final Appointment appointment = calendarTapDetails.date;
                      print("kkkkkkkkkkkk"+calendarTapDetails.date.day.toString());
                      List<One> oneList=getList(calendarTapDetails.date.day.toString());
                      DateFormat dateFormat = DateFormat('dd MMMM yyyy','en');
                      String date=  dateFormat.format(calendarTapDetails.date);
                      if(oneList!=null&&oneList.isNotEmpty) {
                        openBottomSheet(oneList, date);
                      }
                      // print("listSizeIs>>"+oneList.length.toString());

                    },
                    dragAndDropSettings: DragAndDropSettings(
                      allowNavigation: false,
                      allowScroll: false,
                      showTimeIndicator: true,
                    ),
                    backgroundColor: Colors.white,
                    cellBorderColor: Colors.grey,
                    headerStyle: CalendarHeaderStyle(
                      backgroundColor: grayColor,
                      textAlign: TextAlign.right,
                      textStyle: TextStyle(color: Colors.black,fontSize: 20),
                    ),
                    // todayTextStyle:TextStyle(color: Colors.black) ,
                     blackoutDatesTextStyle: TextStyle(color: Colors.black,fontSize: 18,fontFamily: "black"),
                    viewHeaderStyle:ViewHeaderStyle(
                      dateTextStyle: TextStyle(color: Colors.black,fontSize: 18,fontFamily: "black"),
                      dayTextStyle: TextStyle(color: Colors.black,fontSize: 18,fontFamily: "black")
                    ),
                    weekNumberStyle: WeekNumberStyle(
                      textStyle: TextStyle(color: Colors.black,fontSize: 18,fontFamily: "black"),
                    ),
                    monthCellBuilder: (context, details) {
                      if(details.date.day==DateTime.now().day){
                        return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: grayTextColor, width: 0.5)),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(top:5,left:5,right:5,bottom:2),
                                decoration: BoxDecoration(
                                    color: yellowColor,
                                    shape: BoxShape.rectangle,
                                    borderRadius: new BorderRadius.circular(8.0),
                                    border: Border.all(color: yellowColor, width: 0.5)),
                                child: Text(
                                  details.date.day.toString(),
                                  style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: "medium"),
                                ),
                              ),
                            ));
                      }else{
                        return Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: grayTextColor, width: 0.5)),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                details.date.day.toString(),
                                style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: "medium"),
                              ),
                            ));
                      }
                    },
                    // appointmentTextStyle:TextStyle(
                    //     fontSize: 22,
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //     // fontFamily: "black"
                    //     ),

                    allowDragAndDrop: false,

                    // appointmentBuilder: (context, calendarAppointmentDetails) {
                    //   final Appointment appointment = calendarAppointmentDetails.appointments.first;
                    //   return SingleChildScrollView(
                    //     child:Container(
                    //       child: InkWell(
                    //         onTap: () {
                    //           print("appoint>>"+appointment.subject);
                    //         },
                    //         child: Container(
                    //           width: 100,
                    //           child: Row(
                    //             children: [
                    //               Container(
                    //                 width: 13,
                    //                 height: 13,
                    //                 decoration: BoxDecoration(
                    //                     shape: BoxShape.circle,
                    //                     color: appointment.color),
                    //               ),
                    //               Expanded(
                    //                 child: Container(
                    //                   // margin: EdgeInsets.only(bottom: 4,top: 4),
                    //                   // color: appointment.color,
                    //                   child:Text(appointment.subject.toString(),style:
                    //                   TextStyle(color: Colors.black,fontSize: 19,fontFamily: "medium"),)
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     )
                    //   );
                    // },
                  ),
                )
              ),
            ))
          ],
        )
    );
  }
}



_DataSource getCalendarDataSource(List<MyCalenderClass> calenderList) {

  final List<Appointment> appointments = <Appointment>[];

  // appointments.add(Appointment(
  //   startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
  //   endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
  //   subject: 'Release Meeting',
  //   color: Colors.lightBlueAccent,
  // ));
  // appointments.add(Appointment(
  //   startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
  //   endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
  //   subject: 'affsfRelease Meeting',
  //   color: Colors.red,
  // ));
  //
  // appointments.add(Appointment(
  //   startTime: DateTime.now().add(const Duration(hours: 2, days: -2)),
  //   endTime: DateTime.now().add(const Duration(hours: 4, days: -2)),
  //   subject: 'Performance check',
  //   color: Colors.amber,
  // ));
  // appointments.add(Appointment(
  //   startTime: DateTime.now().add(const Duration(hours: 6, days: -3)),
  //   endTime: DateTime.now().add(const Duration(hours: 7, days: -3)),
  //   subject: 'Support',
  //   color: Colors.green,
  // ));

  for(int i=0;i<calenderList.length;i++){
   appointments.add(Appointment(
     startTime: calenderList[i].dateTime,
     endTime: calenderList[i].dateTime,
     subject: calenderList[i].title,
     color: calenderList[i].color,
   ));
 }
  return _DataSource(appointments);
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source){
    appointments = source;
  }
}