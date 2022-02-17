import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/all_meetings_response.dart';
import 'package:itimaaty/Models/calender_response_model.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/MeetingDetailsScreen.dart';
import 'package:itimaaty/View/NotGoingScreen.dart';
import 'package:itimaaty/View/TalkingPointsScreen.dart';

Widget leaveRowForMembers(Members leave,int index) {
  return
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
    );
}

Widget leaveRowForPending(BuildContext context,Pending leave,int index) {
  return InkWell(
    onTap: () {
      navigateTo(context, MeetingDetailsScreen(leave.id));
    },
    child: Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10.0),
          border: Border.all(
              color: grayRoundedColor,// set border color
              width: 1.0
          )
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(leave.title!=null?leave.title:AppLocalizations.of(context).lblBoardMeeting,style: blueColorBoldStyle(16),),
          const SizedBox(height: 16,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ic_date.webp",width: 26,height: 26),
              const SizedBox(width: 14,),
              Container( margin: EdgeInsets.only(top: 4),
                  child: Text(leave.startDate+" - "+leave.duration.toString()+" MIN",style: grayTextColorStyleMedium(17),)),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Image.asset("assets/images/ic_place.webp",width: 26,height: 26),),
              const SizedBox(width: 8,),
              Flexible(child: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(leave.location!=null?leave.location:AppLocalizations.of(context).lblHeadOffice,
                    style: grayTextColorStyleMedium(17),)),),

              const SizedBox(width: 14,),
              Flexible(child: Image.asset("assets/images/ic_video.webp",width: 26,height: 26),),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ic_committee.webp",width: 26,height: 26),
              // Icon(Icons.family_restroom,size: 23,color: Colors.grey,),
              const SizedBox(width: 8,),
              Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(leave.title!=null?
                  leave.title:AppLocalizations.of(context).lblDevelopment,style:
                  grayTextColorStyleMedium(17),)),
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
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: leave.members.length>=3?3:leave.members.length,
                      itemBuilder: (context, index) {
                        return leaveRowForMembers(leave.members[index],index);
                      },
                    ),
                  ),
                  leave.members.length>2? Container(
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
                  ):const SizedBox()
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(14.0),
              //     gradient: LinearGradient(
              //       begin: Alignment.topRight,
              //       end: Alignment.bottomLeft,
              //       stops: [0.1, 0.9],
              //       colors: [
              //         yellowLightColor,
              //         yellowLightColor,
              //       ],
              //     ),
              //   ),
              //   child: FlatButton(
              //     child: Text(
              //       AppLocalizations.of(context).lblLaunch,
              //       style: yellowColorStyleBold(16),
              //     ),
              //     textColor: Colors.white,
              //     color: Colors.transparent,
              //     shape:
              //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              //     onPressed: () {
              //       navigateTo(context, MeetingDetailsScreen(leave.id));
              //       // if (formKey.currentState.validate()) {
              //       //   cubit.userLoginFunc(
              //       //     email: emailController.text,
              //       //     password: passwordController.text,
              //       //   );
              //       // }
              //     },
              //   ),
              // ),
            ],
          ),
          // const SizedBox(height: 4,),
        ],
      ),
    ),
  );
}
Widget makeBodyForPending (BuildContext context,List<Pending> pendingList) {
 return pendingList!=null?ListView.builder(
   shrinkWrap: true,
   physics: const NeverScrollableScrollPhysics(),
   padding: EdgeInsets.zero,
   scrollDirection: Axis.vertical,
   itemCount: pendingList.length,
   itemBuilder: (context, index) {
     return leaveRowForPending(context,pendingList[index], index);
   },
 ):Container();
}

// ________________________________________________

