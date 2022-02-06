import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Repository/HomeRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/Widgets/HomeWidgets.dart';
import 'package:itimaaty/cubit/Home/HomeCubit.dart';
import 'package:itimaaty/cubit/Home/HomeStates.dart';

import 'MotherScreen.dart';

class NotGoingScreen extends StatefulWidget {


  @override
  NotGoingScreenState createState() => NotGoingScreenState();
}

class NotGoingScreenState extends State<NotGoingScreen> {

  var controllerScroll=ScrollController();
  bool _passwordVisible= false;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  DashboardResponseModel dashboardResponseModel;
  List<Pending> pendingList =new List<Pending>();
  List<Ongoing> onGoingList =new List<Ongoing>();
  List<Draft> draftList =new List<Draft>();
  List<Talkingpoints> talkingpointsList =new List<Talkingpoints>();
  int lineColor=0;

  AnimationController _controller;
  Animation<double> _animation;


  double _angle = 0;
  bool isPlaying = false;
  bool isExpandedTalkingPoints =true;
  bool isExpandedDecisions =true;
  bool isExpandedActions =true;

  void getDashboardData(String token) {
    HomeRepository allProductsRepository = new HomeRepository();
    Future<DashboardResponseModel> allList = allProductsRepository.getDashboardData(token);
    allList.then((value) {
      setState(() {
        if(value!=null){
          dashboardResponseModel=value;
          pendingList=value.pending;
          onGoingList=value.ongoing;
          draftList=value.draft;
          talkingpointsList=value.talkingpoints;
          print("goingCounIS>>"+value.toString());
          // print("goingCounIS>>"+value.ongoing[0].title);
          // if(value.counts!=null){
          //   print("goingCounIS>>"+value.counts.going.toString());
          // }
        }
      });

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

  Widget appBAr (BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,size: 18,color: Colors.black,)),
            const SizedBox(width: 10,),
            Container(
              margin: EdgeInsets.only(left: 8,right: 8,top: 4),
              padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 6),
              decoration: BoxDecoration(
                  color: Color(0xfffbecee),
                  // color: Colors.red,
                  border: Border.all(
                      color: Color(0xfffbecee),
                      width: 0.6
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(9))
              ),
              child: Center(
                child: Text(AppLocalizations.of(context).lblNotGoing,style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'black',
                    fontWeight: FontWeight.bold,
                    color: Color(0xfffea6b3)
                ),),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
            children: [
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
                                        child: Icon(Icons.edit,size:20 ,),
                                      ),
                                    ),
                                    const SizedBox(width: 14,),
                                    Container(
                                        margin: EdgeInsets.only(top:6),
                                        child: Text(AppLocalizations.of(context).lblEditMeeting,style: blueColorBoldStyle(16),))
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
                                        child: Icon(Icons.flag_outlined,size:20 ,),
                                      ),
                                    ),
                                    const SizedBox(width: 14,),
                                    Container(
                                        margin: EdgeInsets.only(top:6),
                                        child: Text(AppLocalizations.of(context).lblChangeStatus,style: blueColorBoldStyle(16),))
                                  ],
                                ),
                                const SizedBox(height: 14,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Icon(Icons.edit,size: 20,color: grayTextColor,)),
              const SizedBox(width: 14,),
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
                                child: Text(AppLocalizations.of(context).lblCreate,
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
                                      child: Icon(Icons.edit,size:20 ,),
                                    ),
                                  ),
                                  const SizedBox(width: 14,),
                                  Container(
                                      margin: EdgeInsets.only(top:6),
                                      child: Text(AppLocalizations.of(context).lblTalkingPoints,style: blueColorBoldStyle(16),))
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
                                      child: Icon(Icons.flag_outlined,size:20 ,),
                                    ),
                                  ),
                                  const SizedBox(width: 14,),
                                  Container(
                                      margin: EdgeInsets.only(top:6),
                                      child: Text(AppLocalizations.of(context).lblDescription,style: blueColorBoldStyle(16),))
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
                                      child: Icon(Icons.flag_outlined,size:20 ,),
                                    ),
                                  ),
                                  const SizedBox(width: 14,),
                                  Container(
                                      margin: EdgeInsets.only(top:6),
                                      child: Text(AppLocalizations.of(context).lblActions,style: blueColorBoldStyle(16),))
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
                                      child: Icon(Icons.flag_outlined,size:20 ,),
                                    ),
                                  ),
                                  const SizedBox(width: 14,),
                                  Container(
                                      margin: EdgeInsets.only(top:6),
                                      child: Text(AppLocalizations.of(context).lblApprovals,style: blueColorBoldStyle(16),))
                                ],
                              ),
                              const SizedBox(height: 14,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 6,bottom: 6),
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
                    "+",
                    style: yellowColorStyleBold(26),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    SharedPreferencesHelper.getLoggedToken().then((value) {
      getDashboardData(value);
    });
  }


  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) async {
          if (state is HomeStatesSuccessState) {

            if (state.dashboardResponseModel!=null) {
              print("goingCounIS>>"+state.dashboardResponseModel.counts.going.toString());

            } else {
            }
          }else{
            hasNetwork().then((value) {
              if(value){

              }else{
                print("errorHere");
              }
            });


          }
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          // cubit.getDashboardData();

          return  Scaffold(
            // resizeToAvoidBottomInset: true,
            backgroundColor: grayColor,
            body: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 24,right: 24,top:60),
                    child: appBAr(context)),
                Expanded(
                  child: SingleChildScrollView(
                    // physics: AlwaysScrollableScrollPhysics (),
                    // physics: ScrollPhysics (),
                    // controller: controllerScroll,
                    child: Container(
                      margin: EdgeInsets.only(left: 24,right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 30,),


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
                          Row(
                            children: [
                              Container(width: 80,height: 2,color: lineColor==0?yellowColor:gray2),
                              Container(width: 10,height: 2,color: gray2),
                              Container(width: 70,height: 2,color: lineColor==1?yellowColor:gray2),
                              Container(width: 18,height: 2,color: gray2),
                              Container(width: 60,height: 2,color: lineColor==2?yellowColor:gray2),
                              Container(width: MediaQuery.of(context).size.width-300,height: 2,color: gray2),
                            ],
                          ),
                          lineColor==0?makeBodyForOnGoing(context, onGoingList):lineColor==1?makeBodyForPending(context, pendingList):makeBodyForDraft(context, draftList),
                          const SizedBox(height: 30,),

                          Text(AppLocalizations.of(context).lblMyAgenda,style: blueColorBoldStyle(22),),
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
                        ],

                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}