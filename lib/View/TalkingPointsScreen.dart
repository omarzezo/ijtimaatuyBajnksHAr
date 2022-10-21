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
import 'package:itimaaty/Models/DeleteCommentResponse.dart';
import 'package:itimaaty/Models/UsersAndComments.dart';
import 'package:itimaaty/Models/add_note_request_model.dart';
import 'package:itimaaty/Models/add_note_response_model.dart';
import 'package:itimaaty/Models/all_meetings_response.dart';
import 'package:itimaaty/Models/all_status_response.dart';
import 'package:itimaaty/Models/change_vote_request_model.dart';
import 'package:itimaaty/Models/committee_response_model.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Models/decison_response_model.dart';
import 'package:itimaaty/Models/metting_details_response_model.dart';
import 'package:itimaaty/Models/talking_points_response_model.dart';
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
import '../Models/DeleteCommentsRequestModel.dart';
import '../Models/LoginResponseModel.dart';

class TalkingPointsScreen extends StatefulWidget {
  int meetingId;
  int decisionId;
  TalkingPointsScreen(this.meetingId,this.decisionId);

  @override
  TalkingPointsScreenState createState() => TalkingPointsScreenState();
}

class TalkingPointsScreenState extends State<TalkingPointsScreen> {

  TalkingPointsResponseModel decisonResponseModel = new TalkingPointsResponseModel();
  MeetingRepository meetingRepository;
  String userToken="";
  var writeCommentControler= TextEditingController();
  var voteControler= TextEditingController();
  int approvePercent=0;
  int abstainedPercent=0;
  int deniedPercent=0;
  int pendingPercent=0;

  int totalNum=0;
  List<String> approved=[];
  List<String> abstained=[];
  List<String> denied=[];
  List<String> pending =[];
  List<TalkingPointsComments> userAndCommentsList =[];
  String status='';
  String firstChar='';
  int biggestPercent=0;
  static List<DataForPicChart> data = [];
  var dbHelper = DbHelper();
  String userImage;
  String userName;

