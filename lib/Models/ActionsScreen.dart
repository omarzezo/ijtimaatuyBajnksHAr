import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/AddCommentRequestModel.dart';
import 'package:itimaaty/Models/AddCommentResponseModel.dart';
import 'package:itimaaty/Models/AttendenceModel.dart';
import 'package:itimaaty/Models/ChangeActionStatusRequestModel.dart';
import 'package:itimaaty/Models/ChangeStatusResponseModel.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';
import 'package:itimaaty/Models/UsersAndComments.dart';
import 'package:itimaaty/Models/actions_response_model.dart';
import 'package:itimaaty/Models/add_note_request_model.dart';
import 'package:itimaaty/Models/add_note_response_model.dart';
import 'package:itimaaty/Models/all_meetings_response.dart';
import 'package:itimaaty/Models/all_status_response.dart';
import 'package:itimaaty/Models/change_vote_request_model.dart';
import 'package:itimaaty/Models/committee_response_model.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Models/decison_response_model.dart';
import 'package:itimaaty/Models/metting_details_response_model.dart';
import 'package:itimaaty/Repository/MeetingRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/Utils/PieChartUtils/indicators_widget.dart';
import 'package:itimaaty/Utils/PieChartUtils/pie_chart_sections.dart';
import 'package:itimaaty/Utils/PieChartUtils/pie_data.dart';
import 'package:itimaaty/View/CreateMeetingScreen.dart';
import 'package:itimaaty/View/DrawerWidget.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/SignInScreen.dart';
import 'package:itimaaty/Widgets/HomeWidgets.dart';
import 'package:itimaaty/Widgets/MeetingDetailsWidgets.dart';
import 'package:itimaaty/cubit/Home/HomeCubit.dart';
import 'package:itimaaty/cubit/Home/HomeStates.dart';
import 'package:itimaaty/Models/change_vote_response_model.dart';

import '../LocalDb/DbHelper.dart';
import '../LocalDb/DecisionTableOffline.dart';
import '../LocalDb/OfflineDataLocalModel.dart';
import 'DeleteCommentResponse.dart';
import 'DeleteCommentsRequestModel.dart';
import 'actions_comment_response_model.dart';

class ActionsScreen extends StatefulWidget {
  int meetingId;
  int decisionId;
  String actionStatus;
  ActionsScreen(this.meetingId,this.decisionId,this.actionStatus);

  @override
  ActionsScreenState createState() => ActionsScreenState();
}

class ActionsScreenState extends State<ActionsScreen> {

  ActionsResponseModel decisonResponseModel = new ActionsResponseModel();
  MeetingRepository meetingRepository;
  String userToken="";
  var writeCommentControler= TextEditingController();
  var voteControler= TextEditingController();
  int completePercent=0;
  int notCompletePercent=0;
  int inProgressPercent=0;

  int totalNum=0;
  List<String> complete=[];
  List<String> notComplete=[];
  List<String> inProgress=[];
  List<UsersAndComments> userAndCommentsList =[];
  List<String> votesList ;
  String votesValue;
  String status='';
  String statusBack = null;
  String firstChar='';
  int biggestPercent=0;
  static List<DataForPicChart> data = [];

  String baseUrl="";
  var dbHelper = DbHelper();
  int userId=0;
  String email="";
  String userImage;
  String userName;