Widget leaveRowForOnGoing(BuildContext context,Ongoing leave,int index) {
  return InkWell(
    onTap: () {
      navigateTo(context, MeetingDetailsScreen(leave.id));
    },
    child: Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10.0),
          border: Border.all(
              color: grayRoundedColor,// set border color
              width: 1.0
          )
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(leave.title!=null?leave.title:AppLocalizations.of(context).lblBoardMeeting,style: blueColorBoldStyle(16),),
          const SizedBox(height: 16,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ic_date.webp",width: 26,height: 26),
              const SizedBox(width: 14,),
              Container( margin: EdgeInsets.only(top: 4),
                  child: Text(leave.startDate+" - "+leave.duration.toString()+" MIN",style: grayTextColorStyleMedium(17),)),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Image.asset("assets/images/ic_place.webp",width: 26,height: 26),),
              const SizedBox(width: 8,),
              Flexible(child: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(leave.location!=null?leave.location:AppLocalizations.of(context).lblHeadOffice,
                    style: grayTextColorStyleMedium(17),)),),

              const SizedBox(width: 14,),
              Flexible(child: Image.asset("assets/images/ic_video.webp",width: 26,height: 26),),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ic_committee.webp",width: 26,height: 26),
              // Icon(Icons.family_restroom,size: 23,color: Colors.grey,),
              const SizedBox(width: 8,),
              Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(leave.title!=null?
                  leave.title:AppLocalizations.of(context).lblDevelopment,style:
                  grayTextColorStyleMedium(17),)),
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: leave.members.length>=3?3:leave.members.length,
                      itemBuilder: (context, index) {
                        return leaveRowForMembers(leave.members[index],index);
                      },
                    ),
                  ),
                  leave.members.length>2? Container(
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
                  ):const SizedBox()
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(14.0),
              //     gradient: LinearGradient(
              //       begin: Alignment.topRight,
              //       end: Alignment.bottomLeft,
              //       stops: [0.1, 0.9],
              //       colors: [
              //         yellowLightColor,
              //         yellowLightColor,
              //       ],
              //     ),
              //   ),
              //   child: FlatButton(
              //     child: Text(
              //       AppLocalizations.of(context).lblLaunch,
              //       style: yellowColorStyleBold(16),
              //     ),
              //     textColor: Colors.white,
              //     color: Colors.transparent,
              //     shape:
              //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              //     onPressed: () {
              //       navigateTo(context, MeetingDetailsScreen(leave.id));
              //       // if (formKey.currentState.validate()) {
              //       //   cubit.userLoginFunc(
              //       //     email: emailController.text,
              //       //     password: passwordController.text,
              //       //   );
              //       // }
              //     },
              //   ),
              // ),
            ],
          ),
          // const SizedBox(height: 4,),
        ],
      ),
    ),
  );
}
Widget makeBodyForOnGoing (BuildContext context,List<Ongoing> pendingList) {
  return pendingList!=null?ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    scrollDirection: Axis.vertical,
    itemCount: pendingList.length,
    itemBuilder: (context, index) {
      return leaveRowForOnGoing(context,pendingList[index], index);
      // return Text("hbjbjbjbj");
    },
  ):Container();
}

// ________________________________________________


