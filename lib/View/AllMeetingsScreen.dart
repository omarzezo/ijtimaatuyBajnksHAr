import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:itimaaty/LocalDb/OfflineDataLocalModel.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/AttendenceModel.dart';
import 'package:itimaaty/Models/all_meetings_response.dart';
import 'package:itimaaty/Models/all_status_response.dart';
import 'package:itimaaty/Models/committee_response_model.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Repository/MeetingRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/View/CreateMeetingScreen.dart';
import 'package:itimaaty/View/DrawerWidget.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/Widgets/HomeWidgets.dart';
import 'package:itimaaty/cubit/Home/HomeCubit.dart';
import 'package:itimaaty/cubit/Home/HomeStates.dart';
import '../LocalDb/DbHelper.dart';
import '../Models/LoginResponseModel.dart';
import 'SignInScreen.dart';


class AllMeetingsScreen extends StatefulWidget {


  @override
  AllMeetingsScreenState createState() => AllMeetingsScreenState();
}

class AllMeetingsScreenState extends State<AllMeetingsScreen> {
  GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();
  var controllerScroll = ScrollController();
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  DashboardResponseModel dashboardResponseModel;

  List<AllMeetingsResponseData> allMeetingList = new List<AllMeetingsResponseData>();
  List<AllMeetingsResponseData> allFilterdMeetingList = new List<AllMeetingsResponseData>();
  DateTime selectedDate;
  String selectedDateString;
  final now = DateTime.now();

  bool check;
  bool isPlaying = false;
  bool isExpandedTalkingPoints = true;
  bool isExpandedDecisions = true;
  bool isExpandedActions = true;
  MeetingRepository allProductsRepository;
  List<AllStatusResponse> allStatusList = [];
  List<AllStatusResponse> newAllStatusList = [];
  String statusValue;
  List<bool> _isChecked = [];
  List<String> _isCheckedItems = [];
  List<int> _isCheckedItemsStatusIntegers = [];
  bool isStatusExpanded = false;

  List<CommitteeResponseModelData> allCommitteList = [];
  List<CommitteeResponseModelData> newAllCommitteList = [];
  String committeValue;
  List<bool> _isCheckedCommitte = [];
  List<String> _isCheckedItemsCommitte = [];
  List<int> _isCheckedItemsCommitteIntegers = [];
  bool isCommitteExpanded = false;
  List<AttendenceModel> allAttendenceList = [];
  List<AttendenceModel> newAttendenceList = [];
  String attendenceValue;
  bool isAttendenceExpanded = false;
  String userToken="";
  var dateCurrent = DateTime.now();
  var dbHelper = DbHelper();
  bool isFiltered=false;
  int page=1;
  int listLength=0;
  List<int> listedIntegers=[];
  String attendance,committee,meeting_status_id,role="";

