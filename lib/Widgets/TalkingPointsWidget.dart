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

import '../View/TalkingPointsScreen.dart';
import 'MeetingDetailsWidgets.dart';

class TalkingPointsWidget extends StatefulWidget {

  // List<MeetingDetailsResponseModelDecisions> desisionssList;
  List<AgendasData> desisionssList;
  int  userId;
  int  meetingId;
  // int  index;

  TalkingPointsWidget(this.userId,this.desisionssList,this.meetingId);

  @override
  DescisionsWidgetScreenState createState() => DescisionsWidgetScreenState();
}

class DescisionsWidgetScreenState extends State<TalkingPointsWidget> {
  String userToken='';
  int userId=0;
  MeetingRepository meetingRepository;
  String status;
  // List<String> votesList =["Approved","Pending","Rejected","Abstained"];
  List<String> votesList=[] ;
  String votesValue;
  var voteControler= TextEditingController();
  Color colorStatus=Colors.green;

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
    Future<ChangeVoteResponseModel> allList = meetingRepository.changeVote(token,decisionId,new ChangeVoteRequestModel(reason: reason,vote: vote));
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
            navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
  }

  void openBottomSheetChangeVote(String date, int decisionId,BuildContext _context){
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
                                              padding: EdgeInsets.only(top: 10,bottom: 3),
                                              height:50,
                                              width: 180,
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
                                                changeVote(decisionId,userToken,votesValue2, voteControler.text != null ? voteControler.text : "",
                                                );
                                              }else{
                                                if(votesValue2=="Approved"){
                                                  changeVote(decisionId,userToken,votesValue2, voteControler.text != null ? voteControler.text : "",
                                                  );
                                                }else{
                                                  showErrorWithMsg("Please Enter Reason");
                                                }
                                              }
                                            }else{
                                              showErrorWithMsg("Please Choose Vote");
                                            }
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 10,bottom: 3),
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

  Widget decisionsForMeetingDetailsForTalkingPoint(int userId,BuildContext context,int meetingId,int index, String stauss,List<MeetingDetailsResponseModelDecisions> desisionssList) {

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




    return desisionssList!=null&&desisionssList.isNotEmpty?
    SizedBox(
      // height: 60,
      // width: 200,
        child:ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: desisionssList.length,
          itemBuilder: (context, index) {
            MeetingDetailsResponseModelDecisions leave=desisionssList[index];
            String status;
            int num=0;
            if(leave.voters!=null&&leave.voters.isNotEmpty){
              if(leave.voters.length>4){
                num=leave.voters.length-3;
              }
            }
            print("userId>>>"+userId.toString());
            if(leave.voters!=null&&leave.voters.isNotEmpty){
              for(int i=0;i<leave.voters.length;i++){
                if(userId==leave.voters[i].userId){
                  status=leave.voters[i].vote;
                  break;
                }else{
                }
              }
            }
            // if(status==null){
            //   status=leave.voters[0].vote;
            // }
            Color colorStatus=Colors.green;
            if (status == "Approved") {
              status=AppLocalizations.of(context).lblApproved;
              colorStatus = Colors.green;
            } else if (status == "Abstained") {
              status=AppLocalizations.of(context).lblAbstained;
              colorStatus = Color(0xff0C64F9);
            } else if (status == "Denied" || status == "Rejected") {
              status=AppLocalizations.of(context).lblRejected;
              colorStatus = Color(0xffFF6A81);
            } else if (status == "Pending") {
              status=AppLocalizations.of(context).lblPendingS;
              colorStatus = Color(0xffFEC20E);
            }

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

            return InkWell(
              onTap: () async {
                // Navigator.pop(context);
                // String  test = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DecisionsScreen(leave.meetingId,leave.id,leave.stauss)));
                String  test = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DecisionsScreen(meetingId,leave.id,"Approved")));
                if(test!=null){
                  // setState(() {
                  //   status=test;
                  //   // leave.setStauss=test;
                  //   // leave.stauss=test;
                  //   print("testIs>>"+test.toString());
                  // });
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
                            return leaveRowForAttachments(leave.meetingId,leave.attachments[index],index,context);
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

                    status!=null?
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

                                  child: Text(status!=null?status:"",style: TextStyle(
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
                            openBottomSheetChangeVote("date", leave.id,context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 60,right: 60,top: 24,bottom: 20),
                            decoration: BoxDecoration(
                                color: Color(0xffe8eaed),
                                border: Border.all(
                                  color: Color(0xffe8eaed),
                                ),
                                borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                            ),
                            child: Text(AppLocalizations.of(context).lblChange,style: grayTextColorStyleBlack(22),),
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
                        return leaveRowForAttachments(leave.meetingId,leave.attachments[index],index,context);
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
                        return leaveRowForSubPoints(leave.meetingId,leave.subpoints[index],parentIndex,index,context);
                      },
                    )
                ):Container()

              ],
            ),
          ),

          leave.decisions!=null&&leave.decisions.isNotEmpty?
//            لانتلا
          // decisionsForMeetingDetailsForTalkingPoint(context,leave.meetingId, parentIndex+1, "stauss", leave.decisions[0]):
          decisionsForMeetingDetailsForTalkingPoint(userId,context,leave.meetingId, parentIndex+1, "stauss", leave.decisions):
          Container()
        ],
      ),
    );
  }

  Widget makeBodyTaikingPointsForMeetingDetails(int userId,int id, BuildContext context,List<AgendasData> desisionssList){
    return desisionssList!=null&&desisionssList.isNotEmpty?
    SizedBox(
      // height: 60,
      // width: 200,
        child:ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: desisionssList.length,
          itemBuilder: (context, index) {
            return taikingPointsForMeetingDetails(userId,id,context,desisionssList[index],index);
          },
        )
    ):Container();
  }


  @override
  void initState() {
    Future.delayed(Duration.zero,() {
      votesList=[AppLocalizations.of(context).lblApproved,AppLocalizations.of(context).lblPendingS,
        AppLocalizations.of(context).lblRejected,AppLocalizations.of(context).lblAbstained];
    });
    SharedPreferencesHelper.getLoggedToken().then((value) {
      userToken=value;
      getUser().then((value) {
        userId=value.id;
      });
      // getMeetingDetails(value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return  makeBodyTaikingPointsForMeetingDetails(widget.userId,widget.meetingId,context, widget.desisionssList);
  }
}
