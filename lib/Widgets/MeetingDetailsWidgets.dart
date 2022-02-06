import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/ActionsScreen.dart';
import 'package:itimaaty/Models/UsersAndComments.dart';
import 'package:itimaaty/Models/actions_response_model.dart';
import 'package:itimaaty/Models/decison_response_model.dart';
import 'package:itimaaty/Models/metting_details_response_model.dart';
import 'package:itimaaty/Models/talking_points_response_model.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/DecisionsScreen.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/MeetingDetailsScreen.dart';
import 'package:itimaaty/View/TalkingPointsScreen.dart';
import 'package:url_launcher/url_launcher.dart';

Widget leaveRowForMembers(MeetingDetailsResponseModelMembers leave,int index) {
  return
  //   CachedNetworkImage(
  //   imageUrl: leave.user!=null?!leave.user.image.contains(".html")?leave.user.image:
  //   "https://previews.123rf.com/images/pe3check/pe3check1710/pe3check171000054/88673746-no-image-available-sign-internet-web-icon-to-indicate-the-absence-of-image-until-it-will-be-download.jpg":
  //   "https://previews.123rf.com/images/pe3check/pe3check1710/pe3check171000054/88673746-no-image-available-sign-internet-web-icon-to-indicate-the-absence-of-image-until-it-will-be-download.jpg",
  //   imageBuilder: (context, imageProvider) => Container(
  //     margin: EdgeInsets.only(left: 4,right: 4),
  //     width: 40.0,
  //     height: 40.0,
  //     decoration: BoxDecoration(
  //       shape: BoxShape.circle,
  //       image: DecorationImage(
  //         image: imageProvider,
  //         fit: BoxFit.scaleDown,
  //       ),
  //     ),
  //   ),
  //   // fit: BoxFit,
  //   // placeholder: (context, url) {
  //   //
  //   // },
  //   errorWidget: (context, url, error) =>
  //       Icon(Icons.person, color:Colors.grey),
  // );

  ClipOval(
      child:
      CircleAvatar(
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
      )
  );
}

Widget leaveRowForMeetingDetails(BuildContext context,MeetingDetailsResponseModel leave,int index) {
  return InkWell(
    onTap: () {
      // navigateTo(context, MeetingDetailsScreen(leave.id));
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
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(leave.title!=null?leave.title:"",
            style: blueColorBoldStyle(20),),
          const SizedBox(height: 18,),
          Text(leave.description!=null?leave.description:
          " ",style: blueColorStyleMedium(18),),

          const SizedBox(height: 16,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ic_date.png",width: 26,height: 26),
              const SizedBox(width: 14,),
              Container( margin: EdgeInsets.only(top: 4),
                  child: Text((leave.startDate!=null?leave.startDate:"")+" - "+leave.duration.toString()+" MIN",style: grayTextColorStyleMedium(18),)),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Image.asset("assets/images/ic_place.png",width: 26,height: 26),),
              const SizedBox(width: 8,),
              Flexible(child: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(leave.location!=null?leave.location:AppLocalizations.of(context).lblHeadOffice,
                    style: grayTextColorStyleMedium(18),)),),

              const SizedBox(width: 14,),
              Flexible(child: Image.asset("assets/images/ic_video.png",width: 26,height: 26),),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ic_committee.png",width: 26,height: 26),
              // Icon(Icons.family_restroom,size: 23,color: Colors.grey,),
              const SizedBox(width: 8,),
              Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(leave.committee!=null?
                  leave.committee.name!=null?leave.committee.name:"":"",style:
                  grayTextColorStyleMedium(18),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 60,
                    // width: 200,
                    child:leave.members!=null? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: leave.members.length>=3?3:leave.members.length,
                      itemBuilder: (context, index) {
                        return leaveRowForMembers(leave.members[index],index);
                      },
                    ):Container(),
                  ),
                  leave.members!=null?leave.members.length>2? Container(
                    margin: EdgeInsets.only(left: 4,right: 4),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: yellowColor),
                      shape: BoxShape.circle,
                      // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: yellowColor,
                    ),
                    child:Align(
                      alignment: Alignment.center,
                      child: Text("+4",style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'regular'
                      ),),
                    ),
                  ):const SizedBox():Container()
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.9],
                    colors: [
                      Color(int.parse(("0xff"+(leave.status!=null?leave.status.bgcolor:"ffffff").replaceAll("#", '')))),
                      Color(int.parse(("0xff"+(leave.status!=null?leave.status.bgcolor.replaceAll("#", ''):"ffffff")))),
                    ],
                  ),
                ),
                child: Text(
                  leave.status!=null?leave.status.name:"",
                  style: TextStyle(
                    color: Color(int.parse(("0xff"+(leave.status!=null?leave.status.color.replaceAll("#", ''):"ffffff")))) ,
                    fontFamily: "black",
                    fontSize: 18,
                    // fontWeight: FontWeight.bold
                  ),
                ),
              ),

            ],
          ),
          // const SizedBox(height: 4,),
        ],
      ),
    ),
  );
}