  Future getOfflineMeetings() async {
    // var orgainzationsFuture = dbHelper.getOfflineData();
    var orgainzationsFuture = dbHelper.getAllMeetingsColumn(baseUrl+Constants.MEETINGS+selectedDateString);
    orgainzationsFuture.then((data) {
      setState(()  {
        // this.offlineMeetings = data;
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.MEETINGS+selectedDateString) {
            AllMeetingsResponse value =  AllMeetingsResponse.fromJson(json.decode(localModel.allMeetings));
            // List<AllMeetingsResponseData> value = (json.decode(localModel.allMeetings) as List).map((i) => AllMeetingsResponseData.fromJson(i)).toList();
            allMeetingList = value.data;
            allFilterdMeetingList = allMeetingList;
            break;
          }
        }
      });
    });
  }

  Future addOrUpdateOfflineMeetings(String string) async {
    var orgainzationsFuture = dbHelper.getAllMeetingsColumn(baseUrl+Constants.MEETINGS+selectedDateString);
    bool m=false;
    orgainzationsFuture.then((data) async {
      // setState(()  async {
        // this.offlineMeetings = data;
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.MEETINGS+selectedDateString) {
            m=true;
            break;
          }else{
            m=false;
            // inserst
          }
        }
      // });
    }).then((value) async {
      if(m) {
        print("updateupdate");
        // update
        var result = await dbHelper.updateWithNameOfflineData(baseUrl+Constants.MEETINGS+selectedDateString,string);
      }else{
        var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          url: baseUrl+Constants.MEETINGS+selectedDateString,
          allMeetings: string,
        ));
        print("inserstinserst");
        // inserst
      }
    });
  }

  void getAllMeetings(String token,String selectedDateString,int page) {
    // allMeetingList=[];
    // listedIntegers=[];
        load();
        allProductsRepository = new MeetingRepository();
        Future<String> allList = allProductsRepository.getAllMeetings2(baseUrl,token,selectedDateString,page,
        attendance,committee,meeting_status_id,role);
        allList.then((string) async{
          allMeetingList=[];
          if (string != null) {
              showSuccess();
              AllMeetingsResponse val =  AllMeetingsResponse.fromJson(json.decode(string));
              allMeetingList = val.data;
              print("len>>"+val.data.length.toString());
              setState(() {});

                listLength = val.lastPage;
              listedIntegers = new List<int>.generate(listLength, (i) => i + 1);

              // for(int i=0;i<listLength;i=listLength-1){
              //     listedIntegers.add(i);
              // }
              // allFilterdMeetingList = allMeetingList;
              addOrUpdateOfflineMeetings(string);

              if(allStatusList.isEmpty){
              List<AllStatusResponse>list=[];
              AllStatusResponse allStat1 =new AllStatusResponse();
              AllStatusResponse allStat2 =new AllStatusResponse();
              AllStatusResponse allStat3 =new AllStatusResponse();
              AllStatusResponse allStat4 =new AllStatusResponse();
              AllStatusResponse allStat5 =new AllStatusResponse();
              allStat1.name=AppLocalizations.of(context).lblDraft;
              allStat1.id=1;
              allStat2.name=AppLocalizations.of(context).lblScheduled;
              allStat2.id=2;
              allStat3.name=AppLocalizations.of(context).lblLive;
              allStat3.id=3;
              allStat4.name=AppLocalizations.of(context).lblCanceled;
              allStat4.id=4;
              allStat5.name=AppLocalizations.of(context).lblArchived;
              allStat5.id=5;
              list.add(allStat1);
              list.add(allStat2);
              list.add(allStat3);
              list.add(allStat4);
              list.add(allStat5);
              allStatusList = list;
              _isChecked = List<bool>.filled(allStatusList.length, false);
              _isCheckedItems = List<String>.filled(allStatusList.length, '');
              _isCheckedItemsStatusIntegers = List<int>.filled(allStatusList.length, -1);
              // print("_isCheckedListIS>>" + _isChecked.toString());
              getAllCommites(token);
              }

            }else{
              showError();
            }
        });
  }

  void getAllMeetingsafter(String token,String selectedDateString,int page) {
    load();
    allProductsRepository = new MeetingRepository();
    Future<String> allList = allProductsRepository.getAllMeetings2(baseUrl,token,selectedDateString,page,
        attendance,committee,meeting_status_id,role);
    // Future<List<AllMeetingsResponse>> allList = allProductsRepository.getAllMeetings2(baseUrl,token,selectedDateString);
    allList.then((string) {
      setState(() {
        // List<AllMeetingsResponse> value = (json.decode(string) as List).map((i) => AllMeetingsResponse.fromJson(i)).toList();
        AllMeetingsResponse value =  AllMeetingsResponse.fromJson(json.decode(string));
        // List<AllMeetingsResponseData> value =  (json.decode(string) as List).map((i) => AllMeetingsResponseData.fromJson(i)).toList();

        if (value != null) {
          showSuccess();
          // print("value>>"+value.toString());
          // isFiltered=true;
          allMeetingList = value.data;
          allFilterdMeetingList = value.data;
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });
  }

  void getAllCommiteOffline(){
    SharedPreferencesHelper.getAllCommite().then((string) {
      if(string!=null) {
        CommitteeResponseModel value = CommitteeResponseModel.fromJson(json.decode(string));
        if (value.data != null) {
          allCommitteList = value.data;
          SharedPreferencesHelper.setAllCommite(string);
          _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
          _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
          _isCheckedItemsCommitteIntegers = List<int>.filled(allCommitteList.length, -1);
        }
      }
    });
  }
  
  void getAllCommites(String token) {
    load();
    allProductsRepository = new MeetingRepository();
    Future<String> allList = allProductsRepository.getAllCommittes(baseUrl,token);
    allList.then((string) {
      setState(() {
        if (string != null) {
          showSuccess();
          CommitteeResponseModel value =  CommitteeResponseModel.fromJson(json.decode(string));
          if(value.data!=null) {
            for(int i=0;i<value.data.length;i++){
              if(value.data[i].admins!=null){
                var product = value.data[i].admins.firstWhere((product) => product.id == userId, orElse: () => null);
                // var product2 = value.data[i].users.firstWhere((product) => product.id == userId, orElse: () => null);
                if(product!=null){
                  allCommitteList.add(value.data[i]);
                  _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
                  _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
                  _isCheckedItemsCommitteIntegers = List<int>.filled(allCommitteList.length, -1);
                }
              }
            }
            // allCommitteList = value.data;
            // SharedPreferencesHelper.setAllCommite(string);
            // _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
            // _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
          }
        }else{
          showError();
        }
      });
    });
  }

  void clearFilteredData(){
    setState(() {
      // allFilterdMeetingList.clear();
      // allFilterdMeetingList = new List<AllMeetingsResponse>();
      allFilterdMeetingList=[];
    });
  }

  void filterFunc(){
    setState(() {
      // for(int i=0;i<allMeetingList.length;i++){
      //   print("nameOfCommitee"+allMeetingList[i].committee.name.toString());
      // }
      // print("nameOfCommiteeList"+newAllCommitteList[0].name.toString());
      // if(newAttendenceList!=null) {
      //   if (newAttendenceList.isNotEmpty) {
      //
      //   }
      // }
      isFiltered=true;
      List<AttendenceModel> newAttendenceList2 = [];
      for(int index=0;index<newAttendenceList.length;index++){
        if(newAttendenceList[index].name==AppLocalizations.of(context).lblAll){
          AttendenceModel allStatusResponse= new AttendenceModel('All');
          newAttendenceList2.add(allStatusResponse);
        }else if(newAttendenceList[index].name==AppLocalizations.of(context).lblGoingS){
          AttendenceModel allStatusResponse= new AttendenceModel('Going');
          newAttendenceList2.add(allStatusResponse);
        }else if(newAttendenceList[index].name==AppLocalizations.of(context).lblNotGoingS
        ||newAttendenceList[index].name=="Not going"){
          AttendenceModel allStatusResponse= new AttendenceModel('Not going');
          newAttendenceList2.add(allStatusResponse);
        }else if(newAttendenceList[index].name.contains(AppLocalizations.of(context).lblMayBeS)||
            newAttendenceList[index].name=="Maybe"){
          AttendenceModel allStatusResponse= new AttendenceModel('Maybe');
          newAttendenceList2.add(allStatusResponse);
        }else if(newAttendenceList[index].name==AppLocalizations.of(context).lblPendingS){
          AttendenceModel allStatusResponse= new AttendenceModel('Pending');
          newAttendenceList2.add(allStatusResponse);
        }
      }



      List<AllStatusResponse> newAllStatusList2 = [];
            for(int index=0;index<newAllStatusList.length;index++){
        if(newAllStatusList[index].name==AppLocalizations.of(context).lblDraft){
          AllStatusResponse allStatusResponse= new AllStatusResponse();
          allStatusResponse.name='Draft';
          newAllStatusList2.add(allStatusResponse);
        }else if(newAllStatusList[index].name==AppLocalizations.of(context).lblScheduled){
          AllStatusResponse allStatusResponse= new AllStatusResponse();
          allStatusResponse.name='Scheduled';
          newAllStatusList2.add(allStatusResponse);
        }else if(newAllStatusList[index].name==AppLocalizations.of(context).lblLive){
          AllStatusResponse allStatusResponse= new AllStatusResponse();
          allStatusResponse.name='Live';
          newAllStatusList2.add(allStatusResponse);
        }else if(newAllStatusList[index].name==AppLocalizations.of(context).lblCanceled){
          AllStatusResponse allStatusResponse= new AllStatusResponse();
          allStatusResponse.name='Canceled';
          newAllStatusList2.add(allStatusResponse);
        }else if(newAllStatusList[index].name==AppLocalizations.of(context).lblArchived){
          AllStatusResponse allStatusResponse= new AllStatusResponse();
          allStatusResponse.name='Archived';
          newAllStatusList2.add(allStatusResponse);
        }
      }
      allMeetingList.forEach((element) {
        print("elementName>>"+element.attendanceStatus.toString());
      });
      // allMeetingList.forEach((element) {
      //   print("elementName>>"+element.attendanceStatus.toString());
      // });
          allFilterdMeetingList = allMeetingList.where(
                  (x) =>
                  (newAttendenceList2.isNotEmpty?newAttendenceList2.any((element) =>
                  element.name==AppLocalizations.of(context).lblAll?true:element.name == x.attendanceStatus):true) &&
                  (newAllStatusList2.isNotEmpty?newAllStatusList2.any((element) => element.name == x.status.name):true) &&
                  (x.committee!=null?newAllCommitteList.isNotEmpty? newAllCommitteList.any((element) => element.name == x.committee.name):true:true)&&
                  ( newAllCommitteList.any((element) => element.name == x.committee.name))
          ).toList();

          print("allFilterdMeetingList>>"+allFilterdMeetingList.toString());
          print("allFilterdLength>>"+allFilterdMeetingList.length.toString());
    });
  }

  void openBottomSheetForFilter(BuildContext _context){
    isStatusExpanded=false;
    isCommitteExpanded=false;
    isAttendenceExpanded=false;
    showModalBottomSheet(
        isScrollControlled: true,
        // isDismissible: false,
        context: _context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return StatefulBuilder( builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
            return Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(_context).size.width,
              color: Colors.transparent,
              child:Row(
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
                      // width: MediaQuery.of(context).size.width - 200,
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20,left: 16,right: 16,top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin:
                                  EdgeInsets.only(
                                      top: 10),
                                  child: Text(AppLocalizations.of(_context).lblFilterBy,
                                    style: blueColorBoldStyle(26),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState((){
                                      isStatusExpanded=false;
                                      isCommitteExpanded=false;
                                      isAttendenceExpanded=false;
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Icon(Icons.clear,color: Colors.black,),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                // height:MediaQuery.of(context).size.height-200 ,
                                margin: EdgeInsets.only(left:16,right: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(
                                          _context)
                                          .lblAttendence, style: grayTextColorStyleBlack(20),),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 12,
                                          bottom: 12),
                                      width: MediaQuery.of(_context).size.width,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: grayTextColor.withOpacity(0.6), width: 0.6),
                                          borderRadius: BorderRadius
                                              .all(Radius
                                              .circular(
                                              16))),
                                      child: Container(
                                        // padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                        height: 40,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              // width:MediaQuery.of(context).size.width-100,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    print("kjklnln0");
                                                    isAttendenceExpanded = !isAttendenceExpanded;
                                                  });
                                                },
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: newAttendenceList.length,
                                                    itemBuilder: (context, index) {
                                                      return Container(
                                                        // height: 100,
                                                        margin: EdgeInsets.only(left: 8, right: 8),
                                                        padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 2),
                                                        decoration: BoxDecoration(
                                                            color: Color(0xffeaeaea),
                                                            // color: Colors.red,
                                                            border: Border.all(color: Color(0xffeaeaea), width: 0.6),
                                                            borderRadius: BorderRadius.all(Radius.circular(9))),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                                          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(top: 2),
                                                              // padding: EdgeInsets.only(top: 2,bottom: 4),
                                                              child: Text(
                                                                newAttendenceList[index].name,
                                                                style: TextStyle(fontSize: 18, fontFamily: 'medium', color: Color(0xff617287)),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    print("attendanceattendance");
                                                                    attendance='';
                                                                    newAttendenceList.clear();

                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  size: 20,
                                                                  color: grayTextColor,
                                                                ))
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child:
                                                InkWell(
                                                  onTap:
                                                      () {
                                                    setState(() {
                                                      isAttendenceExpanded = !isAttendenceExpanded;
                                                    });
                                                  },
                                                  child: isAttendenceExpanded
                                                      ? Icon(
                                                    Icons.keyboard_arrow_down_rounded,
                                                    size: 24,
                                                    color: grayTextColor,
                                                  )
                                                      : Icon(
                                                    Icons.keyboard_arrow_up,
                                                    size: 24,
                                                    color: grayTextColor,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    isAttendenceExpanded ? SizedBox(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              14),
                                          border: Border.all(
                                              color: Colors.grey, // set border color
                                              width: 1.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors
                                                    .black12,
                                                blurRadius:
                                                10)
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10,),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isAttendenceExpanded=!isAttendenceExpanded;
                                                },
                                                );
                                              },
                                              child:  Container(
                                                child: Icon(Icons.clear,color: Colors.white,size: 18,),
                                                decoration: BoxDecoration(
                                                  color: yellowColor,
                                                  borderRadius: BorderRadius.circular(14),
                                                  border: Border.all(color: yellowColor, width: 1.0),
                                                  boxShadow: [
                                                    BoxShadow(color: Colors.black12, blurRadius: 10)
                                                  ],
                                                ),
                                                padding: EdgeInsets.all(2),
                                              ),
                                            ),

                                            const SizedBox(height: 10,),
                                            ListView.builder(
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: allAttendenceList?.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return
                                                  InkWell(
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 14,right: 14,bottom: 20),
                                                      child: Text(allAttendenceList[index].name,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                          fontFamily: 'medium'
                                                        ),),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        attendance=allAttendenceList[index].name;
                                                          isAttendenceExpanded=false;
                                                          attendenceValue=allAttendenceList[index].name;
                                                          newAttendenceList.clear();
                                                          newAttendenceList.add(new AttendenceModel(attendenceValue));
                                                        },
                                                      );
                                                    },
                                                  );
                                              },
                                            ),
                                            const SizedBox(height: 10,),
                                          ],
                                        ),
                                      ),
                                    ) : Container(),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            isStatusExpanded=false;
                                            isAttendenceExpanded=false;
                                            isCommitteExpanded=false;
                                          },
                                          );

                                        },
                                        child:  Container(height: 20,)),
                                    Text(
                                      AppLocalizations.of(_context).lblCommittee,
                                      style: grayTextColorStyleBlack(20),
                                    ),
                                    const SizedBox(height: 4,),
                                    Container(
                                      padding:
                                      EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 12,
                                          bottom: 12),
                                      width: MediaQuery.of(
                                          _context)
                                          .size
                                          .width,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: grayTextColor
                                                  .withOpacity(
                                                  0.6),
                                              width: 0.6),
                                          borderRadius: BorderRadius
                                              .all(Radius
                                              .circular(
                                              16))),
                                      child:Container(
                                        // padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                        height: 40,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              // width:MediaQuery.of(context).size.width-100,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isCommitteExpanded = !isCommitteExpanded;
                                                  });
                                                },
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: newAllCommitteList.length,
                                                    itemBuilder: (context, index) {
                                                      return Container(
                                                        margin: EdgeInsets.only(left: 8, right: 8),
                                                        padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 2),
                                                        decoration: BoxDecoration(
                                                            color: Color(0xffeaeaea),
                                                            // color: Colors.red,
                                                            border: Border.all(color: Color(0xffeaeaea), width: 0.6),
                                                            borderRadius: BorderRadius.all(Radius.circular(9))),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                                          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(top: 2),
                                                              child: Text(
                                                                newAllCommitteList[index].name,
                                                                style: TextStyle(fontSize: 18, fontFamily: 'medium', color: Color(0xff617287)),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    for(int i=0;i<_isCheckedItemsCommitte.length;i++){
                                                                      if(newAllCommitteList[index].name==_isCheckedItemsCommitte[i]||
                                                                          newAllCommitteList[index].name==' '+_isCheckedItemsCommitte[i]){
                                                                        newAllCommitteList.removeAt(index);
                                                                        _isCheckedCommitte[i]=false;
                                                                        _isCheckedItemsCommitte[i]='';
                                                                        _isCheckedItemsCommitteIntegers[i]=-1;
                                                                        break;
                                                                        print("Intsdid");
                                                                      }else{
                                                                        print("Oustsdid");
                                                                      }
                                                                    }
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  size: 20,
                                                                  color: grayTextColor,
                                                                ))
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child:
                                                InkWell(
                                                  onTap:
                                                      () {
                                                    setState(() {
                                                      isCommitteExpanded = !isCommitteExpanded;
                                                    });
                                                  },
                                                  child: isCommitteExpanded
                                                      ? Icon(
                                                    Icons.keyboard_arrow_down_rounded,
                                                    size: 24,
                                                    color: grayTextColor,
                                                  )
                                                      : Icon(
                                                    Icons.keyboard_arrow_up,
                                                    size: 24,
                                                    color: grayTextColor,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    isCommitteExpanded ? SizedBox(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              14),
                                          border: Border.all(
                                              color: Colors.grey, // set border color
                                              width: 1.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors
                                                    .black12,
                                                blurRadius:
                                                10)
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10,),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isCommitteExpanded=!isCommitteExpanded;
                                                },
                                                );
                                              },
                                              child:  Container(
                                                child: Icon(Icons.clear,color: Colors.white,size: 18,),
                                                decoration: BoxDecoration(
                                                  color: yellowColor,
                                                  borderRadius: BorderRadius.circular(14),
                                                  border: Border.all(color: yellowColor, width: 1.0),
                                                  boxShadow: [
                                                    BoxShadow(color: Colors.black12, blurRadius: 10)
                                                  ],
                                                ),
                                                padding: EdgeInsets.all(2),
                                              ),
                                            ),

                                            const SizedBox(height: 10,),

                                            ListView.builder(
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: allCommitteList?.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return CheckboxListTile(
                                                  checkColor: Colors.white,
                                                  activeColor: Colors.amberAccent,
                                                  title: Text(allCommitteList[index].name,
                                                    style:  TextStyle(
                                                        fontSize: 22
                                                    ),),
                                                  value: _isCheckedCommitte[index],
                                                  onChanged: (val) {
                                                    setState(
                                                          () {
                                                        _isCheckedCommitte[index] = val;
                                                        if (val) {
                                                          _isCheckedItemsCommitte[index]=allCommitteList[index].name;
                                                          _isCheckedItemsCommitteIntegers[index]=allCommitteList[index].id;
                                                        }else{
                                                          _isCheckedItemsCommitte[index]='';
                                                          _isCheckedItemsCommitteIntegers[index]=-1;
                                                        }

                                                        if(val){
                                                          setState(() {
                                                            newAllCommitteList.add(CommitteeResponseModelData(name:allCommitteList[index].name));
                                                            // print("insideOMMMMM>>" + allCommitteList[0].name.toString());
                                                          },
                                                          );
                                                        }else{
                                                          setState(() {
                                                            print("insideFalse");
                                                            for(int i=0;i<newAllCommitteList.length;i++){
                                                              print("nameFor"+newAllCommitteList[i].name);
                                                              if(allCommitteList[index].name==newAllCommitteList[i].name){
                                                                print("insideFor");
                                                                newAllCommitteList.removeAt(i);
                                                                break;
                                                              }else{
                                                                print("OutsideFor");
                                                              }
                                                            }
                                                          },
                                                          );

                                                        }
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            const SizedBox(height: 10,),
                                          ],
                                        ),
                                      ),
                                    ) : Container(),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            isStatusExpanded=false;
                                            isAttendenceExpanded=false;
                                            isCommitteExpanded=false;
                                          },
                                          );

                                        },
                                        child:  Container(height: 20,)),
                                    Text(
                                      AppLocalizations.of(_context).lblStatus, style: grayTextColorStyleBlack(20),),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
                                      // margin: EdgeInsets.only(top: 2,bottom: 2),
                                      width: MediaQuery.of(_context).size.width,
                                      // height: 40,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: grayTextColor.withOpacity(0.6), width: 0.8),
                                          borderRadius: BorderRadius
                                              .all(Radius
                                              .circular(
                                              16))),
                                      child: Container(
                                        // padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                        height: 40,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 8,
                                              // width:MediaQuery.of(context).size.width-100,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isStatusExpanded = !isStatusExpanded;
                                                  });
                                                },
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: newAllStatusList.length,
                                                    itemBuilder: (context, index) {
                                                      return Container(
                                                        margin: EdgeInsets.only(left: 8, right: 8),
                                                        padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 2),
                                                        decoration: BoxDecoration(
                                                            color: Color(0xffeaeaea),
                                                            // color: Colors.red,
                                                            border: Border.all(color: Color(0xffeaeaea), width: 0.6),
                                                            borderRadius: BorderRadius.all(Radius.circular(9))),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                                          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(top: 2),
                                                              child: Text(
                                                                newAllStatusList[index].name,
                                                                style: TextStyle(fontSize: 18, fontFamily: 'medium', color: Color(0xff617287)),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {

                                                                    // for(int index=0;index<newAllStatusList.length;index++){
                                                                    //   if(newAllStatusList[index].name==AppLocalizations.of(context).lblDraft){
                                                                    //     newAllStatusList[index].name='Draft';
                                                                    //   }else if(newAllStatusList[index].name==AppLocalizations.of(context).lblScheduled){
                                                                    //     newAllStatusList[index].name='Scheduled';
                                                                    //   }else if(newAllStatusList[index].name==AppLocalizations.of(context).lblLive){
                                                                    //     newAllStatusList[index].name='Live';
                                                                    //   }else if(newAllStatusList[index].name==AppLocalizations.of(context).lblCanceled){
                                                                    //     newAllStatusList[index].name='Canceled';
                                                                    //   }else if(newAllStatusList[index].name==AppLocalizations.of(context).lblArchived){
                                                                    //     newAllStatusList[index].name='Archived';
                                                                    //   }
                                                                    // }

                                                                    for(int i=0;i<_isCheckedItems.length;i++){
                                                                      if(newAllStatusList[index].name==_isCheckedItems[i]||
                                                                          newAllStatusList[index].name==' '+_isCheckedItems[i]){
                                                                        newAllStatusList.removeAt(index);
                                                                        _isChecked[i]=false;
                                                                        _isCheckedItems[i]='';
                                                                        _isCheckedItemsStatusIntegers[i]=-1;
                                                                        break;
                                                                        print("Intsdid");
                                                                      }else{
                                                                        print("Oustsdid");
                                                                      }
                                                                    }
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  size: 20,
                                                                  color: grayTextColor,
                                                                ))
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child:
                                                InkWell(
                                                  onTap:
                                                      () {
                                                    setState(() {
                                                      isStatusExpanded = !isStatusExpanded;
                                                    });
                                                  },
                                                  child: isStatusExpanded
                                                      ? Icon(
                                                    Icons.keyboard_arrow_down_rounded,
                                                    size: 24,
                                                    color: grayTextColor,
                                                  )
                                                      : Icon(
                                                    Icons.keyboard_arrow_up,
                                                    size: 24,
                                                    color: grayTextColor,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    isStatusExpanded ? SizedBox(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              14),
                                          border: Border.all(
                                              color: Colors.grey, // set border color
                                              width: 1.0),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors
                                                    .black12,
                                                blurRadius:
                                                10)
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10,),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isStatusExpanded=!isStatusExpanded;
                                                },
                                                );
                                              },
                                              child:  Container(
                                                child: Icon(Icons.clear,color: Colors.white,size: 18,),
                                                decoration: BoxDecoration(
                                                  color: yellowColor,
                                                  borderRadius: BorderRadius.circular(14),
                                                  border: Border.all(color: yellowColor, width: 1.0),
                                                  boxShadow: [
                                                    BoxShadow(color: Colors.black12, blurRadius: 10)
                                                  ],
                                                ),
                                                padding: EdgeInsets.all(2),
                                              ),
                                            ),

                                            const SizedBox(height: 10,),
                                            ListView.builder(
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: allStatusList?.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return CheckboxListTile(
                                                  checkColor: Colors.white,
                                                  activeColor: Colors.amberAccent,
                                                  title: Text(allStatusList[index].name,style:
                                                  TextStyle(
                                                      fontSize: 20,
                                                    fontFamily: 'medium'
                                                  ),),
                                                  value: _isChecked[index],
                                                  onChanged: (val) {
                                                    setState(
                                                          () {
                                                        _isChecked[index] = val;
                                                        if (val) {
                                                          _isCheckedItems[index]=allStatusList[index].name;
                                                          _isCheckedItemsStatusIntegers[index]=allStatusList[index].id;
                                                        }else{
                                                          _isCheckedItems[index]='';
                                                          _isCheckedItemsStatusIntegers[index]=-1;
                                                        }

                                                        if(val){
                                                          setState(() {
                                                            newAllStatusList.add(AllStatusResponse(name:allStatusList[index].name));
                                                          },
                                                          );
                                                        }else{
                                                          setState(() {
                                                            print("insideFalse");
                                                            for(int i=0;i<newAllStatusList.length;i++){
                                                              print("nameFor"+newAllStatusList[i].name);
                                                              if(allStatusList[index].name==newAllStatusList[i].name){
                                                                print("insideFor");
                                                                newAllStatusList.removeAt(i);
                                                                break;
                                                              }else{
                                                                print("OutsideFor");
                                                              }
                                                            }
                                                          },
                                                          );

                                                        }
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),

                                            const SizedBox(height: 10,),
                                          ],
                                        ),
                                      ),
                                    ) : Container(),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(
                                        AppLocalizations.of(_context).lblRole, style: grayTextColorStyleBlack(20),),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    SizedBox(
                                      height: 50,
                                      // width: ,
                                      child: ListView(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          children: getRoleList(context).map((e) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {role = e['name'];},);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(20, 8, 20, 4),
                                                decoration:
                                                BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                        color:e['name']==role?yellowColor: Colors.grey.shade400, width: 1.2),
                                                    borderRadius: BorderRadius.all(Radius.circular(9))),
                                                child: Center(child: Text(e['name']
                                                  ,style:TextStyle(
                                                    fontFamily: 'regular',
                                                    fontSize: 14,
                                                    color: e['name']==role?yellowColor:Colors.black
                                                  ) ,)),
                                              ),
                                            );
                                          }).toList()
                                      ),
                                    ),


                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            isStatusExpanded=false;
                                            isAttendenceExpanded=false;
                                            isCommitteExpanded=false;
                                          },
                                          );

                                        },
                                        child:  Container(height: 80,)),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState((){
                                                listedIntegers=[];
                                                allMeetingList=[];
                                                role=null;
                                                attendance=null;
                                                committee=null;
                                                meeting_status_id=null;
                                                isFiltered=false;
                                                Navigator.pop(context);
                                                newAttendenceList.clear();
                                                newAllStatusList.clear();
                                                newAllCommitteList.clear();
                                                _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
                                                _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
                                                _isCheckedItemsCommitteIntegers = List<int>.filled(allCommitteList.length, -1);
                                                _isChecked = List<bool>.filled(allStatusList.length, false);
                                                _isCheckedItems = List<String>.filled(allStatusList.length, '');
                                                _isCheckedItemsStatusIntegers = List<int>.filled(allStatusList.length, -1);
                                                selectedDateString=DateTime.now().year.toString();
                                                getAllMeetings(userToken, DateTime.now().year.toString(), 1);
                                              });
                                            },
                                            child: Container(
                                                padding: EdgeInsets.only(top: 5),
                                                // padding: EdgeInsets.only(top: 8,bottom:6,left: 30,right: 30),
                                                height:50,
                                                width: MediaQuery.of(context).size.width/8,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: blueColor,
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(14))
                                                ),
                                                child: Center(
                                                  child: Text(AppLocalizations.of(_context).lblReset,style: blueColorStyleMedium(18),),
                                                )
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          InkWell(
                                            onTap: () {
                                              setState((){
                                                isStatusExpanded=false;
                                                isCommitteExpanded=false;
                                                isAttendenceExpanded=false;
                                              });
                                              committee=convetIntList(_isCheckedItemsCommitteIntegers);
                                              meeting_status_id=convetIntList(_isCheckedItemsStatusIntegers);
                                              // if(convetIntList(_isCheckedItemsCommitteIntegers).isNotEmpty){
                                              //   print("jjjjjj>>"+convetIntList(_isCheckedItemsCommitteIntegers));
                                              // }
                                              Navigator.pop(context);
                                              getAllMeetings(userToken, selectedDateString, page);
                                              // print("Hereeeeez"+_isCheckedItemsCommitteIntegers.toList().toString());
                                              // print("Hereeeeez"+_isCheckedItemsStatusIntegers.toList().toString());
                                              // filterFunc();
                                            },
                                            child: Container(
                                                // padding: EdgeInsets.only(top: 10),
                                                // height:50,
                                                // width: 180,
                                                padding: EdgeInsets.only(top: 5),
                                                // padding: EdgeInsets.only(top: 8,bottom:6,left: 30,right: 30),
                                                height:50,
                                                width: MediaQuery.of(context).size.width/8,
                                                decoration: BoxDecoration(
                                                    color: yellowColor,
                                                    border: Border.all(
                                                      color: yellowColor,
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(14))
                                                ),
                                                child: Center(
                                                  child: Text(AppLocalizations.of(_context).lblFilter,style: TextStyle(
                                                    color: Colors.white ,
                                                    fontFamily: "medium",
                                                    fontSize: 18,
                                                    // fontWeight: FontWeight.bold
                                                  ),),
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ),
                  )
                ],
              )

            );
          },);
        });
  }

  int userId;
  String baseUrl="";
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 1, // or whatever offset you wish
    keepScrollOffset: true,
  );

  @override
  void initState() {

    selectedDate = now;
    selectedDateString=now.year.toString();
    Constants.draweItem="AllMeetingsScreen";
    getUser().then((value) {
      userId=value.id;
    });

    String baseUri= Constants.BASE_URL;
    setState(() {
      baseUrl=baseUri;
    });
    SharedPreferencesHelper.getLoggedToken().then((value) {
      userToken=value;
      allAttendenceList.add(new AttendenceModel(AppLocalizations.of(context).lblAll));
      allAttendenceList.add(new AttendenceModel(AppLocalizations.of(context).lblGoingS));
      allAttendenceList.add(new AttendenceModel(AppLocalizations.of(context).lblNotGoingS));
      allAttendenceList.add(new AttendenceModel(AppLocalizations.of(context).lblMayBeS));
      allAttendenceList.add(new AttendenceModel(AppLocalizations.of(context).lblPendingS));


      hasNetwork().then((hasNet) {
        if(hasNet){
          print("Net exist");
          getAllMeetings(value,selectedDateString.substring(0,4),1);
        }else{
          getOfflineMeetings().then((value) {
            List<AllStatusResponse>list=[];
            AllStatusResponse allStat1 =new AllStatusResponse();
            AllStatusResponse allStat2 =new AllStatusResponse();
            AllStatusResponse allStat3 =new AllStatusResponse();
            AllStatusResponse allStat4 =new AllStatusResponse();
            AllStatusResponse allStat5 =new AllStatusResponse();
            allStat1.name=AppLocalizations.of(context).lblDraft;
            allStat1.id=1;
            allStat2.name=AppLocalizations.of(context).lblScheduled;
            allStat2.id=2;
            allStat3.name=AppLocalizations.of(context).lblLive;
            allStat3.id=3;
            allStat4.name=AppLocalizations.of(context).lblCanceled;
            allStat4.id=4;
            allStat5.name=AppLocalizations.of(context).lblArchived;
            allStat5.id=5;
            list.add(allStat1);
            list.add(allStat2);
            list.add(allStat3);
            list.add(allStat4);
            list.add(allStat5);
            allStatusList = list;
            _isChecked = List<bool>.filled(allStatusList.length, false);
            _isCheckedItems = List<String>.filled(allStatusList.length, '');
            _isCheckedItemsStatusIntegers = List<int>.filled(allStatusList.length, -1);
            getAllCommiteOffline();
          });
          print("No Net exist");
        }
      });


    });

  }


  @override
  Widget build(BuildContext context) {
    print("width"+MediaQuery.of(context).size.width.toString());
    print("height"+MediaQuery.of(context).size.height.toString());
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) async {
          if (state is HomeStatesSuccessState) {
            if (state.dashboardResponseModel != null) {
              print("goingCounIS>>" +
                  state.dashboardResponseModel.counts.going.toString());
            } else {}
          } else {
            hasNetwork().then((value) {
              if (value) {
              } else {
                print("errorHere");
              }
            });
          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          // cubit.getDashboardData();

          return Scaffold(
            // resizeToAvoidBottomInset: true,
            key: scaffoldKeyDrawer,
            backgroundColor: grayColor,
            drawer: DrawerWidget(4),
            body: LayoutBuilder(builder: (context, constraints) {
              if(constraints.maxWidth<600){
                return Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                  AppLocalizations.of(context).lblMeetings,
                                  style: blueColorBoldStyle(24),
                                ),margin: EdgeInsets.only(top: 0,left: 16,right: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {

                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                          ),
                                        ),
                                        builder: (context) {
                                          return StatefulBuilder(builder: (BuildContext
                                          context, StateSetter setState /*You can rename this!*/) {
                                            return Container(
                                              height: (MediaQuery.of(context).size.height / 2) + 100,
                                              margin: EdgeInsets.only(
                                                  left: 16, right: 16),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    bottom: MediaQuery.of(context)
                                                        .viewInsets
                                                        .bottom),
                                                child: Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        isStatusExpanded=false;
                                                        Navigator.pop(context);
                                                      },
                                                      child: Align(
                                                          alignment:
                                                          Alignment.center,
                                                          child: Container(
                                                            margin:
                                                            EdgeInsets.only(
                                                                top: 10,
                                                                bottom: 14),
                                                            width: 36,
                                                            height: 4,
                                                            color: grayTextColor,
                                                          )),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 20),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Container(
                                                            margin:
                                                            EdgeInsets.only(
                                                                top: 10),
                                                            child: Text(
                                                              AppLocalizations.of(
                                                                  context)
                                                                  .lblFilterBy,
                                                              style:
                                                              blueColorBoldStyle(
                                                                  26),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState((){
                                                                isFiltered=false;
                                                                Navigator.pop(context);
                                                                newAttendenceList.clear();
                                                                newAllStatusList.clear();
                                                                newAllCommitteList.clear();
                                                                _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
                                                                _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
                                                                _isCheckedItemsCommitteIntegers = List<int>.filled(allCommitteList.length, -1);
                                                                _isChecked = List<bool>.filled(allStatusList.length, false);
                                                                _isCheckedItems = List<String>.filled(allStatusList.length, '');
                                                                _isCheckedItemsStatusIntegers = List<int>.filled(allStatusList.length, -1);
                                                                clearFilteredData();
                                                              });
                                                            },
                                                            child: Container(
                                                              margin:
                                                              EdgeInsets.only(
                                                                  left: 8,
                                                                  right: 8),
                                                              padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  top: 10,
                                                                  bottom: 6),
                                                              decoration:
                                                              BoxDecoration(
                                                                  color: Color(0xffeaeaea),
                                                                  border: Border.all(color: Color(0xffeaeaea), width: 0.6),
                                                                  borderRadius: BorderRadius.all(Radius.circular(9))),
                                                              child: Center(
                                                                child: Text(
                                                                  AppLocalizations.of(
                                                                      context)
                                                                      .lblReset,
                                                                  style: TextStyle(
                                                                      fontSize: 18,
                                                                      fontFamily:
                                                                      'black',
                                                                      fontWeight: FontWeight.bold,
                                                                      color: grayTextColor),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              AppLocalizations.of(context).lblAttendence, style: grayTextColorStyleBlack(20),),
                                                            const SizedBox(
                                                              height: 4,
                                                            ),

                                                            Container(
                                                              padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 12,
                                                                  bottom: 12),
                                                              width: MediaQuery.of(context).size.width,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: grayTextColor
                                                                          .withOpacity(
                                                                          0.6),
                                                                      width: 0.6),
                                                                  borderRadius: BorderRadius
                                                                      .all(Radius
                                                                      .circular(
                                                                      16))),
                                                              child: Container(
                                                                // padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                                                height: 28,
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 8,
                                                                      // width:MediaQuery.of(context).size.width-100,
                                                                      child: ListView.builder(
                                                                          shrinkWrap: true,
                                                                          scrollDirection: Axis.horizontal,
                                                                          itemCount: newAttendenceList.length,
                                                                          itemBuilder: (context, index) {
                                                                            return Container(
                                                                              margin: EdgeInsets.only(left: 8, right: 8),
                                                                              padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 2),
                                                                              decoration: BoxDecoration(
                                                                                  color: Color(0xffeaeaea),
                                                                                  // color: Colors.red,
                                                                                  border: Border.all(color: Color(0xffeaeaea), width: 0.6),
                                                                                  borderRadius: BorderRadius.all(Radius.circular(9))),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                                                                crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                                                                children: [
                                                                                  Container(
                                                                                    margin: EdgeInsets.only(top: 2),
                                                                                    child: Text(
                                                                                      newAttendenceList[index].name,
                                                                                      style: TextStyle(fontSize: 22, fontFamily: 'medium', color: Color(0xff617287)),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 4,
                                                                                  ),
                                                                                  InkWell(
                                                                                      onTap: () {
                                                                                        setState(() {
                                                                                          // print("attendanceattendance");
                                                                                          // attendance=null;
                                                                                          newAttendenceList.clear();
                                                                                        });
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.clear,
                                                                                        size: 20,
                                                                                        color: grayTextColor,
                                                                                      ))
                                                                                ],
                                                                              ),
                                                                            );
                                                                          }),
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              isAttendenceExpanded = !isAttendenceExpanded;
                                                                            });
                                                                          },
                                                                          child: isAttendenceExpanded
                                                                              ? Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            size: 24,
                                                                            color: grayTextColor,
                                                                          )
                                                                              : Icon(
                                                                            Icons.keyboard_arrow_up,
                                                                            size: 24,
                                                                            color: grayTextColor,
                                                                          ),
                                                                        ))
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            isAttendenceExpanded ? SizedBox(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(
                                                                      14),
                                                                  border: Border.all(
                                                                      color: Colors.grey, // set border color
                                                                      width: 1.0),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .black12,
                                                                        blurRadius:
                                                                        10)
                                                                  ],
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    const SizedBox(height: 10,),
                                                                    InkWell(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          isAttendenceExpanded=!isAttendenceExpanded;
                                                                        },
                                                                        );
                                                                      },
                                                                      child:  Container(
                                                                        child: Icon(Icons.clear,color: Colors.white,size: 18,),
                                                                        decoration: BoxDecoration(
                                                                          color: yellowColor,
                                                                          borderRadius: BorderRadius.circular(14),
                                                                          border: Border.all(color: yellowColor, width: 1.0),
                                                                          boxShadow: [
                                                                            BoxShadow(color: Colors.black12, blurRadius: 10)
                                                                          ],
                                                                        ),
                                                                        padding: EdgeInsets.all(2),
                                                                      ),
                                                                    ),

                                                                    const SizedBox(height: 10,),
                                                                    ListView.builder(
                                                                      physics: const NeverScrollableScrollPhysics(),
                                                                      shrinkWrap: true,
                                                                      itemCount: allAttendenceList?.length,
                                                                      itemBuilder: (BuildContext context, int index) {
                                                                        return
                                                                          InkWell(
                                                                            child: Container(
                                                                              margin: EdgeInsets.only(left: 14,right: 14,bottom: 20),
                                                                              child: Text(allAttendenceList[index].name,
                                                                                style: TextStyle(
                                                                                    fontSize: 22
                                                                                ),),
                                                                            ),
                                                                            onTap: () {
                                                                              setState(
                                                                                    () {
                                                                                  isAttendenceExpanded=false;
                                                                                  attendenceValue=allAttendenceList[index].name;
                                                                                  newAttendenceList.clear();
                                                                                  newAttendenceList.add(new AttendenceModel(attendenceValue));
                                                                                },
                                                                              );
                                                                            },
                                                                          );
                                                                      },
                                                                    ),
                                                                    const SizedBox(height: 10,),
                                                                  ],
                                                                ),
                                                              ),
                                                            ) : Container(),

                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    isStatusExpanded=!isStatusExpanded;
                                                                  },
                                                                  );
                                                                  // setState(() {
                                                                  //   print("xdddddddddd");
                                                                  //   // isAttendenceExpanded=!isAttendenceExpanded;
                                                                  //   // isStatusExpanded=!isAttendenceExpanded;
                                                                  //   // isCommitteExpanded=!isAttendenceExpanded;
                                                                  //   // isStatusExpanded=false;
                                                                  //   // isCommitteExpanded=false;
                                                                  //   // isAttendenceExpanded=false;
                                                                  //   // Navigator.pop(context);
                                                                  // },
                                                                  // );

                                                                },
                                                                child:  Container(height: 20,)),
                                                            Text(
                                                              AppLocalizations.of(context).lblCommittee,
                                                              style: grayTextColorStyleBlack(20),
                                                            ),
                                                            const SizedBox(height: 4,),

                                                            Container(
                                                              padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10,
                                                                  top: 12,
                                                                  bottom: 12),
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: grayTextColor
                                                                          .withOpacity(
                                                                          0.6),
                                                                      width: 0.6),
                                                                  borderRadius: BorderRadius
                                                                      .all(Radius
                                                                      .circular(
                                                                      16))),
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    // padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                                                    height: 28,
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 8,
                                                                          // width:MediaQuery.of(context).size.width-100,
                                                                          child: ListView.builder(
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: newAllCommitteList.length,
                                                                              itemBuilder: (context, index) {
                                                                                return Container(
                                                                                  margin: EdgeInsets.only(left: 8, right: 8),
                                                                                  padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 2),
                                                                                  decoration: BoxDecoration(
                                                                                      color: Color(0xffeaeaea),
                                                                                      // color: Colors.red,
                                                                                      border: Border.all(color: Color(0xffeaeaea), width: 0.6),
                                                                                      borderRadius: BorderRadius.all(Radius.circular(9))),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                                                                    children: [
                                                                                      Container(
                                                                                        margin: EdgeInsets.only(top: 2),
                                                                                        child: Text(
                                                                                          newAllCommitteList[index].name,
                                                                                          style: TextStyle(fontSize: 22, fontFamily: 'medium', color: Color(0xff617287)),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        width: 4,
                                                                                      ),
                                                                                      InkWell(
                                                                                          onTap: () {
                                                                                            setState(() {
                                                                                              for(int i=0;i<_isCheckedItemsCommitte.length;i++){
                                                                                                if(newAllCommitteList[index].name==_isCheckedItemsCommitte[i]||
                                                                                                    newAllCommitteList[index].name==' '+_isCheckedItemsCommitte[i]){
                                                                                                  newAllCommitteList.removeAt(index);
                                                                                                  _isCheckedCommitte[i]=false;
                                                                                                  _isCheckedItemsCommitte[i]='';
                                                                                                  _isCheckedItemsCommitteIntegers[i]=-1;
                                                                                                  break;
                                                                                                  print("Intsdid");
                                                                                                }else{
                                                                                                  print("Oustsdid");
                                                                                                }
                                                                                              }
                                                                                            });
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.clear,
                                                                                            size: 20,
                                                                                            color: grayTextColor,
                                                                                          ))
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              }),
                                                                        ),
                                                                        Expanded(
                                                                            flex: 1,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                setState(() {
                                                                                  isCommitteExpanded = !isCommitteExpanded;
                                                                                });
                                                                              },
                                                                              child: isCommitteExpanded
                                                                                  ? Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                size: 24,
                                                                                color: grayTextColor,
                                                                              )
                                                                                  : Icon(
                                                                                Icons.keyboard_arrow_up,
                                                                                size: 24,
                                                                                color: grayTextColor,
                                                                              ),
                                                                            ))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  // DropdownButton<String>(
                                                                  //   items: classificationList.map((String value) {
                                                                  //     return DropdownMenuItem<String>(
                                                                  //       value: value,
                                                                  //       child: Text(value),
                                                                  //     );
                                                                  //   }).toList(),
                                                                  //   onChanged: (_) {},
                                                                  // )
                                                                ],
                                                              ),
                                                            ),
                                                            isCommitteExpanded ? SizedBox(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(
                                                                      14),
                                                                  border: Border.all(
                                                                      color: Colors.grey, // set border color
                                                                      width: 1.0),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .black12,
                                                                        blurRadius:
                                                                        10)
                                                                  ],
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    const SizedBox(height: 10,),
                                                                    InkWell(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          isCommitteExpanded=!isCommitteExpanded;
                                                                        },
                                                                        );
                                                                      },
                                                                      child:  Container(
                                                                        child: Icon(Icons.clear,color: Colors.white,size: 18,),
                                                                        decoration: BoxDecoration(
                                                                          color: yellowColor,
                                                                          borderRadius: BorderRadius.circular(14),
                                                                          border: Border.all(color: yellowColor, width: 1.0),
                                                                          boxShadow: [
                                                                            BoxShadow(color: Colors.black12, blurRadius: 10)
                                                                          ],
                                                                        ),
                                                                        padding: EdgeInsets.all(2),
                                                                      ),
                                                                    ),

                                                                    const SizedBox(height: 10,),

                                                                    ListView.builder(
                                                                      physics: const NeverScrollableScrollPhysics(),
                                                                      shrinkWrap: true,
                                                                      itemCount: allCommitteList?.length,
                                                                      itemBuilder: (BuildContext context, int index) {
                                                                        return CheckboxListTile(
                                                                          checkColor: Colors.white,
                                                                          activeColor: Colors.amberAccent,
                                                                          title: Text(allCommitteList[index].name,
                                                                            style:  TextStyle(
                                                                                fontSize: 22
                                                                            ),),
                                                                          value: _isCheckedCommitte[index],
                                                                          onChanged: (val) {
                                                                            setState(
                                                                                  () {
                                                                                _isCheckedCommitte[index] = val;
                                                                                if (val) {
                                                                                  _isCheckedItemsCommitte[index]=allCommitteList[index].name;
                                                                                  _isCheckedItemsCommitteIntegers[index]=allCommitteList[index].id;
                                                                                }else{
                                                                                  _isCheckedItemsCommitte[index]='';
                                                                                  _isCheckedItemsCommitteIntegers[index]=-1;
                                                                                }

                                                                                if(val){
                                                                                  setState(() {
                                                                                    newAllCommitteList.add(CommitteeResponseModelData(name:allCommitteList[index].name));
                                                                                  },
                                                                                  );
                                                                                }else{
                                                                                  setState(() {
                                                                                    print("insideFalse");
                                                                                    for(int i=0;i<newAllCommitteList.length;i++){
                                                                                      print("nameFor"+newAllCommitteList[i].name);
                                                                                      if(allCommitteList[index].name==newAllCommitteList[i].name){
                                                                                        print("insideFor");
                                                                                        newAllCommitteList.removeAt(i);
                                                                                        break;
                                                                                      }else{
                                                                                        print("OutsideFor");
                                                                                      }
                                                                                    }
                                                                                  },
                                                                                  );

                                                                                }
                                                                              },
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                    const SizedBox(height: 10,),
                                                                  ],
                                                                ),
                                                              ),
                                                            ) : Container(),

                                                            const SizedBox(
                                                              height: 20,
                                                            ),
                                                            Text(
                                                              AppLocalizations.of(context).lblStatus, style: grayTextColorStyleBlack(20),),
                                                            const SizedBox(
                                                              height: 4,
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
                                                              // margin: EdgeInsets.only(top: 10),
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: grayTextColor
                                                                          .withOpacity(
                                                                          0.6),
                                                                      width: 0.6),
                                                                  borderRadius: BorderRadius
                                                                      .all(Radius
                                                                      .circular(
                                                                      16))),
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    // padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                                                    height: 28,
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 8,
                                                                          // width:MediaQuery.of(context).size.width-100,
                                                                          child: ListView.builder(
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.horizontal,
                                                                              itemCount: newAllStatusList.length,
                                                                              itemBuilder: (context, index) {
                                                                                return Container(
                                                                                  margin: EdgeInsets.only(left: 8, right: 8),
                                                                                  padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 2),
                                                                                  decoration: BoxDecoration(
                                                                                      color: Color(0xffeaeaea),
                                                                                      // color: Colors.red,
                                                                                      border: Border.all(color: Color(0xffeaeaea), width: 0.6),
                                                                                      borderRadius: BorderRadius.all(Radius.circular(9))),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                                                                    children: [
                                                                                      Container(
                                                                                        margin: EdgeInsets.only(top: 2),
                                                                                        child: Text(
                                                                                          newAllStatusList[index].name,
                                                                                          style: TextStyle(fontSize: 22, fontFamily: 'medium', color: Color(0xff617287)),
                                                                                        ),
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        width: 4,
                                                                                      ),
                                                                                      InkWell(
                                                                                          onTap: () {
                                                                                            setState(() {
                                                                                              for(int i=0;i<_isCheckedItems.length;i++){
                                                                                                if(newAllStatusList[index].name==_isCheckedItems[i]||
                                                                                                    newAllStatusList[index].name==' '+_isCheckedItems[i]){
                                                                                                  newAllStatusList.removeAt(index);
                                                                                                  _isChecked[i]=false;
                                                                                                  _isCheckedItems[i]='';
                                                                                                  _isCheckedItemsStatusIntegers[i]=-1;
                                                                                                  break;
                                                                                                  print("Intsdid");
                                                                                                }else{
                                                                                                  print("Oustsdid");
                                                                                                }
                                                                                              }
                                                                                            });
                                                                                          },
                                                                                          child: Icon(
                                                                                            Icons.clear,
                                                                                            size: 20,
                                                                                            color: grayTextColor,
                                                                                          ))
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              }),
                                                                        ),
                                                                        Expanded(
                                                                            flex: 1,
                                                                            child:
                                                                            InkWell(
                                                                              onTap:
                                                                                  () {
                                                                                setState(() {
                                                                                  isStatusExpanded = !isStatusExpanded;
                                                                                });
                                                                              },
                                                                              child: isStatusExpanded
                                                                                  ? Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                size: 24,
                                                                                color: grayTextColor,
                                                                              )
                                                                                  : Icon(
                                                                                Icons.keyboard_arrow_up,
                                                                                size: 24,
                                                                                color: grayTextColor,
                                                                              ),
                                                                            ))
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  // DropdownButton<String>(
                                                                  //   items: classificationList.map((String value) {
                                                                  //     return DropdownMenuItem<String>(
                                                                  //       value: value,
                                                                  //       child: Text(value),
                                                                  //     );
                                                                  //   }).toList(),
                                                                  //   onChanged: (_) {},
                                                                  // )
                                                                ],
                                                              ),
                                                            ),
                                                            isStatusExpanded ? SizedBox(
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(
                                                                      14),
                                                                  border: Border.all(
                                                                      color: Colors.grey, // set border color
                                                                      width: 1.0),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .black12,
                                                                        blurRadius:
                                                                        10)
                                                                  ],
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    const SizedBox(height: 10,),
                                                                    InkWell(
                                                                      onTap: () {
                                                                        setState(() {
                                                                          isStatusExpanded=!isStatusExpanded;
                                                                        },
                                                                        );
                                                                      },
                                                                      child:  Container(
                                                                        child: Icon(Icons.clear,color: Colors.white,size: 18,),
                                                                        decoration: BoxDecoration(
                                                                          color: yellowColor,
                                                                          borderRadius: BorderRadius.circular(14),
                                                                          border: Border.all(color: yellowColor, width: 1.0),
                                                                          boxShadow: [
                                                                            BoxShadow(color: Colors.black12, blurRadius: 10)
                                                                          ],
                                                                        ),
                                                                        padding: EdgeInsets.all(2),
                                                                      ),
                                                                    ),

                                                                    const SizedBox(height: 10,),
                                                                    ListView.builder(
                                                                      physics: const NeverScrollableScrollPhysics(),
                                                                      shrinkWrap: true,
                                                                      itemCount: allStatusList?.length,
                                                                      itemBuilder: (BuildContext context, int index) {
                                                                        return CheckboxListTile(
                                                                          checkColor: Colors.white,
                                                                          activeColor: Colors.amberAccent,
                                                                          title: Text(allStatusList[index].name,style:
                                                                          TextStyle(
                                                                              fontSize: 22
                                                                          ),),
                                                                          value: _isChecked[index],
                                                                          onChanged: (val) {
                                                                            setState(
                                                                                  () {
                                                                                _isChecked[index] = val;
                                                                                if (val) {
                                                                                  _isCheckedItems[index]=allStatusList[index].name;
                                                                                  _isCheckedItemsStatusIntegers[index]=allStatusList[index].id;
                                                                                }else{
                                                                                  _isCheckedItems[index]='';
                                                                                  _isCheckedItemsStatusIntegers[index]=-1;
                                                                                }

                                                                                if(val){
                                                                                  setState(() {
                                                                                    newAllStatusList.add(AllStatusResponse(name:allStatusList[index].name));
                                                                                  },
                                                                                  );
                                                                                }else{
                                                                                  setState(() {
                                                                                    print("insideFalse");
                                                                                    for(int i=0;i<newAllStatusList.length;i++){
                                                                                      print("nameFor"+newAllStatusList[i].name);
                                                                                      if(allStatusList[index].name==newAllStatusList[i].name){
                                                                                        print("insideFor");
                                                                                        newAllStatusList.removeAt(i);
                                                                                        break;
                                                                                      }else{
                                                                                        print("OutsideFor");
                                                                                      }
                                                                                    }
                                                                                  },
                                                                                  );

                                                                                }
                                                                              },
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                    // const SizedBox(height: 6,),
                                                                    // Row(
                                                                    //     mainAxisAlignment: MainAxisAlignment.center ,
                                                                    //     crossAxisAlignment: CrossAxisAlignment.center,
                                                                    // children: [
                                                                    //     Container(
                                                                    //       child: Text("Ok", style: whiteColorStyle(16),),
                                                                    //       decoration: BoxDecoration(
                                                                    //         color: yellowColor,
                                                                    //         borderRadius: BorderRadius.circular(14),
                                                                    //         border: Border.all(color: yellowColor, width: 1.0),
                                                                    //         boxShadow: [
                                                                    //           BoxShadow(color: Colors.black12, blurRadius: 10)
                                                                    //         ],
                                                                    //       ),
                                                                    //       padding: EdgeInsets.only(left: 16,right: 16,top: 6,bottom: 4),
                                                                    //     ),
                                                                    //     const SizedBox(width: 10,),
                                                                    //   Container(
                                                                    //     child: Text("Cancel", style: whiteColorStyle(16),),
                                                                    //     decoration: BoxDecoration(
                                                                    //       color: yellowColor,
                                                                    //       borderRadius: BorderRadius.circular(14),
                                                                    //       border: Border.all(color: yellowColor, width: 1.0),
                                                                    //       boxShadow: [
                                                                    //         BoxShadow(color: Colors.black12, blurRadius: 10)
                                                                    //       ],
                                                                    //     ),
                                                                    //     padding: EdgeInsets.only(left: 16,right: 16,top: 6,bottom: 4),
                                                                    //   )
                                                                    //   ],
                                                                    // ),
                                                                    const SizedBox(height: 10,),
                                                                  ],
                                                                ),
                                                              ),
                                                            ) : Container(),
                                                            const SizedBox(
                                                              height: 20,
                                                            ),

                                                            const SizedBox(
                                                              height: 26,
                                                            ),
                                                            Container(
                                                              padding:
                                                              EdgeInsets.only(
                                                                  top: 4,
                                                                  bottom: 2),
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width,
                                                              // height: 43.0,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    10.0),
                                                                gradient:
                                                                LinearGradient(
                                                                  // Where the linear gradient begins and ends
                                                                  begin: Alignment
                                                                      .topRight,
                                                                  end: Alignment
                                                                      .bottomLeft,
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
                                                                  AppLocalizations.of(context).lblFilter,
                                                                  style: whiteColorStyle(21),
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
                                                                  // setState((){
                                                                  Navigator.pop(context);
                                                                  print("Hereeeee");
                                                                  filterFunc();
                                                                  // },);
                                                                },
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 20,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                        },
                                        isDismissible: false
                                    );

                                  },
                                  child: Icon(
                                    Icons.filter_alt_outlined,
                                    size: 22,
                                    color: grayTextColor,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              // InkWell(
                              //   onTap: () async{
                              //     this.check =  await Navigator.of(context).push(
                              //         MaterialPageRoute(
                              //             builder: (context) => CreateMeetingScreen()));
                              //     if (check != null) {
                              //       getAllMeetings(userToken);
                              //       print("omarrrrr");
                              //     }
                              //   },
                              //   child: Container(
                              //     padding: EdgeInsets.only(
                              //         left: 8, right: 8, top: 6, bottom: 6),
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10.0),
                              //       gradient: LinearGradient(
                              //         begin: Alignment.topRight,
                              //         end: Alignment.bottomLeft,
                              //         stops: [0.1, 0.9],
                              //         colors: [
                              //           yellowLightColor,
                              //           yellowLightColor,
                              //         ],
                              //       ),
                              //     ),
                              //     child: Text(
                              //       "+",
                              //       style: yellowColorStyleBold(26),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          // physics: AlwaysScrollableScrollPhysics (),
                          // physics: ScrollPhysics (),
                          // controller: controllerScroll,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                height: 30,
                              ),
                              // DropdownDatePicker(
                              //   firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
                              //   lastDate: ValidDate(year: now.year, month: now.month, day: now.month),
                              //   underLine: Text("kkkkkkkk"),
                              // ),
                            allMeetingList.isNotEmpty?  makeBodyForAllmeetings(context, allMeetingList):
                              Center(
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/no_data.png"),
                                    const SizedBox(height: 10,),
                                    Text(AppLocalizations.of(context).lblNoData,style: blueColorBoldStyle(14),)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              // SizedBox(
                              //   height: 40,
                              //   child: ListView.builder(
                              //     scrollDirection: Axis.horizontal,
                              //     itemCount: listLength,
                              //     shrinkWrap: true,
                              //     physics: NeverScrollableScrollPhysics(),
                              //     padding: EdgeInsets.zero,
                              //     itemBuilder: (BuildContext context, int index) =>
                              //         InkWell(
                              //           onTap: () {
                              //             getAllMeetings(userToken, selectedDateString);
                              //           },
                              //           child: Container(
                              //             margin: EdgeInsets.only(left: 3,right: 3),
                              //             padding: EdgeInsets.only(left: 7,right: 7,bottom: 6),
                              //             child: Center(
                              //               child: Text((index.toString()).toString(),
                              //                 style: TextStyle(
                              //                     fontSize: 16,fontFamily: 'regular',color:
                              //                 page==index+1?Colors.white:Colors.black
                              //                 ),),
                              //             ),
                              //             decoration: BoxDecoration(
                              //               borderRadius: BorderRadius.circular(30.0),
                              //               gradient: LinearGradient(
                              //                 begin: Alignment.topRight,
                              //                 end: Alignment.bottomLeft,
                              //                 stops: [0.1, 0.9],
                              //                 colors: [
                              //                   page==index+1?Color(0xffFEC20E):Colors.transparent,
                              //                   page==index+1?Color(0xffFEC20E):Colors.transparent,
                              //                 ],
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //
                              //   ),
                              // ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }else{
                return Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                  AppLocalizations.of(context).lblMeetings,
                                  style: blueColorBoldStyle(26),
                                ),margin: EdgeInsets.only(top: 0,left: 16,right: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child:InkWell(
                                  onTap:  () {
                                    showDateDialog(context);
                                  },
                                  child: Container(
                                    width: 160,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: new BorderRadius.circular(10.0),
                                        border: Border.all(
                                            color: Colors.blue,// set border color
                                            width: 1.0
                                        )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        TextButton(child: Text(selectedDateString,style: blueColorBoldStyle(22),),
                                          onPressed: () {
                                            showDateDialog(context);
                                          },),
                                        Icon(Icons.arrow_drop_down_rounded,size: 30,)
                                      ],
                                    ),
                                  ),
                                ) ,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                  onTap: () {
                                  openBottomSheetForFilter(context);
                                  },
                                  child: Icon(
                                    Icons.filter_alt_outlined,
                                    size: 30,
                                    color: grayTextColor,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      allMeetingList!=null&&allMeetingList.isNotEmpty?Expanded(
                        child: makeBodyForAllmeetings(context, allMeetingList),
                      ):Expanded(
                        child: Center(
                          child: Container(
                            height: 250,
                            width: 250,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/no_data.png"),
                                const SizedBox(height: 10,),
                                Text(AppLocalizations.of(context).lblNoData,style: blueColorStyleMediumWithColor(18,Colors.black),)
                              ],
                            ),
                          ),
                        ),
                      )
                      // isFiltered?
                      // allFilterdMeetingList.isEmpty?
                      // Expanded(
                      //   child: Center(
                      //     child: Container(
                      //       height: 250,
                      //       width: 250,
                      //       color: Colors.white,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Image.asset("assets/images/no_data.png"),
                      //           const SizedBox(height: 10,),
                      //           Text(AppLocalizations.of(context).lblNoData,style: blueColorStyleMediumWithColor(18,Colors.black),)
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ):Expanded(
                      //   child: makeBodyForAllmeetings(context, allFilterdMeetingList),
                      // ):allMeetingList.isNotEmpty?Expanded(
                      //   child: makeBodyForAllmeetings(context, allMeetingList),
                      // ):Expanded(
                      //   child: Center(
                      //     child: Container(
                      //       height: 250,
                      //       width: 250,
                      //       color: Colors.white,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Image.asset("assets/images/no_data.png"),
                      //           const SizedBox(height: 10,),
                      //           Text(AppLocalizations.of(context).lblNoData,style: blueColorStyleMediumWithColor(18,Colors.black),)
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // )
                      ,const SizedBox(height: 20,),
                      if(allMeetingList!=null&&allMeetingList.isNotEmpty ) SizedBox(
                        // width: 150,
                          height: 30,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  if(page>1) {
                                    allMeetingList=[];
                                    page = page - 1;
                                    getAllMeetings(userToken, selectedDateString, page);
                                    setState(() {});
                                  }
                                },
                                child: Icon(Icons.arrow_back_ios_outlined,size: 14,),
                              ),
                              const SizedBox(width: 6,),
                             if( listLength==listedIntegers.length ) ListView.builder(
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: listLength,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (BuildContext context, int index) =>
                                    InkWell(
                                      onTap: () {
                                        allMeetingList=[];
                                        page=listedIntegers[index];
                                        getAllMeetings(userToken, selectedDateString,page);
                                        setState(() {});
                                      },
                                      child: CircleAvatar(
                                        maxRadius: 14,
                                        backgroundColor: page==index+1?Color(0xffFEC20E):Colors.transparent,
                                        child: Text(listedIntegers[index].toString(),
                                          style: TextStyle(
                                              fontSize: 16,fontFamily: 'regular',color: page==index+1?Colors.white:Colors.black
                                          ),),
                                      ),
                                    ),
                              ),
                              const SizedBox(width: 6,),
                              InkWell(
                                onTap: () {
                                  if(page<listLength) {
                                    allMeetingList=[];
                                    page = page + 1;
                                    getAllMeetings(userToken, selectedDateString, page);
                                    setState(() {});
                                  }
                                },
                                child: Icon(Icons.arrow_forward_ios,size: 14,),
                              ),
                            ],
                          )

                      ),

                      const SizedBox(height: 20,),
                    ],
                  ),
                );
              }
            },),
          );
        },
      ),
    );
  }

  void showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("اختر السنة",style: TextStyle(fontFamily: 'regular',color: Colors.black),),
          content: Container( // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate: DateTime.now(),
              selectedDate: dateCurrent,
              onChanged: (DateTime dateTime) {
                dateCurrent=dateTime;
                selectedDateString=dateTime.year.toString();
                page=1;
                // role="";
                // attendance="";
                // committee="";
                // meeting_status_id="";
                print("selectedDateString>"+selectedDateString);
                allMeetingList=[];
                setState(() {});
                getAllMeetings(userToken, selectedDateString,page);
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
}




