import 'package:flutter/material.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/favourite_response_model.dart';
import 'package:itimaaty/Models/libary_response_model.dart';
import 'package:itimaaty/Repository/LibraryRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/View/CreateMeetingScreen.dart';
import 'package:itimaaty/View/DrawerWidget.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/LibraryScreen.dart';

import 'FavouriteScreen.dart';
import 'SignInScreen.dart';




class ParentLibraryScreen extends StatefulWidget {


  @override
  ParentLibraryScreenState createState() => ParentLibraryScreenState();
}

class ParentLibraryScreenState extends State<ParentLibraryScreen> {
  GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();
  LibraryRepository libraryRepository;
  LibaryResponseModel libaryResponseModel =new LibaryResponseModel();
  List<LibaryDirs> libraryDirs=[];
  List<LibaryFiles> libraryFiles=[];

  String userToken="";
  List<FavouriteResponseModel> favList=[];

  // void getLibrary(String token) {
  //   load();
  //   libraryRepository = new LibraryRepository();
  //   Future<LibaryResponseModel> allList = libraryRepository.getLibrary(token);
  //   allList.then((value) {
  //     setState(() {
  //       if (value != null) {
  //         showSuccess();
  //         libaryResponseModel = value;
  //         libraryDirs=value.dirs;
  //         libraryFiles=value.files;
  //         getFavourite(userToken);
  //       }else{
  //         showError();
  //         if(value==null){
  //           navigateAndFinish(context, SignInScreen());
  //         }
  //       }
  //     });
  //   });
  // }

  void getFavourite(String token) {
    load();
    libraryRepository = new LibraryRepository();
    Future<List<FavouriteResponseModel>> allList = libraryRepository.getFavourite(token);
    allList.then((value) {
      setState(() {
        if (value != null) {
          showSuccess();
          favList = value;
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
  }

  @override
  void initState() {
    Constants.draweItem="Library";
    SharedPreferencesHelper.getLoggedToken().then((value) {
      userToken=value;
      // getLibrary(value);
    });
  }


  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
     length: 4,
     child: Scaffold(
       key: scaffoldKeyDrawer,
        backgroundColor: grayColor,
        drawer: DrawerWidget(5),
         appBar: AppBar(
           toolbarHeight: 160,
           automaticallyImplyLeading: false,
           // titleSpacing: -30,
           backgroundColor: grayColor,
           title: Container(
             margin: EdgeInsets.only(top: 30),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Row(
                   children: [
                     InkWell(
                         onTap: () {
                           print("sddsd");

                           if (scaffoldKeyDrawer.currentState.isDrawerOpen) {
                             scaffoldKeyDrawer.currentState.openEndDrawer();
                           } else {
                             scaffoldKeyDrawer.currentState.openDrawer();
                           }
                         },
                         child: Icon(Icons.menu,color: Colors.black,size: 26,)),
                     Container(
                       child: Text(
                         AppLocalizations.of(context).lblLibrary,
                         style: blueColorBoldStyle(26),
                       ),margin: EdgeInsets.only(top: 8,left: 16,right: 16),
                     ),
                   ],
                 ),
                 Row(
                   children: [
                     InkWell(
                         onTap: () {

                         },
                         child: Icon(
                           Icons.filter_alt_outlined,
                           size: 24,
                           color: grayTextColor,
                         )),
                     const SizedBox(
                       width: 10,
                     ),
                     InkWell(
                       onTap: () {
                         navigateTo(context, CreateMeetingScreen());
                       },
                       child: Container(
                         padding: EdgeInsets.only(
                             left: 10, right: 10, top: 6, bottom: 6),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0),
                           border: Border.all(
                               color: Color(0xffeaeaea),
                               width: 0.6
                           ),
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
                           style: yellowColorStyleBold(28),
                         ),
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
           elevation: 0,
           bottom: PreferredSize(
             preferredSize: Size.fromHeight(40),
             child: Container(
               margin: EdgeInsets.only(top: 20,left: 10,right: 10),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: TabBar(
                     indicatorSize: TabBarIndicatorSize.label,
                     labelColor: yellowColor,
                     unselectedLabelColor: grayTextColor,
                     isScrollable: true,
                     labelPadding: EdgeInsets.symmetric(horizontal: 14.0,vertical: 6),
                     indicator: UnderlineTabIndicator(
                         borderSide: BorderSide(
                           width: 2,
                           color: yellowColor,
                         ),
                         insets: EdgeInsets.only(
                             left: 0,
                             right: 8,
                             bottom: 4)),

                     tabs: [
                       Tab(
                         child: Align(
                           alignment: Alignment.centerLeft,
                           child: Text(
                               "My Library", style: new TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.bold,
                             fontFamily: 'regular',
                           )
                           ),
                         ),
                       ),
                       Tab(
                         child: Align(
                           alignment: Alignment.centerLeft,
                           child: Text(
                               "Shared With Me",style: new TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.bold,
                             fontFamily: 'regular',
                           )
                           ),
                         ),
                       ),
                       Tab(
                         child: Align(
                           alignment: Alignment.centerLeft,
                           child: Text(
                               "Organization Library", style: new TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.bold,
                             fontFamily: 'regular',
                           )
                           ),
                         ),
                       ),
                       Tab(

                         child: Align(
                           alignment: Alignment.centerLeft,
                           child: Text("Favorite", style: new TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.bold,
                             fontFamily: 'regular',
                           )
                           ),
                         ),
                       )
                     ]
                 ),
               ),
             ),
           ),
         ),
        body: TabBarView(children: [
          LibraryScreen(libraryDirs, libraryFiles),
          Container(),
          Text("fff"),
          FavouriteScreen(favList),
       ]),
      ),
   );
  }
}