Widget decisionsForMeetingDetailsForTalkingPoint(BuildContext context,int meetingId,int index, String stauss,MeetingDetailsResponseModelDecisions leave) {
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
  Color colorStatus=Colors.green;
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
                    child: Center(child: Text(index.toString()+".1", style: yellowColorStyleBold(22),)),
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

// Widget taikingPointsForMeetingDetails(BuildContext context,MeetingDetailsResponseModelTalkingpoints leave,int parentIndex) {
Widget taikingPointsForMeetingDetails(int id,BuildContext context,AgendasData leave,int parentIndex) {
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
                            Image.asset("assets/images/ic_talkingpoint.png",width: 24,height: 24,color: Colors.black,),
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
                      child: Image.asset("assets/images/ic_drag.png",width: 30,height: 30)),
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
                      return leaveRowForSubPoints(leave.subpoints[index],parentIndex,index,context);
                    },
                  )
              ):Container()

            ],
          ),
        ),

        leave.decisions!=null&&leave.decisions.isNotEmpty?
        decisionsForMeetingDetailsForTalkingPoint(context,leave.meetingId, parentIndex+1, "stauss", leave.decisions[0]):
            Container()
      ],
    ),
  );
}

// Widget makeBodyTaikingPointsForMeetingDetails(BuildContext context,List<MeetingDetailsResponseModelTalkingpoints> desisionssList){
Widget makeBodyTaikingPointsForMeetingDetails(int id, BuildContext context,List<AgendasData> desisionssList){
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
          return taikingPointsForMeetingDetails(id,context,desisionssList[index],index);
        },
      )
  ):Container();
}

Widget leaveRowForAttachments(MeetingDetailsResponseModelMembersAttachments leave,int index,BuildContext context) {
  String url;
  // print("fileUrl>>"+leave.);
  String icon="assets/images/ic_word.png";
  if(leave.library!=null&&leave.library.name!=null) {
    print("fileUrl>>"+"http://test.app.ijtimaati.com/doc-view?doc="+leave.library.fileUrl.toString()+"&id="+leave.libraryId.toString()+'&e=1');
     url="http://test.app.ijtimaati.com/doc-view?doc="+leave.library.fileUrl.toString()+"&id="+leave.libraryId.toString();
    if (leave.library.name.contains('pdf')) {
      icon = "assets/images/ic_pdf.png";
    } else if (leave.library.name.contains('docx')) {
      icon = "assets/images/ic_word.png";
    } else if (leave.library.name.contains('pot')) {
      icon = "assets/images/ic_power_point.png";
    } else {
      icon = "assets/images/ic_folder.png";
    }
  }
  return leave.library!=null?InkWell(
    onTap: () {
      print("UrlL>"+url.toString());
      print("UrlL>"+leave.library.fileUrl.toString());
      // launch(url);
      // showDocument(leave.library.fileUrl.toString(),context);

    },
    child: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
      // width: 340,
        padding: EdgeInsets.only(top: 16,bottom: 8,left: 20,right: 40),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(14.0),
            border: Border.all(
                color: grayRoundedColor,// set border color
                width: 2.0
            )
        ),child: Row(
      children: [
        Image.asset(icon,width: 26,height: 26),
        const SizedBox(width: 14,),
        Container(
            margin: EdgeInsets.only(top: 6),
            child: Text(leave.library!=null?leave.library.name: " ",style: blueColorStyleMedium(18),))
      ],
    ),
    ),
  ):const SizedBox();
}



