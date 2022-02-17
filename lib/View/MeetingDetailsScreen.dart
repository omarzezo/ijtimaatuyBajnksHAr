import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/AttendenceModel.dart';
import 'package:itimaaty/Models/ChangeMeetingStatusRequestModel.dart';
import 'package:itimaaty/Models/ChangeStatusMeetingResponseModel.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';
import 'package:itimaaty/Models/UserChangeStatusRequestModel.dart';
import 'package:itimaaty/Models/add_note_request_model.dart';
import 'package:itimaaty/Models/add_note_response_model.dart';
import 'package:itimaaty/Models/all_meetings_response.dart';
import 'package:itimaaty/Models/all_status_response.dart';
import 'package:itimaaty/Models/committee_response_model.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Models/metting_details_response_model.dart';
import 'package:itimaaty/Models/user_change_status_response_model.dart';
import 'package:itimaaty/Repository/MeetingRepository.dart';
import 'package:itimaaty/Repository/UserRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/View/CreateMeetingScreen.dart';
import 'package:itimaaty/View/DrawerWidget.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/SignInScreen.dart';
import 'package:itimaaty/Widgets/ActionsWidget.dart';
import 'package:itimaaty/Widgets/AgendaDetailsScreen.dart';
import 'package:itimaaty/Widgets/DescisionsWidget.dart';
import 'package:itimaaty/Widgets/HomeWidgets.dart';
import 'package:itimaaty/Widgets/MeetingDetailsWidgets.dart';
import 'package:itimaaty/Widgets/TalkingPointsWidget.dart';
import 'package:itimaaty/cubit/Home/HomeCubit.dart';
import 'package:itimaaty/cubit/Home/HomeStates.dart';


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

  void getAgendaData(){
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
  UserRepository userRepository;
  int userId;
String attendanceStatus='';
  void getMeetingDetails(String token) {
    // load();
    meetingRepository = new MeetingRepository();
    Future<MeetingDetailsResponseModel> allList = meetingRepository.getMeetingDetails(token,widget.meetingId);
    allList.then((value) {
      setState(() {
        if (value != null) {
          // showSuccess();
          meetingDetailsResponseModel = value;
          if(meetingDetailsResponseModel.attendanceStatus!=null){

            if(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&& meetingDetailsResponseModel.currentMember.attendanceStatus!=null){
              attendanceStatus= meetingDetailsResponseModel.currentMember.attendanceStatus;
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
          getAgendaData();
          // print("meetingDetailsResponseModel>>"+meetingDetailsResponseModel.startDate.toString());
          // print("meetingDetailsResponseModelName>>"+meetingDetailsResponseModel.currentMember.user.name);
        }else{
          // showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
  }

  String editNote;
  void addNote(String token,String note) {
    load();
    meetingRepository = new MeetingRepository();
    Future<AddNoteResponseModel> allList = meetingRepository.addNote(token,widget.meetingId,new AddNoteRequestModel(note: note));
    allList.then((value) {
      setState(() {
        if (value != null) {
          editNote=note;
          showSuccess();
          // meetingDetailsResponseModel = value;
          Navigator.pop(context);
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen());
          }
        }
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
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*(2/3)),
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
                                    width: 180,
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
                                  addNote(userToken, noteControler.text!=null?noteControler.text:"");
                                },
                                child: Container(
                                    padding: EdgeInsets.only(top: 0),
                                    height:50,
                                    width: 180,
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

                ),
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
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*(2/3)),
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
    Future<ChangeStatusMeetingResponseModel> allList = meetingRepository.changeMeetingStatus(token,widget.meetingId,new ChangeMeetingStatusRequestModel(meetingStatusId: id));
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
            navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
  }



  void changeUserStatus(String token,String status ,String reason) {
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

    Future<UserChangeStatusResponseModel> allList = userRepository.changeUserStatus(token,widget.meetingId,new UserChangeStatusRequestModel(status: status,reason: reason));
    // Future<UserChangeStatusResponseModel> allList = userRepository.changeUserStatus(token,meetingDetailsResponseModel.id,new UserChangeStatusRequestModel(status: status,reason: reason));
    allList.then((value) {
      setState(() {
        if (value != null) {
          openTellUs=false;
          if(selectedPos==1){
            attendanceStatus="Going";
          }else if(selectedPos==2){
            attendanceStatus="Not Going";
            setState(() {
              tellUsControler.text="";
            });
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
            navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
  }

  @override
  void initState() {
    SharedPreferencesHelper.getLoggedToken().then((value) {
      userToken=value;
      getUser().then((value) {
        userId=value.id;
        getMeetingDetails(userToken);
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
                        ),margin: EdgeInsets.only(top: 8,left: 16,right: 16),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: ()  {
                     // String url= 'http://test.app.ijtimaati.com/api/public/uploads/library/1643868394181121.pdf';
                     //  createFileOfPdfUrl("test",  url).then((value) async {
                     //    await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
                     //        builder: (_) => PspdfkitAnnotationsExampleWidget(
                     //            documentPath: file.path)));
                     //  });
                     //  https://test.ijtimaati.com/doc-view?doc=https://test.ijtimaati.com/api/public/uploads/library/1637735070830163.pdf&id=72&e=1
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
                  ),
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
                            talkingPointsAgendas!=null? TalkingPointsWidget(userId,talkingPointsAgendas,widget.meetingId):Container(),
                            DescisionsWidgetScreen(decisionAgendas,widget.meetingId,talkingPointsAgendas.length),
                            ActionsWidgetScreen(actionsAgendas,widget.meetingId,talkingPointsAgendas.length+decisionAgendas.length),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),


                      Expanded(
                        flex: 4,
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Row(
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
                                                        meetingDetailsResponseModel.currentMember.user.image:
                                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                                                      ),
                                                    ),
                                                  )
                                              ),
                                              const SizedBox(width: 10,),
                                              Column(
                                                children: [
                                                  Text(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&&meetingDetailsResponseModel.currentMember.user!=null?
                                                  meetingDetailsResponseModel.currentMember.user.name+" ( You )":"",style: blueColorStyleMedium(20), ),
                                                  Text(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.currentMember!=null&& meetingDetailsResponseModel.currentMember.statusReason!=null?
                                                  meetingDetailsResponseModel.currentMember.statusReason:"",style: blueColorStyleregular(20), ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        // const SizedBox(width: 10,),


                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            padding: EdgeInsets.only(left:10,right: 10,top: 6,bottom: 2),
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
                                                fontSize: 20,
                                              ),),
                                            ),
                                          ),
                                        )
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
                                        one=Color(0xff04D182);
                                        two=Color(0xff04D182).withOpacity(0.1);
                                      }else if(meetingDetailsResponseModel.members[index].attendanceStatus=="Not Going"||
                                          meetingDetailsResponseModel.members[index].attendanceStatus=="Not going"){
                                        one=Color(0xffFF6A81);
                                        two=Color(0xffFF6A81).withOpacity(0.1);
                                      }else if(meetingDetailsResponseModel.members[index].attendanceStatus=="Maybe"){
                                        one=Color(0xff7F8FA4);
                                        two=Color(0xff7F8FA4).withOpacity(0.1);
                                      }else if(meetingDetailsResponseModel.members[index].attendanceStatus=="Pending"){
                                        one=Color(0xffFEC20E);
                                        two=Color(0xffFEC20E).withOpacity(0.1);
                                      }else{
                                        one=Color(0xff04D182);
                                        two=Color(0xff04D182).withOpacity(0.1);
                                      }
                                    }
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      padding: EdgeInsets.only(left: 16,right: 16),
                                      child: Row(
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
                                                  Text(meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.members!=null&& meetingDetailsResponseModel.members[index].statusReason!=null?
                                                  meetingDetailsResponseModel.members[index].statusReason:"",style: blueColorStyleregular(16), ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left:22,right: 22,top: 6,bottom: 2),
                                            decoration: BoxDecoration(
                                                color: two,
                                                border: Border.all(
                                                  color: two,
                                                ),
                                                borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                                            ),
                                            child: Text((meetingDetailsResponseModel!=null&& meetingDetailsResponseModel.members!=null&& meetingDetailsResponseModel.members[index].attendanceStatus!=null?
                                            meetingDetailsResponseModel.members[index].attendanceStatus:""),style: TextStyle(
                                              color: one ,
                                              fontFamily: "medium",
                                              fontSize: 20,
                                            ),),
                                          )
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
                                  Container(
                                    margin: EdgeInsets.only(top: 10,left: 16,right: 16),
                                    child: Text(meetingDetailsResponseModel.lastActivity!=null?
                                    meetingDetailsResponseModel.lastActivity:"",
                                      style: grayTextColorStyleMedium(20),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 14),
                                    height: 0.3,color: grayTextColor,),
                                  editNote==null?Container(
                                      margin: EdgeInsets.only(top: 24,left: 16,right: 16),
                                      child: Text(meetingDetailsResponseModel.note!=null&&
                                          meetingDetailsResponseModel.note.note!=null?meetingDetailsResponseModel.note.note:"", style: blueColorStyleMedium(20),))
                                  :Container(
                                margin: EdgeInsets.only(top: 24,left: 16,right: 16),
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
                                      attendanceStatus="Going";
                                      textColor=Color(0xff04D182);
                                      bgColor=Color(0xff04D182).withOpacity(0.1);
                                      changeUserStatus(userToken,"Going","");
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
                                      attendanceStatus="Not Going";
                                      openTellUs=true;
                                      textColor=Color(0xffFF6A81);
                                      bgColor=Color(0xffFF6A81).withOpacity(0.1);
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
                                      attendanceStatus="Pending";
                                      textColor=Color(0xffFEC20E);
                                      bgColor=Color(0xffFEC20E).withOpacity(0.1);
                                      changeUserStatus(userToken,"Pending","");
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
                                      attendanceStatus="Maybe";
                                      textColor=Color(0xff7F8FA4);
                                      bgColor=Color(0xff7F8FA4).withOpacity(0.1);
                                      changeUserStatus(userToken,"Maybe","");
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
                                      changeUserStatus(userToken, "Not Going", tellUsControler.text);
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

