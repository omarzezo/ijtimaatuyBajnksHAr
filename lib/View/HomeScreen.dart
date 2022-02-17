import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/LocaleHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/Event.dart';
import 'package:itimaaty/Models/all_meetings_response.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Repository/HomeRepository.dart';
import 'package:itimaaty/Repository/MeetingRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/View/AllMeetingsScreen.dart';
import 'package:itimaaty/View/DrawerWidget.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/SignInScreen.dart';
import 'package:itimaaty/Widgets/HomeWidgets.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'MotherScreen.dart';

class HomeScreen extends StatefulWidget {
// String lang;
// HomeScreen(this.lang);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool onDaySelected=true;
  Map<DateTime, List<Event>> selectedEvents;
  List<DateTime> allDates=[];

  var controllerScroll=ScrollController();
  bool _passwordVisible= false;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  DashboardResponseModel dashboardResponseModel;
  List<Pending> pendingList =new List<Pending>();
  List<Ongoing> onGoingList =new List<Ongoing>();
  List<Draft> draftList =new List<Draft>();
  List<Talkingpoints> talkingpointsList =new List<Talkingpoints>();
  List<Decision> decisionList =new List<Decision>();
  List<ActionResponse> actionList =new List<ActionResponse>();
  int lineColor=0;

  AnimationController _controller;
  Animation<double> _animation;
  CalendarController _controllerCalender;
  double width;
  double height;

  double _angle = 0;
  bool isPlaying = false;
  bool isExpandedTalkingPoints =true;
  bool isExpandedDecisions =true;
  bool isExpandedActions =true;
  MeetingRepository meetingRepository;
  List<AllMeetingsResponse> allMeetingList =[];
  List<AllMeetingsResponse> newallMeetingList = [];

  void getAllMeetings(String token) {
    load();
    meetingRepository = new MeetingRepository();
    Future<List<AllMeetingsResponse>> allList = meetingRepository.getAllMeetings(token);
    allList.then((value) {
      setState(() {
        if (value != null) {
          showSuccess();
          allMeetingList = value;
          for(int i=0;i<allMeetingList.length;i++){
            DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(allMeetingList[i].startDate);
            // print("tempDatetempDate>>"+tempDate.toString());
            // allMeetingList[i].status;
            allDates.add(tempDate);

            if (selectedEvents[tempDate] != null) {
              selectedEvents[tempDate].add(Event(
                  // title: allMeetingList[i].attendanceStatus!=null?allMeetingList[i].attendanceStatus:"",
                  title: allMeetingList[i].status!=null?allMeetingList[i].status.name:"",
                  bgColor:allMeetingList[i].status!=null?allMeetingList[i].status.bgcolor:"#000000"),);
              // print("selectedEvents1>>"+selectedEvents.toString());
            } else {
              selectedEvents[tempDate] = [Event(
                  // title: allMeetingList[i].attendanceStatus!=null?allMeetingList[i].attendanceStatus:"",
                  title: allMeetingList[i].status!=null?allMeetingList[i].status.name:"",
                  bgColor:allMeetingList[i].status!=null?allMeetingList[i].status.bgcolor:"#000000")];
              // print("selectedEvents2>>"+selectedEvents.toString());
            }

          }
          // print("allMeetingList>>"+allMeetingList.toString());
        }else{
          showError();
        }
      });
    });
  }

  void getDashboardData(String token) {
    load();
    HomeRepository allProductsRepository = new HomeRepository();
    Future<DashboardResponseModel> allList = allProductsRepository.getDashboardData(token);
    allList.then((value) {
      setState(() {
        if(value!=null){
          showSuccess();
          dashboardResponseModel=value;
          pendingList=value.pending;
          onGoingList=value.ongoing;
          draftList=value.draft;
          talkingpointsList=value.talkingpoints;
          decisionList=value.decision;
          actionList=value.action;
          print("goingCounIS>>"+value.toString());
          // print("goingCounIS>>"+value.ongoing[0].title);
          // if(value.counts!=null){
          //   print("goingCounIS>>"+value.counts.going.toString());
          // }
        }else{
          showError();
          print("dddddddd");
          navigateAndFinish(context, SignInScreen());
        }
      });

    }).then((value) {
       getAllMeetings( token) ;
    });
  }

  _toggleContainer() {
    print(_animation.status);
    if (_animation.status != AnimationStatus.completed) {
      _controller.forward();
    } else {
      _controller.animateBack(0, duration: Duration(seconds: 1));
    }
  }
  String userName="",userImage="";
  String firstChar="";
  String secondChar="";
  double widthPadding=0;