// _____________________________________________________________________________


Widget leaveRowForSubPoints(MeetingDetailsResponseModelSubpoints leave,int parentIndex,int index,BuildContext context) {
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
        child: Text(leave.duration!=null?(leave.duration.toString()+" "+AppLocalizations.of(context).lblMin):"0 Min",style: grayTextColorStyleMedium(20),),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                  margin: EdgeInsets.only(top: 10),
                  child: Text(leave.title!=null?leave.title:"",style: blueColorStyleMedium(22),))
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
      Text(leave.description!=null?leave.description:"",style: blueColorStyleregular(20),)
    ],
  ),
  );
}


/////////////////////////////////////////////////////////////////////////////








/////////////////////////////////////////////////////////////////////////////


Widget makeBodyForMeetingDetailsActivitiy(BuildContext context,
    List<MeetingDetailsResponseModelActivities> activityList,int lenght){
  return activityList!=null&&activityList.isNotEmpty?
  SizedBox(
    // height: 60,
    // width: 200,
      child:ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: lenght,
        itemBuilder: (context, index) {
          return activityForMeetingDetails(context,activityList[index],index);
        },
      )
  ):Container();
}


Widget activityForMeetingDetails(BuildContext context,MeetingDetailsResponseModelActivities leave,int index) {
  // print("activ>>"+leave.activity.split(" ").toString());
  // leave.activity.split(" ")
  // print("activ>>"+leave.activity.split(" ")[leave.activity.split(" ").length-1].isEmpty.toString());
  // print("activvv>>"+leave.activity.split(" ")[0][0].toUpperCase());
  // print("activvvmmm>>"+leave.activity.split(" ").length.toString());
  return Container(
    margin: EdgeInsets.only(top: 20,left: 16,right: 16),
    // padding: EdgeInsets.all(16),
    // decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: new BorderRadius.circular(14.0),
    //     border: Border.all(
    //         color: grayRoundedColor,// set border color
    //         width: 2.0
    //     )
    // ),
    child:Row(
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
          child: Center(child: Text(leave.activity!=null&&leave.activity.isNotEmpty?
          leave.activity.split(" ")[0][0].toUpperCase()+
              leave.activity.split(" ")[leave.activity.split(" ")[leave.activity.split(" ").length-1].isEmpty?
              leave.activity.split(" ").length-2:leave.activity.split(" ").length-1][0].toUpperCase():"",
            style: yellowColorStyleBold(20),)),
        ),
        const SizedBox(width: 6,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(leave.activity!=null?leave.activity:"", style: blueColorStyleMedium(20),),
              const SizedBox(height: 4,),
              Text("31 Oct at 10:31 PM", style: blueColorStyleregular(18),)
            ],
          ),
        ),
      ],
    )
  );
}



