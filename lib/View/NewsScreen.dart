import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/MultipleLikeRequestModel.dart';
import 'package:itimaaty/Models/liked_response_model.dart';
import 'package:itimaaty/Models/news_response_model.dart';
import 'package:itimaaty/Repository/NewsRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/NewsDetailsScreen.dart';
import 'package:intl/intl.dart';

import '../LocalDb/DbHelper.dart';
import '../LocalDb/DecisionTableOffline.dart';
import '../LocalDb/OfflineDataLocalModel.dart';
import '../Utils/Constants.dart';
import '../VideoExample.dart';
import 'DrawerWidget.dart';
import 'FontsStyle.dart';
import 'SignInScreen.dart';

class NewsScreen extends StatefulWidget {

  @override
  NewsScreenState createState() => NewsScreenState();
}

DateTime dateTime;

class NewsScreenState extends State<NewsScreen> {

  GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();

  NewsRepository  newsRepository ;
  List<NewsResponseModel> newsList;
  String token;
  var dbHelper = DbHelper();

  void getNewsData(String baseUrl ,String token){
    load();
    newsRepository=NewsRepository();
    Future<String> newsData = newsRepository.getNewsData(baseUrl,token);
    newsData.then((string) async{
      print("stringstring>>"+token.toString());
      print("stringstring>>"+string.toString());
      if(string!=null) {
        showSuccess();
        // setState(() {
        List<NewsResponseModel> value = await (json.decode(string) as List).map((i) => NewsResponseModel.fromJson(i)).toList();
        setState(() {
          newsList = value;
        });
        addOrUpdateOfflineNews(string);
        // List<String> strList = newsList.map((person) => jsonEncode(person.toJson())).toList();
        // SharedPreferencesHelper.setALlNews(strList);
        // });
      }else{
        showError();
        if(string==null){
          navigateAndFinish(context, SignInScreen(false));
        }
      }
    });
  }