  void openBottomSheet(String date,BuildContext _context){
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
              child: Row(
                children: [
                  Expanded(flex:4,child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(color: Colors.transparent,))),
                  Expanded(
                    flex:2,
                    child: Container(
                      // height: height,
                      // margin: EdgeInsets.only(left: width*(2/3)),
                      width: MediaQuery.of(_context).size.width,
                      // color: Colors.transparent,
                      color: Colors.white,
                      child:Column(
                        children: [
                          Container(height:40 ,),
                          Container(
                            margin:EdgeInsets.only(left: 20,right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    child:Text(date.toString(),style: TextStyle(
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
                          Expanded(
                            child: Container(
                              margin:EdgeInsets.only(left: 20,right: 20,bottom: 20),
                              child: SingleChildScrollView(
                                child: makeBodyForAllmeetings(_context, newallMeetingList),
                              ),
                            ),
                          ),
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

    Future<List> makeListForSheet(DateTime dateSelect) async{
      if (allMeetingList != null && allMeetingList.isNotEmpty) {
        for(int i=0;i<allMeetingList.length;i++){
          DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(allMeetingList[i].startDate);
          if(dateSelect==tempDate){
          await  newallMeetingList.add(allMeetingList[i]);
            print("NewList>>"+newallMeetingList.toList().toString());
          }
        }
      }
      return newallMeetingList;
    }

  @override
  void initState() {
    selectedEvents = {};
    _controllerCalender = CalendarController();
    Constants.draweItem="home";
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );

    setState(() {
      SharedPreferencesHelper.getLoggedToken().then((valueFirst) {
        print("valueTokenIs>>"+valueFirst.toString());
        SharedPreferencesHelper.getLoggedUserName().then((valueSecond) {
          SharedPreferencesHelper.getUserImageUrl().then((value) {
            // firstChar=valueSecond.split(" ");
           for(int i=0;i<valueSecond.split(" ").length ;i++){
             firstChar+=valueSecond.split(" ")[i][0];
           }
            userName=valueSecond;
            userImage=value;
            getDashboardData(valueFirst);
          });
        });
      });
    });
  }


  void handleArabic(){
    setState(() {
      if (AppLocalizations.of(context).locale == "en") {
        this.setState((){
          print("ar");
          helper.onLocaleChanged(new Locale("ar"));
        });
      } else {
        this.setState((){
          print("En");
          helper.onLocaleChanged(new Locale("en"));
        });
      }
      print("Logout");
      setState(() {
        SharedPreferencesHelper.setLanguageCode("ar");
      });

    });
  }
  void handleEnglish(){
    setState(() {
      if (AppLocalizations.of(context).locale == "en") {
        this.setState((){
          print("ar");
          helper.onLocaleChanged(new Locale("ar"));
        });
      } else {
        this.setState((){
          print("En");
          helper.onLocaleChanged(new Locale("en"));
        });
      }
      print("Logout");
      setState(() {
        SharedPreferencesHelper.setLanguageCode("en");
      });
    });
  }

  void handleClick(String value) {
    switch (value) {
      case 'العربيه':
        print("here1");
        handleArabic();
        break;
      case 'English':
        print("here2");
        handleEnglish();
        break;
    }
  }


  String letter = 'العربيه';
  Widget buildPopupMenuButton() {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      initialValue: letter,
      onSelected: (val) {
        setState(() {
          letter = val;
        });
      },
      child: ListTile(
        title: Text('The letter $letter'),
      ),
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<String>>[
          PopupMenuItem<String>(
            value: 'العربيه',
            child: Text("العربيه",style: blueColorBoldStyle(20),),
          ),
          PopupMenuItem<String>(
            value: 'English',
            child: Text("English",style: blueColorBoldStyle(20),),
          ),
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    // widthPadding=width/(2/3);
    height = MediaQuery.of(context).size.height;

    return  Scaffold(
      // resizeToAvoidBottomInset: true,
      // key: w_scaffoldKey,
      key: _scaffoldKey,
      drawer: DrawerWidget(0),
      backgroundColor: grayColor,
      body: Container(
        margin: EdgeInsets.only(left: 24,right: 24),
        child: Column(
          children: [
            const SizedBox(height:50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          print("sddsd");

                          if (_scaffoldKey.currentState.isDrawerOpen) {
                            _scaffoldKey.currentState.openEndDrawer();
                          } else {
                            _scaffoldKey.currentState.openDrawer();
                          }
                        },
                        child: Icon(Icons.menu,color: Colors.black,size: 30,)),
                    const SizedBox(width: 10,),
                    Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Text(AppLocalizations.of(context).lblHomeLabel,style: blueColorBoldStyle(width<600?22:30),)),
                  ],
                ),
                Row(
                  children: [
                    // buildPopupMenuButton()
                    PopupMenuButton<String>(
                      onSelected: handleClick,
                      // initialValue: AppLocalizations.of(context).locale=="en"?"English":"العربيه",
                      icon:Icon( Icons.language,size: 36,),
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuItem<String>>[
                          PopupMenuItem<String>(
                            value: 'العربيه',
                            child: Row(
                              children: [
                                Container(child: Text("العربيه",style: blueColorBoldStyle(20),),
                                    margin:EdgeInsets.only(top: 8)),
                                const SizedBox(width: 20,),
                                AppLocalizations.of(context).locale=="ar"? Icon(Icons.check,color: yellowColor,size: 30,):Container()
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'English',
                            child: Row(
                              children: [
                                Container(
                                    child: Text("English",style: blueColorBoldStyle(20),),
                                    margin:EdgeInsets.only(top: 8)),
                                const SizedBox(width: 20,),
                                AppLocalizations.of(context).locale=="en"? Icon(Icons.check,color: yellowColor,size: 30):Container()
                              ],
                            ),
                          ),
                        ];
                      },
                    ),
                    const SizedBox(width: 20,),
                    CircleAvatar(
                      radius: 24.0,
                      backgroundImage:
                      NetworkImage(userImage),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),

              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                // physics: AlwaysScrollableScrollPhysics (),
                // physics: ScrollPhysics (),
                // controller: controllerScroll,
                child: LayoutBuilder(builder: (context, constraints) {
                  print("WidthIs>>"+constraints.maxWidth.toString());
                  if (constraints.maxWidth<600) {
                     return Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[

                         Container(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const SizedBox(height: 30,),

                               // Text(AppLocalizations.of(context).lblOverview,style: blueColorBoldStyle(22),),
                               Text(userName,style: blueColorBoldStyle(22),),

                               Container(
                                 padding: EdgeInsets.all(16),
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: new BorderRadius.circular(10.0),
                                     border: Border.all(
                                         color: grayRoundedColor,// set border color
                                         width: 1.0
                                     )
                                 ),
                                 child:Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Row(
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       mainAxisSize: MainAxisSize.max,
                                       children: <Widget>[
                                         Container(
                                           padding: EdgeInsets.all(10),
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(10.0),
                                             gradient: LinearGradient(
                                               begin: Alignment.topRight,
                                               end: Alignment.bottomLeft,
                                               stops: [0.1, 0.9],
                                               colors: [
                                                 gray2,
                                                 gray2,
                                               ],
                                             ),
                                           ),
                                           child: Icon(Icons.meeting_room,size: 24,),
                                         ),
                                         const SizedBox(width: 12,),
                                         Center(child: Text(dashboardResponseModel!=null?
                                         dashboardResponseModel.upcoming.toString():"",style: blueColorBoldStyle(22),)),
                                         const SizedBox(width: 12,),
                                         Text("Upcoming Meetings",style: grayTextColorStyleBlack(16),),
                                       ],
                                     ),
                                     InkWell(
                                       onTap: () {
                                         Navigator.pop(context);
                                         navigateTo(context, MotherScreen(1));
                                       },
                                       child: Container(
                                         padding: EdgeInsets.all(8),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10.0),
                                           gradient: LinearGradient(
                                             begin: Alignment.topRight,
                                             end: Alignment.bottomLeft,
                                             stops: [0.1, 0.9],
                                             colors: [
                                               yellowLightColor,
                                               yellowLightColor,
                                             ],
                                           ),
                                         ),
                                         child: Text(
                                           AppLocalizations.of(context).lblSeeAll,
                                           style: yellowColorStyleBold(16),
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                               const SizedBox(height: 16,),
                               Row(
                                 children: [
                                   Expanded(
                                     flex: 1,
                                     child: Container(
                                       width: MediaQuery.of(context).size.width * 0.25,
                                       padding: EdgeInsets.all(14),
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: new BorderRadius.circular(10.0),
                                           border: Border.all(
                                               color: grayRoundedColor,// set border color
                                               width: 1.0
                                           )
                                       ),
                                       child:Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Row(
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             mainAxisSize: MainAxisSize.max,
                                             children: <Widget>[
                                               Container(
                                                 padding: EdgeInsets.all(12),
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(10.0),
                                                   gradient: LinearGradient(
                                                     begin: Alignment.topRight,
                                                     end: Alignment.bottomLeft,
                                                     stops: [0.1, 0.9],
                                                     colors: [
                                                       Color(0xffe5faf2),
                                                       Color(0xffe5faf2),
                                                     ],
                                                   ),
                                                 ),
                                                 child: Icon(Icons.check,size: 24,color: Color(0xff61e2b0),),
                                               ),
                                               const SizedBox(width: 12,),
                                               Column(
                                                 children: [
                                                   Center(child: Text(dashboardResponseModel!=null?
                                                   dashboardResponseModel.counts!=null?dashboardResponseModel.counts.going.toString():"":"",style: blueColorBoldStyle(18),)),
                                                   const SizedBox(height: 2,),

                                                   Text(AppLocalizations.of(context).lblGoing,
                                                     style: TextStyle(
                                                     color: grayTextColor ,
                                                     fontFamily: "black",
                                                     fontSize: 14,
                                                   ),),
                                                 ],
                                               )
                                             ],
                                           ),

                                         ],
                                       ),
                                     ),
                                   ),
                                   const SizedBox(width: 16,),
                                   Expanded(
                                     flex: 1,
                                     child:  Container(
                                       width: MediaQuery.of(context).size.width * 0.25,
                                       padding: EdgeInsets.all(14),
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: new BorderRadius.circular(10.0),
                                           border: Border.all(
                                               color: grayRoundedColor,// set border color
                                               width: 1.0
                                           )
                                       ),
                                       child:Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Row(
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             mainAxisSize: MainAxisSize.max,
                                             children: <Widget>[
                                               Container(
                                                 padding: EdgeInsets.all(12),
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(10.0),
                                                   gradient: LinearGradient(
                                                     begin: Alignment.topRight,
                                                     end: Alignment.bottomLeft,
                                                     stops: [0.1, 0.9],
                                                     colors: [
                                                       Color(0xfffff0f2),
                                                       Color(0xfffff0f2),
                                                     ],
                                                   ),
                                                 ),
                                                 child: Icon(Icons.clear,size: 24,color: Color(0xffff6a81),),
                                               ),
                                               const SizedBox(width: 12,),
                                               Column(
                                                 children: [
                                                   Center(child: Text(dashboardResponseModel!=null?
                                                   dashboardResponseModel.counts==null?"": dashboardResponseModel.counts.notgoing.toString():"",style: blueColorBoldStyle(18),)),
                                                   const SizedBox(height: 2,),
                                                   Text(AppLocalizations.of(context).lblNotGoing,style: grayTextColorStyleBlack(14),),
                                                 ],
                                               )
                                             ],
                                           ),

                                         ],
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                               const SizedBox(height: 16,),
                               Row(
                                 children: [
                                   Expanded(
                                     flex: 1,
                                     child: Container(
                                       width: MediaQuery.of(context).size.width * 0.25,
                                       padding: EdgeInsets.all(14),
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: new BorderRadius.circular(10.0),
                                           border: Border.all(
                                               color: grayRoundedColor,// set border color
                                               width: 1.0
                                           )
                                       ),
                                       child:Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Row(
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             mainAxisSize: MainAxisSize.max,
                                             children: <Widget>[
                                               Container(
                                                 padding: EdgeInsets.all(12),
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(10.0),
                                                   gradient: LinearGradient(
                                                     begin: Alignment.topRight,
                                                     end: Alignment.bottomLeft,
                                                     stops: [0.1, 0.9],
                                                     colors: [
                                                       Color(0xfffff9e6),
                                                       Color(0xfffff9e6),
                                                     ],
                                                   ),
                                                 ),
                                                 child: Icon(Icons.check,size: 24,color: yellowColor,),
                                               ),
                                               const SizedBox(width: 12,),
                                               Column(
                                                 children: [
                                                   Center(child: Text(dashboardResponseModel!=null?
                                                   dashboardResponseModel.counts==null?"":dashboardResponseModel.counts.pending.toString():"",style: blueColorBoldStyle(18),)),
                                                   const SizedBox(height: 2,),
                                                   Text(AppLocalizations.of(context).lblPendingS,style: grayTextColorStyleBlack(14),),
                                                 ],
                                               )
                                             ],
                                           ),

                                         ],
                                       ),
                                     ),
                                   ),
                                   const SizedBox(width: 16,),
                                   Expanded(
                                     flex: 1,
                                     child:  Container(
                                       width: MediaQuery.of(context).size.width * 0.25,
                                       padding: EdgeInsets.all(14),
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: new BorderRadius.circular(10.0),
                                           border: Border.all(
                                               color: grayRoundedColor,// set border color
                                               width: 1.0
                                           )
                                       ),
                                       child:Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                         children: [
                                           Row(
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             mainAxisSize: MainAxisSize.max,
                                             children: <Widget>[
                                               Container(
                                                 padding: EdgeInsets.all(12),
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(10.0),
                                                   gradient: LinearGradient(
                                                     begin: Alignment.topRight,
                                                     end: Alignment.bottomLeft,
                                                     stops: [0.1, 0.9],
                                                     colors: [
                                                       Color(0xffebf2fe),
                                                       Color(0xffebf2fe),
                                                     ],
                                                   ),
                                                 ),
                                                 child: Icon(Icons.height,size: 24,color: Color(0xff3e82f7),),
                                               ),
                                               const SizedBox(width: 12,),
                                               Column(
                                                 children: [
                                                   Center(child: Text(dashboardResponseModel!=null?
                                                   dashboardResponseModel.counts==null?"":dashboardResponseModel.counts.maybe.toString():"",style: blueColorBoldStyle(18),)),
                                                   const SizedBox(height: 2,),
                                                   Text(AppLocalizations.of(context).lblMayBe,style: grayTextColorStyleBlack(14),),
                                                 ],
                                               )
                                             ],
                                           ),

                                         ],
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                               const SizedBox(height: 40,),
                               Text(AppLocalizations.of(context).lblMeetings,style: blueColorBoldStyle(22),),
                               const SizedBox(height: 20,),
                               Row(
                                 children: [
                                   InkWell(
                                       onTap: () {
                                         setState(() {
                                           lineColor=0;
                                         });
                                       },
                                       child: Text(AppLocalizations.of(context).lblOnGoing,style: grayTextColorStyleMedium(20),)),
                                   const SizedBox(width: 20,),
                                   InkWell(
                                       onTap: () {
                                         setState(() {
                                           lineColor=1;
                                         });
                                       },
                                       child: Text(AppLocalizations.of(context).lblPending,style: grayTextColorStyleMedium(20),)),
                                   const SizedBox(width: 20,),
                                   InkWell(
                                       onTap: () {
                                         setState(() {
                                           lineColor=2;
                                         });
                                       },
                                       child: Text(AppLocalizations.of(context).lblDraft,style: grayTextColorStyleMedium(20),)),
                                 ],
                               ),
                               const SizedBox(height: 6,),
                               // Row(
                               //   children: [
                               //     Container(width: 80,height: 2,color: lineColor==0?yellowColor:gray2),
                               //     Container(width: 10,height: 2,color: gray2),
                               //     Container(width: 70,height: 2,color: lineColor==1?yellowColor:gray2),
                               //     Container(width: 18,height: 2,color: gray2),
                               //     Container(width: 60,height: 2,color: lineColor==2?yellowColor:gray2),
                               //     Container(width: MediaQuery.of(context).size.width-300,height: 2,color: gray2),
                               //   ],
                               // ),
                               lineColor==0?makeBodyForOnGoing(context, onGoingList):lineColor==1?makeBodyForPending(context, pendingList):makeBodyForDraft(context, draftList),
                               const SizedBox(height: 30,),
                             ],
                           ),
                         ),



                         Container(child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             // Text(AppLocalizations.of(context).lblMyAgenda,style: blueColorBoldStyle(22),),
                             const SizedBox(height: 16,),
                             InkWell(
                               onTap: () {
                                 print(";;;;;");
                                 setState(() {
                                   _toggleContainer();
                                   if(isExpandedTalkingPoints){
                                     isExpandedTalkingPoints=false;
                                   }else{
                                     isExpandedTalkingPoints=true;
                                   }
                                 });
                               },
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                       Icon(Icons.call_to_action_outlined,size: 20,color: Colors.grey,),
                                       const SizedBox(width: 14,),
                                       Container( margin: EdgeInsets.only(top: 4),
                                           child: Text(AppLocalizations.of(context).lblTalkingPoints,style: grayTextColorStyleBlack(18),)),
                                     ],
                                   ),

                                   isExpandedTalkingPoints?
                                   Icon(Icons.keyboard_arrow_down_outlined,size: 30,color: grayTextColor,):
                                   Icon(Icons.arrow_forward_ios,size: 16,color: grayTextColor,),
                                 ],
                               ),
                             ),
                             isExpandedTalkingPoints?makeBodyForTalkingpoints(context, talkingpointsList):
                             Container(),
                             const SizedBox(height: 30,),

                             InkWell(
                               onTap: () {
                                 print(";;;;;");
                                 setState(() {
                                   _toggleContainer();
                                   if(isExpandedDecisions){
                                     isExpandedDecisions=false;
                                   }else{
                                     isExpandedDecisions=true;
                                   }
                                 });
                               },
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                       Image.asset("assets/images/ic_decisions.webp",width: 24,height: 24),
                                       const SizedBox(width: 14,),
                                       Container( margin: EdgeInsets.only(top: 4),
                                           child: Text(AppLocalizations.of(context).lblDesisions,style: grayTextColorStyleBlack(22),)),
                                     ],
                                   ),

                                   isExpandedDecisions?
                                   Icon(Icons.keyboard_arrow_down_outlined,size: 30,color: grayTextColor,):
                                   Icon(Icons.arrow_forward_ios,size: 16,color: grayTextColor,),
                                 ],
                               ),
                             ),
                             isExpandedDecisions?makeBodyForDecisions(context, decisionList):
                             Container(),
                             const SizedBox(height: 30,),

                             InkWell(
                               onTap: () {
                                 print(";;;;;");
                                 setState(() {
                                   _toggleContainer();
                                   if(isExpandedActions){
                                     isExpandedActions=false;
                                   }else{
                                     isExpandedActions=true;
                                   }
                                 });
                               },
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                     children: [
                                       Image.asset("assets/images/ic_action.webp",width: 24,height: 24),
                                       const SizedBox(width: 14,),
                                       Container( margin: EdgeInsets.only(top: 4),
                                           child: Text(AppLocalizations.of(context).lblActions,style: grayTextColorStyleBlack(22),)),
                                     ],
                                   ),

                                   isExpandedActions?
                                   Icon(Icons.keyboard_arrow_down_outlined,size: 30,color: grayTextColor,):
                                   Icon(Icons.arrow_forward_ios,size: 16,color: grayTextColor,),
                                 ],
                               ),
                             ),
                             isExpandedActions?makeBodyForActions(context, actionList):
                             Container(),
                             const SizedBox(height: 30,)
                           ],
                         ),)




                       ],

                     );
                  }else{
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Expanded(
                          flex:8,
                          child: Container(
                            // width:constraints.maxWidth - (constraints.maxWidth*(1/3))-100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // const SizedBox(height: 30,),
                                // // Text(AppLocalizations.of(context).lblOverview,style: blueColorBoldStyle(28),),
                                // Text(userName,style: blueColorBoldStyle(28),),
                                const SizedBox(height: 10,),

                                Row(
                                  children: [
                                    Expanded(
                                      flex:4,
                                      child: Container(
                                        margin: EdgeInsets.only(top:0),
                                        padding: EdgeInsets.only(top: 20,bottom:90,left:16,right:16),
                                        // height: 276,
                                        // padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: new BorderRadius.circular(10.0),
                                            border: Border.all(
                                                color: grayRoundedColor, // set border color
                                                width: 1.0
                                            )
                                        ),
                                        child:Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                margin: EdgeInsets.only(top: 16),
                                                child: Text(AppLocalizations.of(context).lblWelcomeTo+userName.toString(),
                                                  style: blueColorBoldStyle(24),)),

                                            Container(
                                                margin: EdgeInsets.only(top: 16),
                                                child: Text(AppLocalizations.of(context).lblCheckOut,
                                                  style: grayTextColorStyleBlack(20),))
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    Expanded(
                                      flex:5,
                                      child: Container(
                                        // height:280,
                                        margin: EdgeInsets.only(top:30),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(left: 16,right:16,top:28,bottom:24),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: new BorderRadius.circular(10.0),
                                                  border: Border.all(
                                                      color: grayRoundedColor, // set border color
                                                      width: 1.0
                                                  )
                                              ),
                                              child:Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: <Widget>[
                                                      Container(
                                                        padding: EdgeInsets.all(8),
                                                        // margin: EdgeInsets.only(top: 4),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10.0),
                                                          gradient: LinearGradient(
                                                            begin: Alignment.topRight,
                                                            end: Alignment.bottomLeft,
                                                            stops: [0.1, 0.9],
                                                            colors: [
                                                              gray2,
                                                              gray2,
                                                            ],
                                                          ),
                                                        ),
                                                        child: Icon(Icons.meeting_room,size: 20,),
                                                      ),
                                                      const SizedBox(width: 12,),
                                                      Container(
                                                        margin: EdgeInsets.only(top: 6),
                                                        child: Center(child: Text(dashboardResponseModel!=null?
                                                        dashboardResponseModel.upcoming.toString():"",style: blueColorBoldStyle(22),)),
                                                      ),
                                                      const SizedBox(width: 12,),
                                                      Container(
                                                          margin: EdgeInsets.only(top: 6),
                                                          child: Text(AppLocalizations.of(context).lblUpcomingMeetings,style: grayTextColorStyleBlack(19),)),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      // Navigator.pop(context);
                                                      print("gddddhfhfhfhfh");
                                                      navigateTo(context, AllMeetingsScreen());
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 8),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                        gradient: LinearGradient(
                                                          begin: Alignment.topRight,
                                                          end: Alignment.bottomLeft,
                                                          stops: [0.1, 0.9],
                                                          colors: [
                                                            yellowLightColor,
                                                            yellowLightColor,
                                                          ],
                                                        ),
                                                      ),
                                                      child: Text(
                                                        AppLocalizations.of(context).lblSeeAll,
                                                        style: yellowColorStyleBold(19),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20,),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width * 0.25,
                                                    padding: EdgeInsets.only(left:14,right:14,top:20,bottom:20),
                                                    margin: EdgeInsets.only(top: 4),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: new BorderRadius.circular(10.0),
                                                        border: Border.all(
                                                            color: grayRoundedColor,// set border color
                                                            width: 1.0
                                                        )
                                                    ),
                                                    child:Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: <Widget>[
                                                            Container(
                                                              padding: EdgeInsets.all(12),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10.0),
                                                                gradient: LinearGradient(
                                                                  begin: Alignment.topRight,
                                                                  end: Alignment.bottomLeft,
                                                                  stops: [0.1, 0.9],
                                                                  colors: [
                                                                    Color(0xffe5faf2),
                                                                    Color(0xffe5faf2),
                                                                  ],
                                                                ),
                                                              ),
                                                              child: Icon(Icons.check,size: 24,color: Color(0xff61e2b0),),
                                                            ),
                                                            const SizedBox(width: 12,),
                                                            Column(
                                                              children: [
                                                                Center(child: Text(dashboardResponseModel!=null?
                                                                dashboardResponseModel.counts!=null?dashboardResponseModel.counts.going.toString():"":"",style: blueColorBoldStyle(18),)),
                                                                const SizedBox(height: 2,),
                                                                Text(AppLocalizations.of(context).lblGoingS,style:
                                                                grayTextColorStyleBlack(17),),
                                                              ],
                                                            )
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 16,),
                                                Expanded(
                                                  flex: 1,
                                                  child:  Container(
                                                    width: MediaQuery.of(context).size.width * 0.25,
                                                    padding: EdgeInsets.only(left:14,right:14,top:20,bottom:20),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: new BorderRadius.circular(10.0),
                                                        border: Border.all(
                                                            color: grayRoundedColor,// set border color
                                                            width: 1.0
                                                        )
                                                    ),
                                                    child:Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: <Widget>[
                                                            Container(
                                                              padding: EdgeInsets.all(12),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10.0),
                                                                gradient: LinearGradient(
                                                                  begin: Alignment.topRight,
                                                                  end: Alignment.bottomLeft,
                                                                  stops: [0.1, 0.9],
                                                                  colors: [
                                                                    Color(0xfffff0f2),
                                                                    Color(0xfffff0f2),
                                                                  ],
                                                                ),
                                                              ),
                                                              child: Icon(Icons.clear,size: 24,color: Color(0xffff6a81),),
                                                            ),
                                                            const SizedBox(width: 12,),
                                                            Column(
                                                              children: [
                                                                Center(child: Text(dashboardResponseModel!=null?
                                                                dashboardResponseModel.counts==null?"": dashboardResponseModel.counts.notgoing.toString():"",style: blueColorBoldStyle(18),)),
                                                                const SizedBox(height: 2,),
                                                                Text(AppLocalizations.of(context).lblNotGoingS,style: grayTextColorStyleBlack(17),),
                                                              ],
                                                            )
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 26,),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    width: MediaQuery.of(context).size.width * 0.25,
                                                    padding: EdgeInsets.only(left:14,right:14,top:20,bottom:20),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: new BorderRadius.circular(10.0),
                                                        border: Border.all(
                                                            color: grayRoundedColor,// set border color
                                                            width: 1.0
                                                        )
                                                    ),
                                                    child:Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: <Widget>[
                                                            Container(
                                                              padding: EdgeInsets.all(12),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10.0),
                                                                gradient: LinearGradient(
                                                                  begin: Alignment.topRight,
                                                                  end: Alignment.bottomLeft,
                                                                  stops: [0.1, 0.9],
                                                                  colors: [
                                                                    Color(0xfffff9e6),
                                                                    Color(0xfffff9e6),
                                                                  ],
                                                                ),
                                                              ),
                                                              child: Image.asset("assets/images/ic_pending.webp",width: 24,height: 24),
                                                            ),
                                                            const SizedBox(width: 12,),
                                                            Column(
                                                              children: [
                                                                Center(child: Text(dashboardResponseModel!=null?
                                                                dashboardResponseModel.counts==null?"":dashboardResponseModel.counts.pending.toString():"",style: blueColorBoldStyle(18),)),
                                                                const SizedBox(height: 2,),
                                                                Text(AppLocalizations.of(context).lblPendingS,style: grayTextColorStyleBlack(17),),
                                                              ],
                                                            )
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 16,),
                                                Expanded(
                                                  flex: 1,
                                                  child:  Container(
                                                    width: MediaQuery.of(context).size.width * 0.25,
                                                    padding: EdgeInsets.only(left:14,right:14,top:20,bottom:20),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: new BorderRadius.circular(10.0),
                                                        border: Border.all(
                                                            color: grayRoundedColor,// set border color
                                                            width: 1.0
                                                        )
                                                    ),
                                                    child:Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: <Widget>[
                                                            Container(
                                                              padding: EdgeInsets.all(12),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10.0),
                                                                gradient: LinearGradient(
                                                                  begin: Alignment.topRight,
                                                                  end: Alignment.bottomLeft,
                                                                  stops: [0.1, 0.9],
                                                                  colors: [
                                                                    Color(0xffebf2fe),
                                                                    Color(0xffebf2fe),
                                                                  ],
                                                                ),
                                                              ),
                                                              child: Image.asset("assets/images/ic_maybe.webp",width: 24,height: 24),
                                                            ),
                                                            const SizedBox(width: 12,),
                                                            Column(
                                                              children: [
                                                                Center(child: Text(dashboardResponseModel!=null?
                                                                dashboardResponseModel.counts==null?"":dashboardResponseModel.counts.maybe.toString():"",style: blueColorBoldStyle(18),)),
                                                                const SizedBox(height: 2,),
                                                                Text(AppLocalizations.of(context).lblMayBe,style: grayTextColorStyleBlack(17),),
                                                              ],
                                                            )
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),


                                // const SizedBox(height: 40,),
                                const SizedBox(height: 30,),
                                // Text(AppLocalizations.of(context).lblMyAgenda,style: blueColorBoldStyle(24),),
                                const SizedBox(height: 16,),
                                talkingpointsList.isNotEmpty? InkWell(
                                  onTap: () {
                                    print(";;;;;");
                                    setState(() {
                                      _toggleContainer();
                                      if(isExpandedTalkingPoints){
                                        isExpandedTalkingPoints=false;
                                      }else{
                                        isExpandedTalkingPoints=true;
                                      }
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/images/ic_talkingpoint.webp",width: 24,height: 24),
                                          const SizedBox(width: 14,),
                                          Container( margin: EdgeInsets.only(top: 4),
                                              // child: Text(AppLocalizations.of(context).lblTalkingPoints,style: grayTextColorStyleBlack(22),)),
                                              child: Text(AppLocalizations.of(context).lblAgenda,style: grayTextColorStyleBlack(22),)),
                                        ],
                                      ),

                                      isExpandedTalkingPoints?
                                      Icon(Icons.keyboard_arrow_down_outlined,size: 30,color: grayTextColor,):
                                      Icon(Icons.arrow_forward_ios,size: 16,color: grayTextColor,),
                                    ],
                                  ),
                                ):Container(),
                                isExpandedTalkingPoints?makeBodyForTalkingpoints(context, talkingpointsList):
                                // kk
                                Container(),
                                const SizedBox(height: 30,),
                                decisionList.isNotEmpty?   InkWell(
                                  onTap: () {
                                    print(";;;;;");
                                    setState(() {
                                      _toggleContainer();
                                      if(isExpandedDecisions){
                                        isExpandedDecisions=false;
                                      }else{
                                        isExpandedDecisions=true;
                                      }
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/images/ic_decisions.webp",width: 24,height: 24),
                                          const SizedBox(width: 14,),
                                          Container( margin: EdgeInsets.only(top: 4),
                                              child: Text(AppLocalizations.of(context).lblDesisions,style: grayTextColorStyleBlack(22),)),
                                        ],
                                      ),

                                      isExpandedDecisions?
                                      Icon(Icons.keyboard_arrow_down_outlined,size: 30,color: grayTextColor,):
                                      Icon(Icons.arrow_forward_ios,size: 16,color: grayTextColor,),
                                    ],
                                  ),
                                ):Container(),
                                isExpandedDecisions?makeBodyForDecisions(context, decisionList):

                                Container(),
                                const SizedBox(height: 30,),
                                actionList.isNotEmpty? InkWell(
                                  onTap: () {
                                    print(";;;;;");
                                    setState(() {
                                      _toggleContainer();
                                      if(isExpandedActions){
                                        isExpandedActions=false;
                                      }else{
                                        isExpandedActions=true;
                                      }
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/images/ic_action.webp",width: 24,height: 24),
                                          const SizedBox(width: 14,),
                                          Container( margin: EdgeInsets.only(top: 4),
                                              child: Text(AppLocalizations.of(context).lblActions,style: grayTextColorStyleBlack(22),)),
                                        ],
                                      ),

                                      isExpandedActions?
                                      Icon(Icons.keyboard_arrow_down_outlined,size: 30,color: grayTextColor,):
                                      Icon(Icons.arrow_forward_ios,size: 16,color: grayTextColor,),
                                    ],
                                  ),
                                ):Container(),
                                isExpandedActions?makeBodyForActions(context, actionList):
                                Container(),
                                const SizedBox(height: 30,)
                              ],
                            ),
                          ),
                        ),

                          
                          const SizedBox(width: 20,),

                        Expanded(
                          flex:5,
                          child: Container(
                            width: constraints.maxWidth/2-15,
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12,),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayRoundedColor,// set border color
                                        width: 1.0
                                    )
                                ),
                                child: TableCalendar(
                                  // rowHeight: 60,
                                  // headerVisible: false,
                                  daysOfWeekStyle: const DaysOfWeekStyle(
                                    // Weekend days color (Sat,Sun)
                                    weekendStyle: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black),
                                    weekdayStyle: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black)
                                  ),
                                  events: selectedEvents,
                                  initialCalendarFormat: CalendarFormat.month,
                                  calendarStyle: CalendarStyle(
                                      todayColor: yellowColor,
                                      selectedColor: Colors.black,
                                      todayStyle: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                          color: Colors.black),
                                    weekendStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black),
                                    weekdayStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black),
                                    eventDayStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black),
                                    holidayStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black),
                                    outsideHolidayStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black),
                                    outsideStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black),
                                    outsideWeekendStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black),
                                    selectedStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black),
                                    unavailableStyle: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.black),
                                    cellMargin: EdgeInsets.all(0),
                                    // markersPositionBottom: 0,
                                    // markersPositionLeft: 0
                                    // contentDecoration: BoxDecoration(
                                    //   shape: BoxShape.circle,
                                    //   color: yellowColor,
                                    // )
                                    // contentPadding: EdgeInsets.only(bottom: 10)
                                  ),
                                  headerStyle: HeaderStyle(
                                    // centerHeaderTitle: true,
                                    formatButtonDecoration:null,
                                    // BoxDecoration(
                                    //   color: yellowColor,
                                    //   borderRadius: BorderRadius.circular(22.0),
                                    // ),
                                    formatButtonTextStyle: TextStyle(color: Colors.white),
                                    formatButtonShowsNext: false,
                                    formatButtonVisible: false,
                                    titleTextStyle: blueColorBoldStyle(width<600?16:26),
                                    decoration: BoxDecoration(
                                      // shape: BoxShape.circle,
                                      color: grayColor,
                                    ),
                                    headerMargin: EdgeInsets.only(bottom: 20),
                                    centerHeaderTitle: false,
                                    leftChevronIcon:Icon(Icons.chevron_left,color: Colors.black),
                                    rightChevronIcon: Icon(Icons.chevron_right,color: Colors.black),
                                    leftChevronPadding: EdgeInsets.all(1),
                                    rightChevronPadding: EdgeInsets.all(1),
                                    // leftChevronIcon: Icon(Icons.clear)
                                  ),
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  builders: CalendarBuilders(

                                    selectedDayBuilder: (context, date, events) => Container(
                                        margin: const EdgeInsets.all(5.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: yellowColor,
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        ),
                                        child: Text(
                                          date.day.toString(),
                                          style: TextStyle(color: Colors.white,fontSize:20),
                                        )),
                                    todayDayBuilder: (context, date, events) => Container(
                                      // width:4,
                                      //   height:4,
                                        margin: const EdgeInsets.all(5.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: onDaySelected?yellowColor:Colors.transparent,
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          border: Border.all(
                                              color: onDaySelected?Colors.transparent:yellowColor, // set border color
                                              width: 2.0)
                                        ),
                                        child: Text(
                                          date.day.toString(),
                                          style: TextStyle(color: onDaySelected?Colors.white:yellowColor,fontSize:20),
                                        )),
                                      singleMarkerBuilder: (context, date, event) {
                                      // sfsfffffff


                                        print("eventevent>>"+event.toString());
                                        Color color  =Colors.grey;;
                                        // if(event!=null){
                                        //   if(event.toString().isNotEmpty){
                                        //     if(event.toString()=="Live"){
                                        //       color =Colors.green;
                                        //     }else if(event.toString()=="Archived"){
                                        //       color=Color(0xff678ee2);
                                        //     }else if(event.toString()=="Scheduled"){
                                        //       color=Color(0xffd19d74);
                                        //     }else if(event.toString()=="Cancelled"){
                                        //       color=Color(0xffce8e93);
                                        //     }else if(event.toString()=="Draft"){
                                        //       color=Color(0xff888d8f);
                                        //     }else{
                                        //       color =Colors.green;
                                        //     }
                                        //
                                        //   }else{
                                        //     color =Colors.green;
                                        //   }
                                        // }else{
                                        //   color =Colors.green;
                                        // }

                                        return Container(
                                          // margin:EdgeInsets.only(top: 6,left: 1.5,right: 1.5),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:  color), //Change color
                                          width: 8.0,
                                          height: 8.0,
                                          margin: const EdgeInsets.symmetric(horizontal: 1.5,vertical: 1.5),
                                        );
                                      },

                                  ),
                                  calendarController: _controllerCalender,
                                  onDaySelected: (day, events, holidays) {
                                    setState(() {

                                       DateFormat dateFormat = DateFormat('dd MMMM yyyy','en');
                                       String date=  dateFormat.format(day);
                                       // String date =dateFormat.format(day);
                                      newallMeetingList=[];
                                      // selectedEvents=events;
                                      DateTime now = new DateTime.now();
                                      DateTime dateToday = new DateTime(now.year, now.month, now.day);
                                      DateTime dateSelect = new DateTime(day.year, day.month, day.day);
                                      if(dateToday==dateSelect){
                                        onDaySelected=true;
                                      }else{
                                        onDaySelected=false;
                                      }

                                      makeListForSheet(dateSelect).then((value) {
                                        if(value.isNotEmpty) {
                                          openBottomSheet(date,context);
                                        }
                                      });
                                      // if (allMeetingList != null && allMeetingList.isNotEmpty) {
                                      //   for(int i=0;i<allMeetingList.length;i++){
                                      //     DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(allMeetingList[i].startDate);
                                      //     if(dateSelect==tempDate){
                                      //       newallMeetingList.add(allMeetingList[i]);
                                      //       print("NewList>>"+newallMeetingList.toList().toString());
                                      //     }
                                      //   }
                                      // }

                                    });
                                  },

                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text(AppLocalizations.of(context).lblMeetings,style: blueColorBoldStyle(26),),
                              const SizedBox(height: 20,),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        lineColor=0;
                                      });
                                    },
                                    child: Text(
                                      AppLocalizations.of(context).lblOnGoing,
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: lineColor==0?yellowColor:grayTextColor,
                                              offset: Offset(0, -18))
                                        ],
                                        color: Colors.transparent,
                                        decoration: TextDecoration.underline,
                                        decorationColor: lineColor==0?yellowColor:Colors.transparent,
                                        decorationThickness: 2,
                                        fontFamily: "medium",
                                        fontSize: 24,
                                        // decorationStyle: TextDecorationStyle.double,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        lineColor=1;
                                      });
                                    },
                                    child: Text(
                                      AppLocalizations.of(context).lblPending,
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: lineColor==1?yellowColor:grayTextColor,
                                              offset: Offset(0, -18))
                                        ],
                                        color: Colors.transparent,
                                        decoration: TextDecoration.underline,
                                        decorationColor: lineColor==1?yellowColor:Colors.transparent,
                                        decorationThickness: 2,
                                        fontFamily: "medium",
                                        fontSize: 24,
                                        // decorationStyle: TextDecorationStyle.double,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        lineColor=2;
                                      });
                                    },
                                    child: Text(
                                      AppLocalizations.of(context).lblDraft,
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: lineColor==2?yellowColor:grayTextColor,
                                              offset: Offset(0, -18))
                                        ],
                                        color: Colors.transparent,
                                        decoration: TextDecoration.underline,
                                        decorationColor: lineColor==2?yellowColor:Colors.transparent,
                                        decorationThickness: 2,
                                        fontFamily: "medium",
                                        fontSize: 24,
                                        // decorationStyle: TextDecorationStyle.double,
                                      ),
                                    ),
                                  ),
                                  // InkWell(
                                  //     onTap: () {
                                  //       setState(() {
                                  //         lineColor=0;
                                  //       });
                                  //     },
                                  //     child: Text(AppLocalizations.of(context).lblOnGoing,style:
                                  //     TextStyle(
                                  //       color: lineColor==0?yellowColor:grayTextColor ,
                                  //       fontFamily: "medium",
                                  //       fontSize: 24,
                                  //     ),)),
                                  // const SizedBox(width: 20,),
                                  // InkWell(
                                  //     onTap: () {
                                  //       setState(() {
                                  //         lineColor=1;
                                  //       });
                                  //     },
                                  //     child: Text(AppLocalizations.of(context).lblPending,style:
                                  //     TextStyle(
                                  //       color: lineColor==1?yellowColor:grayTextColor ,
                                  //       fontFamily: "medium",
                                  //       fontSize: 24,
                                  //     ),)),
                                  // const SizedBox(width: 20,),
                                  // InkWell(
                                  //     onTap: () {
                                  //       setState(() {
                                  //         lineColor=2;
                                  //       });
                                  //     },
                                  //     child: Text(AppLocalizations.of(context).lblDraft,style:
                                  //     TextStyle(
                                  //       color: lineColor==2?yellowColor:grayTextColor ,
                                  //       fontFamily: "medium",
                                  //       fontSize: 24,
                                  //     ),)),
                                ],
                              ),
                              const SizedBox(height: 6,),
                              // Row(
                              //   children: [
                              //     Container(width: 90,height: 2,color: lineColor==0?yellowColor:gray2),
                              //     Container(width: 24,height: 2,color: gray2),
                              //     Container(width: 80,height: 2,color: lineColor==1?yellowColor:gray2),
                              //     Container(width: 14,height: 2,color: gray2),
                              //     Container(width: 70,height: 2,color: lineColor==2?yellowColor:gray2),
                              //     Container(width: 70,height: 2,color: gray2),
                              //   ],
                              // ),
                              lineColor==0?makeBodyForOnGoing(context, onGoingList):lineColor==1?makeBodyForPending(context, pendingList):makeBodyForDraft(context, draftList),
                              const SizedBox(height: 30,),
                              const SizedBox(height: 30,)

                            ],
                          ),),
                        ),






                      ],

                    );
                  }

                },),
              ),
            ),
          ],
        ),
      ),
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}