Widget leaveRowForDraft(BuildContext context,Draft leave,int index) {
  return InkWell(
    onTap: () {
      navigateTo(context, MeetingDetailsScreen(leave.id));
    },
    child: Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10.0),
          border: Border.all(
              color: grayRoundedColor,// set border color
              width: 1.0
          )
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(leave.title!=null?leave.title:AppLocalizations.of(context).lblBoardMeeting,style: blueColorBoldStyle(16),),
          const SizedBox(height: 16,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ic_date.webp",width: 26,height: 26),
              const SizedBox(width: 14,),
              Container( margin: EdgeInsets.only(top: 4),
                  child: Text(leave.startDate+" - "+leave.duration.toString()+" MIN",style: grayTextColorStyleMedium(17),)),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Image.asset("assets/images/ic_place.webp",width: 26,height: 26),),
              const SizedBox(width: 8,),
              Flexible(child: Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(leave.location!=null?leave.location:AppLocalizations.of(context).lblHeadOffice,
                    style: grayTextColorStyleMedium(17),)),),

              const SizedBox(width: 14,),
              Flexible(child: Image.asset("assets/images/ic_video.webp",width: 26,height: 26),),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/ic_committee.webp",width: 26,height: 26),
              // Icon(Icons.family_restroom,size: 23,color: Colors.grey,),
              const SizedBox(width: 8,),
              Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(leave.title!=null?
                  leave.title:AppLocalizations.of(context).lblDevelopment,style:
                  grayTextColorStyleMedium(17),)),
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
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: leave.members.length>=3?3:leave.members.length,
                      itemBuilder: (context, index) {
                        return leaveRowForMembers(leave.members[index],index);
                      },
                    ),
                  ),
                  leave.members.length>2? Container(
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
                  ):const SizedBox()
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(14.0),
              //     gradient: LinearGradient(
              //       begin: Alignment.topRight,
              //       end: Alignment.bottomLeft,
              //       stops: [0.1, 0.9],
              //       colors: [
              //         yellowLightColor,
              //         yellowLightColor,
              //       ],
              //     ),
              //   ),
              //   child: FlatButton(
              //     child: Text(
              //       AppLocalizations.of(context).lblLaunch,
              //       style: yellowColorStyleBold(16),
              //     ),
              //     textColor: Colors.white,
              //     color: Colors.transparent,
              //     shape:
              //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              //     onPressed: () {
              //       navigateTo(context, MeetingDetailsScreen(leave.id));
              //       // if (formKey.currentState.validate()) {
              //       //   cubit.userLoginFunc(
              //       //     email: emailController.text,
              //       //     password: passwordController.text,
              //       //   );
              //       // }
              //     },
              //   ),
              // ),
            ],
          ),
          // const SizedBox(height: 4,),
        ],
      ),
    ),
  );
}
Widget makeBodyForDraft (BuildContext context,List<Draft> pendingList) {
  return pendingList!=null?ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    scrollDirection: Axis.vertical,
    itemCount: pendingList.length,
    itemBuilder: (context, index) {
      return leaveRowForDraft(context,pendingList[index], index);
      // return Text("hbjbjbjbj");
    },
  ):Container();
}

// ___________________________________________________________


Widget leaveRowForTalkingpoints(BuildContext context,Talkingpoints leave,int index) {
  // print("hhhhhhhhh"+stringToDateTime(leave.meeting.startDate).toString());
  // print("hhhhhhhhhAgain"+getFormattedDate(stringToDateTime(leave.meeting.startDate)).toString());

  return InkWell(
    onTap: () {
      navigateTo(context, MeetingDetailsScreen(leave.meetingId));
      // navigateTo(context, TalkingPointsScreen(leave.meetingId,leave.id));
    },
    child: Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10.0),
          border: Border.all(
              color: grayRoundedColor,// set border color
              width: 1.0
          )
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            // crossAxisAlignment: CrossAxisAlignment.spa,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(leave.title,style: blueColorBoldStyle(16),),
              // const SizedBox(width: 14,),
              SizedBox(
                height: 60,
                // width: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: leave.meeting.members.length>=3?3:leave.meeting.members.length,
                  itemBuilder: (context, index) {
                    return leaveRowForMembers(leave.meeting.members[index],index);
                  },
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 4,right: 4),
              //   height: 30,
              //   width: 30,
              //   child: CircleAvatar(
              //     radius: 30.0,
              //     backgroundImage:
              //     NetworkImage(leave.meeting!=null?
              //     leave.meeting.members[0].user!=null?
              //     leave.meeting.members[0].user.image
              //         :"https://previews.123rf.com/images/pe3check/pe3check1710/pe3check171000054/88673746-no-image-available-sign-internet-web-icon-to-indicate-the-absence-of-image-until-it-will-be-download.jpg"
              //         :"https://previews.123rf.com/images/pe3check/pe3check1710/pe3check171000054/88673746-no-image-available-sign-internet-web-icon-to-indicate-the-absence-of-image-until-it-will-be-download.jpg"),
              //     backgroundColor: Colors.transparent,
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 12,),
          Text(leave.meeting.title,style: grayTextColorStyleMedium(16),),
          const SizedBox(height: 12,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.9],
                    colors: [
                      Color(0xffe5fbf3),
                      Color(0xffe5fbf3)
                      // yellowLightColor,
                      // yellowLightColor,
                    ],
                  ),
                ),
                child: Text(
                  leave.meeting!=null?getFormattedDate(stringToDateTime(leave.meeting.startDate)).toString():"",
                  style: TextStyle(
                    color: Color(0xff98e0c5) ,
                    fontFamily: "black",
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.9],
                    colors: [
                      Color(0xffe5fbf3),
                      Color(0xffe5fbf3)
                      // yellowLightColor,
                      // yellowLightColor,
                    ],
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context).lblLive,
                  style: TextStyle(
                      color: Color(0xff98e0c5) ,
                      fontFamily: "black",
                      fontSize: 16,
                ),
              )
              ),
            ],
          ),
          // const SizedBox(height: 4,),
        ],
      ),
    ),
  );
}
Widget makeBodyForTalkingpoints (BuildContext context,List<Talkingpoints> talkingpointsList) {
  return talkingpointsList!=null?ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    scrollDirection: Axis.vertical,
    itemCount: talkingpointsList.length,
    itemBuilder: (context, index) {
      return leaveRowForTalkingpoints(context,talkingpointsList[index], index);
      // return Text("hbjbjbjbj");
    },
  ):Container();
}


