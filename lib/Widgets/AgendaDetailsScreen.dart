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
import 'package:itimaaty/View/TalkingPointsScreen.dart';

import 'MeetingDetailsWidgets.dart';

class AgendaDetailsScreen extends StatefulWidget {

  MeetingDetailsResponseModel  meetingDetailsResponseModel;
  AgendaDetailsScreen(this.meetingDetailsResponseModel);

  @override
  AgendaDetailsScreenState createState() => AgendaDetailsScreenState();
}

class AgendaDetailsScreenState extends State<AgendaDetailsScreen> {
  String userToken='';
  int userId=0;
  String status;
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

  Widget talkingPointLeave(String type , int meetingId,int id,int index,List<Agendas> list){

    // if(leave[index].data[0]!=null) {
    //   if(leave[index].data[0].decisions!=null){
    //     return decisionsForMeetingDetailsForTalkingPoint(leave[index].meetingId,leave[index].agendaTypeId,
    //         index,stauss,leave[index].data[0].decisions[0]);
    //   }else{
    //
    //   }
    // }else{
    //
    // }
    if(type=='talking_point') {
      AgendasData leave= list[index].data[0];
      return InkWell(
        onTap: () {
          print("kkkkkk");
          // navigateTo(context, TalkingPointsScreen(leave.meetingId,leave.id));
          // navigateTo(context, TalkingPointsScreen(id,leave.id));
          navigateTo(context, TalkingPointsScreen(meetingId, id));
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
                      color: grayRoundedColor, // set border color
                      width: 2.0
                  )
              ),
              child: Column(
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
                            padding: EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 6),
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
                            child: Center(child: Text(((index + 1).toString()),
                              style: yellowColorStyleBold(22),)),
                          ),
                          const SizedBox(width: 6,),
                          Container(
                            // width: 250,
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 10, bottom: 8),
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
                                Image.asset("assets/images/ic_talkingpoint.png",
                                  width: 24, height: 24, color: Colors.black,),
                                const SizedBox(width: 14,),
                                Container(margin: EdgeInsets.only(top: 4),
                                    // child: Text(AppLocalizations.of(context).lblTalkingPoints,style: grayTextColorStyleMedium(20),)),
                                    child: Text(AppLocalizations
                                        .of(context)
                                        .lblAgenda,
                                      style: grayTextColorStyleMedium(20),)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Image.asset(
                              "assets/images/ic_drag.png", width: 30,
                              height: 30)),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(
                        left: 12, right: 12, top: 8, bottom: 2),
                    decoration: BoxDecoration(
                        color: Color(0xffe8eaed),
                        border: Border.all(
                          color: Color(0xffe8eaed),
                        ),
                        borderRadius: BorderRadius.circular(
                            20) // use instead of BorderRadius.all(Radius.circular(20))
                    ),
                    child: Text(
                      (leave.duration != null ? leave.duration.toString() +
                          " " + AppLocalizations
                          .of(context)
                          .lblMin : ""), style: grayTextColorStyleMedium(20),),
                  ),
                  const SizedBox(height: 20,),
                  Text(leave.title != null ? leave.title : "",
                    style: blueColorBoldStyle(20),),
                  const SizedBox(height: 10,),
                  Text(leave.description != null ? leave.description : "",
                    style: blueColorStyleMedium(18),),

                  const SizedBox(height: 20,),