Widget leaveRowForTalikingPoints(BuildContext context,TalkingPointsResponseModel leave,int index) {
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
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(leave.title!=null?leave.title:AppLocalizations.of(context).lblBoardMeeting,
          style: blueColorBoldStyle(20),),
        const SizedBox(height: 18,),

        Text(leave.description!=null?leave.description:
        " description",style: blueColorStyleMedium(18),),

        const SizedBox(height: 12,),
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

        const SizedBox(height: 12,),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Flexible(child: Image.asset("assets/images/ic_place.png",width: 26,height: 26),),
        //     const SizedBox(width: 8,),
        //     Flexible(child: Container(
        //         margin: EdgeInsets.only(top: 4),
        //         child: Text(leave.location!=null?leave.location:AppLocalizations.of(context).lblHeadOffice,
        //           style: grayTextColorStyleMedium(18),)),),
        //
        //     const SizedBox(width: 14,),
        //     Flexible(child: Image.asset("assets/images/ic_video.png",width: 26,height: 26),),
        //   ],
        // ),
        // const SizedBox(height: 12,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ic_committee.png",width: 26,height: 26),
            // Icon(Icons.family_restroom,size: 23,color: Colors.grey,),
            const SizedBox(width: 8,),
            Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(leave.title!=null?
                leave.title:AppLocalizations.of(context).lblDevelopment,style:
                grayTextColorStyleMedium(18),)),
          ],
        ),
        // const SizedBox(height: 4,),
      ],
    ),
  );
}


Widget leaveRowForDecision(BuildContext context,DecisonResponseModel leave,int index) {
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
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(leave.title!=null?leave.title:AppLocalizations.of(context).lblBoardMeeting,
          style: blueColorBoldStyle(20),),
        const SizedBox(height: 18,),

        Text(leave.description!=null?leave.description:AppLocalizations.of(context).lblDescription,style: blueColorStyleMedium(18),),

        const SizedBox(height: 16,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ic_date.png",width: 26,height: 26),
            const SizedBox(width: 14,),
            Container( margin: EdgeInsets.only(top: 4),
                child: Text((leave.deadline!=null?leave.deadline:"")+" - "+leave.deadline.toString()+" MIN",style: grayTextColorStyleMedium(18),)),
          ],
        ),
        const SizedBox(height: 12,),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Flexible(child: Image.asset("assets/images/ic_place.png",width: 26,height: 26),),
        //     const SizedBox(width: 8,),
        //     Flexible(child: Container(
        //         margin: EdgeInsets.only(top: 4),
        //         child: Text(leave.location!=null?leave.location:AppLocalizations.of(context).lblHeadOffice,
        //           style: grayTextColorStyleMedium(18),)),),
        //
        //     const SizedBox(width: 14,),
        //     Flexible(child: Image.asset("assets/images/ic_video.png",width: 26,height: 26),),
        //   ],
        // ),
        // const SizedBox(height: 12,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ic_committee.png",width: 26,height: 26),
            // Icon(Icons.family_restroom,size: 23,color: Colors.grey,),
            const SizedBox(width: 8,),
            Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(leave.title!=null?
                leave.title:AppLocalizations.of(context).lblDevelopment,style:
                grayTextColorStyleMedium(18),)),
          ],
        ),
        // const SizedBox(height: 4,),
      ],
    ),
  );
}


Widget leaveRowForActionsDetails(BuildContext context,ActionsResponseModel leave,int index) {
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
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(leave.title!=null?leave.title:AppLocalizations.of(context).lblBoardMeeting,
          style: blueColorBoldStyle(20),),
        const SizedBox(height: 18,),

        Text(leave.description!=null?leave.description:
        " description",style: blueColorStyleMedium(18),),

        const SizedBox(height: 16,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ic_date.png",width: 26,height: 26),
            const SizedBox(width: 14,),
            Container( margin: EdgeInsets.only(top: 4),
                child: Text((leave.openTill!=null?leave.openTill:"")+" - "+leave.openTill.toString()+" MIN",style: grayTextColorStyleMedium(18),)),
          ],
        ),
        const SizedBox(height: 12,),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Flexible(child: Image.asset("assets/images/ic_place.png",width: 26,height: 26),),
        //     const SizedBox(width: 8,),
        //     Flexible(child: Container(
        //         margin: EdgeInsets.only(top: 4),
        //         child: Text(leave.location!=null?leave.location:AppLocalizations.of(context).lblHeadOffice,
        //           style: grayTextColorStyleMedium(18),)),),
        //
        //     const SizedBox(width: 14,),
        //     Flexible(child: Image.asset("assets/images/ic_video.png",width: 26,height: 26),),
        //   ],
        // ),
        // const SizedBox(height: 12,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ic_committee.png",width: 26,height: 26),
            // Icon(Icons.family_restroom,size: 23,color: Colors.grey,),
            const SizedBox(width: 8,),
            Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(leave.title!=null?
                leave.title:AppLocalizations.of(context).lblDevelopment,style:
                grayTextColorStyleMedium(18),)),
          ],
        ),
        // const SizedBox(height: 4,),
      ],
    ),
  );
}