//________________________________________________

Widget leaveRowForDecisions(BuildContext context,Decision leave,int index) {
  // print("hhhhhhhhh"+stringToDateTime(leave.meeting.startDate).toString());
  // print("hhhhhhhhhAgain"+getFormattedDate(stringToDateTime(leave.meeting.startDate)).toString());

  return InkWell(
    onTap: () {
      navigateTo(context, MeetingDetailsScreen(leave.meetingId));
    },
    child: Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10.0),
          border: Border.all(
              color: grayRoundedColor,// set border color
              width: 1.0
          )
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            // crossAxisAlignment: CrossAxisAlignment.spa,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(leave.title,style: blueColorBoldStyle(16),),
              // const SizedBox(width: 14,),
              SizedBox(
                height: 60,
                // width: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: leave.meeting.members.length>=3?3:leave.meeting.members.length,
                  itemBuilder: (context, index) {
                    return leaveRowForMembers(leave.meeting.members[index],index);
                  },
                ),
              )
              // Container(
              //   margin: EdgeInsets.only(left: 4,right: 4),
              //   height: 30,
              //   width: 30,
              //   child: CircleAvatar(
              //     radius: 30.0,
              //     backgroundImage:
              //     NetworkImage(leave.meeting!=null?
              //     leave.meeting.members[0].user!=null?leave.meeting.members[0].user.image:
              //     "https://previews.123rf.com/images/pe3check/pe3check1710/pe3check171000054/88673746-no-image-available-sign-internet-web-icon-to-indicate-the-absence-of-image-until-it-will-be-download.jpg":
              //     "https://previews.123rf.com/images/pe3check/pe3check1710/pe3check171000054/88673746-no-image-available-sign-internet-web-icon-to-indicate-the-absence-of-image-until-it-will-be-download.jpg"),
              //     backgroundColor: Colors.transparent,
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 12,),
          Text(leave.meeting.title,style: grayTextColorStyleMedium(16),),
          const SizedBox(height: 12,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.9],
                    colors: [
                      Color(0xffe5fbf3),
                      Color(0xffe5fbf3)
                      // yellowLightColor,
                      // yellowLightColor,
                    ],
                  ),
                ),
                child: Text(
                  leave.meeting!=null?getFormattedDate(stringToDateTime(leave.meeting.startDate)).toString():"",
                  style: TextStyle(
                    color: Color(0xff98e0c5) ,
                    fontFamily: "black",
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1, 0.9],
                      colors: [
                        Color(0xffe5fbf3),
                        Color(0xffe5fbf3)
                        // yellowLightColor,
                        // yellowLightColor,
                      ],
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context).lblLive,
                    style: TextStyle(
                      color: Color(0xff98e0c5) ,
                      fontFamily: "black",
                      fontSize: 16,
                    ),
                  )
              ),
            ],
          ),
          // const SizedBox(height: 4,),
        ],
      ),
    ),
  );
}
Widget makeBodyForDecisions (BuildContext context,List<Decision> desisionList) {
  return desisionList!=null?ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    scrollDirection: Axis.vertical,
    itemCount: desisionList.length,
    itemBuilder: (context, index) {
      return leaveRowForDecisions(context,desisionList[index], index);
      // return Text("hbjbjbjbj");
    },
  ):Container();
}


