import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';
import 'package:itimaaty/Models/change_vote_request_model.dart';
import 'package:itimaaty/Models/metting_details_response_model.dart';
import 'package:itimaaty/Repository/MeetingRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/DecisionsScreen.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/MeetingDetailsScreen.dart';
import 'package:itimaaty/View/SignInScreen.dart';
import 'package:itimaaty/Models/change_vote_response_model.dart';
import 'package:intl/intl.dart';

import '../LocalDb/DbHelper.dart';
import '../LocalDb/DecisionTableOffline.dart';
import '../LocalDb/OfflineDataLocalModel.dart';
import '../Models/ActionsScreen.dart';
import '../Models/ChangeActionStatusRequestModel.dart';
import '../Models/ChangeStatusResponseModel.dart';
import '../Utils/Constants.dart';
import '../View/TalkingPointsScreen.dart';
import 'MeetingDetailsWidgets.dart';

class TalkingPointsWidget extends StatefulWidget {

  // List<MeetingDetailsResponseModelDecisions> talkingPointList;
  List<AgendasData> talkingPointList;
  MeetingDetailsResponseModel meetingDetailsResponseModel;
  int  userId;
  int  meetingId;
  // int  index;

  TalkingPointsWidget(this.meetingDetailsResponseModel,this.userId,this.talkingPointList,this.meetingId);

  @override
  DescisionsWidgetScreenState createState() => DescisionsWidgetScreenState();
}

class DescisionsWidgetScreenState extends State<TalkingPointsWidget> {
  String userToken='';
  int userId=0;
  String email="";
  MeetingRepository meetingRepository;
  String status,actionStatus;
  // List<String> votesList =["Approved","Pending","Rejected","Abstained"];
  List<String> votesList=[] ;
  List<String> actionVotesList=[] ;
  String votesValue,actionVotesValue;
  var voteControler= TextEditingController();
  Color colorStatus=Colors.green;
  Color actionColorStatus=Colors.green;
  String baseUrl="";
  var dbHelper = DbHelper();

  String getFormattedDateNew(DateTime day) {
    // print("")
    String formattedDate1 = DateFormat('yyyy-MM-dd kk:mm a','en').format(day);
    // String formattedDate1 = DateFormat('yyyy-MM-ddTkk:mm').format(day);
    // print("")
    String formattedDate =
        getDoubleDigit(day.day.toString()) + " " +
            getDoubleDigit(monthNames[day.month-1]) + " " +
            getDoubleDigit(day.year.toString())+" "+formattedDate1;

    return formattedDate1;
  }

  DateTime stringToDateTimeNew(String dateString){
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime;
  }

  String getStatusColor(String votesValue){
    status=votesValue;
    if(status=="Approved"||status=="Approve")  {
      colorStatus=Colors.green;
    }else if(status=="Abstained")  {
      colorStatus=Color(0xff0C64F9);
    }else if(status=="Denied"||status=="Rejected")  {
      colorStatus=Color(0xffFF6A81);
    }else if(status=="Pending")  {
      colorStatus=Color(0xffFEC20E);
    }
    return status;
  }