Widget makeBodyForUsersComments(BuildContext context, List<UsersAndComments> activityList,int lenght){
  return activityList!=null&&activityList.isNotEmpty?
  ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: activityList.length,
    itemBuilder: (context, index) {
      return leaveRowForUsersComments(context,activityList[index],index);
    },
  ):Container();
}

Widget leaveRowForUsersComments(BuildContext context,UsersAndComments leave,int index) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child:Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ClipOval(
              child:
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    leave.img!=null?!leave.img.contains(".html")?leave.img:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                  ),
                ),
              )
          ),
          Container(
            margin: EdgeInsets.only(left: 14,right: 14),
            padding: EdgeInsets.only(left: 14,right: 14,top: 20,bottom: 20),
            decoration: BoxDecoration(
                color:Color(0xffF7F7F8),
                borderRadius: new BorderRadius.circular(14.0),
                border: Border.all(
                    color: Color(0xffF7F7F8),// set border color
                    width: 2.0
                )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(leave.name!=null?leave.name:"",style: blueColorBoldStyle(18),),
                    const SizedBox(width: 12,),
                    Container(height: 20,width: 1,color: grayTextColor,),
                    const SizedBox(width: 12,),
                    Text(leave.date!=null?getFormattedDate(stringToDateTime(leave.date)):"",style: blueColorStyleMedium(16),),
                  ],
                ),
                const SizedBox(height: 6,),
                Text(leave.comment!=null?leave.comment:"",style: blueColorStyleMedium(16),),

              ],
            ),
          )
        ],
      ),
    ),
  );
}

// ____________________________________________________________








Widget makeBodyForTalkingPointsComments(BuildContext context, List<TalkingPointsComments> activityList,int lenght){
  return activityList!=null&&activityList.isNotEmpty?
  ListView.builder(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: activityList.length,
    itemBuilder: (context, index) {
      return leaveRowForTalkingPointsComments(context,activityList[index],index);
    },
  ):Container();
}

Widget leaveRowForTalkingPointsComments(BuildContext context,TalkingPointsComments leave,int index) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child:Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ClipOval(
              child:
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                      leave.user_image==null?
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                          leave.user_image
                    // leave.img!=null?!leave.img.contains(".html")?leave.img:
                    // "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                    // "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                  ),
                ),
              )
          ),
          Container(
            margin: EdgeInsets.only(left: 14,right: 14),
            padding: EdgeInsets.only(left: 14,right: 14,top: 20,bottom: 20),
            decoration: BoxDecoration(
                color:Color(0xffF7F7F8),
                borderRadius: new BorderRadius.circular(14.0),
                border: Border.all(
                    color: Color(0xffF7F7F8),// set border color
                    width: 2.0
                )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(leave.user_name!=null?leave.user_name:"",style: blueColorBoldStyle(18),),
                    // Text("",style: blueColorBoldStyle(18),),
                    const SizedBox(width: 12,),
                    Container(height: 20,width: 1,color: grayTextColor,),
                    const SizedBox(width: 12,),
                    Text(leave.createdAt!=null?getFormattedDate(stringToDateTime(leave.createdAt)):"",style: blueColorStyleMedium(16),),
                  ],
                ),
                const SizedBox(height: 6,),
                Text(leave.comment!=null?leave.comment:"",style: blueColorStyleMedium(16),),

              ],
            ),
          )
        ],
      ),
    ),
  );
}



// _______________________________________________________