//________________________________________________

Widget leaveRowForActions(BuildContext context,ActionResponse leave,int index) {
  // print("hhhhhhhhh"+stringToDateTime(leave.meeting.startDate).toString());
  // print("hhhhhhhhhAgain"+getFormattedDate(stringToDateTime(leave.meeting.startDate)).toString());

  return InkWell(
    onTap: () {
      navigateTo(context, MeetingDetailsScreen(leave.meetingId));
    },
    child: Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(10.0),
          border: Border.all(
              color: grayRoundedColor,// set border color
              width: 1.0
          )
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            // crossAxisAlignment: CrossAxisAlignment.spa,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(leave.title,style: blueColorBoldStyle(16),),
              // const SizedBox(width: 14,),
              SizedBox(
                height: 60,
                // width: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: leave.meeting.members.length>=3?3:leave.meeting.members.length,
                  itemBuilder: (context, index) {
                    return leaveRowForMembers(leave.meeting.members[index],index);
                  },
                ),
              )
              // Container(
              //   margin: EdgeInsets.only(left: 4,right: 4),
              //   height: 30,
              //   width: 30,
              //   child: CircleAvatar(
              //     radius: 30.0,
              //     backgroundImage:
              //     NetworkImage(leave.meeting!=null?
              //     leave.meeting.members[0].user!=null?leave.meeting.members[0].user.image:
              //     "https://previews.123rf.com/images/pe3check/pe3check1710/pe3check171000054/88673746-no-image-available-sign-internet-web-icon-to-indicate-the-absence-of-image-until-it-will-be-download.jpg":
              //     "https://previews.123rf.com/images/pe3check/pe3check1710/pe3check171000054/88673746-no-image-available-sign-internet-web-icon-to-indicate-the-absence-of-image-until-it-will-be-download.jpg"),
              //     backgroundColor: Colors.transparent,
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 12,),
          Text(leave.meeting.title,style: grayTextColorStyleMedium(16),),
          const SizedBox(height: 12,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.9],
                    colors: [
                      Color(0xffe5fbf3),
                      Color(0xffe5fbf3)
                      // yellowLightColor,
                      // yellowLightColor,
                    ],
                  ),
                ),
                child: Text(
                  leave.meeting!=null?getFormattedDate(stringToDateTime(leave.meeting.startDate)).toString():"",
                  style: TextStyle(
                    color: Color(0xff98e0c5) ,
                    fontFamily: "black",
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.1, 0.9],
                      colors: [
                        Color(0xffe5fbf3),
                        Color(0xffe5fbf3)
                        // yellowLightColor,
                        // yellowLightColor,
                      ],
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context).lblLive,
                    style: TextStyle(
                      color: Color(0xff98e0c5) ,
                      fontFamily: "black",
                      fontSize: 16,
                    ),
                  )
              ),
            ],
          ),
          // const SizedBox(height: 4,),
        ],
      ),
    ),
  );
}
Widget makeBodyForActions (BuildContext context,List<ActionResponse> actionList) {
  return actionList!=null?ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    scrollDirection: Axis.vertical,
    itemCount: actionList.length,
    itemBuilder: (context, index) {
      return leaveRowForActions(context,actionList[index], index);
      // return Text("hbjbjbjbj");
    },
  ):Container();
}

// _____________________________________________


