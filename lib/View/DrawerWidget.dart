import 'package:flutter/material.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/View/AllMeetingsScreen.dart';
import 'package:itimaaty/View/CalenderScreen.dart';
import 'package:itimaaty/View/HomeScreen.dart';
import 'package:itimaaty/View/NewsScreen.dart';
import 'package:itimaaty/View/ProfileScreen.dart';
import 'package:itimaaty/View/SignInToYourOrganizationScreen.dart';
import 'package:itimaaty/Widgets/FadeAnimation.dart';
import 'FontsStyle.dart';
import 'Testtttttttt.dart';



class DrawerWidget extends StatefulWidget {

  int index;
  DrawerWidget(this.index);


  @override
  _NavDrawState createState() => _NavDrawState();
}

int selectedIndex = 0;

class _NavDrawState extends State<DrawerWidget> {

String name='';
String firstChar="";
  @override
  void initState() {
    setState(() {
      selectedIndex=widget.index;
      getUser().then((value) {
        setState(() {
          name=value.name;
        });
      });
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Colors.white,
          child:NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  _createDrawerHeader(
                      context,
                      // name, "Company Name"),
                      name, ""),
                  Container(
                    height: 10,
                    color: Colors.white,
                  ),
                  FadeAnimation(
                    0.2,
                      Container(
                          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          child: Text(AppLocalizations.of(context).lblDashboardC,style: grayTextColorStyleBlack(16),)),
                  ),
                  FadeAnimation(
                    0.2,
                    _createDrawerItem(context,
                        icon: "assets/images/ic_home.png",
                        text: AppLocalizations.of(context).lblHomeLabel,
                        isSelected: selectedIndex == 0, onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                          Navigator.pop(context);
                          print("selectedIndex>>"+selectedIndex.toString());
                          // if(Constants.draweItem!="home") {
                            navigateTo(context, HomeScreen());
                          // }
                        }),
                  ),
                  // FadeAnimation(
                  //     0.4, _createDrawerItem(context,
                  //     icon: "assets/images/ic_anaylitic.png",
                  //     text: AppLocalizations.of(context).lblAnalytic,
                  //     isSelected: selectedIndex == 1, onTap: () {
                  //       setState(() {
                  //         selectedIndex = 1;
                  //       });
                  //
                  //     })),
                  FadeAnimation(
                      0.6,_createDrawerItem(context,
                      icon: "assets/images/ic_news.png",
                      text: AppLocalizations.of(context).lblNews,
                      isSelected: selectedIndex == 2, onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                        Navigator.pop(context);
                        navigateTo(context, NewsScreen());
                        // if(selectedIndex!=4) {
                        //   // Navigator.pop(context);
                        //   navigateTo(context, HomeScreen());
                        // }
                        // Navigator.pop(context);
                        // navigateTo(context, HomeScreen());
                      })),

                  FadeAnimation(
                      0.5, _createDrawerItem(context,
                      icon: "assets/images/ic_calender.png",
                      text: AppLocalizations.of(context).lblCalender,
                      isSelected: selectedIndex == 3, onTap: () {
                        setState(() {
                          // selectedIndex = 3;
                        });
                        // navigateTo(context, CalenderScreen());
                      })),

                  FadeAnimation(
                    0.2,
                    Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 14,bottom: 10),
                        child: Text(AppLocalizations.of(context).lblActivity,style: grayTextColorStyleBlack(16),)),
                  ),

                  FadeAnimation(
                      0.6,_createDrawerItem(context,
                      icon: "assets/images/ic_meetings.png",
                      text: AppLocalizations.of(context).lblMeetings,
                      isSelected: selectedIndex == 4, onTap: () {
                        setState(() {
                          selectedIndex = 4;
                        });
                        print("selectedIndex>>"+selectedIndex.toString());
                        Navigator.pop(context);
                        // if(Constants.draweItem!="AllMeetingsScreen") {
                          navigateTo(context, AllMeetingsScreen());
                        // }
                      })),
                  FadeAnimation(
                      0.7,   _createDrawerItem(context,
                      icon: "assets/images/ic_library.png",
                      text: AppLocalizations.of(context).lblLibrary,
                      isSelected: selectedIndex == 5, onTap: () {
                        setState(() {
                          // selectedIndex = 5;
                        });
                        // navigateTo(context, BasicTilePage2());


                        // navigateTo(context, ParentLibraryScreen());
                        // navigateTo(context, BasicTilePage());
                        // navigateTo(context, ExpansionTileSample());
                        // navigateTo(context, ExpansionTileSample());
                      })),
                  // FadeAnimation(
                  //     0.9,  _createDrawerItem(context,
                  //     icon: "assets/images/ic_library.png",
                  //     text: AppLocalizations.of(context).lblIntegrations,
                  //     isSelected: selectedIndex == 8, onTap: () {
                  //       setState(() {
                  //         selectedIndex = 8;
                  //       });
                  //
                  //     })),

                  FadeAnimation(
                    0.2,
                    Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 14,bottom: 10),
                        child: Text(AppLocalizations.of(context).lblSettings,style: grayTextColorStyleBlack(16),)),
                  ),
                  // FadeAnimation(
                  //     0.7,   _createDrawerItem(context,
                  //     icon: "assets/images/ic_organization.png",
                  //     text: AppLocalizations.of(context).lblOrganization,
                  //     isSelected: selectedIndex == 9, onTap: () {
                  //       setState(() {
                  //         selectedIndex = 9;
                  //       });
                  //       if(Constants.draweItem!="Organizations") {
                  //         navigateTo(context, SignInToYourOrganizationScreen());
                  //       }
                  //     })),
                  FadeAnimation(
                      0.7,   _createDrawerItem(context,
                      icon: "assets/images/ic_profile.png",
                      text: AppLocalizations.of(context).lblProfile,
                      isSelected: selectedIndex == 10, onTap: () {
                        setState(() {
                          selectedIndex = 10;
                        });
                        Navigator.pop(context);
                        navigateTo(context, ProfileScreen());
                      })),


                  Container(
                    height: 40,
                    color: Colors.white,
                  ),
                  // Divider(height: 40,),
                ],
              ))


      ),
    );
  }
}

