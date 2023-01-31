import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:itimaatysoharsohar/LocalDb/DecisionTableOffline.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/AttendenceModel.dart';
import 'package:itimaatysoharsohar/Models/ChangeMeetingStatusRequestModel.dart';
import 'package:itimaatysoharsohar/Models/ChangeStatusMeetingResponseModel.dart';
import 'package:itimaatysoharsohar/Models/LoginResponseModel.dart';
import 'package:itimaatysoharsohar/Models/UserChangeStatusRequestModel.dart';
import 'package:itimaatysoharsohar/Models/add_note_request_model.dart';
import 'package:itimaatysoharsohar/Models/add_note_response_model.dart';
import 'package:itimaatysoharsohar/Models/all_meetings_response.dart';
import 'package:itimaatysoharsohar/Models/all_status_response.dart';
import 'package:itimaatysoharsohar/Models/committee_response_model.dart';
import 'package:itimaatysoharsohar/Models/dashboard_response_model.dart';
import 'package:itimaatysoharsohar/Models/metting_details_response_model.dart';
import 'package:itimaatysoharsohar/Models/user_change_status_response_model.dart';
import 'package:itimaatysoharsohar/Repository/MeetingRepository.dart';
import 'package:itimaatysoharsohar/Repository/UserRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/View/CreateMeetingScreen.dart';
import 'package:itimaatysoharsohar/View/DrawerWidget.dart';
import 'package:itimaatysoharsohar/View/FontsStyle.dart';
import 'package:itimaatysoharsohar/View/SignInScreen.dart';
import 'package:itimaatysoharsohar/View/WebViewScreenForMirrorView.dart';
import 'package:itimaatysoharsohar/Widgets/ActionsWidget.dart';
import 'package:itimaatysoharsohar/Widgets/AgendaDetailsScreen.dart';
import 'package:itimaatysoharsohar/Widgets/DescisionsWidget.dart';
import 'package:itimaatysoharsohar/Widgets/HomeWidgets.dart';
import 'package:itimaatysoharsohar/Widgets/MeetingDetailsWidgets.dart';
import 'package:itimaatysoharsohar/Widgets/TalkingPointsWidget.dart';
import 'package:itimaatysoharsohar/cubit/Home/HomeCubit.dart';
import 'package:itimaatysoharsohar/cubit/Home/HomeStates.dart';
import 'package:url_launcher/url_launcher.dart';

import '../LocalDb/DbHelper.dart';
import '../LocalDb/OfflineDataLocalModel.dart';


class MeetingDetailsScreen extends StatefulWidget {
  int meetingId;
  MeetingDetailsScreen(this.meetingId);

  @override
  MeetingDetailsScreenState createState() => MeetingDetailsScreenState();
}

class MeetingDetailsScreenState extends State<MeetingDetailsScreen> {

  var controllerScroll = ScrollController();
  var noteControler = TextEditingController();
  var tellUsControler = TextEditingController();
  MeetingDetailsResponseModel meetingDetailsResponseModel = new MeetingDetailsResponseModel();
  MeetingRepository meetingRepository;
  String userToken="";
  int selectedPos=0;
  bool openTellUs =false;
  List<String> goingList=[];
  List<String> notGoingList=[];
  List<String> pendingList=[];
  List<String> mayBeList=[];
  int totalNum=0;
  List<AgendasData> decisionAgendas=[];
  List<AgendasData> talkingPointsAgendas=[];
  List<AgendasData> actionsAgendas=[];
  bool isExist =false;
  String baseUrl="";
  String editNote;
  UserRepository userRepository;
  int userId;
  String email="";
  String attendanceStatus='';
  var dbHelper = DbHelper();

  DateTime stringToDateTimeNew(String dateString){
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime;
  }

  Future getAgendaData(int userId,String email) async{
    // int index=0;
    if(meetingDetailsResponseModel!=null){
      if(meetingDetailsResponseModel.agendas!=null){
      if(meetingDetailsResponseModel.agendas.isNotEmpty){
      for(int i=0;i<meetingDetailsResponseModel.agendas.length;i++ ){
        // index=i;
        // meetingDetailsResponseModel.agendas[i].setIndex=index++;
        if(meetingDetailsResponseModel.agendas[i].agendaType!=null){
          if(meetingDetailsResponseModel.agendas[i].agendaType=="talking_point"){
            for(int m=0;m<meetingDetailsResponseModel.agendas[i].data.length;m++ ) {

              meetingDetailsResponseModel.agendas[i].data[m].setIndex=i+1;


              if(meetingDetailsResponseModel.agendas[i].data[m]!=null){
                if(meetingDetailsResponseModel.agendas[i].data[m].decision!=null){
                  for(int z=0;z<meetingDetailsResponseModel.agendas[i].data[m].decision.length;z++){

                    if(meetingDetailsResponseModel.agendas[i].data[m].decision[z].voters!=null){
                      if(meetingDetailsResponseModel.agendas[i].data[m].decision[z].voters.isNotEmpty){

                        for(int g=0;g<meetingDetailsResponseModel.agendas[i].data[m].decision[z].voters.length;g++){
                          if(meetingDetailsResponseModel.agendas[i].data[m].decision[z].voters[g].userId!=null) {
                            if (userId == meetingDetailsResponseModel.agendas[i].data[m].decision[z].voters[g].userId) {
                              meetingDetailsResponseModel.agendas[i].data[m].decision[z].status
                              = meetingDetailsResponseModel.agendas[i].data[m].decision[z].voters[g].vote;
                              break;
                            }
                          }else{
                            if(meetingDetailsResponseModel.agendas[i].data[m].decision[z].voters[g].userEmail!=null){
                              if (email == meetingDetailsResponseModel.agendas[i].data[m].decision[z].voters[g].userEmail) {
                                meetingDetailsResponseModel.agendas[i].data[m].decision[z].status
                                = meetingDetailsResponseModel.agendas[i].data[m].decision[z].voters[g].vote;
                                break;
                              }
                            }
                          }
                        }

                      }else{
                      }
                    }else{
                    }

                  }

                }else{
                  print("kokokoko8>>"+"kokokoko8");
                }

                if(meetingDetailsResponseModel.agendas[i].data[m].subpoints!=null){
                  for(int z=0;z<meetingDetailsResponseModel.agendas[i].data[m].subpoints.length;z++){

                    if( meetingDetailsResponseModel.agendas[i].data[m].subpoints[z].decision!=null){
                      for (int k = 0; k < meetingDetailsResponseModel.agendas[i].data[m].subpoints[z].decision.length; k++) {
                        DateTime now =DateTime.now();
                        DateTime date = stringToDateTimeNew(meetingDetailsResponseModel.agendas[i].data[m].subpoints[z].decision[k].deadline);

                        if(date.isBefore(now)){
                        }else{
                          if(meetingDetailsResponseModel.agendas[i].data.isNotEmpty){
                            for(int d = 0; d <meetingDetailsResponseModel.agendas[i].data[m].subpoints[z].decision[k].voters.length; d++){
                              if(userId!=null){
                                if(userId==meetingDetailsResponseModel.agendas[i].data[m].subpoints[z].decision[k].voters[d].userId){
                                  meetingDetailsResponseModel.agendas[i].data[m].subpoints[z].decision[k].status
                                  =meetingDetailsResponseModel.agendas[i].data[m].subpoints[z].decision[k].voters[d].vote;
                                  break;
                                }else{

                                }
                              }else{
                                // checkMail
                                if(email==meetingDetailsResponseModel.agendas[i].data[m].subpoints[z].decision[k].voters[d].userEmail){
                                  meetingDetailsResponseModel.agendas[i].data[m].subpoints[z].decision[k].status
                                  =meetingDetailsResponseModel.agendas[i].data[m].subpoints[z].decision[k].voters[d].vote;

                                  break;
                                }else{

                                }
                              }
                            }
                          }

                        }
                      }
                    }
                  }
                }

              }

              talkingPointsAgendas.add(meetingDetailsResponseModel.agendas[i].data[m]);
            }
          }else if(meetingDetailsResponseModel.agendas[i].agendaType=="decision"){
            for(int m=0;m<meetingDetailsResponseModel.agendas[i].data.length;m++ ) {
              // meetingDetailsResponseModel.agendas[i].data[m].setIndex=i+1;
              decisionAgendas.add(meetingDetailsResponseModel.agendas[i].data[m]);
              // print("length>"+decisionAgendas.length.toString());
            }
          }else if(meetingDetailsResponseModel.agendas[i].agendaType=="action"){
            for(int m=0;m<meetingDetailsResponseModel.agendas[i].data.length;m++ ) {
              // meetingDetailsResponseModel.agendas[i].data[m].setIndex=i+1;
              actionsAgendas.add(meetingDetailsResponseModel.agendas[i].data[m]);
            }
          }
        }
      }
      }
      }
    }
  }