  void getActionData(String baseUrl,String token) {
    // load();
    meetingRepository = new MeetingRepository();
    // Future<ActionsResponseModel> allList = meetingRepository.getActionData(baseUrl,token,widget.meetingId,widget.decisionId);
    Future<String> allList = meetingRepository.getActionData(baseUrl,token,widget.meetingId,widget.decisionId);
    allList.then((string) {
      setState(() {
        if (string != null) {
          // showSuccess();
          ActionsResponseModel value =  ActionsResponseModel.fromJson(json.decode(string));
          addOrUpdateOfflineAction(string);
          decisonResponseModel = value;

          if(decisonResponseModel!=null&&decisonResponseModel.participants!=null){
            if(decisonResponseModel.participants.isNotEmpty){

              if(widget.actionStatus!=null&&widget.actionStatus.isNotEmpty) {
                status = widget.actionStatus;
                if (status == "Complete") {
                 status = AppLocalizations.of(context).lblComplete;
                  colorStatus = Colors.green;
                } else
                if (status == "Not Complete" || status == "not complete") {
                 status= AppLocalizations.of(context).lblNotComplete;
                  colorStatus = Color(0xffFF6A81);
                } else if (status == "In Progress") {
                  status=AppLocalizations.of(context).lblInProgress;
                  colorStatus = Color(0xffFEC20E);
                }
              }else{
                if(decisonResponseModel.participants!=null&&decisonResponseModel.participants.isNotEmpty){
                  for(int i=0;i<decisonResponseModel.participants.length;i++){
                    if(decisonResponseModel.participants[i].userId!=null) {
                      if (userId == decisonResponseModel.participants[i].userId) {
                        status = decisonResponseModel.participants[i].status;
                        if (status == "Complete") {
                          status = AppLocalizations.of(context).lblComplete;
                          colorStatus = Colors.green;
                        } else
                        if (status == "Not Complete" || status == "not complete") {
                          status= AppLocalizations.of(context).lblNotComplete;
                          colorStatus = Color(0xffFF6A81);
                        } else if (status == "In Progress") {
                          status=AppLocalizations.of(context).lblInProgress;
                          colorStatus = Color(0xffFEC20E);
                        }
                        break;
                      }
                    }else{
                      if(decisonResponseModel.participants[i].userEmail!=null){
                        if (email == decisonResponseModel.participants[i].userEmail) {
                          status = decisonResponseModel.participants[i].status;
                          if (status == "Complete") {
                            status = AppLocalizations.of(context).lblComplete;
                            colorStatus = Colors.green;
                          } else
                          if (status == "Not Complete" || status == "not complete") {
                            status= AppLocalizations.of(context).lblNotComplete;
                            colorStatus = Color(0xffFF6A81);
                          } else if (status == "In Progress") {
                            status=AppLocalizations.of(context).lblInProgress;
                            colorStatus = Color(0xffFEC20E);
                          }
                          break;
                        }
                      }
                    }
                  }
                }
              }

              for(int i=0;i<decisonResponseModel.participants.length;i++){
                if(decisonResponseModel.participants[i].status.toLowerCase()==("Complete")||
                    decisonResponseModel.participants[i].status==("Complete")){
                  complete.add(decisonResponseModel.participants[i].status);
                  print("approvedList>>"+complete.length.toString());
                }else if(decisonResponseModel.participants[i].status.toLowerCase()==("Not Complete")||
                    decisonResponseModel.participants[i].status==("Not Complete")){
                  notComplete.add(decisonResponseModel.participants[i].status);
                  print("abstainedList>>"+notComplete.length.toString());
                }else if(decisonResponseModel.participants[i].status.toLowerCase()==("In Progress")||
                    decisonResponseModel.participants[i].status==("In Progress")){
                  inProgress.add(decisonResponseModel.participants[i].status);
                  print("deniedList>>"+inProgress.length.toString());
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
              print("image>>>>"+decisonResponseModel.comments[i].user_name.toString());
              userAndCommentsList.add(UsersAndComments(
                  fromApi: true,
                  comment: decisonResponseModel.comments[i].comment,
                  id: decisonResponseModel.comments[i].id,
                  commentedId: decisonResponseModel.comments[i].commentedId,
                  // img: i<decisonResponseModel.participants.length?decisonResponseModel.participants[i].user.image:"",
                  img: decisonResponseModel.comments[i].user_image!=null?decisonResponseModel.comments[i].user_image:"",
                  name:decisonResponseModel.comments[i].user_name!=null?decisonResponseModel.comments[i].user_name:"",
                  // name:i<decisonResponseModel.participants.length? decisonResponseModel.participants[i].user.name:"",
                  date: decisonResponseModel.comments[i].createdAt));
            }
          }
          print("dfdfdfdfdfdfdfdfd");
        }else{
          // showError();
          if(string==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });

    // return true;
  }

  Color colorStatus=Colors.green;

  String getStatus(){
    status=votesValue;
    if(status=="Complete")  {
      colorStatus=Colors.green;
    }else if(status=="Not Complete")  {
      colorStatus=Color(0xffFF6A81);
    }else if(status=="In Progress")  {
      colorStatus=Color(0xffFEC20E);
    }
    return status;
  }

  void addComment(String token,String note) {
    load();
    meetingRepository = new MeetingRepository();
    Future<List<ActionsCommentResponseModel>> allList = meetingRepository.addCommentForAction(baseUrl,token,widget.decisionId,new AddCommentRequestModel(comment: note));
    allList.then((value) {
      setState(() {
        if (value != null) {
          userAndCommentsList=[];
          writeCommentControler.text='';
          showSuccess();
          getActionData(baseUrl,userToken);
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

  void deleteComment(String token, int id) {
    load();
    meetingRepository = new MeetingRepository();
    Future<DeleteCommentResponse> allList = meetingRepository.deleteComment(baseUrl,id,token);
    allList.then((value) {
      setState(() {
        if (value != null) {
          userAndCommentsList=[];
          writeCommentControler.text='';
          getActionData(baseUrl,userToken);
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

  void dataReady(){
    data.clear();
     totalNum=complete.length+inProgress.length+notComplete.length;
    if(totalNum!=0) {
      completePercent = (100 * complete.length) ~/ totalNum;
      inProgressPercent = (100 * inProgress.length) ~/ totalNum;
      notCompletePercent = (100 * notComplete.length) ~/ totalNum;

      if(completePercent>inProgressPercent&&completePercent>notCompletePercent){
        biggestPercent=completePercent;
      }else if(inProgressPercent>completePercent&&inProgressPercent>notCompletePercent){
        biggestPercent=inProgressPercent;
      }else if(notCompletePercent>inProgressPercent&&notCompletePercent>completePercent){
        biggestPercent=notCompletePercent;
      }
    }
    print("totalNum>>"+totalNum.toString());
    print("completePercent>>"+completePercent.toString());
    print("deniedPercent>>"+inProgressPercent.toString());
    print("abstainedPercent>>"+notCompletePercent.toString());

    data.add( DataForPicChart(name: AppLocalizations.of(context).lblInProgress, percent: inProgressPercent+0.0, color: const Color(0xffFFB200)));
    data.add( DataForPicChart(name: AppLocalizations.of(context).lblComplete, percent: completePercent+0.0, color: const Color(0xff04D182)));
    data.add( DataForPicChart(name: AppLocalizations.of(context).lblNotComplete, percent: notCompletePercent+0.0, color: const Color(0xffFF6A81)));
  }


  Future<bool> addOrUpdateVote(String vote) async {
    var orgainzationsFuture = dbHelper.getMeetingActions(baseUrl+"actions/"+widget.meetingId.toString()+Constants.CHANGE_STATUS);
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        DecisionTableOffline localModel =data[i];
        if(localModel.url == baseUrl+"actions/"+widget.meetingId.toString()+Constants.CHANGE_STATUS) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      if(m){
        print("Updatettt>>"+m.toString());
        var result = await dbHelper.updateMeetingActions(baseUrl+"actions/"+widget.meetingId.toString()+Constants.CHANGE_STATUS,vote);
      }else{
        print("Insertttt>>"+m.toString());
        var result = await dbHelper.insertRequestsData(DecisionTableOffline(
            url: baseUrl+"actions/"+widget.meetingId.toString()+Constants.CHANGE_STATUS,
            changeDecisionVote: vote,
        ));
      }
    });
  }

  void addOfflineVote(String vote ){
    setState(() {
      Navigator.pop(context);
     getStatus();
      if(widget.actionStatus!=null) {
        if(decisonResponseModel.participants!=null&&decisonResponseModel.participants.isNotEmpty){
          for(int i=0;i<decisonResponseModel.participants.length;i++){
            if(userId!=null) {
              if (userId == decisonResponseModel.participants[i].userId) {
                decisonResponseModel.participants[i].status = vote;
                status = vote;
                if (status == "Complete") {
                  status = AppLocalizations.of(context).lblComplete;
                  colorStatus = Colors.green;
                } else
                if (status == "Not Complete" || status == "not complete") {
                  status= AppLocalizations.of(context).lblNotComplete;
                  colorStatus = Color(0xffFF6A81);
                } else if (status == "In Progress") {
                  status=AppLocalizations.of(context).lblInProgress;
                  colorStatus = Color(0xffFEC20E);
                }
                break;
              }
            }else{
              if (email == decisonResponseModel.participants[i].userEmail) {
                status = decisonResponseModel.participants[i].status;
                if (status == "Complete") {
                  status = AppLocalizations.of(context).lblComplete;
                  colorStatus = Colors.green;
                } else
                if (status == "Not Complete" || status == "not complete") {
                  status= AppLocalizations.of(context).lblNotComplete;
                  colorStatus = Color(0xffFF6A81);
                } else if (status == "In Progress") {
                  status=AppLocalizations.of(context).lblInProgress;
                  colorStatus = Color(0xffFEC20E);
                }
                break;
              }
            }
          }
        }
      }
      addOrUpdateVote(vote).then((value) {
        String dataString= json.encode(decisonResponseModel.toJson());
        addOrUpdateOfflineAction(dataString);
      });
    });
  }

  Future<bool> getOfflineVote() async {
    await Future<String>.delayed(const Duration(seconds:3));
    print("Hereeeeeeeeee");
    var orgainzationsFuture = dbHelper.getMeetingActions(baseUrl+"actions/"+widget.meetingId.toString()+Constants.CHANGE_STATUS);
    bool m=false;
    String vote="";
    orgainzationsFuture.then((data) {
      setState(()  {
        for(int i=0;i<data.length;i++){
          DecisionTableOffline localModel =data[i];
          if(localModel.url==baseUrl+"actions/"+widget.meetingId.toString()+Constants.CHANGE_STATUS) {
            m =true;
            print("");
            print("ididid>>"+localModel.id.toString());
            vote=localModel.changeDecisionVote;
            break;
          }else{
            m=false;
          }
        }
      });
    }).then((value)  {
      // print("mmmm>>"+m.toString());
      if(m){
        changeStatus(baseUrl,userToken, vote,false);
      }else{
        Future.delayed(Duration.zero,() {
          getActionData(baseUrl,userToken);
        });
      }
    });
  }

  void changeStatus(String baseUrl,String token,String status,bool close) {
    load();
    bool m;
    meetingRepository = new MeetingRepository();
    Future<ChangeStatusResponseModel> allList = meetingRepository.changeActionStatus(baseUrl,token,widget.decisionId,new ChangeActionStatusRequestModel(status: status));
    allList.then((value) {
      setState(() {
        if (value != null) {
          statusBack=status;
          showSuccess();
          getStatus();
          m=true;
          // meetingDetailsResponseModel = value;
          if(close) {
            Navigator.pop(context);
          }
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    }).then((value) {
      // Future.delayed(Duration(seconds: 2),() {
        dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+"actions/"+widget.meetingId.toString()+Constants.CHANGE_STATUS]).then((value) {
          // getActionData(baseUrl,userToken);
          if(m){
            getActionData(baseUrl,userToken);
          }
        });
      // });
    });
  }

  void openBottomSheetChangeProgress(String date,BuildContext _context){
    voteControler.text="";
    votesValue=null;
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
                                  votesValue=value;
                                  // committeeId=value.id.toString();
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
                                            if(votesValue!=null) {
                                              String votesValue2;
                                              if (votesValue == AppLocalizations.of(_context).lblInProgress) {
                                                votesValue2="In Progress";
                                              } else if (votesValue == AppLocalizations.of(_context).lblComplete) {
                                                votesValue2="Complete";
                                              } else if (votesValue == AppLocalizations.of(_context).lblNotComplete) {
                                                votesValue2="Not Complete";
                                              }

                                              hasNetwork().then((value) {
                                                if(value){
                                                  changeStatus(baseUrl,userToken,votesValue2,true);
                                                }else{
                                                  addOfflineVote(votesValue2);
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
                    child:Text(AppLocalizations.of(context).lblDelete,style: blueColorBoldStyle(16),) ,
                  ):Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  @override
  void initState() {
    Future.delayed(Duration.zero,() {
      votesList=[AppLocalizations.of(context).lblInProgress,AppLocalizations.of(context).lblComplete,
        AppLocalizations.of(context).lblNotComplete];
    });
    // votesList =["In Progress","Complete","Not Complete"];
    getUser().then((value) {
      userId=value.id;
      email=value.email;
      userImage=value.image!=null?value.image:"";
      userName=value.name!=null?value.name:"";
      SharedPreferencesHelper.getLoggedToken().then((value) {
        userToken=value;
        SharedPreferencesHelper.getLoggedUserName().then((valueSecond) {
          SharedPreferencesHelper.getUserImageUrl().then((value) {
            // firstChar=valueSecond.split(" ");
            for(int i=0;i<valueSecond.split(" ").length ;i++){
              firstChar+=valueSecond.split(" ")[i][0];
            }
              String baseUri= Constants.BASE_URL;
              setState(() {
                baseUrl=baseUri;
              hasNetwork().then((hasNet) {
                if(hasNet){
                  getOfflineComments();
                  // getActionData(baseUrl,userToken);
                }else{
                  getOfflineAction();
                }
              });
              });

          });
        });
      });
    });
  }

  Future getOfflineAction() async {
    var orgainzationsFuture = dbHelper.getActionColumn(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.ACTIONS+widget.decisionId.toString());
    orgainzationsFuture.then((data) {
      setState(()  {
        // this.offlineMeetings = data;
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.ACTIONS+widget.decisionId.toString()) {
            setState(() {
              ActionsResponseModel value =  ActionsResponseModel.fromJson(json.decode(localModel.action));
              decisonResponseModel = value;
              if(decisonResponseModel!=null&&decisonResponseModel.participants!=null){
                if(decisonResponseModel.participants.isNotEmpty){

                  if(widget.actionStatus!=null&&widget.actionStatus.isNotEmpty) {
                    status = widget.actionStatus;
                    if (status == "Complete") {
                      status = AppLocalizations.of(context).lblComplete;
                      colorStatus = Colors.green;
                    } else
                    if (status == "Not Complete" || status == "not complete") {
                      status= AppLocalizations.of(context).lblNotComplete;
                      colorStatus = Color(0xffFF6A81);
                    } else if (status == "In Progress") {
                      status=AppLocalizations.of(context).lblInProgress;
                      colorStatus = Color(0xffFEC20E);
                    }
                  }else{
                    if(decisonResponseModel.participants!=null&&decisonResponseModel.participants.isNotEmpty){
                      for(int i=0;i<decisonResponseModel.participants.length;i++){
                        if(decisonResponseModel.participants[i].userId!=null) {
                          if (userId == decisonResponseModel.participants[i].userId) {
                            status = decisonResponseModel.participants[i].status;
                            if (status == "Complete") {
                              status = AppLocalizations.of(context).lblComplete;
                              colorStatus = Colors.green;
                            } else
                            if (status == "Not Complete" || status == "not complete") {
                              status= AppLocalizations.of(context).lblNotComplete;
                              colorStatus = Color(0xffFF6A81);
                            } else if (status == "In Progress") {
                              status=AppLocalizations.of(context).lblInProgress;
                              colorStatus = Color(0xffFEC20E);
                            }
                            break;
                          }
                        }else{
                          if(decisonResponseModel.participants[i].userEmail!=null){
                            if (email == decisonResponseModel.participants[i].userEmail) {
                              status = decisonResponseModel.participants[i].status;
                              if (status == "Complete") {
                                status = AppLocalizations.of(context).lblComplete;
                                colorStatus = Colors.green;
                              } else
                              if (status == "Not Complete" || status == "not complete") {
                                status= AppLocalizations.of(context).lblNotComplete;
                                colorStatus = Color(0xffFF6A81);
                              } else if (status == "In Progress") {
                                status=AppLocalizations.of(context).lblInProgress;
                                colorStatus = Color(0xffFEC20E);
                              }
                              break;
                            }
                          }
                        }
                      }
                    }
                  }


                  for(int i=0;i<decisonResponseModel.participants.length;i++){
                    if(decisonResponseModel.participants[i].status.toLowerCase()==("Complete")||
                        decisonResponseModel.participants[i].status==("Complete")){
                      complete.add(decisonResponseModel.participants[i].status);
                      print("approvedList>>"+complete.length.toString());
                    }else if(decisonResponseModel.participants[i].status.toLowerCase()==("Not Complete")||
                        decisonResponseModel.participants[i].status==("Not Complete")){
                      notComplete.add(decisonResponseModel.participants[i].status);
                      print("abstainedList>>"+notComplete.length.toString());
                    }else if(decisonResponseModel.participants[i].status.toLowerCase()==("In Progress")||
                        decisonResponseModel.participants[i].status==("In Progress")){
                      inProgress.add(decisonResponseModel.participants[i].status);
                      print("deniedList>>"+inProgress.length.toString());
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
                  print("image>>>>"+decisonResponseModel.comments[i].user_name.toString());
                  userAndCommentsList.add(UsersAndComments(
                      comment: decisonResponseModel.comments[i].comment,
                      id: decisonResponseModel.comments[i].id,
                      commentedId: decisonResponseModel.comments[i].commentedId,
                      // img: i<decisonResponseModel.participants.length?decisonResponseModel.participants[i].user.image:"",
                      img: decisonResponseModel.comments[i].user_image!=null?decisonResponseModel.comments[i].user_image:"",
                      name:decisonResponseModel.comments[i].user_name!=null?decisonResponseModel.comments[i].user_name:"",
                      // name:i<decisonResponseModel.participants.length? decisonResponseModel.participants[i].user.name:"",
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

  Future<bool> addOrUpdateOfflineAction(String string) async {
    // var orgainzationsFuture = dbHelper.getOfflineData();
    var orgainzationsFuture = dbHelper.getActionColumn(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.ACTIONS+widget.decisionId.toString());
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        OfflineDataLocalModel localModel =data[i];
        if(localModel.url==baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.ACTIONS+widget.decisionId.toString()) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      print("inserstinserst>>"+m.toString());
      if(m){
        var result = await dbHelper.updateAction(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.ACTIONS+widget.decisionId.toString(),string);
      }else{
        var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          url: baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.ACTIONS+widget.decisionId.toString(),
          action: string,
        ));
      }
    });
  }

  //For Add Comment << __________________________________________________________

  Future<int> addOfflineComment(String comment) async {
    var result = await dbHelper.insertRequestsData(DecisionTableOffline(
      url: baseUrl+"actions/"+widget.decisionId.toString()+Constants.MultipleDecisionsComments,
      addDecisionComment: comment,
    ));
    print("result>>"+result.toString());
    return result;
  }

  Future<bool> addOfflineCommentToAPi(List<AddCommentRequestModel> model) {
    bool m = false ;
    load();
    meetingRepository = new MeetingRepository();
    Future<List<AddCommentResponseModel>> allList = meetingRepository.addMultipleACtionsComments(baseUrl,userToken,widget.decisionId,model);
    allList.then((value) {
      setState(() {
        if (value != null) {
          dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+"actions/"+widget.decisionId.toString()+Constants.MultipleDecisionsComments]);
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
    var orgainzationsFuture = dbHelper.getDecisionComment(baseUrl+"actions/"+widget.decisionId.toString()+Constants.MultipleDecisionsComments);
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
      url: baseUrl+Constants.DeleteMultipleComments+"actions/"+widget.decisionId.toString(),
      deleteDecisionComment: commentId,
    ));
    print("resultmmmm>"+result.toString());
  }

  Future<bool> getOfflineDeleteComments() async {
    var orgainzationsFuture = dbHelper.getDeleteDecisionComment(baseUrl+Constants.DeleteMultipleComments+"actions/"+widget.decisionId.toString());
    orgainzationsFuture.then((data) async {
      print("lemgthHere>>"+data.toString());
      if(data.isNotEmpty) {
        await deleteOfflineCommentToAPi(userToken,data);
      }else{
        getOfflineVote();
        // getActionData(baseUrl,userToken);
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
          dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+Constants.DeleteMultipleComments+"actions/"+widget.decisionId.toString()]);
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
        // getActionData(baseUrl,userToken);
      }
    });
  }

  // __________________________________________________________ >>
  fillComments(String comment,int id) {
    setState(() {
      DateFormat dateFormat;
      if (AppLocalizations.of(context).locale == "en") {
        dateFormat = DateFormat('yyyy-MM-dd hh:mm', 'en');
      } else {
        dateFormat = DateFormat('yyyy-MM-dd hh:mm', 'ar');
      }
      String date = dateFormat.format(DateTime.now());
      ActionComments modelComments = new ActionComments();
      modelComments.id = id;
      // modelComments.id = null;
      modelComments.user_image = userImage;
      modelComments.comment = comment;
      modelComments.user_name = userName;
      modelComments.createdAt = date;
      modelComments.commentedId = userId.toString();
      decisonResponseModel.comments.add(modelComments);
      userAndCommentsList.add(UsersAndComments(
          comment: modelComments.comment,
          id: modelComments.id,
          commentedId: modelComments.commentedId,
          img: modelComments.user_image != null ? modelComments.user_image : "",
          name: modelComments.user_name != null ? modelComments.user_name : "",
          date: modelComments.createdAt));
      writeCommentControler.text="";
      String dataString= json.encode(decisonResponseModel.toJson());
      addOrUpdateOfflineAction(dataString);
    });
  }

  fillDeleteComments(int index,int id,String comment,int num) {
    setState(() {
      decisonResponseModel.comments.removeWhere((item) => item.id == id);
      userAndCommentsList.removeAt(index);
      String dataString= json.encode(decisonResponseModel.toJson());
      addOrUpdateOfflineAction(dataString);
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
                            print("sddsd");
                            Navigator.pop(context,statusBack);
                          },
                          child: Icon(Icons.chevron_left,color: Colors.black,size: 40,)),
                      Image.asset("assets/images/ic_action.webp",width: 24,height: 24,color: Colors.black,),
                      Container(
                        child: Text(
                          AppLocalizations.of(context).lblActions,
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
                            leaveRowForActionsDetails(context, decisonResponseModel, 0):Container(),
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
                                        Text(AppLocalizations.of(context).lblAssignedTo, style: blueColorBoldStyle(20),),
                                        const SizedBox(height: 4,),
                                        decisonResponseModel!=null&&decisonResponseModel.participants!=null? SizedBox(
                                          height: 40,
                                          child:decisonResponseModel.participants!=null? ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: decisonResponseModel.participants.length,
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
                                                          decisonResponseModel.participants!=null&&decisonResponseModel.participants[index].user!=null?
                                                          decisonResponseModel.participants[index].user.image!=null?!decisonResponseModel.participants[index].user.image.contains(".html")?decisonResponseModel.participants[index].user.image:
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
                                const SizedBox(width: 8,),
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
                                        Text(AppLocalizations.of(context).lblOpenTill, style: blueColorBoldStyle(20),),
                                        const SizedBox(height: 14,),
                                        Text(decisonResponseModel.openTill!=null?
                                        getFormattedDate(stringToDateTime(decisonResponseModel.openTill)):"2021 oct ",style:
                                        grayTextColorStyleMedium(16),)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8,),
                                widget.actionStatus!=null?Expanded(
                                  flex:1,
                                  child: InkWell(
                                    onTap: () {
                                      openBottomSheetChangeProgress("date",context);
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
                                          Text(AppLocalizations.of(context).lblProgress, style: blueColorBoldStyle(20),),
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
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(top: 4),
                                                  child: Text(status!=null?status:"",style: TextStyle(
                                                    color: colorStatus ,
                                                    fontFamily: "black",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  )),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ):const SizedBox(),
                                const SizedBox(width: 8,),
                                Expanded(
                                  flex:1,
                                  child: InkWell(
                                    onTap: () {
                                      // openBottomSheetChangeVote("date");
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
                                          Text(AppLocalizations.of(context).lblPriority, style: blueColorBoldStyle(20),),
                                          const SizedBox(height: 10,),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 13,
                                                height: 13,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: decisonResponseModel.priority!=null&&decisonResponseModel.priority=="Low"?Colors.red:Colors.green),
                                                    // color: decisonResponseModel.priority!=null?decisonResponseModel.priority=="High"?Colors.red: colorStatus :colorStatus),
                                              ),
                                              const SizedBox(width: 10,),
                                              Container(
                                                margin: EdgeInsets.only(top: 0),
                                                // child: Text(decisonResponseModel.priority!=null?decisonResponseModel.priority:"",style: TextStyle(
                                                child: Text(decisonResponseModel.priority!=null?
                                                decisonResponseModel.priority=="Low"?AppLocalizations.of(context).lblLow:AppLocalizations.of(context).lblHigh:"",style: TextStyle(
                                                  // color:decisonResponseModel.priority!=null?decisonResponseModel.priority=="High"?Colors.red: colorStatus :colorStatus,
                                                  color:decisonResponseModel.priority!=null&&decisonResponseModel.priority=="Low"?Colors.red:Colors.green,
                                                  fontFamily: "black",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
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
                                        makeBodyForAttachmentsActions("actions",widget.decisionId,widget.meetingId,context, decisonResponseModel.attachments, 0):Container()
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
                                  Container(
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
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                      const SizedBox(width: 16,),


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
                                      child: Row(
                                        children: [
                                          Flexible(child: Text(totalNum.toString()+" "+
                                              AppLocalizations.of(context).lblGuests+" - ", style: blueColorBoldStyle(20),)),
                                        Flexible(child: Text(complete.length.toString()+" "+
                                            AppLocalizations.of(context).lblComplete+" - ", style: blueColorStyleregular(18),))  ,
                                        Flexible(child: Text(inProgress.length.toString()+" "+
                                            AppLocalizations.of(context).lblInProgress, style: blueColorStyleregular(18),))  ,
                                        ],
                                      )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    color: grayTextColor,height: 0.4,),
                                  const SizedBox(height: 20,),


                                  decisonResponseModel!=null&&decisonResponseModel.participants!=null&&decisonResponseModel.participants.isNotEmpty?
                                  SizedBox(
                                      child:ListView.builder(
                                        padding: EdgeInsets.all(0),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: decisonResponseModel.participants.length,
                                        itemBuilder: (context, index) {

                                          Color one=Color(0xff04D182);
                                          Color two=Color(0xff04D182).withOpacity(0.1);
                                          if( decisonResponseModel!=null&& decisonResponseModel.participants!=null&&
                                              decisonResponseModel.participants[index].status!=null){
                                            if(decisonResponseModel.participants[index].status=="Complete"){
                                              one=Color(0xff04D182);
                                              two=Color(0xff04D182).withOpacity(0.1);
                                            }else if(decisonResponseModel.participants[index].status=="Not Complete"||
                                                decisonResponseModel.participants[index].status=="Not Complete"){
                                              one=Color(0xffFF6A81);
                                              two=Color(0xffFF6A81).withOpacity(0.1);
                                            }else if(decisonResponseModel.participants[index].status=="In Progress"){
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
                                                                  decisonResponseModel!=null&& decisonResponseModel.participants!=null&&decisonResponseModel.participants[index].user!=null?
                                                                  decisonResponseModel.participants[index].user.image!=null?decisonResponseModel.participants[index].user.image:
                                                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                                                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                                                                ),
                                                              ),
                                                            )
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Text(decisonResponseModel!=null&& decisonResponseModel.participants!=null&&decisonResponseModel.participants[index].user!=null?
                                                        decisonResponseModel.participants[index].user.name:"",style: blueColorStyleMedium(15), ),
                                                        // Column(
                                                        //   children: [
                                                        //     Text(decisonResponseModel!=null&& decisonResponseModel.participants!=null&&decisonResponseModel.participants[index].user!=null?
                                                        //     decisonResponseModel.participants[index].user.name:"",style: blueColorStyleMedium(18), ),
                                                        //     Text(decisonResponseModel!=null&& decisonResponseModel.participants!=null&& decisonResponseModel.participants[index].status!=null?
                                                        //     decisonResponseModel.participants[index].status:"Status Reason",style: blueColorStyleregular(16), ),
                                                        //   ],
                                                        // )
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
                                                      child: Text((decisonResponseModel!=null&& decisonResponseModel.participants!=null&& decisonResponseModel.participants[index].status!=null?
                                                      decisonResponseModel.participants[index].status:""),style: TextStyle(
                                                        color: one ,
                                                        fontFamily: "medium",
                                                        fontSize: 18,
                                                      ),),
                                                    )
                                                  ],
                                                ),
                                                decisonResponseModel!=null&& decisonResponseModel.participants!=null&& decisonResponseModel.participants[index].status!=null?
                                                Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  padding: EdgeInsets.only(left: 45,right: 60),
                                                  child:
                                                  Text(decisonResponseModel.participants[index].status,style: blueColorStyleregular(16), ),
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
              const SizedBox(height: 20,),
            ],
          ),
        );
      },),
    );
  }
}