Widget _createDrawerItem(BuildContext context,
    {String icon,
      String text,
      GestureTapCallback onTap,
      bool isSelected}) {

  return Container(
      color: Colors.white,
      child: Container(
        margin: AppLocalizations.of(context).locale == "en"
            ? const EdgeInsets.fromLTRB(0, 0, 20, 0)
            : const EdgeInsets.fromLTRB(20, 0, 0, 0),
        width: MediaQuery.of(context).size.width * 0.75 - 64,
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.transparent,
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(
                AppLocalizations.of(context).locale == "en" ? 0 : 28),
            topRight: Radius.circular(
                AppLocalizations.of(context).locale == "en" ? 28 : 0),
            bottomLeft: Radius.circular(
                AppLocalizations.of(context).locale == "en" ? 0 : 28),
            bottomRight: Radius.circular(
                AppLocalizations.of(context).locale == "en" ? 28 : 0),
          ),
        ),
        child: Ink(
          color: isSelected ? Colors.transparent : Colors.transparent,
          child: ListTile(
            selected: true,
            hoverColor: Colors.white,
            title: Row(
              children: <Widget>[
                Image.asset(icon,width: 30,height: 30,color: !isSelected?grayTextColor:yellowColor,fit: BoxFit.fill,),
                Container(
                  width: 12,
                ),
                Flexible(
                  child: Padding(
                    padding: AppLocalizations.of(context).locale == "en"
                        ? EdgeInsets.only(left: 8.0)
                        : EdgeInsets.fromLTRB(8, 2, 0, 0),
                    child: Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(text,
                          style: TextStyle(
                            color: !isSelected?grayTextColor:yellowColor ,
                            fontFamily: "medium",
                            fontSize: 18,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            onTap: onTap,
          ),
        ),
      ));
}

Widget _createDrawerHeader(
    BuildContext context, String name, String companyName) {
  String firstChar ='';
  if(name!=null&&name.isNotEmpty) {
    for (int i = 0; i < name
        .split(" ")
        .length; i++) {
      firstChar += name.split(" ")[i][0];
    }
  }
  return Container(
    margin: EdgeInsets.only(top: 20,left: 24,right: 24),
    color: Colors.transparent,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start ,
        crossAxisAlignment: CrossAxisAlignment.start ,
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
        const SizedBox(height: 20,),
        Text(name!=null?name:"",style: blueColorBoldStyle(22),),
        const SizedBox(height: 10,),
        Text(companyName,style: grayTextColorStyleMedium(16),),
      ],
    ),
  );
}
