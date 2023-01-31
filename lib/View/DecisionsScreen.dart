import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:itimaatysoharsohar/LocalDb/DbHelper.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/AddCommentRequestModel.dart';
import 'package:itimaatysoharsohar/Models/AddCommentResponseModel.dart';
import 'package:itimaatysoharsohar/Models/AttendenceModel.dart';
import 'package:itimaatysoharsohar/Models/LoginResponseModel.dart';
import 'package:itimaatysoharsohar/Models/UsersAndComments.dart';
import 'package:itimaatysoharsohar/Models/add_note_request_model.dart';
import 'package:itimaatysoharsohar/Models/add_note_response_model.dart';
import 'package:itimaatysoharsohar/Models/all_meetings_response.dart';
import 'package:itimaatysoharsohar/Models/all_status_response.dart';
import 'package:itimaatysoharsohar/Models/change_vote_request_model.dart';
import 'package:itimaatysoharsohar/Models/committee_response_model.dart';
import 'package:itimaatysoharsohar/Models/dashboard_response_model.dart';
import 'package:itimaatysoharsohar/Models/decison_response_model.dart';
import 'package:itimaatysoharsohar/Models/metting_details_response_model.dart';
import 'package:itimaatysoharsohar/Repository/MeetingRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/Utils/PieChartUtils/indicators_widget.dart';
import 'package:itimaatysoharsohar/Utils/PieChartUtils/pie_chart_sections.dart';
import 'package:itimaatysoharsohar/Utils/PieChartUtils/pie_data.dart';
import 'package:itimaatysoharsohar/View/CreateMeetingScreen.dart';
import 'package:itimaatysoharsohar/View/DrawerWidget.dart';
import 'package:itimaatysoharsohar/View/FontsStyle.dart';
import 'package:itimaatysoharsohar/View/SignInScreen.dart';
import 'package:itimaatysoharsohar/Widgets/HomeWidgets.dart';
import 'package:itimaatysoharsohar/Widgets/MeetingDetailsWidgets.dart';
import 'package:itimaatysoharsohar/cubit/Home/HomeCubit.dart';
import 'package:itimaatysoharsohar/cubit/Home/HomeStates.dart';
import 'package:itimaatysoharsohar/Models/change_vote_response_model.dart';

import '../LocalDb/OfflineDataLocalModel.dart';
import '../LocalDb/DecisionTableOffline.dart';
import '../Models/DeleteCommentResponse.dart';
import '../Models/DeleteCommentsRequestModel.dart';

class DecisionsScreen extends StatefulWidget {
  int meetingId;
  int decisionId;
  String status;
  DecisionsScreen(this.meetingId,this.decisionId,this.status);

  @override
  DecisionsScreenState createState() => DecisionsScreenState();
}

class DecisionsScreenState extends State<DecisionsScreen> {

  DecisonResponseModel decisonResponseModel = new DecisonResponseModel();
  MeetingRepository meetingRepository;
  String userToken="";
  var writeCommentControler= TextEditingController();
  var voteControler= TextEditingController();
  int approvePercent=0;
  int abstainedPercent=0;
  int deniedPercent=0;
  int pendingPercent=0;

  int totalNum=0;
  // List<DecisonResponseModelAttachments> allAttachments=[];
  // List<DecisonResponseModelComments> allComents=[];
  List<String> approved=[];
  List<String> abstained=[];
  List<String> denied=[];
  List<String> pending =[];
  List<UsersAndComments> userAndCommentsList =[];
  // List<String> votesList =["Approved","Pending","Rejected","Abstained"];
  List<String> votesList ;
  String votesValue;
  String status;
  String firstChar='';
  int biggestPercent=0;
  int userId=0;
  String email="";
  String baseUrl="";
  String userImage;
  String userName;
  var dbHelper = DbHelper();

  static List<DataForPicChart> data = [];