  String durationToString(int minutes) {
    var d = Duration(minutes:minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  
  void getDescisionData(String baseUrl ,String token) {
    // load();
    meetingRepository = new MeetingRepository();
    // Future<TalkingPointsResponseModel> allList = meetingRepository.getTalikingPointsData(baseUrl,token,widget.meetingId,widget.decisionId);
    Future<String> allList = meetingRepository.getTalikingPointsData(baseUrl,token,widget.meetingId,widget.decisionId);
    allList.then((string) {
      setState(() {
        if (string != null) {
          userAndCommentsList.clear();
          TalkingPointsResponseModel value =  TalkingPointsResponseModel.fromJson(json.decode(string));
          addOrUpdateOfflineTalkingPoint(string);
          decisonResponseModel = value;
          if(decisonResponseModel.comments!=null&&decisonResponseModel.comments.isNotEmpty){
            for(int i=0;i<decisonResponseModel.comments.length;i++) {
              userAndCommentsList.add(TalkingPointsComments(
                  comment: decisonResponseModel.comments[i].comment,
                  id:decisonResponseModel.comments[i].id ,
                  commentedId: decisonResponseModel.comments[i].commentedId,
                  user_image: decisonResponseModel.comments[i].user_image!=null?decisonResponseModel.comments[i].user_image:"",
                  user_name:decisonResponseModel.comments[i].user_name!=null?decisonResponseModel.comments[i].user_name:"",
                  createdAt: decisonResponseModel.comments[i].createdAt));
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
  }


  void addComment(String token,String note) {
    load();
    meetingRepository = new MeetingRepository();
    Future<List<AddCommentResponseModel>> allList = meetingRepository.addCommentTalkingPoint(baseUrl,token,widget.decisionId,new AddCommentRequestModel(comment: note));
    allList.then((value) {
      setState(() {
        if (value != null) {
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

  void deleteComment(String token, int id) {
    load();
    meetingRepository = new MeetingRepository();
    Future<DeleteCommentResponse> allList = meetingRepository.deleteComment(baseUrl,id,token);
    allList.then((value) {
      setState(() {
        if (value != null) {

          showSuccessMsg("Deleted Successfully");
          getDescisionData(baseUrl,userToken);
         
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
    // print("commentId>>"+leave.commentedId.toString());
    return InkWell(
      onTap: () {

        print(""+leave.id.toString());
      },
      child: Container(
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
                    const SizedBox(height: 10,),
                    userId==int.parse(leave.commentedId)?
                    InkWell(
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
                    )
                        :Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  int userId=0;
  String baseUrl="";

  @override
  void initState() {
    getUser().then((value) {
      userId=value.id;
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
                    // getDescisionData(baseUrl,userToken);
                    getOfflineComments();
                  }else{
                    getOfflineTalkingPoint();
                  }
                });
              });

          });
        });
      });
    });
  }

  Future getOfflineTalkingPoint() async {
    var orgainzationsFuture = dbHelper.getTalkingPointColumn(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.TALIKIN_POINTS+widget.decisionId.toString());
    orgainzationsFuture.then((data) {
      setState(()  {
        // this.offlineMeetings = data;
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.TALIKIN_POINTS+widget.decisionId.toString()) {
            setState(() {
              TalkingPointsResponseModel value =  TalkingPointsResponseModel.fromJson(json.decode(localModel.talkingPoint));
              decisonResponseModel = value;
              if(decisonResponseModel.comments!=null&&decisonResponseModel.comments.isNotEmpty){
                for(int i=0;i<decisonResponseModel.comments.length;i++) {
                  userAndCommentsList.add(TalkingPointsComments(
                      comment: decisonResponseModel.comments[i].comment,
                      id:decisonResponseModel.comments[i].id ,
                      commentedId: decisonResponseModel.comments[i].commentedId,
                      user_image: decisonResponseModel.comments[i].user_image!=null?decisonResponseModel.comments[i].user_image:"",
                      user_name:decisonResponseModel.comments[i].user_name!=null?decisonResponseModel.comments[i].user_name:"",
                      createdAt: decisonResponseModel.comments[i].createdAt));
                }
              }
            });
            break;
          }
          // allFilterdMeetingList = allMeetingList;
        }
      });
    });
  }

  Future<bool> addOrUpdateOfflineTalkingPoint(String string) async {
    // var orgainzationsFuture = dbHelper.getOfflineData();
    var orgainzationsFuture = dbHelper.getTalkingPointColumn(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.TALIKIN_POINTS+widget.decisionId.toString());
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        OfflineDataLocalModel localModel =data[i];
        if(localModel.url==baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.TALIKIN_POINTS+widget.decisionId.toString()) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      print("inserstinserst>>"+m.toString());
      if(m){
        var result = await dbHelper.updateTalkingPoint(baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.TALIKIN_POINTS+widget.decisionId.toString(),string);
      }else{
        var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          url: baseUrl+Constants.MEETINGS_DETAILS+widget.meetingId.toString()+Constants.TALIKIN_POINTS+widget.decisionId.toString(),
          talkingPoint: string,
        ));
      }
    });
  }

  //For Add Comment << __________________________________________________________

  Future<int> addOfflineComment(String comment) async {
    var result = await dbHelper.insertRequestsData(DecisionTableOffline(
      url: baseUrl+"talkingpoints/"+widget.decisionId.toString()+Constants.MultipleDecisionsComments,
      addDecisionComment: comment,
    ));
    print("result>>"+result.toString());
    return result;
  }

  Future<bool> addOfflineCommentToAPi(List<AddCommentRequestModel> model) {
    bool m = false ;
    load();
    meetingRepository = new MeetingRepository();
    Future<List<AddCommentResponseModel>> allList = meetingRepository.addMultipleTalkingPointComments(baseUrl,userToken,widget.decisionId,model);
    allList.then((value) {
      setState(() {
        if (value != null) {
          dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+"talkingpoints/"+widget.decisionId.toString()+Constants.MultipleDecisionsComments]);
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
    var orgainzationsFuture = dbHelper.getDecisionComment(baseUrl+"talkingpoints/"+widget.decisionId.toString()+Constants.MultipleDecisionsComments);
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
      url: baseUrl+Constants.DeleteMultipleComments+"talkingpoints/"+widget.decisionId.toString(),
      deleteDecisionComment: commentId,
    ));
    print("resultmmmm>"+result.toString());
  }

  Future<bool> getOfflineDeleteComments() async {
    var orgainzationsFuture = dbHelper.getDeleteDecisionComment(baseUrl+Constants.DeleteMultipleComments+"talkingpoints/"+widget.decisionId.toString());
    orgainzationsFuture.then((data) async {
      print("lemgthHere>>"+data.toString());
      if(data.isNotEmpty) {
        await deleteOfflineCommentToAPi(userToken,data);
      }else{
        // getOfflineVote();
        getDescisionData(baseUrl,userToken);
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
          dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+Constants.DeleteMultipleComments+"talkingpoints/"+widget.decisionId.toString()]);
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
        // getOfflineVote();
        getDescisionData(baseUrl,userToken);
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
      TalkingPointsComments modelComments = new TalkingPointsComments();
      modelComments.id = id;
      // modelComments.id = null;
      modelComments.user_image = userImage;
      modelComments.comment = comment;
      modelComments.user_name = userName;
      modelComments.createdAt = date;
      modelComments.commentedId = userId.toString();
      decisonResponseModel.comments.add(modelComments);
      userAndCommentsList.add(TalkingPointsComments(
          comment: modelComments.comment,
          id: modelComments.id,
          commentedId: modelComments.commentedId,
          user_image:  modelComments.user_image != null ? modelComments.user_image : "",
          user_name:  modelComments.user_name != null ? modelComments.user_name : "",
          createdAt: modelComments.createdAt));
      writeCommentControler.text="";
      String dataString= json.encode(decisonResponseModel.toJson());
      addOrUpdateOfflineTalkingPoint(dataString);
    });
  }

  fillDeleteComments(int index,int id,String comment,int num) {
    setState(() {
      decisonResponseModel.comments.removeWhere((item) => item.id == id);
      userAndCommentsList.removeAt(index);
      String dataString= json.encode(decisonResponseModel.toJson());
      addOrUpdateOfflineTalkingPoint(dataString);
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
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.chevron_left,color: Colors.black,size: 40,)),

                      Image.asset("assets/images/ic_talkingpoint.webp",width: 24,height: 24,color: Colors.black,),

                      Container(
                        child: Text(
                          // AppLocalizations.of(context).lblTalkingPoints,
                          AppLocalizations.of(context).lblAgenda,
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
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            decisonResponseModel!=null?
                            leaveRowForTalikingPoints(context, decisonResponseModel, 0):Container(),
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
                                        Text(AppLocalizations.of(context).lblShowTo, style: blueColorBoldStyle(22),),
                                        const SizedBox(height: 4,),
                                        decisonResponseModel!=null&&decisonResponseModel.viewers!=null? SizedBox(
                                          height: 40,
                                          child:decisonResponseModel.viewers!=null? ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: decisonResponseModel.viewers.length,
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
                                                          decisonResponseModel.viewers!=null?decisonResponseModel.viewers[index].user!=null?
                                                          decisonResponseModel.viewers[index].user.image!=null?!decisonResponseModel.viewers[index].user.image.contains(".html")?decisonResponseModel.viewers[index].user.image:
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
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
                                        Text(AppLocalizations.of(context).lblPresenter, style: blueColorBoldStyle(22),),
                                        const SizedBox(height: 4,),
                                        decisonResponseModel!=null&&decisonResponseModel.presenters!=null? SizedBox(
                                          height: 40,
                                          child:decisonResponseModel.presenters!=null? ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: decisonResponseModel.presenters.length,
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
                                                          decisonResponseModel.presenters!=null&&decisonResponseModel.presenters[index].user!=null?
                                                          decisonResponseModel.presenters[index].user.image!=null?!decisonResponseModel.presenters[index].user.image.contains(".html")?decisonResponseModel.presenters[index].user.image:
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
                                        Text(AppLocalizations.of(context).lblDuration, style: blueColorBoldStyle(22),),
                                        const SizedBox(height: 12,),
                                        // Text(decisonResponseModel.deadline!=null?
                                        // getFormattedDate(stringToDateTime(decisonResponseModel.deadline)):"2021 oct ",style:
                                        // grayTextColorStyleMedium(18),)
                                        Text(decisonResponseModel.duration!=null?durationToString(decisonResponseModel.duration):"",style:
                                        grayTextColorStyleMedium(18),)
                                      ],
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
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(AppLocalizations.of(context).lblDescription,
                                        style: blueColorBoldStyle(20),),
                                      const SizedBox(height: 14,),
                                      Container(
                                        width: MediaQuery.of(context).size.width/2+50,
                                        child: Text(decisonResponseModel.description!=null?decisonResponseModel.description:"description",
                                          style: blueColorStyleMedium(20),
                                          // maxLines: 20,
                                        ),
                                      ),
                                    ],
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
                                      makeBodyForAttachmentsTalkingPoints("talking",widget.meetingId,widget.decisionId,context, decisonResponseModel.attachments, 0):Container()
                                    ],
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
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(AppLocalizations.of(context).lblComments+" ( "+
                                      (decisonResponseModel.comments==null?0.toString():
                                      decisonResponseModel.comments.length.toString())+" )", style: blueColorBoldStyle(20),),
                                  const SizedBox(height: 14,),

                                  makeBodyForTalkingPointsComments(context, userAndCommentsList, 0)
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
                                          width:MediaQuery.of(context).size.width/2-80,
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


                      const SizedBox(width: 20,),


                      Expanded(
                        flex: 3,
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
                                      child: Text(AppLocalizations.of(context).lblSupPoints, style: blueColorBoldStyle(20),)),

                                  const SizedBox(height: 10,),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    color: grayTextColor,height: 0.4,),

                                  decisonResponseModel.subpoints!=null?  makeBodyForSubPointsTalkingPoints(context,decisonResponseModel.subpoints,1):Container(),
                                  const SizedBox(height: 20,),


                                ],
                              ),
                            ),


                            const SizedBox(height: 20,),


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