  void changeVote(int decisionId,String token,String vote,String reason) {
    load();
    meetingRepository = new MeetingRepository();
    Future<ChangeVoteResponseModel> allList = meetingRepository.changeVote(baseUrl,token,decisionId,new ChangeVoteRequestModel(reason: reason,vote: vote));
    allList.then((value) {
      setState(() {
        if (value != null) {
          showSuccess();
          getStatusColor(vote);
          Navigator.pop(context);
          Navigator.pop(context);
          navigateTo(context, MeetingDetailsScreen(widget.meetingId));
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });
  }

  void openBottomSheetChangeVote(int kind,String date, int decisionId,BuildContext _context,MeetingDetailsResponseModelDecisions leave,
      List<MeetingDetailsResponseModelDecisions> list){
    votesValue=null;
    voteControler.text="";
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: _context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return StatefulBuilder( builder: (BuildContext context, StateSetter setStateee /*You can rename this!*/) {
            return Container(
              height: MediaQuery.of(_context).size.height,
              width: MediaQuery.of(_context).size.width,
              color: Colors.transparent,
              child:  Row(
                children: [
                  Expanded(flex:4,child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(color: Colors.transparent,))),
                  Expanded(
                    flex:2,
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      // width: MediaQuery.of(context).size.width - 200,
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
                                    child:Text(AppLocalizations.of(_context).lblDecisions,style: TextStyle(
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
                              margin:EdgeInsets.only(left: 20,right: 20,top:30,bottom: 20),
                              child: Text(AppLocalizations.of(_context).lblMyDecision,style: blueColorStyleMedium(18),)),

                          Container(
                            width: MediaQuery.of(_context).size.width,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: grayRoundedColor,// set border color
                                    width: 3.0
                                )
                            ),
                            // height: 56,
                            padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                            child:DropdownButton<String>(
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down_rounded),
                              iconSize: 22,
                              elevation: 16,
                              style: blueColorStyleMedium(20),
                              underline: Container(
                                height: 0,
                                color: Colors.transparent,
                              ),
                              onChanged: (String value) {
                                setStateee(() {
                                  votesValue=value;
                                });
                              },
                              value: votesValue,
                              items: votesList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 4,right: 4,top: 6),
                                        width: 13,
                                        height: 13,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: value==AppLocalizations.of(_context).lblApproved?Colors.green:
                                            value==AppLocalizations.of(_context).lblRejected?Colors.red:
                                            value==AppLocalizations.of(_context).lblPendingS?yellowColor:
                                            value==AppLocalizations.of(_context).lblAbstained?Colors.blueAccent:Colors.green
                                        ),
                                      ),
                                      const SizedBox(width: 4,),
                                      Container(
                                          margin: EdgeInsets.only(top: 0),
                                          child: Text(value)),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),

                          Container(
                              margin:EdgeInsets.only(left: 20,right: 20,top:30),
                              child: Text(AppLocalizations.of(_context).lblReason,style: blueColorStyleMedium(18),)),


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
                                controller: voteControler,
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
                                            // padding: EdgeInsets.only(top: 10,bottom: 3),
                                            // height:50,
                                            // width: 180,
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
                                                child: Text(AppLocalizations.of(_context).lblCancel,style: blueColorStyleMedium(18),),
                                              )
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        InkWell(
                                          onTap: () {
                                            String votesValue2;
                                            if (votesValue == AppLocalizations.of(_context).lblApproved) {
                                              votesValue2="Approved";
                                            } else if (votesValue == AppLocalizations.of(_context).lblAbstained) {
                                              votesValue2="Abstained";
                                            } else if (votesValue == AppLocalizations.of(_context).lblPendingS) {
                                              votesValue2="Pending";
                                            }else if (votesValue == AppLocalizations.of(_context).lblRejected) {
                                              votesValue2="Rejected";
                                            }
                                            if(votesValue!=null) {
                                              if(voteControler!=null&&voteControler.text.isNotEmpty) {
                                                hasNetwork().then((value) {
                                                  if(value){
                                                    changeVote(decisionId,userToken,votesValue2, voteControler.text != null ? voteControler.text : "",);
                                                  }else{
                                                    addOfflineVoteForDecision(kind, votesValue2, voteControler.text != null ? voteControler.text : "", leave, list);
                                                    // ffffffff
                                                    // showErrorWithMsg(AppLocalizations.of(context).lblNoInternet);
                                                  }
                                                });
                                              }else{
                                                if(votesValue2=="Approved"){
                                                  hasNetwork().then((value) {
                                                    if(value){
                                                      changeVote(decisionId,userToken,votesValue2, voteControler.text != null ? voteControler.text : "",
                                                      );
                                                    }else{
                                                      // ffffffff
                                                      addOfflineVoteForDecision(kind, votesValue2, voteControler.text != null ? voteControler.text : "", leave, list);

                                                      // showErrorWithMsg(AppLocalizations.of(context).lblNoInternet);
                                                    }
                                                  });

                                                }else{
                                                  showErrorWithMsg("Please Enter Reason");
                                                }
                                              }
                                            }else{
                                              showErrorWithMsg("Please Choose Vote");
                                            }
                                          },
                                          child: Container(
                                            // padding: EdgeInsets.only(top: 10,bottom: 3),
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
                                                child: Text(AppLocalizations.of(_context).lblConfirm,style: TextStyle(
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
                              )),
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

  Widget decisionsForMeetingDetailsForTalkingPoint(int kind,int userId,BuildContext context,int meetingId,int index, String stauss,List<MeetingDetailsResponseModelDecisions> talkingPointList) {

    // print("statusIs111111>>"+leave.stauss);
    // if(leave.stauss!=null) {
    //   if (leave.stauss == "Approved" || leave.stauss == "Approve") {
    //     colorStatus = Colors.green;
    //   } else if (leave.stauss == "Abstained") {
    //     colorStatus = Color(0xff0C64F9);
    //   } else if (leave.stauss == "Denied" || leave.stauss == "Rejected") {
    //     colorStatus = Color(0xffFF6A81);
    //   } else if (leave.stauss == "Pending") {
    //     colorStatus = Color(0xffFEC20E);
    //   }
    // }

    return talkingPointList!=null&&talkingPointList.isNotEmpty?
    SizedBox(
      // height: 60,
      // width: 200,
        child:ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: talkingPointList.length,
          itemBuilder: (context, index) {
            MeetingDetailsResponseModelDecisions leave=talkingPointList[index];
            // String status;
            int num=0;
            if(leave.voters!=null&&leave.voters.isNotEmpty){
              if(leave.voters.length>4){
                num=leave.voters.length-3;
              }
            }

            // if(leave.voters!=null&&leave.voters.isNotEmpty){
            //   for(int i=0;i<leave.voters.length;i++){
            //     if(userId==leave.voters[i].userId){
            //       leave.status=leave.voters[i].vote;
            //       break;
            //     }else{
            //     }
            //   }
            // }

            Color colorStatus=Colors.green;
            if (leave.status == "Approved") {
              leave.status=AppLocalizations.of(context).lblApproved;
              colorStatus = Colors.green;
            } else if (leave.status == "Abstained") {
              leave.status=AppLocalizations.of(context).lblAbstained;
              colorStatus = Color(0xff0C64F9);
            } else if (leave.status == "Denied" || leave.status == "Rejected") {
              leave.status=AppLocalizations.of(context).lblRejected;
              colorStatus = Color(0xffFF6A81);
            } else if (leave.status == "Pending") {
              leave.status=AppLocalizations.of(context).lblPendingS;
              print("leave.status>>"+leave.status.toString());
              colorStatus = Color(0xffFEC20E);
            }

            return InkWell(
              onTap: () async {
                // Navigator.pop(context);
                // String  test = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DecisionsScreen(leave.meetingId,leave.id,leave.stauss)));
                String  test = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DecisionsScreen(meetingId,leave.id,"Approved")));
                if(test!=null){
                  setState(() {
                    leave.status=test;
                    if (leave.status == "Approved") {
                      leave.status=AppLocalizations.of(context).lblApproved;
                      colorStatus = Colors.green;
                    } else if (leave.status == "Abstained") {
                      leave.status=AppLocalizations.of(context).lblAbstained;
                      colorStatus = Color(0xff0C64F9);
                    } else if (leave.status == "Denied" || leave.status == "Rejected") {
                      leave.status=AppLocalizations.of(context).lblRejected;
                      colorStatus = Color(0xffFF6A81);
                    } else if (leave.status == "Pending") {
                      leave.status=AppLocalizations.of(context).lblPendingS;
                      print("leave.status>>"+leave.status.toString());
                      colorStatus = Color(0xffFEC20E);
                    }
                    print("testIs>>"+test.toString());
                  });
                }
                // navigateTo(context, DecisionsScreen(leave.meetingId,leave.id,leave.stauss));
              },

              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(14.0),
                    border: Border.all(
                        color: grayRoundedColor,// set border color
                        width: 2.0
                    )
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              // width: 30,
                              // height: 30,
                              padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom:6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [0.1, 0.9],
                                  colors: [
                                    Color(0xffFEC20E).withOpacity(0.1),
                                    Color(0xffFEC20E).withOpacity(0.1),
                                  ],
                                ),
                              ),
                              child: Center(child: Text("1."+(index+1).toString(), style: yellowColorStyleBold(22),)),
                            ),
                            const SizedBox(width: 6,),
                            Container(
                              // width: 250,
                              padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 8),
                              decoration: BoxDecoration(
                                  color: Color(0xffe8eaed),
                                  border: Border.all(
                                    color: Color(0xffe8eaed),
                                  ),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/images/ic_decisions.webp",width: 24,height: 24,color: Colors.black,),
                                  const SizedBox(width: 14,),
                                  Container( margin: EdgeInsets.only(top: 4),
                                      child: Text(AppLocalizations.of(context).lblDesisions,style: grayTextColorStyleMedium(20),)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Image.asset("assets/images/ic_drag.webp",width: 30,height: 30)),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 2),
                          decoration: BoxDecoration(
                              color: colorStatus.withOpacity(0.1),
                              border: Border.all(
                                color: colorStatus.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                          ),
                          child: Text((leave.deadline!=null?getFormattedDateNew(stringToDateTimeNew(leave.deadline)):""),style:  TextStyle(
                            color: colorStatus ,
                            fontFamily: "black",
                            fontSize: 20,
                          ),),
                          // child: Text(("leave.deadline"),style: grayTextColorStyleMedium(20),),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount:leave.voters.length>3?3: leave.voters.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 2,right: 2),
                                    child: ClipOval(
                                        child:
                                        CircleAvatar(
                                          radius: 26,
                                          backgroundColor: Colors.red,
                                          child: CircleAvatar(
                                            radius: 26,
                                            backgroundImage: NetworkImage(
                                              leave.voters!=null&&leave.voters[index].user!=null?
                                              leave.voters[index].user.image!=null?leave.voters[index].user.image:
                                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                                            ),
                                          ),
                                        )
                                    ),
                                  );
                                },
                              ),
                            ),
                            num<4 ?Container():Container(
                              // width: 30,
                              // height: 30,
                              padding: EdgeInsets.only(left: 12,right: 12,top: 16,bottom:12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [0.1, 0.9],
                                  colors: [
                                    Color(0xffFEC20E),
                                    Color(0xffFEC20E),
                                  ],
                                ),
                              ),
                              child: Center(child: Text("+"+num.toString(), style: TextStyle(
                                color: Colors.white ,
                                fontFamily: "black",
                                fontSize: 20,
                                // fontWeight: FontWeight.bold
                              ),)),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text(leave.title!=null?leave.title:"",
                      style: blueColorBoldStyle(20),),
                    const SizedBox(height: 10,),
                    Text(leave.description!=null?leave.description:"",
                      style: blueColorStyleMedium(18),),

                    const SizedBox(height: 20,),
                    leave.attachments!=null&&leave.attachments.isNotEmpty? SizedBox(
                        height: 60,
                        // width: 200,
                        child:ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: leave.attachments.length,
                          itemBuilder: (context, index) {
                            return leaveRowForAttachments(leave.meetingId,leave.attachments[index],index,context,0);
                          },
                        )
                    ):Container(),

                    const SizedBox(height: 20,),
                    // leave.subpoints!=null&&leave.subpoints.isNotEmpty?
                    // SizedBox(
                    //   // height: 60,
                    //   // width: 200,
                    //     child:ListView.builder(
                    //       scrollDirection: Axis.vertical,
                    //       shrinkWrap: true,
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       itemCount: leave.subpoints.length,
                    //       itemBuilder: (context, index) {
                    //         return leaveRowForSubPoints(leave.subpoints[index],index,index,context);
                    //       },
                    //     )
                    // ):Container(),
                    //
                    // leave.subpoints!=null&&leave.subpoints.isNotEmpty?  const SizedBox(height: 20,):const SizedBox(height: 0,),

                    leave.status!=null
                        &&(widget.meetingDetailsResponseModel.status.name.contains(AppLocalizations.of(context).lblLive)
                        ||widget.meetingDetailsResponseModel.status.name.contains(AppLocalizations.of(context).lblArchived))
                        ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 13,
                                  height: 13,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colorStatus),
                                ),
                                const SizedBox(width: 10,),
                                Container(
                                  margin: EdgeInsets.only(top: 4),

                                  child: Text(leave.status!=null?leave.status:"",style: TextStyle(
                                    // child: Text("",style: TextStyle(
                                    color: colorStatus ,
                                    fontFamily: "black",
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4,),
                            Container(
                                child: Text(("My Decision"),style: grayTextColorStyleMedium(20),))
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            openBottomSheetChangeVote(kind,"date", leave.id,context,leave,talkingPointList);
                          },
                          child: Container(
                            // padding: EdgeInsets.only(left: 40,right: 40,top: 16,bottom: 12),
                            padding: EdgeInsets.only(left: 24,right: 24,top: 8,bottom: 8),
                            decoration: BoxDecoration(
                                color: Color(0xffe8eaed),
                                border: Border.all(
                                  color: Color(0xffe8eaed),
                                ),
                                borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                            child: Text(AppLocalizations.of(context).lblVote,style: grayTextColorStyleBlack(22),),
                          ),
                        )
                      ],
                    )
                        : const SizedBox(height: 1,),

                  ],
                ),
              ),
            );
          },
        )
    ):Container();



  }

  Widget actionsForMeetingDetailsForTalkingPoint(int kind,int userId,BuildContext context,int meetingId,int index, String stauss,List<MeetingDetailsResponseModelActions> actionList) {

    // prepare(userId, email);
    return actionList!=null&&actionList.isNotEmpty?
    SizedBox(
        child:ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: actionList.length,
          itemBuilder: (context, index) {
            MeetingDetailsResponseModelActions leave  =  actionList[index];
            // index=widget.index++;
            // if(leave.actionStauss!=null) {
            //   if(leave.actionStauss=="Complete")  {
            //     // status="Complete";
            //     colorStatus=Colors.green;
            //     leave.actionStauss=AppLocalizations.of(context).lblComplete;
            //   }else if(leave.actionStauss=="Not Complete")  {
            //     // status="Not Complete";
            //     colorStatus=Color(0xffFF6A81);
            //     leave.actionStauss=AppLocalizations.of(context).lblNotComplete;
            //   }else if(leave.actionStauss=="In Progress")  {
            //     // status="In Progress";
            //     colorStatus=Color(0xffFEC20E);
            //     leave.actionStauss=AppLocalizations.of(context).lblInProgress;
            //   }
            // }
            int num=0;
            if(leave.participants!=null&&leave.participants.isNotEmpty){
              if(leave.participants.length>4){
                num=leave.participants.length-3;
              }
            }

            return InkWell(
              onTap: () {
                // navigateTo(context, ActionsScreen(widget.meetingId,leave.id,leave.actionStauss));
                navigateTo(context, ActionsScreen(widget.meetingId,leave.id,""));
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(14.0),
                    border: Border.all(
                        color: grayRoundedColor,// set border color
                        width: 2.0
                    )
                ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              // width: 30,
                              // height: 30,
                              padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom:6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [0.1, 0.9],
                                  colors: [
                                    Color(0xffFEC20E).withOpacity(0.1),
                                    Color(0xffFEC20E).withOpacity(0.1),
                                  ],
                                ),
                              ),
                              // jjj
                              child: Center(child: Text(("1."+(index+1).toString()).toString(), style: yellowColorStyleBold(22),)),
                            ),
                            const SizedBox(width: 6,),
                            Container(
                              // width: 250,
                              padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 8),
                              decoration: BoxDecoration(
                                  color: Color(0xffe8eaed),
                                  border: Border.all(
                                    color: Color(0xffe8eaed),
                                  ),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset("assets/images/ic_action.webp",width: 24,height: 24,color: Colors.black,),
                                  const SizedBox(width: 14,),
                                  Container( margin: EdgeInsets.only(top: 4),
                                      child: Text(AppLocalizations.of(context).lblActions,style: grayTextColorStyleMedium(20),)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Image.asset("assets/images/ic_drag.webp",width: 30,height: 30)),
                      ],
                    ),
                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 2),
                          decoration: BoxDecoration(
                              color:colorStatus.withOpacity(0.1),
                              border: Border.all(
                                color: colorStatus.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                          ),
                          child: Text((leave.openTill!=null?getFormattedDateNew(stringToDateTimeNew(leave.openTill)):""),style: TextStyle(
                            color: colorStatus ,
                            fontFamily: "medium",
                            fontSize: 20,
                          ),),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: leave.participants.length>3?3: leave.participants.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 2,right: 2),
                                    child: ClipOval(
                                        child:
                                        CircleAvatar(
                                          radius: 26,
                                          backgroundColor: Colors.red,
                                          child: CircleAvatar(
                                            radius: 26,
                                            backgroundImage: NetworkImage(
                                              leave.participants!=null&&leave.participants[index].user!=null?
                                              leave.participants[index].user.image!=null?  leave.participants[index].user.image:
                                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                                              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                                            ),
                                          ),
                                        )
                                    ),
                                  );
                                },
                              ),
                            ),
                            num<4 ?Container():Container(
                              // width: 30,
                              // height: 30,
                              padding: EdgeInsets.only(left: 12,right: 12,top: 16,bottom:12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  stops: [0.1, 0.9],
                                  colors: [
                                    Color(0xffFEC20E),
                                    Color(0xffFEC20E),
                                  ],
                                ),
                              ),
                              child: Center(child: Text("+"+num.toString(), style: TextStyle(
                                color: Colors.white ,
                                fontFamily: "black",
                                fontSize: 20,
                                // fontWeight: FontWeight.bold
                              ),)),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text(leave.title!=null?leave.title:"",
                      style: blueColorBoldStyle(20),),
                    const SizedBox(height: 10,),
                    Text(leave.description!=null?leave.description:"",
                      style: blueColorStyleMedium(18),),

                    const SizedBox(height: 20,),
                    leave.attachments!=null&&leave.attachments.isNotEmpty? SizedBox(
                        height: 60,
                        // width: 200,
                        child:ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: leave.attachments.length,
                          itemBuilder: (context, index) {
                            return leaveRowForAttachments(leave.meetingId,leave.attachments[index],index,context,2);
                          },
                        )
                    ):Container(),

                    const SizedBox(height: 20,),
                    // leave.subpoints!=null&&leave.subpoints.isNotEmpty?
                    // SizedBox(
                    //   // height: 60,
                    //   // width: 200,
                    //     child:ListView.builder(
                    //       scrollDirection: Axis.vertical,
                    //       shrinkWrap: true,
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       itemCount: leave.subpoints.length,
                    //       itemBuilder: (context, index) {
                    //         return leaveRowForSubPoints(leave.meetingId,leave.subpoints[index],parentIndex,index,context);
                    //       },
                    //     )
                    // ):Container(),
                    // leave.subpoints!=null&&leave.subpoints.isNotEmpty?  const SizedBox(height: 20,):SizedBox(height: 0,),
                    //
                    // leave.status!=null?
                    (widget.meetingDetailsResponseModel.status.name.contains(AppLocalizations.of(context).lblLive)
                        ||widget.meetingDetailsResponseModel.status.name.contains(AppLocalizations.of(context).lblArchived))
                        ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 13,
                                  height: 13,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      // color: leave.getColor
                                      color:leave.getColor!=null?
                                      Color( int.parse(leave.getColor.split('(0x')[1].split(')')[0],radix: 16)):Colors.transparent
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  child: Text(leave.getStatus.toString(),style: TextStyle(
                                    color: leave.getColor!=null?
                                    Color( int.parse(leave.getColor.split('(0x')[1].split(')')[0],radix: 16)):Colors.transparent ,
                                    fontFamily: "black",
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4,),
                            Container(
                                child: Text(AppLocalizations.of(context).lblMyAction,style: grayTextColorStyleMedium(22),))
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            openBottomSheetChangeProgress(kind,"date", context,leave.id,leave,actionList);
                          },
                          child: Container(
                            // padding: EdgeInsets.only(left: 40,right: 40,top: 16,bottom: 12),
                            padding: EdgeInsets.only(left: 24,right: 24,top: 8,bottom: 8),
                            decoration: BoxDecoration(
                                color: Color(0xffe8eaed),
                                border: Border.all(
                                  color: Color(0xffe8eaed),
                                ),
                                borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                            child: Text(AppLocalizations.of(context).lblMyStatus,style: grayTextColorStyleBlack(22),),
                          ),
                        )
                      ],
                    ):Container()
                    // :SizedBox(height: 1,),

                  ],
                ),
              ),
            );
          },
        )
    ):Container();
  }

  Widget taikingPointsForMeetingDetails(int userId,int id,BuildContext context,AgendasData leave,int parentIndex) {
    return InkWell(
      onTap: () {
        print("kkkkkk");
        // navigateTo(context, TalkingPointsScreen(leave.meetingId,leave.id));
        navigateTo(context, TalkingPointsScreen(id,leave.id));
        // print(""+leave.meetingId.toString());
        // print(""+leave.id.toString());
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding:AppLocalizations.of(context).locale=="en"? EdgeInsets.only(top: 16,bottom: 16,right: 60,left: 16)
                :EdgeInsets.only(top: 16,bottom: 16,right: 16,left: 60),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(14.0),
                border: Border.all(
                    color: grayRoundedColor,// set border color
                    width: 2.0
                )
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          // width: 30,
                          // height: 30,
                          padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom:6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [0.1, 0.9],
                              colors: [
                                Color(0xffFEC20E).withOpacity(0.1),
                                Color(0xffFEC20E).withOpacity(0.1),
                              ],
                            ),
                          ),
                          child: Center(child: Text(((parentIndex+1).toString()), style: yellowColorStyleBold(22),)),
                        ),
                        const SizedBox(width: 6,),
                        Container(
                          // width: 250,
                          padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 8),
                          decoration: BoxDecoration(
                              color: Color(0xffe8eaed),
                              border: Border.all(
                                color: Color(0xffe8eaed),
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/ic_talkingpoint.webp",width: 24,height: 24,color: Colors.black,),
                              const SizedBox(width: 14,),
                              Container( margin: EdgeInsets.only(top: 4),
                                  // child: Text(AppLocalizations.of(context).lblTalkingPoints,style: grayTextColorStyleMedium(20),)),
                                  child: Text(AppLocalizations.of(context).lblAgenda,style: grayTextColorStyleMedium(20),)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Image.asset("assets/images/ic_drag.webp",width: 30,height: 30)),
                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 2),
                  decoration: BoxDecoration(
                      color: Color(0xffe8eaed),
                      border: Border.all(
                        color: Color(0xffe8eaed),
                      ),
                      borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                  ),
                  child: Text((leave.duration!=null?leave.duration.toString()+" "+AppLocalizations.of(context).lblMin:""),style: grayTextColorStyleMedium(20),),
                ),
                const SizedBox(height: 20,),
                Text(leave.title!=null?leave.title:"",
                  style: blueColorBoldStyle(20),),
                const SizedBox(height: 10,),

                Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: Text(leave.description!=null?leave.description:"",
                    style: blueColorStyleMedium(18),),
                ),

                leave.attachments!=null&&leave.attachments.isNotEmpty?
                const SizedBox(height: 20,):const SizedBox(height: 0,),

                leave.attachments!=null&&leave.attachments.isNotEmpty? SizedBox(
                    height: 60,
                    // width: 200,
                    child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: leave.attachments.length,
                      itemBuilder: (context, index) {
                        return leaveRowForAttachments(leave.meetingId,leave.attachments[index],index,context,0);
                      },
                    )
                ):Container(),

                const SizedBox(height: 20,),

                leave.subpoints!=null&&leave.subpoints.isNotEmpty?
                SizedBox(
                  // height: 60,
                  // width: 200,
                    child:ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: leave.subpoints.length,
                      itemBuilder: (context, index) {
                        // leave.subpoints[0].
                        return Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(14.0),
                                border: Border.all(
                                    color: grayRoundedColor,// set border color
                                    width: 2.0
                                )
                            ),
                            child: leaveRowForSubPoints(leave.meetingId,leave.subpoints[index],parentIndex,index,context));

                      },
                    )
                ):Container(),

                leave.decision!=null&&leave.decision.isNotEmpty?
                // decisionsForMeetingDetailsForTalkingPoint(context,leave.meetingId, parentIndex+1, "stauss", leave.decisions[0]):
                decisionsForMeetingDetailsForTalkingPoint(0,userId,context,leave.meetingId, parentIndex+1, "stauss", leave.decision):
                Container(),

                actionsForMeetingDetailsForTalkingPoint(0,userId,context,leave.meetingId, parentIndex+1, "stauss", leave.action),

              ],
            ),
          ),
          // leave.subpoints!=null&&leave.subpoints.isNotEmpty?
          // SizedBox(
          //   // height: 60,
          //   // width: 200,
          //     child:ListView.builder(
          //       scrollDirection: Axis.vertical,
          //       shrinkWrap: true,
          //       physics: const NeverScrollableScrollPhysics(),
          //       itemCount: leave.subpoints.length,
          //       itemBuilder: (context, index) {
          //         // leave.subpoints[0].
          //         return Container(
          //             margin: EdgeInsets.only(top: 20),
          //             padding: EdgeInsets.all(16),
          //             decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: new BorderRadius.circular(14.0),
          //                 border: Border.all(
          //                     color: grayRoundedColor,// set border color
          //                     width: 2.0
          //                 )
          //             ),
          //             child: leaveRowForSubPoints(leave.meetingId,leave.subpoints[index],parentIndex,index,context));
          //
          //       },
          //     )
          // ):Container(),
          // actionsForMeetingDetailsForTalkingPoint(0,userId,context,leave.meetingId, parentIndex+1, "stauss", leave.action),

          // leave.decision!=null&&leave.decision.isNotEmpty?
          // // decisionsForMeetingDetailsForTalkingPoint(context,leave.meetingId, parentIndex+1, "stauss", leave.decisions[0]):
          // decisionsForMeetingDetailsForTalkingPoint(0,userId,context,leave.meetingId, parentIndex+1, "stauss", leave.decision):
          // Container(),
        ],
      ),
    );
  }

  Widget leaveRowForSubPoints(int meetingId,MeetingDetailsResponseModelSubpoints leave,int parentIndex,int index,BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(16),
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: new BorderRadius.circular(14.0),
      //     border: Border.all(
      //         color: grayRoundedColor,// set border color
      //         width: 2.0
      //     )
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12,right: 12,top: 9,bottom: 3),
            margin: EdgeInsets.only(bottom: 10,top: 12),
            decoration: BoxDecoration(
                color: Color(0xffe8eaed),
                border: Border.all(
                  color: Color(0xffe8eaed),
                ),
                borderRadius: BorderRadius.circular(14) // use instead of BorderRadius.all(Radius.circular(20))
            ),
            child: Text(

              leave.duration!=null?(leave.duration.toString()+" "+AppLocalizations.of(context).lblMin):"0 Min",style: grayTextColorStyleMedium(20),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // width: 30,
                    // height: 30,
                    padding: EdgeInsets.only(left: 7,right: 7,top: 7,bottom:3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.1, 0.9],
                        colors: [
                          Color(0xffFEC20E),
                          Color(0xffFEC20E),
                        ],
                      ),
                    ),
                    child: Center(child: Text((parentIndex+1).toString()+"." + ((index+1).toString()), style:
                    TextStyle(
                      color: whiteColor ,
                      fontFamily: "black",
                      fontSize: 20,
                      // fontWeight: FontWeight.bold
                    ),)),
                  ),
                  const SizedBox(width: 6,),
                  Container(
                    width: MediaQuery.of(context).size.width/2-140,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(leave.title!=null? leave.title:"",
                        style: blueColorStyleMedium(22),))
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      leave.user!=null?leave.user.image!=null?!leave.user.image.contains(".html")?leave.user.image:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4,),
          Text(leave.description!=null?leave.description:"",style: blueColorStyleregular(20),),
          leave.attachments!=null&&leave.attachments.isNotEmpty? SizedBox(
              height: 60,
              // width: 200,
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: leave.attachments.length,
                itemBuilder: (context, index) {
                  return leaveRowForAttachments(meetingId,leave.attachments[index],index,context,0);
                },
              )
          ):Container(),

          Container(
            // margin: EdgeInsets.only(top: 20),
            // padding: EdgeInsets.all(16),
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: new BorderRadius.circular(14.0),
            //     border: Border.all(
            //         color: grayRoundedColor,// set border color
            //         width: 2.0
            //     )
            // ),
              child:
              actionsForMeetingDetailsForTalkingPoint(1,userId,context,leave.meetingTalkingPointId, parentIndex+1, "stauss", leave.action)),

          leave.decision!=null&&leave.decision.isNotEmpty?
          Container(
            // margin: EdgeInsets.only(top: 20),
            // padding: EdgeInsets.all(16),
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: new BorderRadius.circular(14.0),
            //     border: Border.all(
            //         color: grayRoundedColor,// set border color
            //         width: 2.0
            //     )
            // ),
              child: decisionsForMeetingDetailsForTalkingPoint(1,userId,context,leave.meetingTalkingPointId, parentIndex+1, "stauss", leave.decision)):
          Container(),

        ],
      ),
    );
  }

  Widget makeBodyTaikingPointsForMeetingDetails(int userId,int id, BuildContext context,List<AgendasData> talkingPointList){
    return talkingPointList!=null&&talkingPointList.isNotEmpty?
    SizedBox(
      // height: 60,
      // width: 200,
        child:ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: talkingPointList.length,
          itemBuilder: (context, index) {
            return taikingPointsForMeetingDetails(userId,id,context,talkingPointList[index],index);
          },
        )
    ):Container();
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

  void changeStatus(String baseUrl,String token,String status,int id,MeetingDetailsResponseModelActions leave) {
    load();
    meetingRepository = new MeetingRepository();
    Future<ChangeStatusResponseModel> allList = meetingRepository.changeActionStatus(baseUrl,token,id,new ChangeActionStatusRequestModel(status: status));
    allList.then((value) {
      setState(() {
        if (value != null) {
          showSuccess();
          // getStatus(actionStatus!=null?actionStatus:actionVotesValue);
          getStatus(status);
          setState(() {
            // leave.setStatus=actionStatus!=null?actionStatus:actionVotesValue;
            leave.setStatus=status;
            // leave.setColor=getStatus(actionStatus!=null?actionStatus:actionVotesValue);
            leave.setColor=getStatus(status);
            // String dataString= json.encode(widget.meetingDetailsResponseModel.toJson());
            // addOrUpdateOfflineMeetingDetails(dataString);
          });
          // meetingDetailsResponseModel = value;
          Navigator.pop(context);
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });
  }

  void openBottomSheetChangeProgress(int kind,String date,BuildContext _context,int id,MeetingDetailsResponseModelActions leave,List<MeetingDetailsResponseModelActions>list){
    voteControler.text="";
    actionVotesValue=null;
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: _context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return StatefulBuilder( builder: (BuildContext context, StateSetter setStateee /*You can rename this!*/) {
            return Container(
              height: MediaQuery.of(_context).size.height,
              width: MediaQuery.of(_context).size.width,
              color: Colors.transparent,
              child:  Row(
                children: [
                  Expanded(flex:4,child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(color: Colors.transparent,))),
                  Expanded(
                    flex:2,
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      // width: MediaQuery.of(context).size.width - 200,
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
                                    child:Text(AppLocalizations.of(_context).lblActions,style: TextStyle(
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
                              margin:EdgeInsets.only(left: 20,right: 20,top:30,bottom: 20),
                              child: Text(AppLocalizations.of(_context).lblMyAction,style: blueColorStyleMedium(18),)),

                          Container(
                            width: MediaQuery.of(_context).size.width,
                            margin: EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: grayRoundedColor,// set border color
                                    width: 3.0
                                )
                            ),
                            // height: 56,
                            padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
                            child:DropdownButton<String>(
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down_rounded),
                              iconSize: 22,
                              elevation: 16,
                              style: blueColorStyleMedium(20),
                              underline: Container(
                                height: 0,
                                color: Colors.transparent,
                              ),
                              onChanged: (String value) {
                                setStateee(() {
                                  actionVotesValue=value;
                                  // committeeId=value.id.toString();
                                });
                              },
                              value: actionVotesValue,
                              items: actionVotesList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 4,right: 4),
                                        width: 13,
                                        height: 13,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: value==AppLocalizations.of(_context).lblComplete?Colors.green:
                                            value==AppLocalizations.of(_context).lblNotComplete?Colors.red:
                                            value==AppLocalizations.of(_context).lblInProgress?yellowColor:Colors.green
                                        ),
                                      ),
                                      const SizedBox(width: 4,),
                                      Container(
                                          margin: EdgeInsets.only(top: 0),
                                          child: Text(value)),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
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
                                            // padding: EdgeInsets.only(top: 10,bottom: 3),
                                            // height:50,
                                            // width: 180,
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
                                                child: Text(AppLocalizations.of(_context).lblCancels,style: blueColorStyleMedium(18),),
                                              )
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        InkWell(
                                          onTap: () {
                                            if(actionVotesValue!=null) {
                                              String votesValue2;
                                              if (actionVotesValue == AppLocalizations.of(_context).lblInProgress) {
                                                votesValue2="In Progress";
                                              } else if (actionVotesValue == AppLocalizations.of(_context).lblComplete) {
                                                votesValue2="Complete";
                                              } else if (actionVotesValue == AppLocalizations.of(_context).lblNotComplete) {
                                                votesValue2="Not Complete";
                                              }
                                              hasNetwork().then((value) {
                                                if(value){
                                                  changeStatus(baseUrl,userToken,votesValue2,id,leave);
                                                }else{
                                                  // ffffffff
                                                  addOfflineVoteForAction(kind,votesValue2,  leave, list);
                                                  // showErrorWithMsg(AppLocalizations.of(context).lblNoInternet);
                                                }
                                              });

                                            }else{
                                              showErrorWithMsg("Please Choose Status");
                                            }
                                          },
                                          child: Container(
                                            // padding: EdgeInsets.only(top: 10,bottom: 3),
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
                                                child: Text(AppLocalizations.of(_context).lblConfirm,style: TextStyle(
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
                              )),
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
  // _______________________________________________________
  // _________________________________________________________
  Future<bool> addOrUpdateVote(String vote,int id) async {
    var orgainzationsFuture = dbHelper.getMeetingActions(baseUrl+"actions/"+id.toString()+Constants.CHANGE_STATUS);
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        DecisionTableOffline localModel =data[i];
        if(localModel.url == baseUrl+"actions/"+id.toString()+Constants.CHANGE_STATUS) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      if(m){
        print("Updatettt>>"+m.toString());
        var result = await dbHelper.updateMeetingActions(baseUrl+"actions/"+id.toString()+Constants.CHANGE_STATUS,vote);
      }else{
        print("Insertttt>>"+m.toString());
        var result = await dbHelper.insertRequestsData(DecisionTableOffline(
          url: baseUrl+"actions/"+id.toString()+Constants.CHANGE_STATUS,
          changeDecisionVote: vote,
        ));
      }
    });
  }

  Future setActions(MeetingDetailsResponseModelActions leave,String vote,List<MeetingDetailsResponseModelActions> actionsList) async{
    // int index=0;
    if(widget.meetingDetailsResponseModel!=null){
      if(widget.meetingDetailsResponseModel.agendas!=null){
        if(widget.meetingDetailsResponseModel.agendas.isNotEmpty){
          for(int i=0;i<widget.meetingDetailsResponseModel.agendas.length;i++ ){
            if(widget.meetingDetailsResponseModel.agendas[i].agendaType!=null){
              if(widget.meetingDetailsResponseModel.agendas[i].agendaType=="talking_point"){
                for(int m=0;m<widget.meetingDetailsResponseModel.agendas[i].data.length;m++ ) {
                  print("data>>>"+widget.meetingDetailsResponseModel.agendas[i].data.toString());
                  if(widget.meetingDetailsResponseModel.agendas[i].data[m].action!=null){
                    for(int k=0;k<widget.meetingDetailsResponseModel.agendas[i].data[m].action.length;k++){
                      if(widget.meetingDetailsResponseModel.agendas[i].data[m].action[k].id==leave.id){
                        // widget.meetingDetailsResponseModel.agendas[i].data[m].action[k]=leave;
                        if(widget.meetingDetailsResponseModel.agendas[i].data[m].action[k].participants!=null&&widget.meetingDetailsResponseModel.agendas[i].data[m].action[k].participants.isNotEmpty)
                          for(int r= 0; r <widget.meetingDetailsResponseModel.agendas[i].data[m].action[k].participants.length; r++){
                            if(userId!=null){
                              if(userId==widget.meetingDetailsResponseModel.agendas[i].data[m].action[k].participants[r].userId){
                                widget.meetingDetailsResponseModel.agendas[i].data[m].action[k].participants[r].status=vote;
                                break;
                              }else{
                              }
                            }else{
                              // checkMail
                              if(email==widget.meetingDetailsResponseModel.agendas[i].data[m].action[k].participants[r].userEmail){
                                widget.meetingDetailsResponseModel.agendas[i].data[m].action[k].participants[r].status=vote;
                                break;
                              }else{
                              }
                            }
                          }

                        break;
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
  }

  Future setActionsForUbPoints(MeetingDetailsResponseModelActions leave,String vote,List<MeetingDetailsResponseModelActions> actionsList) async{
    // int index=0;
    if(widget.meetingDetailsResponseModel!=null){
      if(widget.meetingDetailsResponseModel.agendas!=null){
        if(widget.meetingDetailsResponseModel.agendas.isNotEmpty){
          for(int i=0;i<widget.meetingDetailsResponseModel.agendas.length;i++ ){
            if(widget.meetingDetailsResponseModel.agendas[i].agendaType!=null){
              if(widget.meetingDetailsResponseModel.agendas[i].agendaType=="talking_point"){
                for(int m=0;m<widget.meetingDetailsResponseModel.agendas[i].data.length;m++ ) {
                  print("data>>>"+widget.meetingDetailsResponseModel.agendas[i].data.toString());
                  if(widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints!=null){
                    for(int h=0;h<widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints.length;h++){
                      if(widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].action!=null){
                        for(int k=0;k<widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].action.length;k++){
                          if(widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].action[k].id==leave.id){
                            // widget.meetingDetailsResponseModel.agendas[i].data[m].action[k]=leave;
                            if(widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].action[k].participants!=null&&widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].action[k].participants.isNotEmpty)
                              for(int r= 0; r <widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].action[k].participants.length; r++){
                                if(userId!=null){
                                  if(userId==widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].action[k].participants[r].userId){
                                    widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].action[k].participants[r].status=vote;
                                    break;
                                  }else{
                                  }
                                }else{
                                  // checkMail
                                  if(email==widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].action[k].participants[r].userEmail){
                                    widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].action[k].participants[r].status=vote;
                                    break;
                                  }else{
                                  }
                                }
                              }

                            break;
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
      }
    }
  }

  void addOfflineVoteForAction(int kind,String vote ,MeetingDetailsResponseModelActions leave,List<MeetingDetailsResponseModelActions> actionsList){
    addOrUpdateVote(vote,leave.id).then((value) {
      Navigator.pop(context);
      setState(() {
        leave.setColor=  getStatus(vote);
        leave.setStatus=vote;
        status=vote;
      });
     if(kind==0){
       setActions(leave,vote,actionsList).then((value) {
         String dataString= json.encode(widget.meetingDetailsResponseModel.toJson());
         addOrUpdateOfflineMeetingDetails(dataString);
       });
     }else{
       setActionsForUbPoints(leave,vote,actionsList).then((value) {
         String dataString= json.encode(widget.meetingDetailsResponseModel.toJson());
         addOrUpdateOfflineMeetingDetails(dataString);
       });
     }
    });
  }

  Future<bool> addOrUpdateVoteForAction(String vote,String reason,int id) async {
    var orgainzationsFuture = dbHelper.getMeetingActions(baseUrl+"actions/"+id.toString()+Constants.CHANGE_STATUS);
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        DecisionTableOffline localModel =data[i];
        if(localModel.url == baseUrl+"actions/"+id.toString()+Constants.CHANGE_STATUS) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      if(m){
        print("Updatettt>>"+m.toString());
        var result = await dbHelper.updateMeetingActions(baseUrl+"actions/"+id.toString()+Constants.CHANGE_STATUS,vote);
      }else{
        print("Insertttt>>"+m.toString());
        var result = await dbHelper.insertRequestsData(DecisionTableOffline(
          url: baseUrl+"actions/"+id.toString()+Constants.CHANGE_STATUS,
          changeDecisionVote: vote,
        ));
      }
    });
  }
  // _______________________________________________________
  // _________________________________________________________

  // _______________________________________________________

  Future setDecisions(MeetingDetailsResponseModelDecisions leave,String vote,List<MeetingDetailsResponseModelDecisions> actionsList) async{
    // int index=0;
    if(widget.meetingDetailsResponseModel!=null){
      if(widget.meetingDetailsResponseModel.agendas!=null){
        if(widget.meetingDetailsResponseModel.agendas.isNotEmpty){
          for(int i=0;i<widget.meetingDetailsResponseModel.agendas.length;i++ ){
            if(widget.meetingDetailsResponseModel.agendas[i].agendaType!=null){
              if(widget.meetingDetailsResponseModel.agendas[i].agendaType=="talking_point"){
                for(int m=0;m<widget.meetingDetailsResponseModel.agendas[i].data.length;m++ ) {
                  print("data>>>"+widget.meetingDetailsResponseModel.agendas[i].data.toString());
                  if(widget.meetingDetailsResponseModel.agendas[i].data[m].decision!=null){
                    for(int k=0;k<widget.meetingDetailsResponseModel.agendas[i].data[m].decision.length;k++){
                      if(widget.meetingDetailsResponseModel.agendas[i].data[m].decision[k].id==leave.id){
                        if(widget.meetingDetailsResponseModel.agendas[i].data[m].decision[k].voters!=null&&widget.meetingDetailsResponseModel.agendas[i].data[m].decision[k].voters.isNotEmpty)
                          for(int r= 0; r <widget.meetingDetailsResponseModel.agendas[i].data[m].decision[k].voters.length; r++){
                            if(userId!=null){
                              if(userId==widget.meetingDetailsResponseModel.agendas[i].data[m].decision[k].voters[r].userId){
                                widget.meetingDetailsResponseModel.agendas[i].data[m].decision[k].voters[r].vote=vote;
                                break;
                              }else{
                              }
                            }else{
                              // checkMail
                              if(email==widget.meetingDetailsResponseModel.agendas[i].data[m].decision[k].voters[r].userEmail){
                                widget.meetingDetailsResponseModel.agendas[i].data[m].decision[k].voters[r].vote=vote;
                                break;
                              }else{
                              }
                            }
                          }

                        break;
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
  }

  Future setDecisionsForUbPoints(MeetingDetailsResponseModelDecisions leave,String vote,List<MeetingDetailsResponseModelDecisions> actionsList) async{
    // int index=0;
    if(widget.meetingDetailsResponseModel!=null){
      if(widget.meetingDetailsResponseModel.agendas!=null){
        if(widget.meetingDetailsResponseModel.agendas.isNotEmpty){
          for(int i=0;i<widget.meetingDetailsResponseModel.agendas.length;i++ ){
            if(widget.meetingDetailsResponseModel.agendas[i].agendaType!=null){
              if(widget.meetingDetailsResponseModel.agendas[i].agendaType=="talking_point"){
                for(int m=0;m<widget.meetingDetailsResponseModel.agendas[i].data.length;m++ ) {
                  print("data>>>"+widget.meetingDetailsResponseModel.agendas[i].data.toString());
                  if(widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints!=null){
                    for(int h=0;h<widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints.length;h++){
                      if(widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].decision!=null){
                        for(int k=0;k<widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].decision.length;k++){
                          if(widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].decision[k].id==leave.id){
                            // widget.meetingDetailsResponseModel.agendas[i].data[m].action[k]=leave;
                            if(widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].decision[k].voters!=null&&widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].decision[k].voters.isNotEmpty)
                              for(int r= 0; r <widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].decision[k].voters.length; r++){
                                if(userId!=null){
                                  if(userId==widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].decision[k].voters[r].userId){
                                    widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].decision[k].voters[r].vote=vote;
                                    break;
                                  }else{
                                  }
                                }else{
                                  // checkMail
                                  if(email==widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].decision[k].voters[r].userEmail){
                                    widget.meetingDetailsResponseModel.agendas[i].data[m].subpoints[h].decision[k].voters[r].vote=vote;
                                    break;
                                  }else{
                                  }
                                }
                              }

                            break;
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
      }
    }
  }

  void addOfflineVoteForDecision(int kind,String vote ,String reason,MeetingDetailsResponseModelDecisions leave,List<MeetingDetailsResponseModelDecisions>list){
    addOrUpdateVoteForDecision(vote,reason).then((value) {
     setState(() {
       if(leave.voters!=null&&leave.voters.isNotEmpty){
         for(int i=0;i<leave.voters.length;i++){
           if(userId==leave.voters[i].userId){
             leave.voters[i].vote=vote;
             break;
           }else{
           }
         }
       }
     });
      Navigator.pop(context);
      if(kind==0){
        setDecisions(leave,vote,list).then((value) {
          String dataString= json.encode(widget.meetingDetailsResponseModel.toJson());
          addOrUpdateOfflineMeetingDetails(dataString);
        });
      }else{
        setDecisionsForUbPoints(leave,vote,list).then((value) {
          String dataString= json.encode(widget.meetingDetailsResponseModel.toJson());
          addOrUpdateOfflineMeetingDetails(dataString);
        });
      }

    });
  }

  Future<bool> addOrUpdateVoteForDecision(String vote,String reason) async {
    var orgainzationsFuture = dbHelper.getMeetingDecision(baseUrl+"decisions/"+widget.meetingId.toString()+Constants.CHANGE_VOTE);
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        DecisionTableOffline localModel =data[i];
        if(localModel.url == baseUrl+"decisions/"+widget.meetingId.toString()+Constants.CHANGE_VOTE) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      if(m){
        print("Updatettt>>"+m.toString());
        var result = await dbHelper.updateMeetingDecision(baseUrl+"decisions/"+widget.meetingId.toString()+Constants.CHANGE_VOTE,vote,reason);
      }else{
        print("Insertttt>>"+m.toString());
        var result = await dbHelper.insertRequestsData(DecisionTableOffline(
            url: baseUrl+"decisions/"+widget.meetingId.toString()+Constants.CHANGE_VOTE,
            changeDecisionVote: vote,
            changeDecisionReason: reason
        ));
      }
    });
  }

  // _________________________________________________________


  Future<bool> prepareData()async{
    setState(() {
      if(widget.talkingPointList!=null&&widget.talkingPointList.isNotEmpty){
        for(int i=0;i<widget.talkingPointList.length;i++){
          if(widget.talkingPointList[i]!=null){
            if(widget.talkingPointList[i].decision!=null){
              for(int z=0;z<widget.talkingPointList[i].decision.length;z++){

                if(widget.talkingPointList[i].decision[z].voters!=null){
                  if(widget.talkingPointList[i].decision[z].voters.isNotEmpty){

                    for(int g=0;g<widget.talkingPointList[i].decision[z].voters.length;g++){
                      if(widget.talkingPointList[i].decision[z].voters[g].userId!=null) {
                        if (userId == widget.talkingPointList[i].decision[z].voters[g].userId) {
                          widget.talkingPointList[i].decision[z].status
                          = widget.talkingPointList[i].decision[z].voters[g].vote;
                          break;
                        }
                      }else{
                        if(widget.talkingPointList[i].decision[z].voters[g].userEmail!=null){
                          if (email == widget.talkingPointList[i].decision[z].voters[g].userEmail) {
                            widget.talkingPointList[i].decision[z].status
                            = widget.talkingPointList[i].decision[z].voters[g].vote;
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

          }

          if(widget.talkingPointList[i].subpoints!=null){
            for(int z=0;z<widget.talkingPointList[i].subpoints.length;z++){

              if( widget.talkingPointList[i].subpoints[z].decision!=null){
                for (int k = 0; k < widget.talkingPointList[i].subpoints[z].decision.length; k++) {
                  DateTime now =DateTime.now();
                  DateTime date = stringToDateTimeNew(widget.talkingPointList[i].subpoints[z].decision[k].deadline);

                  if(date.isBefore(now)){
                  }else{
                    for(int m = 0; m <widget.talkingPointList[i].subpoints[z].decision[k].voters.length; m++){
                      if(userId!=null){
                        if(userId==widget.talkingPointList[i].subpoints[z].decision[k].voters[m].userId){
                          widget.talkingPointList[i].subpoints[z].decision[k].status
                          =widget.talkingPointList[i].subpoints[z].decision[k].voters[m].vote;
                          break;
                        }else{

                        }
                      }else{
                        // checkMail
                        if(email==widget.talkingPointList[i].subpoints[z].decision[k].voters[m].userEmail){
                          widget.talkingPointList[i].subpoints[z].decision[k].status
                          =widget.talkingPointList[i].subpoints[z].decision[k].voters[m].vote;

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
    });
    return true;
  }

  @override
  void initState() {
    SharedPreferencesHelper.getLoggedToken().then((value) {
      userToken=value;
      getUser().then((value) async {
        userId=value.id;
        email=value.email;
      }).then((value) {
          String baseUri= Constants.BASE_URL;
          setState(() {
            baseUrl=baseUri;
            Future.delayed(Duration.zero,() {
              votesList=[AppLocalizations.of(context).lblApproved,AppLocalizations.of(context).lblPendingS,
                AppLocalizations.of(context).lblRejected,AppLocalizations.of(context).lblAbstained];

              actionVotesList=[AppLocalizations.of(context).lblInProgress,AppLocalizations.of(context).lblComplete,
                AppLocalizations.of(context).lblNotComplete];

            });
          });
      });

      // getMeetingDetails(value);
    });

  }


  @override
  Widget build(BuildContext context) {
    return  makeBodyTaikingPointsForMeetingDetails(widget.userId,widget.meetingId,context, widget.talkingPointList);
  }
}