  Future getDescisionData(String baseUrl,String token) {
    // load();
    meetingRepository = new MeetingRepository();
    Future<String> allList = meetingRepository.getDescisionData(baseUrl,token,widget.meetingId,widget.decisionId);
    allList.then((string) {
      setState(() {
        if (string != null) {
          // showSuccess();
          DecisonResponseModel value =  DecisonResponseModel.fromJson(json.decode(string));
          addOrUpdateOfflineDecision(string);
          decisonResponseModel = value;
          if(decisonResponseModel!=null&&decisonResponseModel.voters!=null){
            if(decisonResponseModel.voters.isNotEmpty){
              if(widget.status!=null&&widget.status.isNotEmpty) {
                if(decisonResponseModel.voters!=null&&decisonResponseModel.voters.isNotEmpty){
                  for(int i=0;i<decisonResponseModel.voters.length;i++){
                    if(decisonResponseModel.voters[i].userId!=null) {
                      if (userId == decisonResponseModel.voters[i].userId) {
                        status = decisonResponseModel.voters[i].vote;
                        break;
                      }
                    }else{
                      if(decisonResponseModel.voters[i].userEmail!=null){
                        if (email == decisonResponseModel.voters[i].userEmail) {
                          status = decisonResponseModel.voters[i].vote;
                          break;
                        }
                      }
                    }
                  }
                }
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
              }
              for(int i=0;i<decisonResponseModel.voters.length;i++){
                if(decisonResponseModel.voters[i].vote.toLowerCase()==("approved")){
                  approved.add(decisonResponseModel.voters[i].vote);
                  print("approvedList>>"+approved.length.toString());
                }else if(decisonResponseModel.voters[i].vote.toLowerCase()==("abstained")){
                  abstained.add(decisonResponseModel.voters[i].vote);
                  print("abstainedList>>"+abstained.length.toString());
                }else if(decisonResponseModel.voters[i].vote.toLowerCase()==("rejected")||decisonResponseModel.voters[i].vote.toLowerCase()==("denied")){
                  denied.add(decisonResponseModel.voters[i].vote);
                  print("deniedList>>"+denied.length.toString());
                }else if(decisonResponseModel.voters[i].vote.toLowerCase()==("pending")){
                  pending.add(decisonResponseModel.voters[i].vote);
                  print("pendingList>>"+pending.length.toString());
                }
              }

              dataReady();
              // getStatus();
            }else{
              print("mkmkmkmkmkmkk");
            }
          }else{
            print("nottttttttttt");
          }

          if(decisonResponseModel.comments!=null&&decisonResponseModel.comments.isNotEmpty){
            for(int i=0;i<decisonResponseModel.comments.length;i++) {
              userAndCommentsList.add(UsersAndComments(
                  fromApi: true,
                  comment: decisonResponseModel.comments[i].comment,
                  id: decisonResponseModel.comments[i].id,
                  commentedId: decisonResponseModel.comments[i].commentedId,
                  img: decisonResponseModel.comments[i].user_image!=null?decisonResponseModel.comments[i].user_image:"",
                  name:decisonResponseModel.comments[i].user_name!=null?decisonResponseModel.comments[i].user_name:"",
                  date: decisonResponseModel.comments[i].createdAt));
            }
          }
          print("dfdfdfdfdfdfdfdfd");
        }else{
          if(string==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });

    // return true;
  }

  Color colorStatus=Colors.green;

  String getStatusColor(){
    status=votesValue;
    if(status==AppLocalizations.of(context).lblApproved)  {
      colorStatus=Colors.green;
    }else if(status==AppLocalizations.of(context).lblAbstained)  {
      colorStatus=Color(0xff0C64F9);
    }else if(status=="Denied"||status==AppLocalizations.of(context).lblRejected)  {
      colorStatus=Color(0xffFF6A81);
    }else if(status==AppLocalizations.of(context).lblPendingS)  {
      colorStatus=Color(0xffFEC20E);
    }
    return status;
  }

  void addComment(String token,String note) {
    load();
    meetingRepository = new MeetingRepository();
    Future<List<AddCommentResponseModel>> allList = meetingRepository.addComment(baseUrl,token,widget.decisionId,new AddCommentRequestModel(comment: note));
    allList.then((value) {
      setState(() {
        if (value != null) {
          userAndCommentsList=[];
          writeCommentControler.text='';
          showSuccess();
          getDescisionData(baseUrl,userToken);
          // meetingDetailsResponseModel = value;
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

  void dataReady(){
    data.clear();
    print("pendingListdataReady>>"+pending.length.toString());
    totalNum=approved.length+denied.length+pending.length+abstained.length;
    if(totalNum!=0) {
      approvePercent = (100 * approved.length) ~/ totalNum;
      deniedPercent = (100 * denied.length) ~/ totalNum;
      abstainedPercent = (100 * abstained.length) ~/ totalNum;
      pendingPercent = (100 * pending.length) ~/ totalNum;
      if(approvePercent>deniedPercent&&approvePercent>abstainedPercent&&approvePercent>pendingPercent){
        biggestPercent=approvePercent;
      }else if(deniedPercent>approvePercent&&deniedPercent>abstainedPercent&&deniedPercent>pendingPercent){
        biggestPercent=deniedPercent;
      }else if(abstainedPercent>deniedPercent&&abstainedPercent>approvePercent&&abstainedPercent>pendingPercent){
        biggestPercent=abstainedPercent;
      }else if(pendingPercent>deniedPercent&&pendingPercent>approvePercent&&pendingPercent>abstainedPercent){
        biggestPercent=pendingPercent;
      }
    }
    print("totalNum>>"+totalNum.toString());
    print("approvePercent>>"+approvePercent.toString());
    print("deniedPercent>>"+deniedPercent.toString());
    print("abstainedPercent>>"+abstainedPercent.toString());
    print("pendingPercent>>"+pendingPercent.toString());
    data.add( DataForPicChart(name: AppLocalizations.of(context).lblApproved, percent: approvePercent+0.0, color: const Color(0xff04D182)));
    data.add( DataForPicChart(name: AppLocalizations.of(context).lblRejected, percent: deniedPercent+0.0, color: const Color(0xffFF6A81)));
    data.add( DataForPicChart(name: AppLocalizations.of(context).lblAbstained, percent: abstainedPercent+0.0, color: const Color(0xff0C64F9)));
    data.add( DataForPicChart(name:AppLocalizations.of(context).lblPendingS, percent: pendingPercent+0.0, color: const Color(0xffFFB200)));
  }

  void changeVote(String token,String vote,String reason,bool close) {
    load();
    meetingRepository = new MeetingRepository();
    Future<ChangeVoteResponseModel> allList = meetingRepository.changeVote(baseUrl,token,widget.decisionId,new ChangeVoteRequestModel(reason: reason,vote: vote));
    allList.then((value) {
      setState(()  {
        if (value != null) {
          status=votesValue;
          showSuccess();
          // meetingDetailsResponseModel = value;
          getStatusColor();
          if(close) {
            Navigator.pop(context);
            getDescisionData(baseUrl,userToken);
          }else{
            dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+"decisions/"+widget.meetingId.toString()+Constants.CHANGE_VOTE]);
            // dbHelper.deleteVoteDecision(baseUrl+"decisions/"+widget.meetingId.toString()+Constants.CHANGE_VOTE);
            getDescisionData(baseUrl,userToken);
          }
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });
  }

  Future<bool> addOrUpdateVote(String vote,String reason) async {
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

  void addOfflineVote(String vote ,String reason){
    setState(() {
      Navigator.pop(context);
      voteControler.text="";
      if (vote == AppLocalizations.of(context).lblApproved) {
        status="Approved";
        colorStatus = Colors.green;
      } else if (vote == AppLocalizations.of(context).lblAbstained) {
        status="Abstained";
        colorStatus = Color(0xff0C64F9);
      } else if (vote == AppLocalizations.of(context).lblRejected) {
        status="Rejected";
        colorStatus = Color(0xffFF6A81);
      } else if (vote == "Denied" ) {
        status="Rejected";
        colorStatus = Color(0xffFF6A81);
      }else if (vote == AppLocalizations.of(context).lblPendingS) {
        status="Pending";
        colorStatus = Color(0xffFEC20E);
      }
      if(widget.status!=null) {
        if(decisonResponseModel.voters!=null&&decisonResponseModel.voters.isNotEmpty){
          for(int i=0;i<decisonResponseModel.voters.length;i++){
            if(userId==decisonResponseModel.voters[i].userId){
              decisonResponseModel.voters[i].vote=vote;
              break;
            }
          }
        }
      }
      addOrUpdateVote(vote,reason).then((value) {
        String dataString= json.encode(decisonResponseModel.toJson());
        addOrUpdateOfflineDecision(dataString);
      });
    });
  }

  Future<bool> getOfflineVote() async {
    await Future<String>.delayed(const Duration(seconds:3));
    print("Hereeeeeeeeee");
    var orgainzationsFuture = dbHelper.getMeetingDecision(baseUrl+"decisions/"+widget.meetingId.toString()+Constants.CHANGE_VOTE);
    bool m=false;
    String vote="";
    String reason="";
    orgainzationsFuture.then((data) {
      setState(()  {
        for(int i=0;i<data.length;i++){
          DecisionTableOffline localModel =data[i];
          if(localModel.url==baseUrl+"decisions/"+widget.meetingId.toString()+Constants.CHANGE_VOTE) {
            m =true;
            print("");
            print("ididid>>"+localModel.id.toString());
            vote=localModel.changeDecisionVote;
            reason=localModel.changeDecisionReason;
            break;
          }else{
            m=false;
          }
        }
      });
    }).then((value)  {
      // print("mmmm>>"+m.toString());
      if(m){
        // print("vote>>"+vote);
        // print("reason>>"+reason);
        changeVote(userToken, vote,reason,false);
      }else{
        Future.delayed(Duration.zero,() {
          getDescisionData(baseUrl,userToken);
        });
      }
    });
  }

  //For Add Comment << __________________________________________________________

  Future<int> addOfflineComment(String comment) async {
    var result = await dbHelper.insertRequestsData(DecisionTableOffline(
      url: baseUrl+"decisions/"+widget.decisionId.toString()+Constants.MultipleDecisionsComments,
      addDecisionComment: comment,
    ));
    print("result>>"+result.toString());
    return result;
  }

  Future<bool> addOfflineCommentToAPi(List<AddCommentRequestModel> model) {
    bool m = false ;
    load();
    meetingRepository = new MeetingRepository();
    Future<List<AddCommentResponseModel>> allList = meetingRepository.addMultipleDecisionsComments(baseUrl,userToken,widget.decisionId,model);
    allList.then((value) {
      setState(() {
        if (value != null) {
          dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+"decisions/"+widget.decisionId.toString()+Constants.MultipleDecisionsComments]);
          showSuccess();
          m=true;
          // return m;
        }else{
          m=false;
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    }).then((value) {
      if(m){
        getOfflineDeleteComments();
      }
    });
  }

  Future<bool> getOfflineComments() async {
    var orgainzationsFuture = dbHelper.getDecisionComment(baseUrl+"decisions/"+widget.decisionId.toString()+Constants.MultipleDecisionsComments);
    orgainzationsFuture.then((data) async {
      print("lemgth>>"+data.toString());
      if(data.isNotEmpty) {
        await addOfflineCommentToAPi(data);
      }else{
          getOfflineDeleteComments();
      }
    }).then((value) {
    });
  }


  // __________________________________________________________ >>

  //For Delete Comment << __________________________________________________________

  Future<bool> addDeleteOfflineComment(int commentId) async {
    var result = await dbHelper.insertRequestsData(DecisionTableOffline(
      url: baseUrl+Constants.DeleteMultipleComments+"decision/"+widget.decisionId.toString(),
      deleteDecisionComment: commentId,
    ));
    print("resultmmmm>"+result.toString());
  }

  Future<bool> getOfflineDeleteComments() async {
    var orgainzationsFuture = dbHelper.getDeleteDecisionComment(baseUrl+Constants.DeleteMultipleComments+"decision/"+widget.decisionId.toString());
    orgainzationsFuture.then((data) async {
      print("lemgthHere>>"+data.toString());
      if(data.isNotEmpty) {
        await deleteOfflineCommentToAPi(userToken,data);
      }else{
        getOfflineVote();
      }
    }).then((value) {
    });
    //
  }

  Future<bool> deleteOfflineCommentToAPi(String token,List<DeleteCommentsRequestModel> model) {
    bool m = false ;
    load();
    meetingRepository = new MeetingRepository();
    Future<DeleteCommentResponse> allList = meetingRepository.deleteMultipleComment(baseUrl,token,model);
    allList.then((value) {
      setState(() {
        if (value != null) {
          dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+Constants.DeleteMultipleComments+"decision/"+widget.decisionId.toString()]);
          showSuccess();
          m=true;
        }else{
          m=false;
          showError();
          if(value==null){
            showErrorWithMsg('this item not deleted');
            // navigateAndFinish(context, SignInScreen());
          }
        }
      });
    }).then((value) {
      if(m){
        getOfflineVote();
      }
    });
  }

  // __________________________________________________________ >>


  void openBottomSheetChangeVote(String date,BuildContext _context){
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
                      // height: MediaQuery.of(context).size.height+100,
                      color: Colors.white,
                      // width: MediaQuery.of(context).size.width - 200,
                      child:
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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

                            // Expanded(
                            //     child:),
                            // Padding( // this is new
                            //     padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
                            // )
                            // Container(height:40 ,),
                            Container(
                              margin: EdgeInsets.only(bottom: 20,top: 40),
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
                                              changeVote(userToken,votesValue2,
                                                  voteControler.text != null ? voteControler.text : "",
                                                  true);
                                            }else{
                                              addOfflineVote(votesValue2, voteControler.text != null ? voteControler.text : "");
                                            }
                                          });

                                        }else{
                                          if(votesValue2=="Approved"){
                                            hasNetwork().then((value) {
                                              if(value){
                                                changeVote(userToken,votesValue2, voteControler.text != null ? voteControler.text : "",
                                                    true);
                                              }else{
                                                addOfflineVote(votesValue2, voteControler.text != null ? voteControler.text : "");
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
                            ),
                            Container(height: MediaQuery.of(context).size.height/2, ),
                          ],
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            );
          },);
        });
  }

  void deleteComment(String token, int id) {
    load();
    meetingRepository = new MeetingRepository();
    Future<DeleteCommentResponse> allList = meetingRepository.deleteComment(baseUrl,id,token);
    allList.then((value) {
      setState(() {
        if (value != null) {
          userAndCommentsList=[];
          writeCommentControler.text='';
          getDescisionData(baseUrl,userToken);
          showSuccessMsg("Deleted Successfully");
        }else{
          showError();
          if(value==null){
            showErrorWithMsg('this item not deleted');
            // navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
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
              width: MediaQuery.of(context).size.width/2-100,
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
                  const SizedBox(height: 10,),
                  userId==int.parse(leave.commentedId)?InkWell(
                    onTap: () {
                      hasNetwork().then((value) {
                        print("nnn>>"+leave.fromApi.toString());
                        // &&leave.fromApi
                        if(value){
                          deleteComment(userToken, leave.id);
                        }else{
                          dbHelper.deleteStoredDecisionComment(whereArgs: [leave.id]).then((value) {
                            print("ValIss>>"+value.toString());
                            print("commentIs>>"+leave.comment);
                            print("idIs>>"+leave.id.toString());
                            print("indexIs>>"+index.toString());
                            fillDeleteComments(index, leave.id,leave.comment,value);
                          });
                        }
                      });
                    },
                    child:Text(AppLocalizations.of(context).lblDelete,style: blueColorBoldStyle(16),),
                  ):Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  initMethods() async {
    var f = await getOfflineComments();
    var s = await getOfflineDeleteComments();
    var t = await getOfflineVote();
    print(await f.toString()+"fffffffffffff");
    print(await s.toString()+"ssssssssssss");
    print(await t.toString()+"tttttttttttt");
    print('done');
  }
  @override
  void initState() {
    Future.delayed(Duration.zero,() {
      votesList=[AppLocalizations.of(context).lblApproved,AppLocalizations.of(context).lblPendingS,
        AppLocalizations.of(context).lblRejected,AppLocalizations.of(context).lblAbstained];
    });
      String baseUri= Constants.BASE_URL;
      setState(() {
        baseUrl=baseUri;
      });
    getUser().then((value) {
      userId=value.id;
      email=value.email;
      userImage=value.image!=null?value.image:"";
      print("userImage>>"+userImage.toString());
      userName=value.name!=null?value.name:"";
      SharedPreferencesHelper.getLoggedToken().then((value) {
        userToken=value;
        SharedPreferencesHelper.getLoggedUserName().then((valueSecond) {
          SharedPreferencesHelper.getUserImageUrl().then((value) {
            // firstChar=valueSecond.split(" ");
            for(int i=0;i<valueSecond.split(" ").length ;i++){
              firstChar+=valueSecond.split(" ")[i][0];
            }
            hasNetwork().then((hasNet) async {
              if(hasNet){
                // getDescisionData(baseUrl,userToken);
                // initMethods();
                await  getOfflineComments();
                // getOfflineComments();

                // getOfflineVote().then((value) {
                //   getDescisionData(baseUrl,userToken);
                // });
              }else{
                getOfflineDecision();
              }
            });

          });
        });
      });
    });
  }

  Future getOfflineDecision() async {
    var orgainzationsFuture = dbHelper.getDecisionColumn(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.DECISIONS+widget.decisionId.toString());
    orgainzationsFuture.then((data) {
      setState(()  {
        // this.offlineMeetings = data;
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.DECISIONS+widget.decisionId.toString()) {
            setState(() {
              DecisonResponseModel value =  DecisonResponseModel.fromJson(json.decode(localModel.decision));
              decisonResponseModel = value;
              if(decisonResponseModel!=null&&decisonResponseModel.voters!=null){
                if(decisonResponseModel.voters.isNotEmpty){
                  if(widget.status!=null) {
                    if(decisonResponseModel.voters!=null&&decisonResponseModel.voters.isNotEmpty){
                      for(int i=0;i<decisonResponseModel.voters.length;i++){
                        if(userId==decisonResponseModel.voters[i].userId){
                          status=decisonResponseModel.voters[i].vote;
                          break;
                        }
                      }
                    }
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
                  }
                  for(int i=0;i<decisonResponseModel.voters.length;i++){
                    if(decisonResponseModel.voters[i].vote.toLowerCase()==("approved")){
                      approved.add(decisonResponseModel.voters[i].vote);
                      print("approvedList>>"+approved.length.toString());
                    }else if(decisonResponseModel.voters[i].vote.toLowerCase()==("abstained")){
                      abstained.add(decisonResponseModel.voters[i].vote);
                      print("abstainedList>>"+abstained.length.toString());
                    }else if(decisonResponseModel.voters[i].vote.toLowerCase()==("rejected")||decisonResponseModel.voters[i].vote.toLowerCase()==("denied")){
                      denied.add(decisonResponseModel.voters[i].vote);
                      print("deniedList>>"+denied.length.toString());
                    }else if(decisonResponseModel.voters[i].vote.toLowerCase()==("pending")){
                      pending.add(decisonResponseModel.voters[i].vote);
                      print("pendingList>>"+pending.length.toString());
                    }
                  }

                  dataReady();
                  // getStatus();
                }else{
                  print("mkmkmkmkmkmkk");
                }
              }else{
                print("nottttttttttt");
              }

              if(decisonResponseModel.comments!=null&&decisonResponseModel.comments.isNotEmpty){
                for(int i=0;i<decisonResponseModel.comments.length;i++) {
                  userAndCommentsList.add(UsersAndComments(
                      fromApi: decisonResponseModel.comments[i].fromApi,
                      comment: decisonResponseModel.comments[i].comment,
                      id: decisonResponseModel.comments[i].id,
                      commentedId: decisonResponseModel.comments[i].commentedId,
                      img: decisonResponseModel.comments[i].user_image!=null?decisonResponseModel.comments[i].user_image:"",
                      name:decisonResponseModel.comments[i].user_name!=null?decisonResponseModel.comments[i].user_name:"",
                      date: decisonResponseModel.comments[i].createdAt));
                }
              }
              print("dfdfdfdfdfdfdfdfd");
            });
            break;
          }
          // allFilterdMeetingList = allMeetingList;
        }
      });
    });
  }

  Future<bool> addOrUpdateOfflineDecision(String string) async {
    // var orgainzationsFuture = dbHelper.getOfflineData();
    var orgainzationsFuture = dbHelper.getDecisionColumn(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.DECISIONS+widget.decisionId.toString());
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        OfflineDataLocalModel localModel =data[i];
        if(localModel.url==baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.DECISIONS+widget.decisionId.toString()) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      print("inserstinserst>>"+m.toString());
      if(m){
        var result = await dbHelper.updateDecision(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.DECISIONS+widget.decisionId.toString(),string);
      }else{
        var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          url: baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.DECISIONS+widget.decisionId.toString(),
          decision: string,
        ));
      }
    });
  }

  fillComments(String comment,int id) {
    setState(() {
      DateFormat dateFormat;
      if (AppLocalizations.of(context).locale == "en") {
        dateFormat = DateFormat('yyyy-MM-dd hh:mm', 'en');
      } else {
        dateFormat = DateFormat('yyyy-MM-dd hh:mm', 'ar');
      }
      String date = dateFormat.format(DateTime.now());
      DecisonResponseModelComments modelComments = new DecisonResponseModelComments();
      modelComments.id = id;
      // modelComments.id = null;
      modelComments.user_image = userImage;
      modelComments.comment = comment;
      modelComments.user_name = userName;
      modelComments.createdAt = date;
      modelComments.commentedId = userId.toString();
      modelComments.fromApi = false;
      decisonResponseModel.comments.add(modelComments);
      userAndCommentsList.add(UsersAndComments(
          comment: modelComments.comment,
          id: modelComments.id,
          fromApi: modelComments.fromApi,
          commentedId: modelComments.commentedId,
          img: modelComments.user_image != null ? modelComments.user_image : "",
          name: modelComments.user_name != null ? modelComments.user_name : "",
          date: modelComments.createdAt));
      writeCommentControler.text="";
      String dataString= json.encode(decisonResponseModel.toJson());
      addOrUpdateOfflineDecision(dataString);
    });
  }

  fillDeleteComments(int index,int id,String comment,int num) {
    setState(() {
      decisonResponseModel.comments.removeWhere((item) => item.id == id);
      userAndCommentsList.removeAt(index);
      String dataString= json.encode(decisonResponseModel.toJson());
      addOrUpdateOfflineDecision(dataString);
      if(num==0){
        addDeleteOfflineComment(id);
      }
    });
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
                            // print("sddsd");
                            Navigator.pop(context,status);
                          },
                          child: Icon(Icons.chevron_left,color: Colors.black,size: 40,)),

                      Image.asset("assets/images/ic_decisions.webp",width: 24,height: 24,color: Colors.black,),

                      Container(
                        child: Text(
                          AppLocalizations.of(context).lblDesisions,
                          style: blueColorBoldStyle(26),
                        ),margin: EdgeInsets.only(top: 8,left: 16,right: 16),
                      ),
                    ],
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            decisonResponseModel!=null?
                            leaveRowForDecision(context, decisonResponseModel, 0):Container(),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                Expanded(
                                  flex:1,
                                  child: Container(
                                    padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: new BorderRadius.circular(14.0),
                                        border: Border.all(
                                            color: grayRoundedColor,// set border color
                                            width: 2.0
                                        )
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [
                                        Text(AppLocalizations.of(context).lblAssignedTo, style: blueColorBoldStyle(22),),
                                        const SizedBox(height: 4,),
                                        decisonResponseModel!=null&&decisonResponseModel.voters!=null? SizedBox(
                                          height: 40,
                                          child:decisonResponseModel.voters!=null? ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: decisonResponseModel.voters.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: EdgeInsets.only(left: 4,right: 4),
                                                child: ClipOval(
                                                    child:
                                                    CircleAvatar(
                                                      radius: 18,
                                                      backgroundColor: Colors.red,
                                                      child: CircleAvatar(
                                                        radius: 18,
                                                        backgroundImage: NetworkImage(
                                                          decisonResponseModel.voters!=null&&decisonResponseModel.voters[index].user!=null?
                                                          decisonResponseModel.voters[index].user.image!=null?!decisonResponseModel.voters[index].user.image.contains(".html")?decisonResponseModel.voters[index].user.image:
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                                                        ),
                                                      ),
                                                    )
                                                ),
                                              );
                                            },
                                          ):Container(),
                                        ):Container()
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  flex:1,
                                  child: Container(
                                    padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: new BorderRadius.circular(14.0),
                                        border: Border.all(
                                            color: grayRoundedColor,// set border color
                                            width: 2.0
                                        )
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [
                                        Text(AppLocalizations.of(context).lblOpenDate, style: blueColorBoldStyle(22),),
                                        const SizedBox(height: 20,),
                                        Text(decisonResponseModel.deadline!=null?
                                        getFormattedDate(stringToDateTime(decisonResponseModel.deadline)):"2021 oct ",style:
                                        grayTextColorStyleMedium(18),)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),


                                widget.status!=null? status!=null? Expanded(
                                  flex:1,
                                  child: InkWell(
                                    onTap: () {
                                      openBottomSheetChangeVote("date",context);
                                    },
                                    child: Container(
                                      padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.circular(14.0),
                                          border: Border.all(
                                              color: grayRoundedColor,// set border color
                                              width: 2.0
                                          )
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context).lblMyDecisions, style: blueColorBoldStyle(22),),
                                          const SizedBox(height: 10,),
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
                                                child: Text((status!=null?status:""),style: TextStyle(
                                                  color: colorStatus ,
                                                  fontFamily: "black",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22,
                                                )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                    :const SizedBox()
                                    :const SizedBox()
                              ],
                            ),
                            const SizedBox(height: 20,),

                            Container(
                              padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: grayRoundedColor,// set border color
                                      width: 2.0
                                  )
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(AppLocalizations.of(context).lblDescription,
                                          style: blueColorBoldStyle(20),),
                                        const SizedBox(height: 14,),
                                        Text(decisonResponseModel.description!=null?decisonResponseModel.description:"description",
                                          style: blueColorStyleMedium(20),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20,),

                            Container(
                                padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: grayRoundedColor,// set border color
                                        width: 2.0
                                    )
                                ),
                                child:  Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(AppLocalizations.of(context).lblAttachments, style: blueColorBoldStyle(20),),
                                        const SizedBox(height: 14,),

                                        decisonResponseModel.attachments!=null?
                                        makeBodyForAttachmentsDecisions("decisions",widget.decisionId,widget.meetingId,context, decisonResponseModel.attachments, 0):Container()
                                      ],
                                    ),
                                  ],
                                )),