Widget leaveRowForMembersInAllMeetings(MembersInAllMeeting leave,int index) {
  return  Container(
    margin: EdgeInsets.only(left: 1,right: 1),
    child: CircleAvatar(
      radius: 18,
      backgroundColor: Colors.red,
      child: CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(
          leave.user!=null?leave.user.image!=null?!leave.user.image.contains(".html")?leave.user.image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
        ),
      ),
    ),
  );
}
Widget leaveRowForAllmeetings(BuildContext context,AllMeetingsResponse leave,int index) {

  return LayoutBuilder(builder: (context, constraints) {
    if(constraints.maxWidth<600){
      return InkWell(
        onTap: () {
          navigateTo(context, MeetingDetailsScreen(leave.id));
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color:leave.status==null?Colors.green: Color(int.parse(("0xff"+leave.status.color.replaceAll("#", '')))),width: 10)
                    // Border(
                    //   top: BorderSide(color: Colors.green, width: 5),
                    // ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.transparent, width: 5),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text(leave.title!=null?leave.title:AppLocalizations.of(context).lblBoardMeeting,style: blueColorBoldStyle(18),)),
                        ],
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call_to_action_outlined,size: 20,color: Colors.grey,),
                          const SizedBox(width: 14,),
                          Container( margin: EdgeInsets.only(top: 4),
                              child:  Text(leave.startDate+" - "+leave.duration.toString()+" MIN",style: grayTextColorStyleMedium(17),)),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,size: 20,color: Colors.grey,),
                          const SizedBox(width: 8,),
                          Flexible(
                            child: Container(
                                margin: EdgeInsets.only(top: 4),
                                child: Text(leave.location!=null?leave.location:AppLocalizations.of(context).lblHeadOffice,
                                  style: grayTextColorStyleMedium(17),)),
                          ),
                          const SizedBox(width: 14,),
                          Icon(Icons.meeting_room_rounded,size: 14,color: Color(0xff3585fb),),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.family_restroom,size: 20,color: Colors.grey,),
                          const SizedBox(width: 8,),
                          Container(
                              margin: EdgeInsets.only(top: 4),

                              child: Text(leave.committee!=null?
                           leave.committee.name!=null?  leave.committee.name:"":"",style:
                              grayTextColorStyleMedium(17),)),
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
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: leave.members.length>=3?3:leave.members.length,
                                  itemBuilder: (context, index) {
                                    return leaveRowForMembersInAllMeetings(leave.members[index],index);
                                  },
                                ),
                              ),
                              leave.members.length>2? Container(
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
                                  child: Text("+"+(leave.members.length-3).toString(),style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'regular'
                                  ),),
                                ),
                              ):const SizedBox()
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
                                  Color(int.parse(("0xff"+leave.status.bgcolor.replaceAll("#", '')))),
                                  Color(int.parse(("0xff"+leave.status.bgcolor.replaceAll("#", '')))),
                                ],
                              ),
                            ),
                            child: Text(
                              leave.status.name,
                              style: TextStyle(
                                color: Color(int.parse(("0xff"+leave.status.color.replaceAll("#", '')))) ,
                                fontFamily: "black",
                                fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),

                      Container(
                          margin: EdgeInsets.only(top: 14),
                          child: Text(leave.lastActivity!=null?
                          leave.lastActivity:"",style:
                          grayTextColorStyleMedium(17),))
                      // const SizedBox(height: 4,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }else{
      return Container(
        // height: 100,
        margin: EdgeInsets.only(left: 4,right: 4,top: 0,bottom: 0),
        child: Stack(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color:leave.status==null?Colors.green: Color(int.parse(("0xff"+leave.status.color.replaceAll("#", '')))),width: 10)
                    // Border(
                    //   top: BorderSide(color: Colors.green, width: 5),
                    // ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.transparent, width: 5),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child:  Text(leave.title!=null?leave.title:AppLocalizations.of(context).lblBoardMeeting,
                            style: blueColorBoldStyle(20),)),
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
                                builder: (context) => Container(
                                  margin: EdgeInsets.only(left: 16,right: 16),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context).viewInsets.bottom),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap:(){
                                              Navigator.pop(context);
                                            },
                                            child: Align(
                                                alignment:Alignment.center,
                                                child: Container(
                                                  margin: EdgeInsets.only(top: 10,bottom: 14),
                                                  width: 36,height: 4,color: grayTextColor,)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(AppLocalizations.of(context).lblMeeting,
                                              style: blueColorBoldStyle(24),),
                                          ),
                                          const SizedBox(height: 14,),
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
                                                  child: Icon(Icons.edit,size:20 ,color: grayTextColor,),
                                                ),
                                              ),
                                              const SizedBox(width: 14,),
                                              Container(
                                                  margin: EdgeInsets.only(top:10),
                                                  child: Text(AppLocalizations.of(context).lblEditMeeting,style: blueColorBoldStyle(20),))
                                            ],
                                          ),
                                          const SizedBox(height: 14,),
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
                                                  child: Icon(Icons.flag_outlined,size:20 ,color: grayTextColor,),
                                                ),
                                              ),
                                              const SizedBox(width: 14,),
                                              Container(
                                                  margin: EdgeInsets.only(top:10),
                                                  child: Text(AppLocalizations.of(context).lblChangeStatus,style: blueColorBoldStyle(20),))
                                            ],
                                          ),
                                          const SizedBox(height: 14,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },child: Icon(Icons.height,size: 20,),
                          )
                        ],
                      ),),
                      const SizedBox(height: 16,),
                      Expanded(child:Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/ic_date.webp",width: 26,height: 26),
                          const SizedBox(width: 14,),
                          Container( margin: EdgeInsets.only(top: 4),
                              child: Text(leave.startDate+" - "+leave.duration.toString()+" MIN",style: grayTextColorStyleMedium(17),)),
                        ],
                      ) ,),
                      const SizedBox(height: 12,),
                      Expanded(child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: Image.asset("assets/images/ic_place.webp",width: 26,height: 26),),
                          const SizedBox(width: 8,),
                          Flexible(child: Container(
                              margin: EdgeInsets.only(top: 4),
                              child: Text(leave.location!=null?leave.location:AppLocalizations.of(context).lblHeadOffice,
                                style: grayTextColorStyleMedium(17),)),),

                          const SizedBox(width: 14,),
                          Flexible(child: Image.asset("assets/images/ic_video.webp",width: 26,height: 26),),
                        ],
                      ),),
                      const SizedBox(height: 16,),
                      Expanded(child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/ic_committee.webp",width: 26,height: 26),
                          // Icon(Icons.family_restroom,size: 23,color: Colors.grey,),
                          const SizedBox(width: 8,),
                          Container(
                              margin: EdgeInsets.only(top: 4),
                              child: Text(leave.committee!=null?
                              leave.committee.name!=null?  leave.committee.name:"":"",style:
                              grayTextColorStyleMedium(17),)),
                        ],
                      ),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 60,
                                  // width: 200,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: leave.members.length>=3?3:leave.members.length,
                                    itemBuilder: (context, index) {
                                      return leaveRowForMembersInAllMeetings(leave.members[index],index);
                                    },
                                  ),
                                ),
                                leave.members.length>2? Container(
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
                                ):const SizedBox()
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
                                    Color(int.parse(("0xff"+leave.status.bgcolor.replaceAll("#", '')))),
                                    Color(int.parse(("0xff"+leave.status.bgcolor.replaceAll("#", '')))),
                                  ],
                                ),
                              ),
                              child: Text(
                                leave.status.name,
                                style: TextStyle(
                                  color: Color(int.parse(("0xff"+leave.status.color.replaceAll("#", '')))) ,
                                  fontFamily: "black",
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(top: 14),
                            child: Text(leave.lastActivity!=null?
                                leave.lastActivity:"",style:
                            grayTextColorStyleMedium(17),)),
                      )
                      // const SizedBox(height: 4,),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      );
    }
  },);

}