Widget leaveRowForAttachmentsTalkingPoints(TalkingPointsAttachments leave,int index,BuildContext context) {
  String url;
  // print("fileUrl>>"+leave.);
  String icon="assets/images/ic_word.png";
  if(leave.library!=null&&leave.library.name!=null) {
    // print("fileUrl>>"+"http://test.app.ijtimaati.com/doc-view?doc="+leave.library.fileUrl.toString()+"&id="+leave.libraryId.toString());
    url="http://test.app.ijtimaati.com/doc-view?doc="+leave.library.fileUrl.toString()+"&id="+leave.libraryId.toString();
    if (leave.library.name.contains('pdf')) {
      icon = "assets/images/ic_pdf.png";
    } else if (leave.library.name.contains('docx')) {
      icon = "assets/images/ic_word.png";
    } else if (leave.library.name.contains('pot')) {
      icon = "assets/images/ic_power_point.png";
    } else {
      icon = "assets/images/ic_folder.png";
    }
  }
  return leave.library!=null?InkWell(
    onTap: () {
      showDocument(leave.library.fileUrl.toString(),context);
      // launch(url);
    },
    child: Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      // width: 340,
      padding: EdgeInsets.only(top: 16,bottom: 8,left: 20,right: 40),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(14.0),
          border: Border.all(
              color: grayRoundedColor,// set border color
              width: 2.0
          )
      ),child: Row(
      children: [
        Image.asset(icon,width: 26,height: 26),
        const SizedBox(width: 14,),
        Container(
            margin: EdgeInsets.only(top: 6),
            child: Text(leave.library!=null?leave.library.name: " ",style: blueColorStyleMedium(18),))
      ],
    ),
    ),
  ):const SizedBox();
}

Widget makeBodyForAttachmentsTalkingPoints(BuildContext context, List<TalkingPointsAttachments> activityList,int lenght){
  return activityList!=null&&activityList.isNotEmpty? SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width/2+100,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: activityList.length,
        itemBuilder: (context, index) {
          return leaveRowForAttachmentsTalkingPoints(activityList[index],index,context);
        },
      )
  ):Container();
}


// ________________________________________________________

Widget makeBodyForAttachmentsDecisions(BuildContext context, List<DecisonResponseModelAttachments> activityList,int lenght){
  return activityList!=null&&activityList.isNotEmpty? SizedBox(
      height: 60,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: activityList.length,
        itemBuilder: (context, index) {
          return leaveRowForAttachmentsDecisions(activityList[index],index,context);
        },
      )
  ):Container();
}
Widget leaveRowForAttachmentsDecisions(DecisonResponseModelAttachments leave,int index,BuildContext context) {
  String url;
  // print("fileUrl>>"+leave.);
  String icon="assets/images/ic_word.png";
  if(leave.library!=null&&leave.library.name!=null) {
    // print("fileUrl>>"+"http://test.app.ijtimaati.com/doc-view?doc="+leave.library.fileUrl.toString()+"&id="+leave.libraryId.toString());
    url="http://test.app.ijtimaati.com/doc-view?doc="+leave.library.fileUrl.toString()+"&id="+leave.libraryId.toString();
    if (leave.library.name.contains('pdf')) {
      icon = "assets/images/ic_pdf.png";
    } else if (leave.library.name.contains('docx')) {
      icon = "assets/images/ic_word.png";
    } else if (leave.library.name.contains('pot')) {
      icon = "assets/images/ic_power_point.png";
    } else {
      icon = "assets/images/ic_folder.png";
    }
  }
  return leave.library!=null?InkWell(
    onTap: () {
      // launch(url);
      showDocument(leave.library.fileUrl.toString(),context);
    },
    child: Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      // width: 340,
      padding: EdgeInsets.only(top: 16,bottom: 8,left: 20,right: 40),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(14.0),
          border: Border.all(
              color: grayRoundedColor,// set border color
              width: 2.0
          )
      ),child: Row(
      children: [
        Image.asset(icon,width: 26,height: 26),
        const SizedBox(width: 14,),
        Container(
            margin: EdgeInsets.only(top: 6),
            child: Text(leave.library!=null?leave.library.name: " ",style: blueColorStyleMedium(18),))
      ],
    ),
    ),
  ):const SizedBox();
}
// _____________________________________________________________________________