                            const SizedBox(height: 20,),

                            Container(
                              padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: grayRoundedColor,// set border color
                                      width: 2.0
                                  )
                              ),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(AppLocalizations.of(context).lblComments+" ( "+
                                      (decisonResponseModel.comments==null?0.toString():
                                      decisonResponseModel.comments.length.toString())+" )", style: blueColorBoldStyle(20),),
                                  const SizedBox(height: 14,),

                                  makeBodyForUsersComments(context, userAndCommentsList, 0)
                                ],
                              ),
                            ),

                            const SizedBox(height: 20,),

                            Container(
                              padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: grayRoundedColor,// set border color
                                      width: 2.0
                                  )
                              ),
                              child:  Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 13),
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
                                    child: Text(firstChar.toString(), style: yellowColorStyleBold(22),),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 14,right: 14),
                                      padding: EdgeInsets.only(left: 14,right: 14,top: 6,bottom: 2),
                                      decoration: BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: new BorderRadius.circular(14.0),
                                          border: Border.all(
                                              color: Color(0xffEDF2F9),// set border color
                                              width: 2.0
                                          )
                                      ),
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width:MediaQuery.of(context).size.width/2-180,
                                            child: TextField(
                                                controller: writeCommentControler,
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
                                                    hintText: AppLocalizations.of(context).lblWriteComments,
                                                    hintStyle: blueColorStyleMedium(20)
                                                )
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {

                                                hasNetwork().then((value){
                                                  if(value){
                                                    addComment(userToken, writeCommentControler.text==null?"": writeCommentControler.text);
                                                  }else{
                                                    addOfflineComment(writeCommentControler.text==null?"": writeCommentControler.text).then((value) {
                                                      fillComments(writeCommentControler.text==null?"": writeCommentControler.text,value);
                                                    });
                                                  }
                                                });
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
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
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
                                  // Container(
                                  //     padding: EdgeInsets.only(left: 16,right: 16),
                                  //     child: Row(
                                  //       children: [
                                  //         // Flexible(child: Text(totalNum.toString()+" Guests - ", style: blueColorStyleMedium(20),)),
                                  //         // Flexible(child: Text(complete.length.toString()+" Going - ", style: blueColorStyleregular(18),))  ,
                                  //         // Flexible(child: Text(inProgress.length.toString()+" pending", style: blueColorStyleregular(18),))  ,
                                  //         // Flexible(child: Text(inProgress.length.toString()+" Not Going", style: blueColorStyleregular(18),))  ,
                                  //       ],
                                  //     )
                                  // ),
                                  // const SizedBox(height: 10,),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    color: grayTextColor,height: 0.4,),
                                  const SizedBox(height: 20,),


                                  decisonResponseModel!=null&&decisonResponseModel.voters!=null&&decisonResponseModel.voters.isNotEmpty?
                                  SizedBox(
                                      child:ListView.builder(
                                        padding: EdgeInsets.all(0),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: decisonResponseModel.voters.length,
                                        itemBuilder: (context, index) {

                                          Color one=Color(0xff04D182);
                                          Color two=Color(0xff04D182).withOpacity(0.1);
                                          if( decisonResponseModel!=null&& decisonResponseModel.voters!=null&&
                                              decisonResponseModel.voters[index].vote!=null){
                                            if(decisonResponseModel.voters[index].vote=="Going"){
                                              one=Color(0xff04D182);
                                              two=Color(0xff04D182).withOpacity(0.1);
                                            }else if(decisonResponseModel.voters[index].vote=="Not Going"||
                                                decisonResponseModel.voters[index].vote=="Not going"
                                                ||decisonResponseModel.voters[index].vote=="Denied"){
                                              one=Color(0xffFF6A81);
                                              two=Color(0xffFF6A81).withOpacity(0.1);
                                            }else if(decisonResponseModel.voters[index].vote=="Maybe"){
                                              one=Color(0xff7F8FA4);
                                              two=Color(0xff7F8FA4).withOpacity(0.1);
                                            }else if(decisonResponseModel.voters[index].vote=="Pending"){
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
                                                                  decisonResponseModel!=null&& decisonResponseModel.voters!=null&&decisonResponseModel.voters[index].user!=null?
                                                                  decisonResponseModel.voters[index].user.image!=null? decisonResponseModel.voters[index].user.image:
                                                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                                                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                                                                ),
                                                              ),
                                                            )
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Column(
                                                          children: [
                                                            Text(decisonResponseModel!=null&& decisonResponseModel.voters!=null&&decisonResponseModel.voters[index].user!=null?
                                                            decisonResponseModel.voters[index].user.name:"",style: blueColorStyleMedium(18), ),
                                                            // Text(decisonResponseModel!=null&& decisonResponseModel.voters!=null&& decisonResponseModel.voters[index].reason!=null?
                                                            // decisonResponseModel.voters[index].reason:"",style: blueColorStyleregular(16), ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),

                                                    Container(
                                                      padding: EdgeInsets.only(left:22,right: 22,top: 6,bottom: 2),
                                                      // padding: EdgeInsets.only(left:4,right: 4,top: 6,bottom: 2),
                                                      decoration: BoxDecoration(
                                                          color: two,
                                                          border: Border.all(
                                                            color: two,
                                                          ),
                                                          borderRadius: BorderRadius.circular(20) // use instead of BorderRadius.all(Radius.circular(20))
                                                      ),
                                                      child: Center(
                                                        child: Text((decisonResponseModel!=null&& decisonResponseModel.voters!=null&& decisonResponseModel.voters[index].vote!=null?
                                                        decisonResponseModel.voters[index].vote:""),style: TextStyle(
                                                          color: one ,
                                                          fontFamily: "medium",
                                                          fontSize: 20,
                                                        ),),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                decisonResponseModel!=null&& decisonResponseModel.voters!=null&& decisonResponseModel.voters[index].reason!=null?
                                                Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  padding: EdgeInsets.only(left: 45,right: 60),
                                                  child:
                                                  Text(decisonResponseModel.voters[index].reason,style: blueColorStyleregular(16), ),
                                                ):const SizedBox()
                                              ],
                                            ),
                                          );

                                        },
                                      )
                                  ):Container(),
                                ],
                              ),
                            ),


                            const SizedBox(height: 20,),

                            Container(
                              margin: EdgeInsets.only(top: 18),
                              padding: EdgeInsets.only(top: 16,right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: grayRoundedColor,// set border color
                                      width: 2.0
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                                              child: Text(AppLocalizations.of(context).lblAnalysis, style: blueColorBoldStyle(20),)),
                                          Container(
                                              padding: EdgeInsets.only(left: 16,right: 16,top: 18),
                                              child: Text(biggestPercent.toString()+" % ", style: blueColorBoldStyle(20),)),
                                          Container(
                                              padding: EdgeInsets.only(left: 16,right: 16,top: 18),
                                              child: Text(AppLocalizations.of(context).lblParticipants, style: blueColorStyleMedium(18),))
                                        ],
                                      ),
                                      // const SizedBox(height: 10,),
                                      Container(
                                        margin: EdgeInsets.only(left: 10,right: 10,top: 30),
                                        width: 100,
                                        height: 100,
                                        child: PieChart(
                                          PieChartData(
                                            pieTouchData: PieTouchData(
                                              touchCallback: (p0, p1) {

                                              },
                                            ),
                                            borderData: FlBorderData(show: false),
                                            sectionsSpace: 0,
                                            centerSpaceRadius: 40,
                                            sections: getSections(data,0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      margin:EdgeInsets.all(16) ,
                                      child: IndicatorsWidget(data))
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
              const SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },),
    );
  }
}