  String getStatus(String actionStatus){
    String actionColorStatus=Colors.green.toString();
    if(actionStatus=="Complete")  {
      actionColorStatus=Colors.green.toString();
    }else if(actionStatus.contains("Not Complete"))  {
      actionColorStatus=Color(0xffFF6A81).toString();
    }else if(actionStatus.contains("In Progress"))  {
      actionColorStatus=Color(0xffFEC20E).toString();
    }
    return actionColorStatus;
  }

  Future prepare(int userId, String email) async {
    setState(() {
    print("hhhhhhhhhhhhhhhhh1");
    String status="";
    // widget.talkingPointList[0].s
    if (talkingPointsAgendas != null && talkingPointsAgendas.isNotEmpty) {
      for (int i = 0; i < talkingPointsAgendas.length; i++) {
        if(talkingPointsAgendas[i].action!=null){
            if( talkingPointsAgendas[i].action!=null){
              for (int k = 0; k < talkingPointsAgendas[i].action.length; k++) {
                print("vvvvvvvv");
                DateTime now =DateTime.now();
                DateTime date = stringToDateTimeNew(talkingPointsAgendas[i].action[k].openTill);
                print("now>"+now.toString());
                print("date>"+date.toString());
                for(int m = 0; m <talkingPointsAgendas[i].action[k].participants.length; m++){
                  if(userId!=null){
                    if(userId==talkingPointsAgendas[i].action[k].participants[m].userId){

                        status=talkingPointsAgendas[i].action[k].participants[m].status;
                        talkingPointsAgendas[i].action[k].setStatus=status;
                        talkingPointsAgendas[i].action[k].setColor=getStatus(status);
                        print("statussssss>>"+status.toString());
                      break;
                    }else{
                      talkingPointsAgendas[i].action[k].setStatus=null;
                      status=null;
                    }
                  }else{
                    // checkMail
                    if(email==talkingPointsAgendas[i].action[k].participants[m].userEmail){
                        status=talkingPointsAgendas[i].action[k].participants[m].status;
                        talkingPointsAgendas[i].action[k].setStatus=status;
                        talkingPointsAgendas[i].action[k].setColor=getStatus(status);
                        print("statusssssss2>>"+status.toString());
                      break;
                    }else{
                      talkingPointsAgendas[i].action[k].setStatus=null;
                      status=null;
                    }
                  }
                }
              }
            }
        }

        if(talkingPointsAgendas[i].subpoints!=null){
          for(int z=0;z<talkingPointsAgendas[i].subpoints.length;z++){

            if( talkingPointsAgendas[i].subpoints[z].action!=null){
              for (int k = 0; k < talkingPointsAgendas[i].subpoints[z].action.length; k++) {
                print("vvvvvvvv");
                DateTime now =DateTime.now();
                DateTime date = stringToDateTimeNew(talkingPointsAgendas[i].subpoints[z].action[k].openTill);
                print("now>"+now.toString());
                print("date>"+date.toString());

                if(date.isBefore(now)){
                }else{
                  for(int m = 0; m <talkingPointsAgendas[i].subpoints[z].action[k].participants.length; m++){
                    if(userId!=null){
                      if(userId==talkingPointsAgendas[i].subpoints[z].action[k].participants[m].userId){
                        status=talkingPointsAgendas[i].subpoints[z].action[k].participants[m].status;
                        talkingPointsAgendas[i].subpoints[z].action[k].setStatus=status;
                        talkingPointsAgendas[i].subpoints[z].action[k].setColor=getStatus(status);
                        print("statussssss>>"+status.toString());
                        break;
                      }else{
                        talkingPointsAgendas[i].subpoints[z].action[k].setStatus=null;
                        status=null;
                      }
                    }else{
                      // checkMail
                      if(email==talkingPointsAgendas[i].subpoints[z].action[k].participants[m].userEmail){
                        status=talkingPointsAgendas[i].subpoints[z].action[k].participants[m].status;
                        talkingPointsAgendas[i].subpoints[z].action[k].setStatus=status;
                        talkingPointsAgendas[i].subpoints[z].action[k].setColor=getStatus(status);
                        print("statusssssss2>>"+status.toString());
                        break;
                      }else{
                        talkingPointsAgendas[i].subpoints[z].action[k].setStatus=null;
                        status=null;
                      }
                    }
                  }
                }
              }
            }
          }
        }

      }
    }
    // return status;
    });
  }

  Future prepareForActions(int userId, String email) async {
    setState(() {
      print("hhhhhhhhhhhhhhhhh1hkbkjvhjc>>"+userId.toString());
      String status="";
      // widget.talkingPointList[0].s
      if (actionsAgendas != null && actionsAgendas.isNotEmpty) {
        for (int i = 0; i < actionsAgendas.length; i++) {
            DateTime now =DateTime.now();
            DateTime date = stringToDateTimeNew(actionsAgendas[i].open_till);
            print("now>"+now.toString());
            print("date>"+date.toString());
            for(int m = 0; m <actionsAgendas[i].participants.length; m++){
              if(userId!=null){
                if(userId==actionsAgendas[i].participants[m].userId){

                  // actionsAgendas[i].setColor=getStatus(status);
                  actionsAgendas[i].actionStauss=actionsAgendas[i].participants[m].status;
                  print("InsideAction2>>"+status.toString());
                  break;
                }else{
                  actionsAgendas[i].actionStauss=null;
                }
              }else{
                // checkMail
                if(email==actionsAgendas[i].participants[m].userEmail){
                  // actionsAgendas[i].setColor=getStatus(status);
                  actionsAgendas[i].actionStauss=actionsAgendas[i].participants[m].status;
                  print("InsideAction>>"+status.toString());
                  break;
                }else{
                  actionsAgendas[i].actionStauss=null;
                  status=null;
                }
              }
            }
        }
      }
      // return status;
    });
  }

  Future prepareForDecsisons(int userId, String email) async {
    setState(() {
      print("hhhhhhhhhhhhhhhhh1Dess>>"+userId.toString());
      String status="";
      // widget.talkingPointList[0].s
      if (decisionAgendas != null && decisionAgendas.isNotEmpty) {
        for (int i = 0; i < decisionAgendas.length; i++) {
            DateTime now =DateTime.now();
            DateTime date = stringToDateTimeNew(decisionAgendas[i].deadline);
            print("now>"+now.toString());
            print("date>"+date.toString());
            if(decisionAgendas[i].voters!=null&&decisionAgendas[i].voters.isNotEmpty)
            for(int m = 0; m <decisionAgendas[i].voters.length; m++){
              if(userId!=null){
                if(userId==decisionAgendas[i].voters[m].userId){
                  // decisionAgendas[i].setColor=getStatus(status);
                  decisionAgendas[i].setStauss=decisionAgendas[i].voters[m].vote;
                  print("InsideAction4>>"+status.toString());
                  break;
                }else{
                  decisionAgendas[i].setStauss=null;
                }
              }else{
                // checkMail
                if(email==decisionAgendas[i].voters[m].userEmail){
                  // decisionAgendas[i].setColor=getStatus(status);
                  decisionAgendas[i].setStauss=decisionAgendas[i].voters[m].vote;
                  print("InsideAction5>>"+status.toString());
                  break;
                }else{
                  decisionAgendas[i].setStauss=null;
                  status=null;
                }
              }
            }
        }
      }
      // return status;
    });
  }

