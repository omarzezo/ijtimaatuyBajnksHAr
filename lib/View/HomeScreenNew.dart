import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:itimaaty/View/LogInToYourOrganizationScreen.dart';
import 'package:itimaaty/View/SignInScreen.dart';
import 'package:itimaaty/View/SignInToYourOrganizationScreen.dart';
import 'package:itimaaty/Widgets/HomeWidgets.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../LocalDb/DbHelper.dart';
import '../LocalDb/OfflineDataLocalModel.dart';
import '../LocalDb/OrganizationLocalModel.dart';
import '../Widgets/TooltipShape.dart';
import 'ProfileScreen.dart';


class HomeScreenNew extends StatefulWidget {
// String lang;
// HomeScreen(this.lang);

  @override
  HomeScreenNewState createState() => HomeScreenNewState();
}

class HomeScreenNewState extends State<HomeScreenNew> with SingleTickerProviderStateMixin{


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool onDaySelected=true;
  Map<DateTime, List<Event>> selectedEvents;
  List<DateTime> allDates=[];

  var controllerScroll=ScrollController();
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
  // MeetingRepository meetingRepository;
  List<AllMeetingsResponseData> allMeetingList =[];
  List<AllMeetingsResponseData> newallMeetingList = [];
  HomeRepository homeRepository ;
  String userName="",userImage="";
  String firstChar="";
  String secondChar="";
  double widthPadding=0;
  String letter = 'العربيه';
  DateTime selectedDate;
  String selectedDateString;
  final now = DateTime.now();