Widget makeBodyForAllmeetings (BuildContext context,List<AllMeetingsResponse> allMeetingList) {
  double cardWidth = MediaQuery.of(context).size.width / 3.3;
  double cardHeight = MediaQuery.of(context).size.height / 3.6;

  print("first>>"+(cardWidth/cardHeight).toString());

  var size = MediaQuery.of(context).size;
  final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
  final double itemWidth = size.width / 2;
  print("first>>"+(itemWidth/itemHeight).toString());

  return allMeetingList!=null?
      LayoutBuilder(builder: (context, constraints) {
        if(constraints.maxWidth<600){
          return  ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: allMeetingList.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.only(top: 20,left: 2,right: 2),
                  child: leaveRowForAllmeetings(context,allMeetingList[index], index));
              // return Text("hbjbjbjbj");
            },
          );
        }else{
          return InkWell(
            onTap: () {
              // navigateTo(context, NotGoingScreen());
            },
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child:
              GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.9,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                  children:  new List<Widget>.generate(allMeetingList.length, (index) {
                    return Container(
                        margin: EdgeInsets.only(left: 4,right: 4,top: 16),
                        child: leaveRowForAllmeetings(context,allMeetingList[index], index));
                  }))

            ),

          );
        }
      },):Container();
}




Widget leaveRowForMembersCalender(MembersCalender leave,int index) {
  return  Container(
    margin: EdgeInsets.only(left: 1,right: 1),
    child: CircleAvatar(
      radius: 18,
      backgroundColor: Colors.red,
      child: CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(
          leave.user!=null?!leave.user.image.contains(".html")?leave.user.image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
        ),
      ),
    ),
  );
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

  return textColor;
}


