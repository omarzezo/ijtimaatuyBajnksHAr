import 'package:flutter/material.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/liked_response_model.dart';
import 'package:itimaaty/Models/news_response_model.dart';
import 'package:itimaaty/Repository/NewsRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/NewsDetailsScreen.dart';
import 'package:intl/intl.dart';

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

  void getNewsData(String token){
    load();
    newsRepository=NewsRepository();
    Future<List<NewsResponseModel>> newsData = newsRepository.getNewsData(token);
    newsData.then((value) {
      if(value!=null) {
        showSuccess();
        setState(() {
          newsList = value;
        });
      }else{
        showError();
        if(value==null){
          navigateAndFinish(context, SignInScreen());
        }
      }
    });
  }

  void getNewsData2(String token){
    // load();
    newsRepository=NewsRepository();
    Future<List<NewsResponseModel>> newsData = newsRepository.getNewsData(token);
    newsData.then((value) {
      if(value!=null) {
        // showSuccess();
        setState(() {
          newsList = value;
        });
      }else{
        // showError();
        if(value==null){
          navigateAndFinish(context, SignInScreen());
        }
      }
    });
  }
  void makeLike(String token,id){
    // load();
    newsRepository=NewsRepository();
    Future<LikedResponseModel> like = newsRepository.makeLike(token,id);
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
    Future<LikedResponseModel> like = newsRepository.makeDisLike(token,id);
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

  @override
  void initState() {
    SharedPreferencesHelper.getLoggedToken().then((value) {
      token=value;
      getNewsData(value);
    });
    super.initState();
  }

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
      onTap: () {
        navigateTo(context, NewsDetailsScreen(model.id));
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [

                Image(image:  NetworkImage
                  (img),
                //     model.imageUrl!=null?
                //     !model.imageUrl.contains('mp4')?model.imageUrl:
                //     model.gallery!=null&&model.gallery.isNotEmpty?model.gallery[1].image:
                // "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                // "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"),
                  width: double.infinity,height: 245,fit: BoxFit.cover,),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: Row(
                    children:   [
                       CircleAvatar(
                        // backgroundImage: NetworkImage(${model.authoruser.image}),
                        backgroundImage:NetworkImage(model.authoruser.image!=null?model.authoruser.image:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png")
                      ),
                      const SizedBox(width: 15,),
                      Text(model.authoruser.name!=null?model.authoruser.name:"", style : blueColorStyleMedium(16),),
                    ],),
                ),
                const SizedBox(height: 25),
                 Padding(
                  padding: EdgeInsets.only(left:  20.0,right: 20),
                  child: Text(model.name!=null?model.name:"",style:blueColorBoldStyle(18),),
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
                const SizedBox(height: 20),
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
                              if(model.liked){
                                makeDisLike(token, model.id);
                              }else{
                                makeLike(token, model.id);
                              }
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                child:  newsList!=null?
                SizedBox(
                  child: GridView.count(
                      crossAxisCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      shrinkWrap: true,
                      childAspectRatio: 0.7,
                      children: List.generate(newsList.length, (index) {
                        return myRow(newsList[index]);
                      }
                      )
                  ),
                )
                    :Container(),
              ),
            ))
          ],
        )
    );
  }
}
