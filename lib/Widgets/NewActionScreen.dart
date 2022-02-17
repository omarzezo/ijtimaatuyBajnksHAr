// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
// import 'package:itimaaty/Localizations/localization/localizations.dart';
// import 'package:itimaaty/Models/ActionsScreen.dart';
// import 'package:itimaaty/Models/ChangeActionStatusRequestModel.dart';
// import 'package:itimaaty/Models/ChangeStatusResponseModel.dart';
// import 'package:itimaaty/Models/LoginResponseModel.dart';
// import 'package:itimaaty/Models/change_vote_request_model.dart';
// import 'package:itimaaty/Models/metting_details_response_model.dart';
// import 'package:itimaaty/Repository/MeetingRepository.dart';
// import 'package:itimaaty/Utils/AppColors.dart';
// import 'package:itimaaty/Utils/CommonMethods.dart';
// import 'package:itimaaty/View/DecisionsScreen.dart';
// import 'package:itimaaty/View/FontsStyle.dart';
// import 'package:itimaaty/View/MeetingDetailsScreen.dart';
// import 'package:itimaaty/View/SignInScreen.dart';
// import 'package:itimaaty/Models/change_vote_response_model.dart';
// import 'package:intl/intl.dart';
//
// import 'MeetingDetailsWidgets.dart';
//
//
// class NewActionScreen extends StatefulWidget {
//
//   // List<MeetingDetailsResponseModelActions> actionsList;
//   List<AgendasData> actionsList;
//   int  meetingId;
//   NewActionScreen(this.actionsList,this.meetingId);
//
//   @override
//   NewActionScreenState createState() => NewActionScreenState();
// }
//
// class NewActionScreenState extends State<NewActionScreen> {
//   int userId=0;
//   String userToken='';
//   MeetingRepository meetingRepository;
//   String status='';
//   List<String> votesList =["In Progress","Complete","Not Complete"];
//   String votesValue;
//   var voteControler= TextEditingController();
//
//   Color colorStatus=Colors.green;
//   String getStatus(){
//     if(status=="Complete")  {
//       status="Complete";
//       colorStatus=Colors.green;
//     }else if(status=="Not Complete")  {
//       status="Not Complete";
//       colorStatus=Color(0xffFF6A81);
//     }else if(status=="In Progress")  {
//       status="In Progress";
//       colorStatus=Color(0xffFEC20E);
//     }
//     return status;
//   }
//
//   String getFormattedDateNew(DateTime day) {
//     // print("")
//     String formattedDate1 = DateFormat('yyyy-MM-dd kk:mm a','en').format(day);
//     // String formattedDate1 = DateFormat('yyyy-MM-ddTkk:mm').format(day);
//     // print("")
//     String formattedDate =
//         getDoubleDigit(day.day.toString()) + " " +
//             getDoubleDigit(monthNames[day.month-1]) + " " +
//             getDoubleDigit(day.year.toString())+" "+formattedDate1;
//
//     return formattedDate1;
//   }
//   DateTime stringToDateTimeNew(String dateString){
//     DateTime dateTime = DateTime.parse(dateString);
//     return dateTime;
//   }
//   void openBottomSheetChangeProgress(String date,int decisionId){
//     showModalBottomSheet(
//         isScrollControlled: true,
//         isDismissible: false,
//         context: context,
//         backgroundColor: Colors.transparent,
//         builder: (BuildContext bc) {
//           return StatefulBuilder( builder: (BuildContext context, StateSetter setStateee /*You can rename this!*/) {
//             return Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               color: Colors.transparent,
//               child: Padding(
//                 padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*(2/3)),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height,
//                   color: Colors.white,
//                   width: MediaQuery.of(context).size.width - 200,
//                   child:
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(height:40 ,),
//                       Container(
//                         margin:EdgeInsets.only(left: 20,right: 20),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                                 child:Text("Actions",style: TextStyle(
//                                   color: blueColor ,
//                                   fontFamily: "black",
//                                   fontSize: 24,
//                                   // fontWeight: FontWeight.bold
//                                 ),)
//                             ),
//                             InkWell(
//                                 onTap:(){
//                                   Navigator.pop(context);
//                                 },child: Icon(Icons.clear,size: 30,color: grayTextColor,)),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 14),
//                         height: 0.3,color: grayTextColor,),
//
//                       Container(
//                           margin:EdgeInsets.only(left: 20,right: 20,top:30,bottom: 20),
//                           child: Text("My Action",style: blueColorStyleMedium(18),)),
//
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         margin: EdgeInsets.only(left: 20,right: 20),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: new BorderRadius.circular(10.0),
//                             border: Border.all(
//                                 color: grayRoundedColor,// set border color
//                                 width: 3.0
//                             )
//                         ),
//                         // height: 56,
//                         padding: EdgeInsets.fromLTRB(16, 3, 16, 6),
//                         child:DropdownButton<String>(
//                           isExpanded: true,
//                           icon: const Icon(Icons.keyboard_arrow_down_rounded),
//                           iconSize: 22,
//                           elevation: 16,
//                           style: blueColorStyleMedium(20),
//                           underline: Container(
//                             height: 0,
//                             color: Colors.transparent,
//                           ),
//                           onChanged: (String value) {
//                             setStateee(() {
//                               votesValue=value;
//                               // committeeId=value.id.toString();
//                             });
//                           },
//                           value: votesValue,
//                           items: votesList.map((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(left: 4,right: 4),
//                                     width: 13,
//                                     height: 13,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: value=="Complete"?Colors.green:value=="Not Complete"?Colors.red:
//                                         value=="In Progress"?yellowColor:Colors.green
//                                     ),
//                                   ),
//                                   const SizedBox(width: 4,),
//                                   Container(
//                                       margin: EdgeInsets.only(top: 10),
//                                       child: Text(value)),
//                                 ],
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//
//
//                       Expanded(
//                           child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child:Container(
//                                 margin: EdgeInsets.only(bottom: 20),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         Navigator.pop(context);
//                                       },
//                                       child: Container(
//                                           padding: EdgeInsets.only(top: 10,bottom: 3),
//                                           height:50,
//                                           width: 180,
//                                           decoration: BoxDecoration(
//                                               border: Border.all(
//                                                 color: blueColor,
//                                               ),
//                                               borderRadius: BorderRadius.all(Radius.circular(14))
//                                           ),
//                                           child: Center(
//                                             child: Text("cancel",style: blueColorStyleMedium(18),),
//                                           )
//                                       ),
//                                     ),
//                                     const SizedBox(width: 10,),
//                                     InkWell(
//                                       onTap: () {
//                                         if(votesValue!=null) {
//                                           changeStatus(decisionId,userToken,votesValue);
//                                         }else{
//                                           showErrorWithMsg("Please Choose Status");
//                                         }
//                                       },
//                                       child: Container(
//                                           padding: EdgeInsets.only(top: 10,bottom: 3),
//                                           height:50,
//                                           width: 180,
//                                           decoration: BoxDecoration(
//                                               color: yellowColor,
//                                               border: Border.all(
//                                                 color: yellowColor,
//                                               ),
//                                               borderRadius: BorderRadius.all(Radius.circular(14))
//                                           ),
//                                           child: Center(
//                                             child: Text("Confirm",style: TextStyle(
//                                               color: Colors.white ,
//                                               fontFamily: "medium",
//                                               fontSize: 18,
//                                               // fontWeight: FontWeight.bold
//                                             ),),
//                                           )
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                           )),
//                     ],
//                   ),
//
//                 ),
//               ),
//             );
//           },);
//         });
//   }
//
//   void changeStatus(int decisionId,String token,String status) {
//     load();
//     meetingRepository = new MeetingRepository();
//     Future<ChangeStatusResponseModel> allList = meetingRepository.changeActionStatus(token,decisionId,new ChangeActionStatusRequestModel(status: status));
//     allList.then((value) {
//       setState(() {
//         if (value != null) {
//           showSuccess();
//           // meetingDetailsResponseModel = value;
//           Navigator.pop(context);
//           Navigator.pop(context);
//           navigateTo(context, MeetingDetailsScreen(widget.meetingId));
//         }else{
//           showError();
//           if(value==null){
//             navigateAndFinish(context, SignInScreen());
//           }
//         }
//       });
//     });
//   }
//   Widget actionsForMeetingDetails(BuildContext context,AgendasData leave,int index,String stausNew,int parentIndex) {
//     // status=stausNew;
//
//
//     if(leave.actionStauss!=null) {
//       if(leave.actionStauss=="Complete")  {
//         // status="Complete";
//         colorStatus=Colors.green;
//       }else if(leave.actionStauss=="Not Complete")  {
//         // status="Not Complete";
//         colorStatus=Color(0xffFF6A81);
//       }else if(leave.actionStauss=="In Progress")  {
//         // status="In Progress";
//         colorStatus=Color(0xffFEC20E);
//       }
//     }
//
//     int num=0;
//     if(leave.participants!=null&&leave.participants.isNotEmpty){
//       if(leave.participants.length>4){
//         num=leave.participants.length-3;
//       }
//     }
//
//     return InkWell(
//       onTap: () {
//         // navigateTo(context, ActionsScreen(leave.meetingId,leave.id,leave.actionStauss));
//         navigateTo(context, ActionsScreen(widget.meetingId,leave.id,leave.actionStauss));
//       },
//       child: Container(
//         margin: EdgeInsets.only(top: 20),
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: new BorderRadius.circular(14.0),
//             border: Border.all(
//                 color: grayRoundedColor,// set border color
//                 width: 2.0
//             )
//         ),
//         child:Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           // mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       // width: 30,
//                       // height: 30,
//                       padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom:6),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30.0),
//                         gradient: LinearGradient(
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomLeft,
//                           stops: [0.1, 0.9],
//                           colors: [
//                             Color(0xffFEC20E).withOpacity(0.1),
//                             Color(0xffFEC20E).withOpacity(0.1),
//                           ],
//                         ),
//                       ),
//                       child: Center(child: Text((index+1).toString(), style: yellowColorStyleBold(22),)),
//                     ),
//                     const SizedBox(width: 6,),
//                     Container(
//                       // width: 250,
//                       padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 8),
//                       decoration: BoxDecoration(
//                           color: Color(0xffe8eaed),
//                           border: Border.all(
//                             color: Color(0xffe8eaed),
//                           ),
//                           borderRadius: BorderRadius.circular(20)
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.asset("assets/images/ic_action.png",width: 24,height: 24,color: Colors.black,),
//                           const SizedBox(width: 14,),
//                           Container( margin: EdgeInsets.only(top: 4),
//                               child: Text(AppLocalizations.of(context).lblActions,style: grayTextColorStyleMedium(20),)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: Image.asset("assets/images/ic_drag.png",width: 30,height: 30)),
//               ],
//             ),
//             const SizedBox(height: 20,),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(left: 12,right: 12,top: 8,bottom: 2),
//                   decoration: BoxDecoration(
//                       color:colorStatus.withOpacity(0.1),
//                       border: Border.all(
//                         color: colorStatus.withOpacity(0.1),
//                       ),
//                       borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
//                   ),
//                   child: Text((leave.open_till!=null?getFormattedDateNew(stringToDateTimeNew(leave.open_till)):""),style: TextStyle(
//                     color: colorStatus ,
//                     fontFamily: "medium",
//                     fontSize: 20,
//                   ),),
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       height: 60,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemCount: leave.participants.length>3?3: leave.participants.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             margin: EdgeInsets.only(left: 2,right: 2),
//                             child: ClipOval(
//                                 child:
//                                 CircleAvatar(
//                                   radius: 26,
//                                   backgroundColor: Colors.red,
//                                   child: CircleAvatar(
//                                     radius: 26,
//                                     backgroundImage: NetworkImage(
//                                       leave.participants!=null&&leave.participants[index].user!=null?
//                                       leave.participants[index].user.image!=null?  leave.participants[index].user.image:
//                                       "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
//                                       "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
//                                     ),
//                                   ),
//                                 )
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     num<4 ?Container():Container(
//                       // width: 30,
//                       // height: 30,
//                       padding: EdgeInsets.only(left: 12,right: 12,top: 16,bottom:12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30.0),
//                         gradient: LinearGradient(
//                           begin: Alignment.topRight,
//                           end: Alignment.bottomLeft,
//                           stops: [0.1, 0.9],
//                           colors: [
//                             Color(0xffFEC20E),
//                             Color(0xffFEC20E),
//                           ],
//                         ),
//                       ),
//                       child: Center(child: Text("+"+num.toString(), style: TextStyle(
//                         color: Colors.white ,
//                         fontFamily: "black",
//                         fontSize: 20,
//                         // fontWeight: FontWeight.bold
//                       ),)),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20,),
//             Text(leave.title!=null?leave.title:"",
//               style: blueColorBoldStyle(20),),
//             const SizedBox(height: 10,),
//             Text(leave.description!=null?leave.description:"",
//               style: blueColorStyleMedium(18),),
//
//             const SizedBox(height: 20,),
//             leave.attachments!=null&&leave.attachments.isNotEmpty? SizedBox(
//                 height: 60,
//                 // width: 200,
//                 child:ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   itemCount: leave.attachments.length,
//                   itemBuilder: (context, index) {
//                     return leaveRowForAttachments(leave.meetingId,leave.attachments[index],index,context);
//                   },
//                 )
//             ):Container(),
//
//             const SizedBox(height: 20,),
//             leave.subpoints!=null&&leave.subpoints.isNotEmpty?
//             SizedBox(
//               // height: 60,
//               // width: 200,
//                 child:ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: leave.subpoints.length,
//                   itemBuilder: (context, index) {
//                     return leaveRowForSubPoints(leave.subpoints[index],parentIndex,index,context);
//                   },
//                 )
//             ):Container(),
//             leave.subpoints!=null&&leave.subpoints.isNotEmpty?  const SizedBox(height: 20,):SizedBox(height: 0,),
//
//             leave.actionStauss!=null? Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 13,
//                           height: 13,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: colorStatus),
//                         ),
//                         const SizedBox(width: 10,),
//                         Container(
//                           margin: EdgeInsets.only(top: 4),
//                           child: Text(leave.actionStauss,style: TextStyle(
//                             color: colorStatus ,
//                             fontFamily: "black",
//                             // fontWeight: FontWeight.bold,
//                             fontSize: 24,
//                           )),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4,),
//                     Container(
//                         child: Text(("My Action"),style: grayTextColorStyleMedium(22),))
//                   ],
//                 ),
//                 InkWell(
//                   onTap: () {
//                     openBottomSheetChangeProgress("date", leave.id);
//                   },
//                   child: Container(
//                     padding: EdgeInsets.only(left: 60,right: 60,top: 24,bottom: 20),
//                     decoration: BoxDecoration(
//                         color: Color(0xffe8eaed),
//                         border: Border.all(
//                           color: Color(0xffe8eaed),
//                         ),
//                         borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
//                     ),
//                     child: Text(AppLocalizations.of(context).lblChange,style: grayTextColorStyleBlack(22),),
//                   ),
//                 )
//               ],
//             ):SizedBox(height: 1,),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   @override
//   void initState() {
//     SharedPreferencesHelper.getLoggedToken().then((value) {
//       userToken=value;
//       getUser().then((value) {
//         userId=value.id;
//         print("klkmnknknknkn");
//       });
//       // getMeetingDetails(value);
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     AgendasData leave;
//     return  actionsForMeetingDetails(context, leave,0,"",0);
//   }
// }
//