Widget leaveRowForCalender(BuildContext context,One leave,int index) {

  return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: () {
          navigateTo(context, MeetingDetailsScreen(leave.id));
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(color:leave.attendanceStatus==null?Colors.green: checkColor(leave.attendanceStatus),width: 10)
                    // border:Border(
                    //   top: BorderSide(color: Colors.green, width: 5),
                    // ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.transparent, width: 5),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text(leave.title!=null?leave.title:AppLocalizations.of(context).lblBoardMeeting,style: blueColorBoldStyle(18),)),
                        ],
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call_to_action_outlined,size: 20,color: Colors.grey,),
                          const SizedBox(width: 14,),
                          Container( margin: EdgeInsets.only(top: 4),
                              child:  Text(leave.startDate+" - "+leave.duration.toString()+" MIN",style: grayTextColorStyleMedium(17),)),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on,size: 20,color: Colors.grey,),
                          const SizedBox(width: 8,),
                          Flexible(
                            child: Container(
                                margin: EdgeInsets.only(top: 4),
                                child: Text(leave.location!=null?leave.location:AppLocalizations.of(context).lblHeadOffice,
                                  style: grayTextColorStyleMedium(17),)),
                          ),
                          const SizedBox(width: 14,),
                          Icon(Icons.meeting_room_rounded,size: 14,color: Color(0xff3585fb),),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 60,
                                // width: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: leave.members.length>=3?3:leave.members.length,
                                  itemBuilder: (context, index) {
                                    return leaveRowForMembersCalender(leave.members[index],index);
                                  },
                                ),
                              ),
                              leave.members.length>2? Container(
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
                                  child: Text("+"+(leave.members.length-3).toString(),style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'regular'
                                  ),),
                                ),
                              ):const SizedBox()
                            ],
                          ),
                        ],
                      ),

                      Container(
                          margin: EdgeInsets.only(top: 14),
                          child: Text(leave.lastActivity!=null?
                          leave.lastActivity:"",style:
                          grayTextColorStyleMedium(17),))
                      // const SizedBox(height: 4,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  },);

}

Widget makeBodyForCalender (BuildContext context,List<One> oneList) {

  return oneList!=null?
  LayoutBuilder(builder: (context, constraints) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: oneList.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(top: 20,left: 2,right: 2),
              child: leaveRowForCalender(context,oneList[index], index));
          // return Text("hbjbjbjbj");
        },
      );
  },):Container();
}