Widget leaveRowForSubPointsForTalkingPoint(TalkingPointsSubpoints leave,int parentIndex,int index,BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 12,right: 12,top: 9,bottom: 3),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Color(0xffe8eaed),
                  border: Border.all(
                    color: Color(0xffe8eaed),
                  ),
                  borderRadius: BorderRadius.circular(14) // use instead of BorderRadius.all(Radius.circular(20))
              ),
              child: Text(leave.duration!=null?(leave.duration.toString()+" "+AppLocalizations.of(context).lblMin):"0 Min",style: grayTextColorStyleMedium(20),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                    margin: EdgeInsets.only(top: 10),
                    child: Text(leave.title!=null?leave.title:"",style: blueColorStyleMedium(22),))
              ],
            ),
          ],
        ),
        const SizedBox(height: 4,),
        Text(leave.description!=null?leave.description:"",style: blueColorStyleregular(20),),
        Container(
          margin: EdgeInsets.only(top: 10),
          color: grayTextColor,height: 0.4,),
      ],
    ),
  );
}

Widget makeBodyForSubPointsTalkingPoints(BuildContext context, List<TalkingPointsSubpoints> activityList,int parentIndex){
  return activityList!=null&&activityList.isNotEmpty?
  SizedBox(
    // height: 60,
    // width: 200,
      child:ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: activityList.length,
        itemBuilder: (context, index) {
          return leaveRowForSubPointsForTalkingPoint(activityList[index],parentIndex,index,context);
        },
      )
  ):Container();
}





// ________________________________________________________

Widget makeBodyForAttachmentsActions(BuildContext context, List<ActionsResponseModelAttachments> activityList,int lenght){
  return activityList!=null&&activityList.isNotEmpty? SizedBox(
      height: 60,
      child:ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: activityList.length,
        itemBuilder: (context, index) {
          return leaveRowForAttachmentsActions(activityList[index],index,context);
        },
      )
  ):Container();
}
Widget leaveRowForAttachmentsActions(ActionsResponseModelAttachments leave,int index,BuildContext context) {
  String url;
  // print("fileUrl>>"+leave.);
  String icon="assets/images/ic_word.png";
  if(leave.library!=null&&leave.library.name!=null) {
    // print("fileUrl>>"+"http://test.app.ijtimaati.com/doc-view?doc="+leave.library.fileUrl.toString()+"&id="+leave.libraryId.toString());
    url="http://test.app.ijtimaati.com/doc-view?doc="+leave.library.fileUrl.toString()+"&id="+leave.libraryId.toString();
    if (leave.library.name.contains('pdf')) {
      icon = "assets/images/ic_pdf.png";
    } else if (leave.library.name.contains('docx')) {
      icon = "assets/images/ic_word.png";
    } else if (leave.library.name.contains('pot')) {
      icon = "assets/images/ic_power_point.png";
    } else {
      icon = "assets/images/ic_folder.png";
    }
  }
  return leave.library!=null?InkWell(
    onTap: () {
      // launch(url);
      showDocument(leave.library.fileUrl.toString(),context);
    },
    child: Container(
      margin: EdgeInsets.only(left: 10,right: 10),
      // width: 340,
      padding: EdgeInsets.only(top: 16,bottom: 8,left: 20,right: 40),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(14.0),
          border: Border.all(
              color: grayRoundedColor,// set border color
              width: 2.0
          )
      ),child: Row(
      children: [
        Image.asset(icon,width: 26,height: 26),
        const SizedBox(width: 14,),
        Container(
            margin: EdgeInsets.only(top: 6),
            child: Text(leave.library!=null?leave.library.name: " ",style: blueColorStyleMedium(18),))
      ],
    ),
    ),
  ):const SizedBox();
}
// _____________________________________________________________________________