  Future getOfflineNews() async {
    // var orgainzationsFuture = dbHelper.getOfflineData();
    var orgainzationsFuture = dbHelper.getNewsColumn(baseUrl+Constants.NEWS);
    orgainzationsFuture.then((data) {
      setState(()  {
        // this.offlineMeetings = data;
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.NEWS) {
            List<NewsResponseModel> value = (json.decode(localModel.news) as List).map((i) => NewsResponseModel.fromJson(i)).toList();
            setState(() {
              newsList = value;
            });
            break;
          }
          // allFilterdMeetingList = allMeetingList;
        }
      });
    });
  }

  Future<bool> addOrUpdateOfflineNews(String string) async {
    var orgainzationsFuture = dbHelper.getOfflineData();
    bool m = false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        OfflineDataLocalModel localModel =data[i];
        print("baseUrl>"+baseUrl.toString());
        if(localModel.url==baseUrl+Constants.NEWS) {
          m =true;
          break;
        }else{
          // var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          //   url: baseUrl+Constants.NEWS,
          //   news: string,
          // ));
          // print("inserstinserst");
          m=false;
          // inserst
        }
      }
    }).then((value) async {
      print("inserstinserst>>"+m.toString());
      if(m){
        var result = await dbHelper.updateNews(baseUrl+Constants.NEWS,string);
      }else{
        var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          url: baseUrl+Constants.NEWS,
          news: string,
        ));
      }
    });
  }



  void getNewsData2(String token){
    // load();
    newsRepository=NewsRepository();
    Future<String> newsData = newsRepository.getNewsData(baseUrl,token);
    newsData.then((string) async {
      if(string!=null) {
        // showSuccess();
        // setState(() {
          List<NewsResponseModel> value = await (json.decode(string) as List).map((i) => NewsResponseModel.fromJson(i)).toList();
          setState(() {
            newsList = value;
          });

        // });
      }else{
        // showError();
        if(string==null){
          navigateAndFinish(context, SignInScreen(false));
        }
      }
    });
  }


  void makeLike(String token,id){
    // load();
    newsRepository=NewsRepository();
    Future<LikedResponseModel> like = newsRepository.makeLike(baseUrl,token,id);
    like.then((value) {
      setState(() {
       if(value!=null){
         // showSuccess();
         getNewsData2(token);
       }else{
         // showError();
       }
      });
    });
  }

  void makeDisLike(String token,id){
    // load();
    newsRepository=NewsRepository();
    Future<LikedResponseModel> like = newsRepository.makeDisLike(baseUrl,token,id);
    like.then((value) {
      setState(() {
        if(value!=null){
          // showSuccess();
          getNewsData2(token);
        }else{
          // showError();
        }
      });
    });
  }

  String baseUrl;
  @override
  void initState() {
    SharedPreferencesHelper.getLoggedToken().then((value) {
      token=value;
        String baseUri= Constants.BASE_URL;
        baseUrl=baseUri;
        print("token>>"+token.toString());
        setState(() {
          hasNetwork().then((hasNet) {
          if(hasNet){
            getUnLikeOffline();

            // getNewsData(baseUrl,token);
          } else{
            getOfflineNews();
          }
          });
        });


    });
    super.initState();
  }


  //For Like  << __________________________________________________________

  Future<bool> addLikeOffline(int id) async {
    var result = await dbHelper.insertRequestsData(DecisionTableOffline(
      url: baseUrl+Constants.MultipleLIKE,
      like: id,
    ));
  }

  Future<bool> getLikeOffline() async {
    var orgainzationsFuture = dbHelper.getMultipleLike(baseUrl+Constants.MultipleLIKE);
    orgainzationsFuture.then((data) async {
      print("lemgthHere>>"+data.toString());
      if(data.isNotEmpty) {
        await sendLikeOfflineToAPi(token,data);
      }else{
        // getOfflineVote();
        getNewsData(baseUrl,token);
      }
    }).then((value) {
    });
    //
  }

  Future<bool> sendLikeOfflineToAPi(String token,List<MultipleLikeRequestModel> model) {
    bool m = false ;
    load();
    newsRepository = new NewsRepository();
    Future<LikedResponseModel> allList = newsRepository.addMultipleLike(baseUrl,token,model);
    allList.then((value) {
      setState(() {
        if (value != null) {
          dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+Constants.MultipleLIKE]);
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
        getNewsData(baseUrl,token);
      }
    });
  }

  // __________________________________________________________ >>

  //For UnLike  << __________________________________________________________

  Future<bool> addUnLikeOffline(int id) async {
    var result = await dbHelper.insertRequestsData(DecisionTableOffline(
      url: baseUrl+Constants.MultipleUnLIKE,
      unLike: id,
    ));
  }

  Future<bool> getUnLikeOffline() async {
    var orgainzationsFuture = dbHelper.getMultipleUnLike(baseUrl+Constants.MultipleUnLIKE);
    orgainzationsFuture.then((data) async {
      print("lemgthHere>>"+data.toString());
      if(data.isNotEmpty) {
        await sendUnLikeOfflineToAPi(token,data);
      }else{
        // getOfflineVote();
        getLikeOffline();
      }
    }).then((value) {
    });
    //
  }

  Future<bool> sendUnLikeOfflineToAPi(String token,List<MultipleLikeRequestModel> model) {
    bool m = false ;
    load();
    newsRepository = new NewsRepository();
    Future<LikedResponseModel> allList = newsRepository.addMultipleUnLike(baseUrl,token,model);
    allList.then((value) {
      setState(() {
        if (value != null) {
          dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+Constants.MultipleUnLIKE]);
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
        getLikeOffline();
      }
    });
  }

  // __________________________________________________________ >>



  String getFormattedDateNew(DateTime day) {
    // print("")
    String formattedDate1 = DateFormat('yyyy-MM-dd kk:mm a','en').format(day);
    // String formattedDate1 = DateFormat('yyyy-MM-ddTkk:mm').format(day);
    // print("")
    String formattedDate =
        getDoubleDigit(day.day.toString()) + " " +
            getDoubleDigit(monthNames[day.month-1]) + " " +
            getDoubleDigit(day.year.toString())+" "+formattedDate1;

    return formattedDate1;
  }
  DateTime stringToDateTimeNew(String dateString){
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime;
  }
  Widget myRow(NewsResponseModel model){

    String img='https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png';
    if(model.imageUrl!=null&&!model.imageUrl.contains('.mp4')){
      img=model.imageUrl;
    }else{
      if(model.gallery!=null&&model.gallery.isNotEmpty){
        for(int i=0;i<model.gallery.length;i++){
          if(model.gallery[i].image!=null&&!model.gallery[i].image.contains('.mp4')){
            img=model.gallery[i].image;
            break;
          }
        }
      }
    }
    return InkWell(
      onTap: () async {
        bool change = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>NewsDetailsScreen(model.id)));
        print("change>>"+change.toString());
        if(change){
          hasNetwork().then((hasNet) {
            if(hasNet){
              getNewsData(baseUrl,token);
            } else{
              setState(() {
                model.liked=!model.liked;
                String string= jsonEncode(newsList);
                addOrUpdateOfflineNews(string);
                // getOfflineNews();
              });
            }
          });
          // getNewsData(baseUrl,token);
        }
        // navigateTo(context, NewsDetailsScreen(model.id));
        // navigateTo(context,  ChewieDemo());
      },
      child: Container(
          width: 200,
          // height: MediaQuery.of(context).size.height/2,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    CachedNetworkImage(
                        width: double.infinity,
                        height: 245,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Image.asset(
                              "assets/images/loade_color.gif",
                              width: 100, height: 100,),
                        imageUrl: img),
                    // Image(image:  NetworkImage(img),
                    //       width: double.infinity,height: 245,fit: BoxFit.cover,),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: Row(
                        children:   [
                          ClipRRect(borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 45.0,
                                height: 45.0,
                                margin: EdgeInsets.only(left: 1,right: 1),
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: CachedNetworkImage(
                                    width: double.infinity,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    imageUrl: model.authoruser.image!=null?model.authoruser.image:
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"),
                              )),

                          const SizedBox(width: 15,),
                          Text(model.authoruser.name!=null?model.authoruser.name:"", style : blueColorStyleMedium(16),),
                        ],),
                    ),
                    const SizedBox(height: 25),
                     Container(
                       height: 70,
                       child: Padding(
                        padding: EdgeInsets.only(left:  20.0,right: 20),
                        child: Text(model.name!=null?model.name:"",style:blueColorBoldStyle(18),),
                    ),
                     ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: Row(
                        children:    [
                          Icon(Icons.date_range,color: Colors.black54,),
                          SizedBox(width: 15,),
                          model.authoruser.role!=null?Text(getFormattedDateNew(stringToDateTimeNew(model.authoruser.role.createdAt)), style :
                          blueColorStyleMedium(16),):Text(""),
                        ],),
                    ),
                    const SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: Row(
                        children:    [
                          Icon(Icons.group,color: Colors.black54,),
                          SizedBox(width: 15,),
                          Text(model.committee.name, style : blueColorStyleMedium(16),),
                        ],),
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(color: Colors.blueGrey.shade100,),
                      Padding(
                        padding:  EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:  10.0),
                                  child: Row(
                                    children:  [
                                      Text(
                                        model.likers.length.toString()+" "+AppLocalizations.of(context).lblLikes+" - "+
                                            model.comments.length.toString()+" "+AppLocalizations.of(context).lblComments, style : TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.blueGrey,
                                      ),),
                                      SizedBox(width: 5,),
                                      // Text('Like', style :blueColorStyleMedium(16),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                if(model.liked){
                                  makeDisLike(token, model.id);
                                }else{
                                  makeLike(token, model.id);
                                }
                              },
                              child: Container(
                                // width: 90,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color:!model.liked?Color(0xfff2f4f6): Color(0xfffff9e6),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: MaterialButton(onPressed: (){
                                    hasNetwork().then((value) {
                                      if(value){
                                        if(model.liked){
                                          makeDisLike(token, model.id);
                                        }else{
                                          makeLike(token, model.id);
                                        }
                                      }else{
                                        if(model.liked){
                                          addUnLikeOffline(model.id).then((value) {
                                            setState(() {
                                              model.liked=false;
                                              String string= jsonEncode(newsList);
                                              addOrUpdateOfflineNews(string);
                                            });
                                          });
                                        }else{
                                          addLikeOffline(model.id).then((value) {
                                            setState(() {
                                              model.liked=true;
                                              String string= jsonEncode(newsList);
                                              addOrUpdateOfflineNews(string);
                                            });
                                          });
                                        }
                                      }
                                    });

                                  },child:
                                  Text(!model.liked?AppLocalizations.of(context).lblLike:AppLocalizations.of(context).lblLiked,
                                    style : TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: 'medium',
                                        color: !model.liked?Color(0xffafbac6):Color(0xffffd14b)
                                    ),),)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) ;
    final double itemWidth = size.width / 3;

    return Scaffold(
        key: scaffoldKeyDrawer,
        backgroundColor: grayColor,
        drawer: DrawerWidget(2),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 14,right: 14,top:50),
              child: Row(
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
                      AppLocalizations.of(context).lblNews,
                      style: blueColorBoldStyle(26),
                    ),margin: EdgeInsets.only(top: 0,left: 16,right: 16),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    height: 1,color: grayTextColor,),
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child:  newsList!=null&&newsList.isNotEmpty? SizedBox(
                  child: GridView.count(
                      // crossAxisCount: 3,
                      // childAspectRatio: (itemWidth / itemHeight),
                      // controller: new ScrollController(keepScrollOffset: false),
                      crossAxisCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      shrinkWrap: true,
                      childAspectRatio: 0.6,
                      children: List.generate(newsList.length, (index) {
                        return myRow(newsList[index]);
                      }
                      )
                  ),
                )
                    :Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 140),
                    height: 250,
                    width: 250,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/no_data.png"),
                        const SizedBox(height: 10,),
                        Text(AppLocalizations.of(context).lblNoData,style: blueColorStyleMediumWithColor(18,Colors.black),)
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        )
    );
  }
}