                  leave.attachments != null && leave.attachments.isNotEmpty
                      ? SizedBox(
                      height: 60,
                      // width: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: leave.attachments.length,
                        itemBuilder: (context, index) {
                          return leaveRowForAttachments(
                              leave.attachments[index], index,context);
                        },
                      )
                  )
                      : Container(),

                  const SizedBox(height: 20,),

                  leave.subpoints != null && leave.subpoints.isNotEmpty ?
                  SizedBox(
                    // height: 60,
                    // width: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: leave.subpoints.length,
                        itemBuilder: (context, index) {
                          return leaveRowForSubPoints(
                              leave.subpoints[index], index, index, context);
                        },
                      )
                  ) : Container()

                ],
              ),
            ),
            decisionsForMeetingDetailsForTalkingPoint(leave.meetingId,
                index, "stauss", leave.decisions[0])
          ],
        ),
      );
    }

    else if(type=='decision'){
      // return Text(type);
      String stauss='';
      for(int m=0;m<list[index].data.length;m++){
        if(list[index].data[m].voters!=null&&list[index].data[m].voters.isNotEmpty){
          for(int i=0;i<list[index].data[m].voters.length;i++){
            if(userId==list[index].data[m].voters[i].userId){
              stauss=list[index].data[m].voters[i].vote;
              list[index].data[m].setStauss=stauss;
              // print("statusIsNUll0>>"+desisionssList[index].stauss);
              break;
            }
          }
        }
      }

      if(list[index].data!=null && list[index].data.isNotEmpty) {
        print('insideHHHHHHHHHHh>>'+index.toString());
        return decisionsForMeetingDetails(list[index].meetingId, list[index].agendaTypeId, index, stauss, list[index].data[0]);

      }else{
        return Container();
      }
    }else if(type=='action'){
      return Text(type);
     }
  }

  Widget decisionsForMeetingDetails(int meetingId,int id,int index, String stauss,AgendasData leave) {
    // print("statusIs111111>>"+leave.stauss);
    if(leave.stauss!=null) {
      if (leave.stauss == "Approved" || leave.stauss == "Approve") {
        colorStatus = Colors.green;
      } else if (leave.stauss == "Abstained") {
        colorStatus = Color(0xff0C64F9);
      } else if (leave.stauss == "Denied" || leave.stauss == "Rejected") {
        colorStatus = Color(0xffFF6A81);
      } else if (leave.stauss == "Pending") {
        colorStatus = Color(0xffFEC20E);
      }
    }

    int num=0;
    if(leave.voters!=null&&leave.voters.isNotEmpty){
      if(leave.voters.length>4){
        num=leave.voters.length-3;
      }
    }


    return InkWell(
      onTap: () async {
        // Navigator.pop(context);
        // String  test = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DecisionsScreen(leave.meetingId,leave.id,leave.stauss)));
        String  test = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DecisionsScreen(meetingId,id,leave.stauss)));
        if(test!=null){
          setState(() {
            status=test;
            leave.setStauss=test;
            // leave.stauss=test;
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
                      child: Center(child: Text((index+1).toString(), style: yellowColorStyleBold(22),)),
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
                          Image.asset("assets/images/ic_decisions.png",width: 24,height: 24,color: Colors.black,),
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
                    child: Image.asset("assets/images/ic_drag.png",width: 30,height: 30)),
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
                    return leaveRowForAttachments(leave.attachments[index],index,context);
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
                    return leaveRowForSubPoints(leave.subpoints[index],index,index,context);
                  },
                )
            ):Container(),
            leave.subpoints!=null&&leave.subpoints.isNotEmpty?  const SizedBox(height: 20,):const SizedBox(height: 0,),

            leave.stauss!=null? Row(
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
                          child: Text(leave.stauss!=null?leave.stauss:"",style: TextStyle(
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
                    // openBottomSheetChangeVote("date", leave.id);
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
            ): const SizedBox(height: 1,),

          ],
        ),
      ),
    );
  }
  Widget decisionsForMeetingDetailsForTalkingPoint(int meetingId,int index, String stauss,MeetingDetailsResponseModelDecisions leave) {
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

    int num=0;
    if(leave.voters!=null&&leave.voters.isNotEmpty){
      if(leave.voters.length>4){
        num=leave.voters.length-3;
      }
    }


    return InkWell(
      onTap: () async {
        // Navigator.pop(context);
        // String  test = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DecisionsScreen(leave.meetingId,leave.id,leave.stauss)));
        String  test = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>DecisionsScreen(meetingId,leave.id,"Approved")));
        if(test!=null){
          setState(() {
            status=test;
            // leave.setStauss=test;
            // leave.stauss=test;
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
                      child: Center(child: Text((index+1).toString(), style: yellowColorStyleBold(22),)),
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
                          Image.asset("assets/images/ic_decisions.png",width: 24,height: 24,color: Colors.black,),
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
                    child: Image.asset("assets/images/ic_drag.png",width: 30,height: 30)),
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
                    return leaveRowForAttachments(leave.attachments[index],index,context);
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

            // leave.stauss!=null? Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Column(
            //       children: [
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Container(
            //               width: 13,
            //               height: 13,
            //               decoration: BoxDecoration(
            //                   shape: BoxShape.circle,
            //                   color: colorStatus),
            //             ),
            //             const SizedBox(width: 10,),
            //             Container(
            //               margin: EdgeInsets.only(top: 4),
            //               child: Text(leave.stauss!=null?leave.stauss:"",style: TextStyle(
            //                 color: colorStatus ,
            //                 fontFamily: "black",
            //                 // fontWeight: FontWeight.bold,
            //                 fontSize: 22,
            //               )),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(height: 4,),
            //         Container(
            //             child: Text(("My Decision"),style: grayTextColorStyleMedium(20),))
            //       ],
            //     ),
            //     InkWell(
            //       onTap: () {
            //         // openBottomSheetChangeVote("date", leave.id);
            //       },
            //       child: Container(
            //         padding: EdgeInsets.only(left: 60,right: 60,top: 24,bottom: 20),
            //         decoration: BoxDecoration(
            //             color: Color(0xffe8eaed),
            //             border: Border.all(
            //               color: Color(0xffe8eaed),
            //             ),
            //             borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
            //         ),
            //         child: Text(AppLocalizations.of(context).lblChange,style: grayTextColorStyleBlack(22),),
            //       ),
            //     )
            //   ],
            // ): const SizedBox(height: 1,),

          ],
        ),
      ),
    );
  }



  Widget makeBody(BuildContext context,List<Agendas> leave){
    return leave!=null&&leave.isNotEmpty?
    SizedBox(
        child:ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.meetingDetailsResponseModel.agendas.length,
          itemBuilder: (context, index) {


            return talkingPointLeave(leave[index].agendaType,leave[index].meetingId, leave[index].agendaTypeId, index,leave);

            // if(leave[index].agendaType.contains('talking_point')){
            //   if(leave[index].data[0]!=null) {
            //   }else{
            //
            //   }
            //
            // }else
            //   if(leave[index].agendaType=='decision'){
            //   print("kkkkkkkkkkkkmkmkmmnn");
            //   // if
            //   String stauss='';
            //   for(int m=0;m<leave[index].data.length;m++){
            //     if(leave[index].data[m].voters!=null&&leave[index].data[m].voters.isNotEmpty){
            //       for(int i=0;i<leave[index].data[m].voters.length;i++){
            //         if(userId==leave[index].data[m].voters[i].userId){
            //           stauss=leave[index].data[m].voters[i].vote;
            //           leave[index].data[m].setStauss=stauss;
            //           // print("statusIsNUll0>>"+desisionssList[index].stauss);
            //           break;
            //         }
            //       }
            //     }
            //   }
            //
            //   if(leave[index].data!=null && leave[index].data.isNotEmpty) {
            //     print('insideHHHHHHHHHHh');
            //     child= Text(leave[index].data[index].decisions[0].title);
            //     return decisionsForMeetingDetails(leave[index].meetingId, leave[index].agendaTypeId, index, stauss, leave[index].data[0]);
            //   }else{
            //     return null;
            //   }
            //
            // }else{
            //     child= Text(leave[index].agendaType);
            // }
            //
            //   return child;
          },
        )
    ):Container();
  }




  @override
  void initState() {
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
    return  makeBody(context, widget.meetingDetailsResponseModel.agendas);
  }
}