  Future getOfflineMeetingDetails() async {
    var orgainzationsFuture = dbHelper.getAllMeetingsDetailsColumn(baseUrl+Constants.MEETINGS_DETAILS+"/"+widget.meetingId.toString());
    orgainzationsFuture.then((data) {
      setState(()  {
        // this.offlineMeetings = data;
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.MEETINGS_DETAILS+"/"+widget.meetingId.toString()) {
            setState(() {
              MeetingDetailsResponseModel value =  MeetingDetailsResponseModel.fromJson(json.decode(localModel.allMeetingsDetails));
              meetingDetailsResponseModel = value;
              if(meetingDetailsResponseModel.attendanceStatus!=null){

                if(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&& meetingDetailsResponseModel.currentMember.attendanceStatus!=null){
                  attendanceStatus= meetingDetailsResponseModel.currentMember.attendanceStatus;

                  if(attendanceStatus=="Going"){
                    attendanceStatus=AppLocalizations.of(context).lblGoingS;
                  }else if(attendanceStatus=="Not Going"||attendanceStatus=="Not going"){
                    attendanceStatus=AppLocalizations.of(context).lblNotGoingS;
                  }else if(attendanceStatus=="Pending"){
                    attendanceStatus=AppLocalizations.of(context).lblPendingS;
                  }else if(attendanceStatus=="Maybe"){
                    attendanceStatus=AppLocalizations.of(context).lblMayBeS;
                  }
                }


                if(meetingDetailsResponseModel.attendanceStatus=="Going"){
                  selectedPos=1;
                }else if(meetingDetailsResponseModel.attendanceStatus=="Not Going"||meetingDetailsResponseModel.attendanceStatus=="Not going"){
                  selectedPos=2;
                }else if(meetingDetailsResponseModel.attendanceStatus=="Pending"){
                  selectedPos=3;
                }else if(meetingDetailsResponseModel.attendanceStatus=="Maybe"){
                  selectedPos=4;
                }else{
                  selectedPos=0;
                }
              }

              // if(meetingDetailsResponseModel.admins!=null&& meetingDetailsResponseModel.admins.isNotEmpty) {
              //   for (int i = 0; i < meetingDetailsResponseModel.admins.length; i++) {
              //     // if (meetingDetailsResponseModel.members[i].userId != userId) {
              //     if (meetingDetailsResponseModel.admins[i].id == userId) {
              //       isExist=true;
              //       break;
              //     }else{
              //       isExist=false;
              //     }
              //   }
              // }else{
              //   isExist=false;
              // }


              if(meetingDetailsResponseModel.members!=null&& meetingDetailsResponseModel.members.isNotEmpty) {
                for (int i = 0; i < meetingDetailsResponseModel.members.length; i++) {
                  // if (meetingDetailsResponseModel.members[i].userId != userId) {
                  if (meetingDetailsResponseModel.members[i].userId == userId) {
                    isExist=true;
                    break;
                  }else{
                    isExist=false;
                  }
                }
              }else{
                isExist=false;
              }

              if(meetingDetailsResponseModel.members!=null&& meetingDetailsResponseModel.members.isNotEmpty){
                for(int i=0;i<meetingDetailsResponseModel.members.length;i++) {
                  if (meetingDetailsResponseModel.members[i].attendanceStatus != null) {
                    if (meetingDetailsResponseModel.members[i].attendanceStatus == "Going") {
                      goingList.add(meetingDetailsResponseModel.members[i].attendanceStatus);
                    } else if (meetingDetailsResponseModel.members[i].attendanceStatus == "Not Going" ||
                        meetingDetailsResponseModel.members[i].attendanceStatus == "Not going") {
                      notGoingList.add(meetingDetailsResponseModel.members[i].attendanceStatus);
                    } else
                    if (meetingDetailsResponseModel.members[i].attendanceStatus == "Pending") {
                      pendingList.add(meetingDetailsResponseModel.members[i].attendanceStatus);
                    } else
                    if (meetingDetailsResponseModel.members[i].attendanceStatus == "Maybe") {
                      mayBeList.add(meetingDetailsResponseModel.members[i].attendanceStatus);
                    } else {
                    }
                  }
                  totalNum=goingList.length+notGoingList.length+pendingList.length+mayBeList.length;
                }
              }
              checkStatus();
              getAgendaData(userId, email).then((value) {
                prepare(userId, email).then((value) {
                  prepareForActions(userId, email).then((value) {
                    prepareForDecsisons(userId, email).then((value) {

                    });
                  });
                });
              });
            });
            break;
          }
          // allFilterdMeetingList = allMeetingList;
        }
      });
    });
  }

  Future<bool> addOrUpdateOfflineMeetingDetails(String string) async {
    // var orgainzationsFuture = dbHelper.getOfflineData();
    var orgainzationsFuture = dbHelper.getAllMeetingsDetailsColumn(baseUrl+Constants.MEETINGS_DETAILS+"/"+widget.meetingId.toString());
    // var orgainzationsFuture = dbHelper.getOfflineData();
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        OfflineDataLocalModel localModel =data[i];
        if(localModel.url == baseUrl+Constants.MEETINGS_DETAILS+"/"+widget.meetingId.toString()) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      if(m){
        print("Updatettt>>"+m.toString());
        var result = await dbHelper.updateMeetingDetails(baseUrl+Constants.MEETINGS_DETAILS+"/"+widget.meetingId.toString(),string);
      }else{
        print("Insertttt>>"+m.toString());
        var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          url: baseUrl+Constants.MEETINGS_DETAILS+"/"+widget.meetingId.toString(),
          allMeetingsDetails: string,
        ));
      }
    });
  }

  void getMeetingDetails(String baseUrl ,String token) {
    // load();
    meetingRepository = new MeetingRepository();
    // Future<MeetingDetailsResponseModel> allList = meetingRepository.getMeetingDetails(baseUrl,token,widget.meetingId);
    Future<String> allList = meetingRepository.getMeetingDetails(baseUrl,token,widget.meetingId);
    allList.then((string) {
      setState(() {
        if (string != null) {
          // showSuccess();
          MeetingDetailsResponseModel value =  MeetingDetailsResponseModel.fromJson(json.decode(string));
          addOrUpdateOfflineMeetingDetails(string);
          meetingDetailsResponseModel = value;
          // print("meetingDetailsResponseModeljjhjhjh>>"+meetingDetailsResponseModel.status.name.toString());
          if(meetingDetailsResponseModel.attendanceStatus!=null){

            if(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&& meetingDetailsResponseModel.currentMember.attendanceStatus!=null){
              attendanceStatus= meetingDetailsResponseModel.currentMember.attendanceStatus;

              if(attendanceStatus=="Going"){
                attendanceStatus=AppLocalizations.of(context).lblGoingS;
              }else if(attendanceStatus=="Not Going"||attendanceStatus=="Not going"){
                attendanceStatus=AppLocalizations.of(context).lblNotGoingS;
              }else if(attendanceStatus=="Pending"){
                attendanceStatus=AppLocalizations.of(context).lblPendingS;
              }else if(attendanceStatus=="Maybe"){
                attendanceStatus=AppLocalizations.of(context).lblMayBeS;
              }
            }


            if(meetingDetailsResponseModel.attendanceStatus=="Going"){
              selectedPos=1;
              // goingList.add(meetingDetailsResponseModel.attendanceStatus);
            }else if(meetingDetailsResponseModel.attendanceStatus=="Not Going"||meetingDetailsResponseModel.attendanceStatus=="Not going"){
              selectedPos=2;
              // notGoingList.add(meetingDetailsResponseModel.attendanceStatus);
            }else if(meetingDetailsResponseModel.attendanceStatus=="Pending"){
              selectedPos=3;
              // pendingList.add(meetingDetailsResponseModel.attendanceStatus);
            }else if(meetingDetailsResponseModel.attendanceStatus=="Maybe"){
              selectedPos=4;
              // mayBeList.add(meetingDetailsResponseModel.attendanceStatus);
            }else{
              selectedPos=0;
            }
          }
          if(meetingDetailsResponseModel.members!=null&& meetingDetailsResponseModel.members.isNotEmpty) {
            for (int i = 0; i < meetingDetailsResponseModel.members.length; i++) {
              // if (meetingDetailsResponseModel.members[i].userId != userId) {
              if (meetingDetailsResponseModel.members[i].userId == userId) {
                  isExist=true;
                  break;
              }else{
                isExist=false;
              }
            }
          }else{
            isExist=false;
          }

          if(meetingDetailsResponseModel.members!=null&& meetingDetailsResponseModel.members.isNotEmpty){
            for(int i=0;i<meetingDetailsResponseModel.members.length;i++) {
              if (meetingDetailsResponseModel.members[i].attendanceStatus != null) {
                if (meetingDetailsResponseModel.members[i].attendanceStatus == "Going") {
                  goingList.add(meetingDetailsResponseModel.members[i].attendanceStatus);
                } else if (meetingDetailsResponseModel.members[i].attendanceStatus == "Not Going" ||
                    meetingDetailsResponseModel.members[i].attendanceStatus == "Not going") {
                  notGoingList.add(meetingDetailsResponseModel.members[i].attendanceStatus);
                } else
                if (meetingDetailsResponseModel.members[i].attendanceStatus == "Pending") {
                  pendingList.add(meetingDetailsResponseModel.members[i].attendanceStatus);
                } else
                if (meetingDetailsResponseModel.members[i].attendanceStatus == "Maybe") {
                  mayBeList.add(meetingDetailsResponseModel.members[i].attendanceStatus);
                } else {
                }
              }
              totalNum=goingList.length+notGoingList.length+pendingList.length+mayBeList.length;
            }
          }
          checkStatus();
          getAgendaData(userId, email).then((value) {
            prepare(userId, email).then((value) {
              prepareForActions(userId, email).then((value) {
                prepareForDecsisons(userId, email).then((value) {

                });
              });
            });
          });
          // print("meetingDetailsResponseModel>>"+meetingDetailsResponseModel.startDate.toString());
          // print("meetingDetailsResponseModelName>>"+meetingDetailsResponseModel.currentMember.user.name);
        }else{
          // showError();
          if(string==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });
  }

  addNote(String token,String note,bool close)  {
    load();
    meetingRepository = new MeetingRepository();
    Future<AddNoteResponseModel> allList = meetingRepository.addNote(baseUrl,token,widget.meetingId,new AddNoteRequestModel(note: note));
    allList.then((value) {
      setState(() {
        if (value != null) {
          editNote=note;
          showSuccess();
          // meetingDetailsResponseModel = value;
          if(close) {
            Navigator.pop(context);
          }else{

          }
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    }).then((value) {
      dbHelper.deleteRow(whereArgs: [baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.NOTE]);
    });
  }

  Future<bool> addOrUpdateNote(String string) async {
    var orgainzationsFuture = dbHelper.getNoteRequest(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.NOTE);
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        DecisionTableOffline localModel =data[i];
        if(localModel.url == baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.NOTE) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      if(m){
        print("Updatettt>>"+m.toString());
        var result = await dbHelper.updateNoteRequest(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.NOTE,string);
      }else{
        print("Insertttt>>"+m.toString());
        var result = await dbHelper.insertRequestsData(DecisionTableOffline(
          url: baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.NOTE,
          addNoteRequest: string,
        ));
      }
    });
  }

  Future<bool> addOrUpdateStatus(String string,String reason) async {
    var orgainzationsFuture = dbHelper.getStatus(baseUrl+"meetings/"+widget.meetingId.toString()+Constants.CHANGE_STATUS_USER);
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        DecisionTableOffline localModel =data[i];
        if(localModel.url == baseUrl+"meetings/"+widget.meetingId.toString()+Constants.CHANGE_STATUS_USER) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      if(m){
        print("Updatettt>>"+m.toString());
        var result = await dbHelper.updateStatus(baseUrl+"meetings/"+widget.meetingId.toString()+Constants.CHANGE_STATUS_USER,string,reason);
      }else{
        print("Insertttt>>"+m.toString());
        var result = await dbHelper.insertRequestsData(DecisionTableOffline(
          url: baseUrl+"meetings/"+widget.meetingId.toString()+Constants.CHANGE_STATUS_USER,
          changeUserStatusRequest: string,
          statusReason: reason
        ));
      }
    });
  }

  Future<bool> getOfflineNote() async {
    var orgainzationsFuture = dbHelper.getNoteRequest(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.NOTE);
    bool m=false;
    String valueIs="";
    orgainzationsFuture.then((data) {
      setState(()  {
        for(int i=0;i<data.length;i++){
          DecisionTableOffline localModel =data[i];
          if(localModel.url==baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.NOTE) {
            m =true;
            valueIs=localModel.addNoteRequest;
            break;
          }else{
            m=false;
          }
        }
      });
    }).then((value) {
      if(m){
        addNote(userToken, valueIs,false);
      }
    });
  }

  Future<bool> getOfflineStatus() async {
    var orgainzationsFuture = dbHelper.getStatus(baseUrl+"meetings/"+widget.meetingId.toString()+Constants.CHANGE_STATUS_USER);
    bool m=false;
    String changeUserStatusRequest="";
    String reason="";
    orgainzationsFuture.then((data) {
      setState(()  {
        for(int i=0;i<data.length;i++){
          DecisionTableOffline localModel =data[i];
          if(localModel.url==baseUrl+"meetings/"+widget.meetingId.toString()+Constants.CHANGE_STATUS_USER) {
            m =true;
            changeUserStatusRequest=localModel.changeUserStatusRequest;
            reason=localModel.statusReason;
            break;
          }else{
            m=false;
          }
        }
      });
    }).then((value) {
      if(m){
        print("changeUserStatusRequest>>"+changeUserStatusRequest);
        print("reason>>"+reason);
        changeUserStatus(userToken, changeUserStatusRequest, reason);
        // addNote(userToken, valueIs,false);
      }
    });
  }
  void addOfflineNote(String note){
    setState(() {
      Navigator.pop(context);
      editNote = note;
      meetingDetailsResponseModel.note.note=editNote;
      noteControler.text="";
      String dataString= json.encode(meetingDetailsResponseModel.toJson());
      print("dataString>>"+dataString);
      // MeetingDetailsResponseModel value =  MeetingDetailsResponseModel.fromJson(json.decode(dataString));
      addOrUpdateNote(editNote).then((value) {
        addOrUpdateOfflineMeetingDetails(dataString);
      });
    });
  }

  void addOfflineStatus(String status ,String reason){
    setState(() {
      print("statusIS>>"+status);

      if(meetingDetailsResponseModel.attendanceStatus!=null){

        if(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&& meetingDetailsResponseModel.currentMember.attendanceStatus!=null){
          meetingDetailsResponseModel.currentMember.attendanceStatus=status;
          meetingDetailsResponseModel.attendanceStatus=status;
          attendanceStatus= meetingDetailsResponseModel.currentMember.attendanceStatus;
          print("attendanceStatussIS>>"+attendanceStatus);
          if(attendanceStatus=="Going"){
            attendanceStatus=AppLocalizations.of(context).lblGoingS;
          }else if(attendanceStatus=="Not Going"||attendanceStatus=="Not going"){
            attendanceStatus=AppLocalizations.of(context).lblNotGoingS;
          }else if(attendanceStatus=="Pending"){
            attendanceStatus=AppLocalizations.of(context).lblPendingS;
          }else if(attendanceStatus=="Maybe"){
            attendanceStatus=AppLocalizations.of(context).lblMayBeS;
          }
        }
        if(selectedPos==1){
          // attendanceStatus="Going";
          attendanceStatus=AppLocalizations.of(context).lblGoingS;
          textColor=Color(0xff04D182);
          bgColor=Color(0xff04D182).withOpacity(0.1);
        }else if(selectedPos==2){
          // attendanceStatus="Not Going";
          attendanceStatus=AppLocalizations.of(context).lblNotGoingS;
          textColor=Color(0xffFF6A81);
          bgColor=Color(0xffFF6A81).withOpacity(0.1);
          setState(() {
            tellUsControler.text="";
          });
        }else if(selectedPos==3){
          // attendanceStatus="Pending";
          textColor=Color(0xffFEC20E);
          bgColor=Color(0xffFEC20E).withOpacity(0.1);
          attendanceStatus=AppLocalizations.of(context).lblPendingS;
        }else if(selectedPos==4){
          // attendanceStatus="Maybe";
          textColor=Color(0xff7F8FA4);
          bgColor=Color(0xff7F8FA4).withOpacity(0.1);
          attendanceStatus=AppLocalizations.of(context).lblMayBeS;
        }
      }

      // checkStatus();
      if( meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.members!=null){
      for(int index=0;index<meetingDetailsResponseModel.members.length;index++){

        if(meetingDetailsResponseModel.members[index].attendanceStatus.contains(AppLocalizations.of(context).lblGoingS)){
          meetingDetailsResponseModel.members[index].attendanceStatus="Going";
        }else if(meetingDetailsResponseModel.members[index].attendanceStatus=="Not Going"||
            meetingDetailsResponseModel.members[index].attendanceStatus.contains(AppLocalizations.of(context).lblNotGoingS)){
          meetingDetailsResponseModel.members[index].attendanceStatus="Not going";
        }else if(meetingDetailsResponseModel.members[index].attendanceStatus.contains(AppLocalizations.of(context).lblMayBeS)){
          meetingDetailsResponseModel.members[index].attendanceStatus="Maybe";
        }else if(meetingDetailsResponseModel.members[index].attendanceStatus.contains(AppLocalizations.of(context).lblPendingS)){
          meetingDetailsResponseModel.members[index].attendanceStatus="Pending";
        }else{
        }
      }
      }else{

      }

      addOrUpdateStatus(status,reason).then((value) {
        String dataString= json.encode(meetingDetailsResponseModel.toJson());
        addOrUpdateOfflineMeetingDetails(dataString);
      });
    });
  }

  void openBottomSheetForAddNot(String date){
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return StatefulBuilder( builder: (BuildContext context, StateSetter setStateee /*You can rename this!*/) {
            return Container(

              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Row(
                children:[
                // Expanded(flex:4,child: InkWell(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: Container(color: Colors.transparent,))),
                  Container(
                    width: (MediaQuery.of(context).size.width-(MediaQuery.of(context).size.width/4))-100,
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(color: Colors.transparent,)),
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    width: (MediaQuery.of(context).size.width/4)+100,
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height:40 ,),
                        Container(
                          margin:EdgeInsets.only(left: 20,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  child:Text("Add Note",style: TextStyle(
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

                        Container(
                            margin:EdgeInsets.only(left: 20,right: 20,top:30),
                            child: Text("Note",style: blueColorStyleMedium(18),)),

                        Container(
                          height: 120,
                          margin:EdgeInsets.only(left: 20,right: 20,top:10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.circular(18.0),
                              border: Border.all(
                                  color: grayRoundedColor,// set border color
                                  width: 3.0
                              )
                          ),
                          child: TextField(
                              controller: noteControler,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              style: blueColorStyleMedium(20),
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding:
                                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              )
                          ) ,
                        ),

                        Expanded(
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child:Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            padding: EdgeInsets.only(top: 0),
                                            height:50,
                                            // width: 180,
                                            width: (((MediaQuery.of(context).size.width/4)+100)/2)-30,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: blueColor,
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(14))
                                            ),
                                            child: Center(
                                              child: Text("cancel",style: blueColorStyleMedium(20),),
                                            )
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      InkWell(
                                        onTap: () {
                                          hasNetwork().then((value) {
                                            if(value){
                                              addNote(userToken, noteControler.text!=null?noteControler.text:"",true);
                                            }else{
                                              addOfflineNote(noteControler.text!=null?noteControler.text:"");
                                            }
                                          });
                                        },
                                        child: Container(
                                            padding: EdgeInsets.only(top: 0),
                                            height:50,
                                            // width: 180,
                                            width: (((MediaQuery.of(context).size.width/4)+100)/2)-30,
                                            decoration: BoxDecoration(
                                                color: yellowColor,
                                                border: Border.all(
                                                  color: yellowColor,
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(14))
                                            ),
                                            child: Center(
                                              child: Text("save",style: TextStyle(
                                                color: Colors.white ,
                                                fontFamily: "medium",
                                                fontSize: 20,
                                                // fontWeight: FontWeight.bold
                                              ),),
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            )),
                        Padding( // this is new
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                        )
                      ],
                    ),

                  )
                // Expanded(
                //   flex:2,
                //   child:  Container(
                //   // height: MediaQuery.of(context).size.height,
                //   color: Colors.white,
                //   // width: MediaQuery.of(context).size.width - 200,
                //   child:
                //   Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Container(height:40 ,),
                //       Container(
                //         margin:EdgeInsets.only(left: 20,right: 20),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Container(
                //                 child:Text("Add Note",style: TextStyle(
                //                   color: blueColor ,
                //                   fontFamily: "black",
                //                   fontSize: 24,
                //                   // fontWeight: FontWeight.bold
                //                 ),)
                //             ),
                //             InkWell(
                //                 onTap:(){
                //                   Navigator.pop(context);
                //                 },child: Icon(Icons.clear,size: 30,color: grayTextColor,)),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         margin: EdgeInsets.only(top: 14),
                //         height: 0.3,color: grayTextColor,),
                //
                //       Container(
                //           margin:EdgeInsets.only(left: 20,right: 20,top:30),
                //           child: Text("Note",style: blueColorStyleMedium(18),)),
                //
                //       Container(
                //         height: 120,
                //         margin:EdgeInsets.only(left: 20,right: 20,top:10),
                //           decoration: BoxDecoration(
                //               color: Colors.white,
                //               borderRadius: new BorderRadius.circular(18.0),
                //               border: Border.all(
                //                   color: grayRoundedColor,// set border color
                //                   width: 3.0
                //               )
                //           ),
                //         child: TextField(
                //           controller: noteControler,
                //           maxLines: null,
                //           keyboardType: TextInputType.multiline,
                //             style: blueColorStyleMedium(20),
                //             decoration: new InputDecoration(
                //                 border: InputBorder.none,
                //                 focusedBorder: InputBorder.none,
                //                 enabledBorder: InputBorder.none,
                //                 errorBorder: InputBorder.none,
                //                 disabledBorder: InputBorder.none,
                //                 contentPadding:
                //                 EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                //                 )
                //         ) ,
                //       ),
                //
                //       Expanded(
                //           child: Align(
                //         alignment: Alignment.bottomCenter,
                //         child:Container(
                //           margin: EdgeInsets.only(bottom: 20),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               InkWell(
                //                 onTap: () {
                //                   Navigator.pop(context);
                //                 },
                //                 child: Container(
                //                     padding: EdgeInsets.only(top: 0),
                //                     height:50,
                //                     width: 180,
                //                     decoration: BoxDecoration(
                //                         border: Border.all(
                //                           color: blueColor,
                //                         ),
                //                         borderRadius: BorderRadius.all(Radius.circular(14))
                //                     ),
                //                     child: Center(
                //                       child: Text("cancel",style: blueColorStyleMedium(20),),
                //                     )
                //                 ),
                //               ),
                //               const SizedBox(width: 10,),
                //               InkWell(
                //                 onTap: () {
                //                   addNote(userToken, noteControler.text!=null?noteControler.text:"");
                //                 },
                //                 child: Container(
                //                     padding: EdgeInsets.only(top: 0),
                //                     height:50,
                //                     width: 180,
                //                     decoration: BoxDecoration(
                //                       color: yellowColor,
                //                         border: Border.all(
                //                           color: yellowColor,
                //                         ),
                //                         borderRadius: BorderRadius.all(Radius.circular(14))
                //                     ),
                //                     child: Center(
                //                       child: Text("save",style: TextStyle(
                //                         color: Colors.white ,
                //                         fontFamily: "medium",
                //                         fontSize: 20,
                //                         // fontWeight: FontWeight.bold
                //                       ),),
                //                     )
                //                 ),
                //               ),
                //             ],
                //           ),
                //         )
                //       )),
                //       Padding( // this is new
                //           padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                //       )
                //     ],
                //   ),
                //
                // )),
                ]
              ),
            );
          },);
        });
  }

  void openBottomSheetForAllActivities(List<MeetingDetailsResponseModelActivities> activityList){
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return StatefulBuilder( builder: (BuildContext context, StateSetter setStateee /*You can rename this!*/) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child:
                Row(
                  children: [
                    Expanded(flex:4,child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(color: Colors.transparent,))),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width - 200,
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height:40 ,),
                            Container(
                              margin:EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      child:Text("Acivity",style: TextStyle(
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

                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 14),
                                      height: 0.3,color: grayTextColor,),
                                    activityList!=null?
                                    makeBodyForMeetingDetailsActivitiy(context, activityList,activityList.length):
                                    Container()
                                  ],
                                ),
                              ),
                            )


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

  void changeMeetingStatus(String token) {
    int id=0;
    if(selectedPos==1){
      id=1;
    }else if(selectedPos==2){
      id=3;
    }else if(selectedPos==3){
      id=2;
    }else if(selectedPos==4){
      id=4;
    }

    load();
    meetingRepository = new MeetingRepository();
    Future<ChangeStatusMeetingResponseModel> allList = meetingRepository.changeMeetingStatus(baseUrl,token,widget.meetingId,new ChangeMeetingStatusRequestModel(meetingStatusId: id));
    allList.then((value) {
      setState(() {
        if (value != null) {
          if(selectedPos==1){
            attendanceStatus="Going";
          }else if(selectedPos==2){
            attendanceStatus="Not Going";
          }else if(selectedPos==3){
            attendanceStatus="Pending";
          }else if(selectedPos==4){
            attendanceStatus="Maybe";
          }

          showSuccess();
          // Navigator.pop(context);
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });
  }

  void changeUserStatus(String token, String status ,String reason) {
    int id=0;
    if(selectedPos==1){
      id=1;
    }else if(selectedPos==2){
      id=3;
    }else if(selectedPos==3){
      id=2;
    }else if(selectedPos==4){
      id=4;
    }

    load();
    userRepository = new UserRepository();

    Future<UserChangeStatusResponseModel> allList = userRepository.changeUserStatus(baseUrl,token,widget.meetingId,new UserChangeStatusRequestModel(status: status,reason: reason));
    // Future<UserChangeStatusResponseModel> allList = userRepository.changeUserStatus(token,meetingDetailsResponseModel.id,new UserChangeStatusRequestModel(status: status,reason: reason));
    allList.then((value) {
      setState(() {
        if (value != null) {
          openTellUs=false;
          if(selectedPos==1){
            // attendanceStatus="Going";
            attendanceStatus=AppLocalizations.of(context).lblGoingS;
            textColor=Color(0xff04D182);
            bgColor=Color(0xff04D182).withOpacity(0.1);
          }else if(selectedPos==2){
            // attendanceStatus="Not Going";
            attendanceStatus=AppLocalizations.of(context).lblNotGoingS;
            textColor=Color(0xffFF6A81);
            bgColor=Color(0xffFF6A81).withOpacity(0.1);
            setState(() {
              tellUsControler.text="";
            });
          }else if(selectedPos==3){
            // attendanceStatus="Pending";
            textColor=Color(0xffFEC20E);
            bgColor=Color(0xffFEC20E).withOpacity(0.1);
            attendanceStatus=AppLocalizations.of(context).lblPendingS;
          }else if(selectedPos==4){
            // attendanceStatus="Maybe";
            textColor=Color(0xff7F8FA4);
            bgColor=Color(0xff7F8FA4).withOpacity(0.1);
            attendanceStatus=AppLocalizations.of(context).lblMayBeS;
          }

          showSuccess();
          // Navigator.pop(context);
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    }).then((value) {
      dbHelper.deleteRow(whereArgs: [baseUrl+"meetings/"+widget.meetingId.toString()+Constants.CHANGE_STATUS_USER]);
    });
  }

  // Future<bool> getOfflineVoteActions() async {
  //   await Future<String>.delayed(const Duration(seconds:3));
  //   print("Hereeeeeeeeee");
  //   var orgainzationsFuture = dbHelper.getMeetingActions(baseUrl+"actions/"+widget.meetingId.toString()+Constants.CHANGE_STATUS);
  //   bool m=false;
  //   String vote="";
  //   orgainzationsFuture.then((data) {
  //     setState(()  {
  //       for(int i=0;i<data.length;i++){
  //         DecisionTableOffline localModel =data[i];
  //         if(localModel.url==baseUrl+"actions/"+widget.meetingId.toString()+Constants.CHANGE_STATUS) {
  //           m =true;
  //           print("");
  //           print("ididid>>"+localModel.id.toString());
  //           vote=localModel.changeDecisionVote;
  //           break;
  //         }else{
  //           m=false;
  //         }
  //       }
  //     });
  //   }).then((value)  {
  //     // print("mmmm>>"+m.toString());
  //     if(m){
  //       changeStatus(baseUrl,userToken, vote,false);
  //     }else{
  //       Future.delayed(Duration.zero,() {
  //         getActionData(baseUrl,userToken);
  //       });
  //     }
  //   });
  // }

  @override
  void initState() {
    SharedPreferencesHelper.getLoggedToken().then((value) {
      userToken=value;
      getUser().then((value) {
        userId=value.id;
        email=value.email;
          String baseUri= Constants.BASE_URL;
          setState(() {
            baseUrl=baseUri;
            hasNetwork().then((hasNet) async {
              if(hasNet) {
                getOfflineNote().then((value) {
                  getOfflineStatus().then((value) {
                    getMeetingDetails(baseUrl, userToken);
                  });
                });
              }else{
                getOfflineMeetingDetails();
              }
            });
          });

      });
    });
  }

  Color textColor=Color(0xff04D182);
  Color bgColor=Color(0xff04D182).withOpacity(0.1);

  void checkStatus() {
    if (meetingDetailsResponseModel != null &&
        meetingDetailsResponseModel.currentMember != null &&
        meetingDetailsResponseModel.currentMember.attendanceStatus != null) {
      if (meetingDetailsResponseModel.currentMember.attendanceStatus == "Going") {
        textColor = Color(0xff04D182);
        bgColor = Color(0xff04D182).withOpacity(0.1);
      } else if (meetingDetailsResponseModel.currentMember.attendanceStatus == "Not Going"||meetingDetailsResponseModel.currentMember.attendanceStatus == "Not going") {
        textColor = Color(0xffFF6A81);
        bgColor = Color(0xffFF6A81).withOpacity(0.1);
      } else
      if (meetingDetailsResponseModel.currentMember.attendanceStatus == "Maybe") {
        textColor = Color(0xff7F8FA4);
        bgColor = Color(0xff7F8FA4).withOpacity(0.1);
      } else
      if (meetingDetailsResponseModel.currentMember.attendanceStatus == "Pending") {
        textColor = Color(0xffFEC20E);
        bgColor = Color(0xffFEC20E).withOpacity(0.1);
      } else {
        textColor = Color(0xff04D182);
        bgColor = Color(0xff04D182).withOpacity(0.1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: grayColor,
      body: LayoutBuilder(builder: (context, constraints) {
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
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.chevron_left,color: Colors.black,size: 40,)),
                      Container(
                        child: Text(
                          AppLocalizations.of(context).lblMeetingAgenda,
                          style: blueColorBoldStyle(26),
                        ),margin: EdgeInsets.only(top:0,left: 16,right: 16),
                      ),
                    ],
                  ),
                 meetingDetailsResponseModel!=null
                     &&meetingDetailsResponseModel.ijmeet!=null&&
                     meetingDetailsResponseModel.ijmeet.isNotEmpty?
                      // meetingDetailsResponseModel.status!=null &&
                      // meetingDetailsResponseModel.status.name!=null &&
                      // meetingDetailsResponseModel.status.name=="Live"?
                  InkWell(
                    onTap: ()  {
                      hasNetwork().then((value) {
                        if(value){
                          SharedPreferencesHelper.getLoggedToken().then((value) {
                              String baseUri = Constants.BASE_URL+"ijmeet/"+meetingDetailsResponseModel.id.toString()+"?auth="+value;
                              print("baseUri>>"+baseUri.toString());
                              // http://test.app.ijtimaati.com/ijmeet/592?auth={tocken}
                              navigateTo(context,WebViewScreenForMirrorView(baseUri));
                              // launch(baseUri);
                              // launchUrl(Uri.);
                          });
                        }else{
                          showErrorWithMsg(AppLocalizations.of(context).lblNoInternet);
                        }
                      });
                      },
                    child: Container(
                      margin:EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 8),
                      decoration:
                      BoxDecoration(color: yellowColor,
                          // color: Colors.red,
                          border: Border.all(color: Color(0xffeaeaea), width: 0.6),
                          borderRadius: BorderRadius.all(Radius.circular(9))),
                      child: Center(
                        child: Text(AppLocalizations.of(context).lblJoinMeeting,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily:
                              'black',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ):Container(),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 14),
                height: 0.3,color: grayTextColor,),
              const SizedBox(height: 20,),


              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Column(
                          children: [
                          meetingDetailsResponseModel!=null? leaveRowForMeetingDetails(context, meetingDetailsResponseModel, 0):Container(),

                            // meetingDetailsResponseModel!=null? AgendaDetailsScreen(meetingDetailsResponseModel):Container(),
                            // talkingPointsAgendas!=null? makeBodyTaikingPointsForMeetingDetails(userId,widget.meetingId,context,talkingPointsAgendas):Container(),
                            talkingPointsAgendas!=null&&talkingPointsAgendas.isNotEmpty? TalkingPointsWidget(meetingDetailsResponseModel,userId,talkingPointsAgendas,widget.meetingId):Container(),
                            DescisionsWidgetScreen(meetingDetailsResponseModel,decisionAgendas,widget.meetingId,talkingPointsAgendas.length),
                            ActionsWidgetScreen(meetingDetailsResponseModel,actionsAgendas,widget.meetingId,talkingPointsAgendas.length+decisionAgendas.length),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),


                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 18),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: grayRoundedColor,// set border color
                                      width: 2.0
                                  )
                              ),
                              // padding: EdgeInsets.only(left: 16,right: 16,top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                                      child: Text(AppLocalizations.of(context).lblParticipants, style: blueColorBoldStyle(20),)),
                                  const SizedBox(height: 10,),
                                  Container(
                                      padding: EdgeInsets.only(left: 16,right: 16),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(child: Text(totalNum.toString()+" "+AppLocalizations.of(context).lblGuests+"  - ", style: blueColorBoldStyle(20),)),
                                              Flexible(child: Text(goingList.length.toString()+" "+AppLocalizations.of(context).lblGoingS+" - ", style: blueColorStyleregular(18),))  ,
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Flexible(child: Text(pendingList.length.toString()+" "+AppLocalizations.of(context).lblPendingS+" - ", style: blueColorStyleregular(18),))  ,
                                              Flexible(child: Text(notGoingList.length.toString()+" "+AppLocalizations.of(context).lblNotGoingS+" ", style: blueColorStyleregular(18),))  ,

                                            ],
                                          )
                                           ],
                                      )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    color: grayTextColor,height: 0.4,),
                                  const SizedBox(height: 20,),




                                  Container(
                                    padding: EdgeInsets.only(left: 16,right: 16),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                                Row(
                                                  children: [
                                                    ClipOval(
                                                        child:
                                                        CircleAvatar(
                                                          radius: 18,
                                                          backgroundColor: Colors.red,
                                                          child: CircleAvatar(
                                                            radius: 18,
                                                            backgroundImage: NetworkImage(
                                                              meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&&meetingDetailsResponseModel.currentMember.user!=null?
                                                              meetingDetailsResponseModel.currentMember.user.image!=null?meetingDetailsResponseModel.currentMember.user.image:
                                                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                                                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                                                            ),
                                                          ),
                                                        )
                                                    ),
                                                    const SizedBox(width: 6,),
                                                    Column(
                                                      children: [

                                                        Text(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&&meetingDetailsResponseModel.currentMember.user!=null?
                                                        meetingDetailsResponseModel.currentMember.user.name.split(" ")[0]+" ( You )":"",style: blueColorStyleMedium(18), ),
                                                        // Text(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&& meetingDetailsResponseModel.currentMember.statusReason!=null?
                                                        // meetingDetailsResponseModel.currentMember.statusReason:"",style: blueColorStyleregular(18), ),
                                                      ],
                                                    )
                                                  ],
                                                ),

                                                // Text(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&& meetingDetailsResponseModel.currentMember.statusReason!=null?
                                                // meetingDetailsResponseModel.currentMember.statusReason:"",style: blueColorStyleregular(20), ),
                                                Container(
                                                  // padding: EdgeInsets.only(left:14,right: 14,top: 6,bottom: 2),
                                                  padding: EdgeInsets.only(left:22,right: 22,top: 6,bottom: 2),
                                                  decoration: BoxDecoration(
                                                      color: bgColor,
                                                      border: Border.all(
                                                        color: bgColor,
                                                      ),
                                                      borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                                                  ),
                                                  child: Center(
                                                    child: Text((attendanceStatus),style: TextStyle(
                                                      color: textColor ,
                                                      fontFamily: "medium",
                                                      fontSize: 18,
                                                    ),),
                                                  ),
                                                )
                                          ],
                                        ),
                                        meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&& meetingDetailsResponseModel.currentMember.statusReason!=null?
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          padding: EdgeInsets.only(left: 45,right: 60),
                                          child:
                                          Text(meetingDetailsResponseModel.currentMember.statusReason,style: blueColorStyleregular(16), ),
                                        ):const SizedBox()
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 14,bottom: 20),
                                    color: grayTextColor,height: 0.4,),





                            meetingDetailsResponseModel!=null&&meetingDetailsResponseModel.members!=null&&meetingDetailsResponseModel.members.isNotEmpty?
                            SizedBox(
                                child:ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: meetingDetailsResponseModel.members.length,
                                  itemBuilder: (context, index) {

                                    if(index!=0){
                                    Color one=Color(0xff04D182);
                                    Color two=Color(0xff04D182).withOpacity(0.1);
                                    if( meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.members!=null&&
                                        meetingDetailsResponseModel.members[index].attendanceStatus!=null){

                                      if(meetingDetailsResponseModel.members[index].attendanceStatus=="Going"){
                                        // one=Color(0xff04D182);
                                        // two=Color(0xff04D182).withOpacity(0.1);
                                        meetingDetailsResponseModel.members[index].attendanceStatus=AppLocalizations.of(context).lblGoingS;
                                        meetingDetailsResponseModel.members[index].setColor="0xff04D182";
                                      }else if(meetingDetailsResponseModel.members[index].attendanceStatus=="Not Going"||
                                          meetingDetailsResponseModel.members[index].attendanceStatus=="Not going"){
                                        // one=Color(0xffFF6A81);
                                        // two=Color(0xffFF6A81).withOpacity(0.1);
                                        meetingDetailsResponseModel.members[index].setColor="0xffFF6A81";
                                        meetingDetailsResponseModel.members[index].attendanceStatus=AppLocalizations.of(context).lblNotGoingS;
                                      }else if(meetingDetailsResponseModel.members[index].attendanceStatus=="Maybe"){
                                        // one=Color(0xff7F8FA4);
                                        // two=Color(0xff7F8FA4).withOpacity(0.1);
                                        meetingDetailsResponseModel.members[index].setColor="0xff7F8FA4";
                                        meetingDetailsResponseModel.members[index].attendanceStatus=AppLocalizations.of(context).lblMayBeS;
                                      }else if(meetingDetailsResponseModel.members[index].attendanceStatus=="Pending"){
                                        // one=Color(0xffFEC20E);
                                        // two=Color(0xffFEC20E).withOpacity(0.1);
                                        meetingDetailsResponseModel.members[index].setColor="0xffFEC20E";
                                        meetingDetailsResponseModel.members[index].attendanceStatus=AppLocalizations.of(context).lblPendingS;
                                      }else{
                                        // meetingDetailsResponseModel.members[index].color="0xff04D182";
                                        // one=Color(0xff04D182);
                                        // two=Color(0xff04D182).withOpacity(0.1);
                                      }
                                    }else{

                                    }
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      padding: EdgeInsets.only(left: 16,right: 16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  ClipOval(
                                                      child:
                                                      CircleAvatar(
                                                        radius: 18,
                                                        backgroundColor: Colors.red,
                                                        child: CircleAvatar(
                                                          radius: 18,
                                                          backgroundImage: NetworkImage(
                                                            meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.members!=null&&meetingDetailsResponseModel.members[index].user!=null?
                                                            meetingDetailsResponseModel.members[index].user.image!=null? meetingDetailsResponseModel.members[index].user.image:
                                                            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                                                            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                                                          ),
                                                        ),
                                                      )
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Column(
                                                    children: [
                                                      Text(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.members!=null&&meetingDetailsResponseModel.members[index].user!=null?
                                                      meetingDetailsResponseModel.members[index].user.name:"",style: blueColorStyleMedium(18), ),
                                                      // Text(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.members!=null&& meetingDetailsResponseModel.members[index].statusReason!=null?
                                                      // meetingDetailsResponseModel.members[index].statusReason:"",style: blueColorStyleregular(16), ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left:22,right: 22,top: 6,bottom: 2),
                                                decoration: BoxDecoration(
                                                    color: Color(int.parse(meetingDetailsResponseModel.members[index].color)).withOpacity(0.1),
                                                    border: Border.all(
                                                      color: Color(int.parse(meetingDetailsResponseModel.members[index].color)).withOpacity(0.1),
                                                    ),
                                                    borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                                                ),
                                                child: Text((meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.members!=null&& meetingDetailsResponseModel.members[index].attendanceStatus!=null?
                                                meetingDetailsResponseModel.members[index].attendanceStatus:""),style: TextStyle(
                                                  color: Color(int.parse(meetingDetailsResponseModel.members[index].color)) ,
                                                  fontFamily: "medium",
                                                  fontSize: 18,
                                                ),),
                                              )
                                            ],
                                          ),
                                          meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.members!=null&& meetingDetailsResponseModel.members[index].statusReason!=null?
                                          Container(
                                        margin: EdgeInsets.only(top: 10),
                                        padding: EdgeInsets.only(left: 45,right: 60),
                                        child:
                                        // Text(meetingDetailsResponseModel.members[index].statusReason,
                                        Text(meetingDetailsResponseModel.members[index].statusReason,
                                          style: blueColorStyleregular(16), ),
                                          ):const SizedBox()
                                        ],
                                      ),
                                    );
                                    }else{
                                      return Container();
                                    }
                                  },
                                )
                                ):Container(),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: grayRoundedColor,// set border color
                                      width: 2.0
                                  )
                              ),
                              child:  Column(
                                children: [
                                  const SizedBox(height: 20,),
                                  Container(
                                    padding: EdgeInsets.only(left: 16,right: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(AppLocalizations.of(context).lblActivityS,style: blueColorBoldStyle(22),),

                                        InkWell(
                                          onTap: () {
                                            openBottomSheetForAllActivities(meetingDetailsResponseModel.activities);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(left: 20,right: 20,top: 12,bottom: 8),
                                            decoration: BoxDecoration(
                                                color: Color(0xff7F8FA4).withOpacity(0.1),
                                                border: Border.all(
                                                  color: Color(0xff7F8FA4).withOpacity(0.1),
                                                ),
                                                borderRadius: BorderRadius.circular(14) // use instead of BorderRadius.all(Radius.circular(20))
                                            ),
                                            child: Text(AppLocalizations.of(context).lblSeeAll,style: TextStyle(
                                              color: Color(0xff7F8FA4) ,
                                              fontFamily: "black",
                                              fontSize: 18,
                                            ),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10,left: 16,right: 16),
                                    child: Text(meetingDetailsResponseModel.lastActivity!=null?
                                    meetingDetailsResponseModel.lastActivity:"",
                                      style: grayTextColorStyleMedium(20),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 14),
                                    height: 0.3,color: grayTextColor,),
                                  meetingDetailsResponseModel.activities!=null? makeBodyForMeetingDetailsActivitiy(context,meetingDetailsResponseModel.activities,
                                      meetingDetailsResponseModel.activities.length>6?6:meetingDetailsResponseModel.activities.length):Container(),
                                  const SizedBox(height: 20,),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20,),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: grayRoundedColor,// set border color
                                      width: 2.0
                                  )
                              ),
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20,),
                                  Container(
                                    padding: EdgeInsets.only(left: 16,right: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(AppLocalizations.of(context).lblNote,style: blueColorBoldStyle(22),),

                                        InkWell(
                                          onTap: () {
                                            openBottomSheetForAddNot("date");
                                          },
                                           child: Container(
                                              padding: EdgeInsets.only(left: 20,right: 20,top: 12,bottom: 8),
                                              decoration: BoxDecoration(
                                                  color: Color(0xff7F8FA4).withOpacity(0.1),
                                                  border: Border.all(
                                                    color: Color(0xff7F8FA4).withOpacity(0.1),
                                                  ),
                                                  borderRadius: BorderRadius.circular(14) // use instead of BorderRadius.all(Radius.circular(20))
                                              ),
                                              child: Text(AppLocalizations.of(context).lblAddNote,style: TextStyle(
                                                color: Color(0xff7F8FA4) ,
                                                fontFamily: "black",
                                                fontSize: 18,
                                              ),),
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Container(
                                  //   margin: EdgeInsets.only(top: 10,left: 16,right: 16),
                                  //   child: Text(meetingDetailsResponseModel.lastActivity!=null?
                                  //   meetingDetailsResponseModel.lastActivity:"",
                                  //     style: grayTextColorStyleMedium(20),),
                                  // ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    height: 0.3,color: grayTextColor,),
                                  editNote==null?Container(
                                      margin: EdgeInsets.only(top: 16,left: 16,right: 16),
                                      child: Text(meetingDetailsResponseModel.note!=null&&
                                          meetingDetailsResponseModel.note.note!=null?meetingDetailsResponseModel.note.note:"", style: blueColorStyleMedium(20),))
                                  :Container(
                                margin: EdgeInsets.only(top: 16,left: 16,right: 16),
                                child: Text(editNote, style: blueColorStyleMedium(20),)),
                                  const SizedBox(height: 20,),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

             isExist? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  // height: selectedPos==2?150:100,
                  height: openTellUs==true?150:100,
                  padding: EdgeInsets.only(bottom: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context).lblWhatWill,style: blueColorStyleMedium(20),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      openTellUs=false;
                                      selectedPos=1;
                                      // attendanceStatus="Going";
                                      // textColor=Color(0xff04D182);
                                      // bgColor=Color(0xff04D182).withOpacity(0.1);
                                      hasNetwork().then((value) {
                                        if(value){
                                          changeUserStatus(userToken,"Going","");
                                        }else{
                                          addOfflineStatus("Going","");
                                        }
                                      });
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 4),
                                    decoration: BoxDecoration(
                                        color: selectedPos!=1 ?Colors.transparent: Color(0xff04D182).withOpacity(0.1),
                                        border: Border.all(
                                          color: selectedPos!=1 ?Colors.transparent: Color(0xff04D182),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(14))
                                    ),
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    child: Text(AppLocalizations.of(context).lblGoingS,style: TextStyle(
                                        color: Color(0xff04D182),
                                        fontFamily: 'medium',
                                        fontSize: 22
                                    ),),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPos=2;
                                      // attendanceStatus="Not Going";
                                      openTellUs=true;
                                      // textColor=Color(0xffFF6A81);
                                      // bgColor=Color(0xffFF6A81).withOpacity(0.1);
                                      // changeMeetingStatus(userToken);
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 4),
                                    decoration: BoxDecoration(
                                        color: selectedPos!=2 ?Colors.transparent: Color(0xffFF6A81).withOpacity(0.1),
                                        border: Border.all(
                                          color:selectedPos!=2 ?Colors.transparent: Color(0xffFF6A81),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(14))
                                    ),
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    child: Text(AppLocalizations.of(context).lblNotGoingS,style: TextStyle(
                                        color: Color(0xffFF6A81),
                                        fontFamily: 'medium',
                                        fontSize: 22
                                    ),),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPos=3;
                                      openTellUs=false;
                                      // attendanceStatus="Pending";
                                      // textColor=Color(0xffFEC20E);
                                      // bgColor=Color(0xffFEC20E).withOpacity(0.1);

                                      hasNetwork().then((value) {
                                        if(value){
                                          changeUserStatus(userToken,"Pending","");
                                        }else{
                                          addOfflineStatus("Pending","");
                                        }
                                      });
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 4),
                                    decoration: BoxDecoration(
                                        color:  selectedPos!=3 ?Colors.transparent:Color(0xffFEC20E).withOpacity(0.1),
                                        border: Border.all(
                                          color: selectedPos!=3 ?Colors.transparent:Color(0xffFEC20E),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(14))
                                    ),
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    child: Text(AppLocalizations.of(context).lblPendingS,style: TextStyle(
                                        color: Color(0xffFEC20E),
                                        fontFamily: 'medium',
                                        fontSize: 22
                                    ),),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPos=4;
                                      openTellUs=false;

                                      // attendanceStatus="Maybe";
                                      // textColor=Color(0xff7F8FA4);
                                      // bgColor=Color(0xff7F8FA4).withOpacity(0.1);
                                      hasNetwork().then((value) {
                                        if(value){
                                          changeUserStatus(userToken,"Maybe","");
                                        }else{
                                          addOfflineStatus("Maybe","");
                                        }
                                      });
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 4),
                                    decoration: BoxDecoration(
                                        color: selectedPos!=4 ?Colors.transparent:Color(0xff7F8FA4).withOpacity(0.1),
                                        border: Border.all(
                                          color:selectedPos!=4 ?Colors.transparent:Color(0xff7F8FA4),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(14))
                                    ),
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    child: Text(AppLocalizations.of(context).lblMayBeS,style: TextStyle(
                                        color: Color(0xff7F8FA4),
                                        fontFamily: 'medium',
                                        fontSize: 22
                                    ),),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),

                        openTellUs==true? const SizedBox(height: 10,):Container(height: 1,),
                       // selectedPos==2?
                       openTellUs==true? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width:MediaQuery.of(context).size.width-200,
                              child: TextField(
                                  controller: tellUsControler,
                                  maxLines: null,
                                  keyboardType: TextInputType.text,
                                  style: blueColorStyleMedium(20),
                                  decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding:
                                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                                      hintText: AppLocalizations.of(context).lblTellUs,
                                      hintStyle: blueColorStyleMedium(20)
                                  )
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if(tellUsControler.text!=null) {
                                    if(tellUsControler.text.isNotEmpty) {
                                      hasNetwork().then((value) {
                                        if(value){
                                          changeUserStatus(userToken, "Not Going", tellUsControler.text);
                                        }else{
                                          addOfflineStatus("Not Going", tellUsControler.text);
                                        }
                                      });
                                    }else{
                                      showErrorWithMsg(AppLocalizations.of(context).lblpleaseEnterReason);
                                    }
                                  }else{
                                    showErrorWithMsg(AppLocalizations.of(context).lblpleaseEnterReason);
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 4),
                                decoration: BoxDecoration(
                                    color: yellowColor,
                                    border: Border.all(
                                      color: yellowColor,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(14))
                                ),
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: Text(AppLocalizations.of(context).lblSend,style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'medium',
                                    fontSize: 18
                                ),),
                              ),
                            )
                          ],
                        )
                           :Container(height: 1,)
                           // :Container(height: 1,),
                      ],
                    ),
                  ),
                ),
              ):Container()
            ],
          ),
        );
      },),
    );
  }
}