  Future addOrUpdateOfflineMeetings(String string) async {
    var orgainzationsFuture = dbHelper.getAllMeetingsDashboardColumn(baseUrl+Constants.MEETINGS+"Dashboard"+selectedDateString);
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        OfflineDataLocalModel localModel =data[i];
        if(localModel.url==baseUrl+Constants.MEETINGS+"Dashboard"+selectedDateString) {
          m=true;
          break;
        }else{
          m=false;
          // inserst
        }
      }
    }).then((value) async {
      if(m) {
        print("updateupdate");
        // update
        var result = await dbHelper.updateMeetingsDasboard(baseUrl+Constants.MEETINGS+"Dashboard"+selectedDateString,string);
      }else{
        var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          url: baseUrl+Constants.MEETINGS+"Dashboard"+selectedDateString,
          allMeetingsDashboard: string,
        ));
        print("inserstinserst");
        // inserst
      }
    });
  }

  Future getOfflineMeetings() async {
    var orgainzationsFuture = dbHelper.getAllMeetingsDashboardColumn(baseUrl+Constants.MEETINGS+"Dashboard"+selectedDateString);
    orgainzationsFuture.then((data) {
      setState(()  {
        // this.offlineMeetings = data;
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.MEETINGS+"Dashboard"+selectedDateString) {
            setState(() {
              AllMeetingsResponse value =  AllMeetingsResponse.fromJson(json.decode(localModel.allMeetingsDashboard));
              // List<AllMeetingsResponseData> value = (json.decode(localModel.allMeetingsDashboard) as List).map((i) => AllMeetingsResponseData.fromJson(i)).toList();
              allMeetingList = value.data;
              print("allMeetingList>>"+allMeetingList.toString());
              for(int i=0;i<allMeetingList.length;i++){
                DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(allMeetingList[i].startDate);
                allDates.add(tempDate);
                if (selectedEvents[tempDate] != null) {
                  selectedEvents[tempDate].add(Event(
                      title: allMeetingList[i].status!=null?allMeetingList[i].status.name:"",
                      bgColor:allMeetingList[i].status!=null?allMeetingList[i].status.bgcolor:"#000000"),);
                } else {
                  selectedEvents[tempDate] = [Event(
                      title: allMeetingList[i].status!=null?allMeetingList[i].status.name:"",
                      bgColor:allMeetingList[i].status!=null?allMeetingList[i].status.bgcolor:"#000000")];
                }
              }
            });
            break;
          }else{
            print("NotExist");
          }
        }
      });
    });
  }

  Future<bool> addOrUpdateOfflineDashboard(String string) async {
    // var orgainzationsFuture = await dbHelper.getOfflineData();
    var orgainzationsFuture =  dbHelper.getDashboardColumn(baseUrl+Constants.DASHBOARD);
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        OfflineDataLocalModel localModel =data[i];
        if(localModel.url==baseUrl+Constants.DASHBOARD) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      print("inserstinsersthhhhh>>"+m.toString());
      if(m){
        var result = await dbHelper.updateDashboard(baseUrl+Constants.DASHBOARD,string);
        print("HereUpdateeee>>"+m.toString());
      }else{
        var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          url: baseUrl+Constants.DASHBOARD,
          dashboard: string,
        ));
        print("HereInsert>>"+m.toString());
      }
    });
  }

  Future getOfflineDashboard() async {
    var orgainzationsFuture = dbHelper.getDashboardColumn(baseUrl+Constants.DASHBOARD);
    orgainzationsFuture.then((data) {
      setState(()  {
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.DASHBOARD) {
            setState(() {
              DashboardResponseModel value =  DashboardResponseModel.fromJson(json.decode(localModel.dashboard));
              dashboardResponseModel=value;
              pendingList=value.pending;
              onGoingList=value.ongoing;
              draftList=value.draft;
              talkingpointsList=value.talkingpoints;
              decisionList=value.decision;
              actionList=value.action;
            });
            break;
          }
          // allFilterdMeetingList = allMeetingList;
        }
      });
    }).then((value) {
      print("dddddddddddddddd");
      getOfflineMeetings();
    });
  }

  void getAllMeetings(String baseUrl ,String token) {
    load();
    homeRepository = new HomeRepository();
    Future<String> allList = homeRepository.getAllMeetings(baseUrl,token);
    // Future<List<AllMeetingsResponse>> allList = homeRepository.getAllMeetingsCache(token);
    // Future<List<AllMeetingsResponse>> allList = homeRepository.getAllMeetingsUsingDio2(token,"2022/3");
    allList.then((string) async{
        if (string != null) {
          showSuccess();
          AllMeetingsResponse value =  AllMeetingsResponse.fromJson(json.decode(string));
          // List<AllMeetingsResponseData> value = await (json.decode(string) as List).map((i) => AllMeetingsResponseData.fromJson(i)).toList();
          setState(() {
            allMeetingList = value.data;
            List<String> strList = allMeetingList.map((person) => jsonEncode(person.toJson())).toList();
            // SharedPreferencesHelper.setALlMeetingData(strList);
            addOrUpdateOfflineMeetings(string);
            print("allMeetingListSize>>"+strList.length.toString());
            for(int i=0;i<allMeetingList.length;i++){
              DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(allMeetingList[i].startDate);
              allDates.add(tempDate);
              if (selectedEvents[tempDate] != null) {
                selectedEvents[tempDate].add(Event(
                    title: allMeetingList[i].status!=null?allMeetingList[i].status.name:"",
                    bgColor:allMeetingList[i].status!=null?allMeetingList[i].status.bgcolor:"#000000"),);
              } else {
                selectedEvents[tempDate] = [Event(
                    title: allMeetingList[i].status!=null?allMeetingList[i].status.name:"",
                    bgColor:allMeetingList[i].status!=null?allMeetingList[i].status.bgcolor:"#000000")];
              }
            }
          });
        }else{
          showError();
        }
      // });
    });
  }

  void getAllMeetingsForOnline(String baseUrl ,String token) {
    load();
    homeRepository = new HomeRepository();
    Future<String> allList = homeRepository.getAllMeetingsByDate(baseUrl,token,selectedDateString);
    allList.then((string) async{
        if (string != null) {
          showSuccess();
          AllMeetingsResponse value =  AllMeetingsResponse.fromJson(json.decode(string));
          // List<AllMeetingsResponseData> value = await (json.decode(string) as List).map((i) => AllMeetingsResponseData.fromJson(i)).toList();
          setState(() {
            if(selectedEvents!=null&&selectedEvents.isNotEmpty) {
              selectedEvents.clear();
            }
            allMeetingList = value.data;
            List<String> strList = allMeetingList.map((person) => jsonEncode(person.toJson())).toList();
            // SharedPreferencesHelper.setALlMeetingData(strList);
            addOrUpdateOfflineMeetings(string);
            print("allMeetingListSize>>"+strList.length.toString());
            for(int i=0;i<allMeetingList.length;i++){
              DateTime tempDate = new DateFormat("yyyy-MM-dd",'en').parse(allMeetingList[i].startDate);
              allDates.add(tempDate);
              if (selectedEvents[tempDate] != null) {
                selectedEvents[tempDate].add(Event(
                    title: allMeetingList[i].status!=null?allMeetingList[i].status.name:"",
                    bgColor:allMeetingList[i].status!=null?allMeetingList[i].status.bgcolor:"#000000"),);
              } else {
                selectedEvents[tempDate] = [Event(
                    title: allMeetingList[i].status!=null?allMeetingList[i].status.name:"",
                    bgColor:allMeetingList[i].status!=null?allMeetingList[i].status.bgcolor:"#000000")];
              }
            }
          });
        }else{
          showError();
        }
      // });
    });
  }

  void getDashboardData(String baseUrl ,String token) {
    homeRepository = new HomeRepository();
    load();
    Future<String> allList = homeRepository.getDashboardData(baseUrl,token);
    // Future<DashboardResponseModel> allList = homeRepository.getDashboardDataCache(token);
    allList.then((string) {
      setState(() {
        if(string!=null){
          // String strList = jsonEncode(value.toJson());
          // SharedPreferencesHelper.setDashboardData(strList);
          showSuccess();
          DashboardResponseModel value =  DashboardResponseModel.fromJson(json.decode(string));
          addOrUpdateOfflineDashboard(string);
          dashboardResponseModel=value;
          pendingList=value.pending;
          onGoingList=value.ongoing;
          draftList=value.draft;
          talkingpointsList=value.talkingpoints;
          decisionList=value.decision;
          actionList=value.action;
          print("goingCounIS>>"+value.toString());
        }else{
          showError();
          print("dddddddd");
          navigateAndFinish(context, SignInScreen(false));
        }
      });

    }).then((value) {
        String baseUrl= Constants.BASE_URL;
        getAllMeetingsForOnline(baseUrl,token) ;
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
                  Expanded(flex:5,child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(color: Colors.transparent,))),
                  Expanded(
                    flex:3,
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

  String name ;
  String logo ;

  void getProducts(String domain) async {
    var orgainzationsFuture = dbHelper.getOrganizations();
    orgainzationsFuture.then((data) {
      setState(() {
        List<OrganizationLocalModel> list = data.cast<OrganizationLocalModel>();
        this.orgainzations = list.where((i) =>i.userToken !=null).toList();
        for(int i=0;i<orgainzations.length;i++){
          OrganizationLocalModel leave =orgainzations[i];
          if(domain==leave.domain){
            // print("namename>>"+leave.name);
            name=leave.name;
            logo=leave.logo;
            for(int i=0;i<leave.userName.split(" ").length ;i++){
              firstChar+=leave.userName.split(" ")[i][0];
            }
            userName=leave.userName;
            userImage=leave.userImage;

            break;
          }
        }
        // orgainzationsCount = data.length;
        // print(""+"countIs>>"+orgainzationsCount.toString());
      });
    });
  }

  String baseUrl ="";
  String token ;

  versionCheck(context) async {
    //Get Current installed version of app
    final PackageInfo info = await PackageInfo.fromPlatform();
    double currentVersion = double.parse(info.version.trim().replaceAll(".", ""));

    //Get Latest version info from firebase config
    final FirebaseRemoteConfig remoteConfig = await FirebaseRemoteConfig.instance;

    try {
      // Using default duration to force fetching from remote server.
      await remoteConfig.fetch();
      await remoteConfig.fetchAndActivate();
      // await remoteConfig.activateFetched();
      remoteConfig.getString('force_update_current_version');
      double newVersion = double.parse(remoteConfig
          .getString('force_update_current_version')
          .trim()
          .replaceAll(".", ""));
      if (newVersion > currentVersion) {
        _showVersionDialog(context);
      }
    } catch(exception) {
      // Fetch throttled.
      print(exception);
    }
  }
  String APP_STORE_URL =
      'https://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftwareUpdate?id=YOUR-APP-ID&mt=8';
  String PLAY_STORE_URL =
      'https://play.google.com/store/apps/details?id=com.itimaaty.itimaat';
  //Show Dialog to force user to update
  _showVersionDialog(context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "New Update Available";
        String message =
            "There is a newer version of app available please update it now.";
        String btnLabel = "Update Now";
        String btnLabelCancel = "Later";
        return Platform.isIOS
            ? new CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(btnLabel),
              onPressed: () => _launchURL(APP_STORE_URL),
            ),
            FlatButton(
              child: Text(btnLabelCancel),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        )
            : new AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(btnLabel),
              onPressed: () => _launchURL(PLAY_STORE_URL),
            ),
            FlatButton(
              child: Text(btnLabelCancel),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    selectedDate = now;
    selectedDateString=(selectedDate.year.toString()+"/"+selectedDate.month.toString()).substring(0,4);
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

    // versionCheck(context);
    setState(() {
        SharedPreferencesHelper.getLoggedToken().then((valueFirst) {
            setState(() {
              hasNetwork().then((hasNet) {
                  String baseUri = Constants.BASE_URL;
                  setState(() {
                    baseUrl = baseUri;
                  });
                  if(hasNet) {
                    token=valueFirst;
                    getDashboardData(baseUrl, valueFirst);
                    print("Net exist");
                  }else{
                    getOfflineDashboard();
                  }
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
        // this.setState((){
        //   print("En");
        //   helper.onLocaleChanged(new Locale("en"));
        // });
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
        // this.setState((){
        //   print("ar");
        //   helper.onLocaleChanged(new Locale("ar"));
        // });
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

  Future<void> handleClickProfile(String value) async {
    if(value==AppLocalizations.of(context).lblSignOut){
      print("here2");
      load();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.clear();
      // await Future.delayed(Duration(seconds: 2));
      SharedPreferencesHelper.setLoggedToken("null").then((value) {
        // removeUser();
        showSuccessMsg("Sign out Successfully!");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (BuildContext context) => SignInScreen(false),
          ),
              (Route route) => false,
        );
      });
    }else{
      navigateTo(context, ProfileScreen());
    }
  }
  List orgainzations=[];
  var dbHelper = DbHelper();

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

                          // navigateTo(context, TestTask());
                          // navigateTo(context, TestSignature());
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

                    const SizedBox(width: 20,),

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
                    PopupMenuButton<String>(
                      onSelected: handleClickProfile,
                      child: userImage!=null?userImage==""?Container(
                        width: 50.0,
                        height: 50.0,
                        // color: Colors.grey,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle ,
                          color: Colors.grey.shade400,
                        ),
                        child: Icon(Icons.person,color: Colors.white,),
                      ):new Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new CachedNetworkImageProvider(userImage,),
                          ),
                        ),
                      ):Container(
                        width: 50.0,
                        height: 50.0,
                        // color: Colors.grey,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle ,
                          color: Colors.grey.shade400,
                        ),
                        child: Icon(Icons.person,color: Colors.white,),
                      ),
                      // padding: EdgeInsets.only(top: 60),
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuItem<String>>[
                          PopupMenuItem<String>(
                            value: AppLocalizations.of(context).lblEditProfile,
                            child: Row(
                              children: [
                                Icon(Icons.person,color: yellowColor,size: 30,),
                                const SizedBox(width: 20,),
                                Container(
                                    child: Text(AppLocalizations.of(context).lblEditProfile,style: blueColorBoldStyle(20),),
                                    margin:EdgeInsets.only(top: 0)),


                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: AppLocalizations.of(context).lblSignOut,
                            child: Row(
                              children: [
                                Icon(Icons.logout,color: yellowColor,size: 30),
                                const SizedBox(width: 20,),
                                Container(
                                    child: Text(AppLocalizations.of(context).lblSignOut,style: blueColorBoldStyle(20),),
                                    margin:EdgeInsets.only(top: 0)),
                              ],
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        ];
                      },
                    ),
                    // new Container(
                    //   width: 50.0,
                    //   height: 50.0,
                    //   decoration: new BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     image: new DecorationImage(
                    //       fit: BoxFit.cover,
                    //       image: new CachedNetworkImageProvider(userImage,),
                    //     ),
                    //   ),
                    // )
                    // ClipRRect(borderRadius: BorderRadius.circular(10000.0),
                    //     child:  CachedNetworkImage(
                    //       // cacheManager: CustomCacheManager(),
                    //       imageUrl: userImage,
                    //     ))

                    // CircleAvatar(
                    //   radius: 24.0,
                    //   backgroundImage:
                    //   NetworkImage(userImage),
                    //   backgroundColor: Colors.transparent,
                    // ),
                  ],
                ),

              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: LayoutBuilder(builder: (context, constraints) {
                  print("WidthIs>>"+constraints.maxWidth.toString());

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width:MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top:30),
                        padding: EdgeInsets.only(top: 20,bottom:10,left:16,right:16),
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
                            Row(
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
                                    margin: EdgeInsets.only(top: 0,right: 10,left: 10),
                                    child: Text(AppLocalizations.of(context).lblWelcomeTo+userName.toString(),
                                      style: blueColorBoldStyle(24),)),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 0,right: 65,left: 65),
                                child: Text(AppLocalizations.of(context).lblCheckOut,
                                  style: grayTextColorStyleBlack(20),))
                          ],
                        ),
                      ),
                      SizedBox(
                        height:constraints.maxWidth>600?450:300,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Expanded(
                              child: Container(
                                height:constraints.maxWidth>600?450:300,
                                // width:(MediaQuery.of(context).size.width-60)/2,
                                // height:400,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayRoundedColor,// set border color
                                        width: 1.0
                                    )
                                ),
                                margin: EdgeInsets.only(top:65),
                                padding:EdgeInsets.all(10),
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
                                                dashboardResponseModel.upcoming.toString():"",style: blueColorBoldStyle(20),)),
                                              ),
                                              const SizedBox(width: 12,),
                                              Container(
                                                  margin: EdgeInsets.only(top: 6),
                                                  child: Text(AppLocalizations.of(context).lblUpcomingMeetings,style: grayTextColorStyleBlack(16),)),
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
                                                style: yellowColorStyleBold(16),
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
                                            margin: EdgeInsets.only(top: 4,),
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
                                                      child: Icon(Icons.check,size: 20,color: Color(0xff61e2b0),),
                                                    ),
                                                    const SizedBox(width: 20,),
                                                    Row(
                                                      children: [
                                                        Center(child: Text(dashboardResponseModel!=null?
                                                        dashboardResponseModel.counts!=null?dashboardResponseModel.counts.going.toString():"":"",style: blueColorBoldStyle(18),)),
                                                        const SizedBox(width: 14,),
                                                        Text(AppLocalizations.of(context).lblGoingS,style:
                                                        grayTextColorStyleBlack(15),),
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
                                                      child: Icon(Icons.clear,size: 20,color: Color(0xffff6a81),),
                                                    ),
                                                    const SizedBox(width: 20,),
                                                    Row(
                                                      children: [
                                                        Center(child: Text(dashboardResponseModel!=null?
                                                        dashboardResponseModel.counts==null?"": dashboardResponseModel.counts.notgoing.toString():"",style: blueColorBoldStyle(18),)),
                                                        const SizedBox(width: 14,),
                                                        Text(AppLocalizations.of(context).lblNotGoingS,style: grayTextColorStyleBlack(15),),
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
                                                      child: Image.asset("assets/images/ic_pending.webp",width: 20,height: 20),
                                                    ),
                                                    const SizedBox(width: 20,),
                                                    Row(
                                                      children: [
                                                        Center(child: Text(dashboardResponseModel!=null?
                                                        dashboardResponseModel.counts==null?"":dashboardResponseModel.counts.pending.toString():"",style: blueColorBoldStyle(18),)),
                                                        const SizedBox(width: 14,),
                                                        Text(AppLocalizations.of(context).lblPendingS,style: grayTextColorStyleBlack(15),),
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
                                                      child: Image.asset("assets/images/ic_maybe.webp",width: 20,height: 20),
                                                    ),
                                                    const SizedBox(width: 20,),
                                                    Row(
                                                      children: [
                                                        Center(child: Text(dashboardResponseModel!=null?
                                                        dashboardResponseModel.counts==null?"":dashboardResponseModel.counts.maybe.toString():"",style: blueColorBoldStyle(18),)),
                                                        const SizedBox(width: 14,),
                                                        Text(AppLocalizations.of(context).lblMayBe,style: grayTextColorStyleBlack(15),),
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
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Container(
                                // width:(MediaQuery.of(context).size.width-60)/2,
                                // height:constraints.maxWidth/3,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: grayRoundedColor,// set border color
                                        width: 1.0
                                    )
                                ),
                                child:

                                TableCalendar(
                                  rowHeight: 50,
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
                                    formatButtonDecoration:null,
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
                                    leftChevronIcon:Icon(Icons.chevron_left,color: Colors.black,),
                                    rightChevronIcon: Icon(Icons.chevron_right,color: Colors.black),
                                    leftChevronPadding: EdgeInsets.all(1),
                                    rightChevronPadding: EdgeInsets.all(1),
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
                                          style: TextStyle(color: onDaySelected?Colors.white:yellowColor,fontSize:18),
                                        )),
                                    singleMarkerBuilder: (context, date, event) {
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
                                      DateFormat dateFormat;
                                      if(AppLocalizations.of(context).locale=="en"){
                                         dateFormat = DateFormat('dd MMMM yyyy','en');
                                      }else{
                                         dateFormat = DateFormat('dd MMMM yyyy','ar');
                                      }

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
                                  afterNextOrBackAction: (date){
                                   // String selectedDate =getFormattedDateForCalender(date);
                                   selectedDateString=getFormattedDateForCalender(date);
                                   selectedDateString=selectedDateString.substring(0,4);
                                   hasNetwork().then((value) {
                                     if(value){
                                       getAllMeetingsForOnline(baseUrl, token);
                                     }else{
                                       getOfflineMeetings();
                                     }
                                   });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              // width:600,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20,),
                                  Text(AppLocalizations.of(context).lblMyAgenda,style: blueColorBoldStyle(26),),
                                  // const SizedBox(height: 20,),
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
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(top: 22),
                                                child: Image.asset("assets/images/ic_talkingpoint.webp",width: 24,height: 24)),
                                            const SizedBox(width: 14,),
                                            Container( margin: EdgeInsets.only(top: 22),
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
                                  Container(),
                                  const SizedBox(height: 14,),
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
                                  const SizedBox(height: 14,),
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
                              child:Container(
                                // width: constraints.maxWidth/2-15,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                    const SizedBox(height: 0,),
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
                                ),)
                          )
                          
                        ],
                      )
                    ],

                  );

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



