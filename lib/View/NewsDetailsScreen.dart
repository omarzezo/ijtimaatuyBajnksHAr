import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:itimaaty/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/add_comment_response_model.dart';
import 'package:itimaaty/Models/add_news_comment.dart';
import 'package:itimaaty/Models/liked_response_model.dart';
import 'package:itimaaty/Models/news_details_response_model.dart';
import 'package:itimaaty/Models/news_response_model.dart';
import 'package:itimaaty/Repository/NewsRepository.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/FontsStyle.dart';

import 'SignInScreen.dart';


class NewsDetailsScreen extends StatefulWidget {

  int id;
  NewsDetailsScreen(this.id);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}


class _DetailsScreenState extends State<NewsDetailsScreen> {

  NewsRepository  newsRepository ;
  NewsDetailsResponseModel newsDetailsResponseModel=new NewsDetailsResponseModel();
  List<NewsDetailsResponseModelComments> commentsList=[];
  List<NewsDetailsResponseModelLikers> likersList=[];
  String token;
  String firstChar='';
  String name='';
  String image='';
  bool like=false;
  var writeCommentControler= TextEditingController();

  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  int currentPage = 0;

  void getNewsData(String token){
    load();
    newsRepository=NewsRepository();
    Future<NewsDetailsResponseModel> newsData = newsRepository.getNewsDetailsData(token,widget.id);
    newsData.then((value) {
      if(value!=null) {
        showSuccess();
        setState(() {
          newsDetailsResponseModel = value;
          name=newsDetailsResponseModel.authoruser.name;
          image=newsDetailsResponseModel.authoruser.image;
          like=newsDetailsResponseModel.liked;
          commentsList=value.comments;
          likersList=value.likers;
        });
      }else{
        showError();
        if(value==null){
          navigateAndFinish(context, SignInScreen());
        }
      }
    });
  }

  void addComment(String token,String note) {
    load();
    newsRepository = new NewsRepository();
    AddNewsComment addNewsComment =new AddNewsComment(rate: "5",comment:note!=null?note:"" );
    Future<AddCommentResponseModel> allList = newsRepository.addComment(token,addNewsComment,widget.id);
    allList.then((value) {
      setState(() {
        if (value != null) {
          commentsList=[];
          writeCommentControler.text='';
          showSuccess();
          getNewsData(token);
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
    SharedPreferencesHelper.getLoggedToken().then((value) {
      token=value;
      SharedPreferencesHelper.getLoggedUserName().then((valueSecond) {
          for(int i=0;i<valueSecond.split(" ").length ;i++){
            firstChar+=valueSecond.split(" ")[i][0];
          }
          getNewsData(token);
      });

    });
    super.initState();
  }

  Widget makeBodyForTalkingPointsComments(BuildContext context, List<NewsDetailsResponseModelComments> activityList,int lenght){
    return activityList!=null&&activityList.isNotEmpty?
    ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: activityList.length,
      itemBuilder: (context, index) {
        return leaveRowForComments(context,activityList[index],index);
      },
    ):Container();
  }

  Widget leaveRowForComments(BuildContext context,NewsDetailsResponseModelComments leave,int index) {
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
                        // "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"
                      leave.userImage!=null?leave.userImage:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"
                      // "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                    ),
                  ),
                )
            ),
            Container(
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
                      Text(leave.userName!=null?leave.userName:"",style: blueColorBoldStyle(18),),
                      // Text("",style: blueColorBoldStyle(18),),
                      const SizedBox(width: 12,),
                      Container(height: 20,width: 1,color: grayTextColor,),
                      const SizedBox(width: 12,),
                      Text(leave.createdAt!=null?getFormattedDate(stringToDateTime(leave.createdAt)):"",style: blueColorStyleMedium(16),),
                    ],
                  ),
                  const SizedBox(height: 6,),
                  Text(leave.comment!=null?leave.comment:"",style: blueColorStyleMedium(16),),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void makeLike(String token,id){
    load();
    newsRepository=NewsRepository();
    Future<LikedResponseModel> like = newsRepository.makeLike(token,id);
    like.then((value) {
      setState(() {
        if(value!=null){
          showSuccess();
          getNewsData(token);
        }else{
          showError();
        }
      });
    });
  }

  void makeDisLike(String token,id){
    load();
    newsRepository=NewsRepository();
    Future<LikedResponseModel> like = newsRepository.makeDisLike(token,id);
    like.then((value) {
      setState(() {
        if(value!=null){
          showSuccess();
          getNewsData(token);
        }else{
          showError();
        }
      });
    });
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 30 : 24,
      decoration: BoxDecoration(
        color: currentPage == index ? yellowColor : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayColor,
      body: Column(
        children: [
          const SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Row(
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
                    CircleAvatar(
                      radius: 14,
                        backgroundImage:NetworkImage(
                            image!=null?image:
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png")
                    ),
                    const SizedBox(width: 20,),
                    Container(
                        margin: EdgeInsets.only(top: 6),
                        child: Text(name,style: blueColorBoldStyle(20),)),
                  ],
                ),
                Container(
                  // width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                      color:!like?Color(0xfff2f4f6): Color(0xfffff9e6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(onPressed: (){
                      if(like){
                        makeDisLike(token, widget.id);
                      }else{
                        makeLike(token, widget.id);
                      }
                    },child:
                    Text(!like?AppLocalizations.of(context).lblLike:AppLocalizations.of(context).lblLiked,style : TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: !like?Color(0xffafbac6):Color(0xffffd14b)
                    ),),)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 14),
            height: 0.3,color: grayTextColor,),
          const SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            newsDetailsResponseModel!=null && newsDetailsResponseModel.gallery!=null?  Container(
                              height: 420,
                              child: PageView.builder(
                                  controller: _controller,
                                  // physics: NeverScrollableScrollPhysics(),
                                  onPageChanged: (value) {
                                    setState(() {
                                      currentPage = value;
                                    });
                                  },
                                  itemCount: newsDetailsResponseModel.gallery.length,

                                  itemBuilder: (context, index) =>
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                              height: 420,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              // margin: const EdgeInsets.only(right: 20),
                                              child: CachedNetworkImage(
                                                  width: double.infinity,height: 245,fit: BoxFit.cover,
                                                placeholder: (context, url) => Image.asset("assets/images/loade_color.gif",
                                                  width: 100,height: 100,),
                                                // imageUrl:  "https://elyafta.com/tmp/public/images/companies/"+path,
                                                imageUrl:   newsDetailsResponseModel.gallery[index].image!=null?
                                                newsDetailsResponseModel.gallery[index].image:
                                                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"),


                                              // Image(image:
                                              // NetworkImage(
                                              //     newsDetailsResponseModel.gallery[index].image!=null?
                                              // newsDetailsResponseModel.gallery[index].image:
                                              // "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"),
                                              //   width: double.infinity,height: 245,fit: BoxFit.cover,)
                                          ),
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                margin: EdgeInsets.only(bottom: 40),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: List.generate(
                                                    newsDetailsResponseModel.gallery.length,
                                                        (index) => InkWell(
                                                            onTap: () {
                                                              print("index>>"+index.toString());
                                                              _controller.jumpToPage(index);
                                                            },
                                                            child: buildDot(index: index)),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )


                              ),
                            ):Container(),
                            // Container(
                            //     height: 420,
                            //     clipBehavior: Clip.antiAlias,
                            //     decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.circular(20),
                            //     ),
                            //     // margin: const EdgeInsets.only(right: 20),
                            //     child: Image(image:  NetworkImage
                            //       (newsDetailsResponseModel.imageUrl!=null?
                            //     newsDetailsResponseModel.imageUrl:
                            //     "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"),
                            //       width: double.infinity,height: 245,fit: BoxFit.cover,)
                            // ),
                            const SizedBox(height: 40,),
                            Container(
                              padding:  EdgeInsets.only(left:  10.0,right: 10,top: 20,bottom: 20),
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
                                  Text(
                                    newsDetailsResponseModel.name!=null?newsDetailsResponseModel.name:"",
                                    style: blueColorBoldStyle(18),
                                  ),
                                ],
                              ),),
                            const SizedBox(height: 40,),
                            Container(
                              padding:  EdgeInsets.only(left:  10.0,right: 10,top: 20,bottom: 20),
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
                                      (newsDetailsResponseModel.comments==null?0.toString():
                                      newsDetailsResponseModel.comments.length.toString())+" )", style: blueColorBoldStyle(20),),
                                  const SizedBox(height: 14,),

                                  makeBodyForTalkingPointsComments(context, commentsList, 0),

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
                                                    addComment(token, writeCommentControler.text==null?"": writeCommentControler.text);
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
                            const SizedBox(height: 40,),
                          ],
                        ),
                      )),

                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 40),
                    width: MediaQuery.of(context).size.width/3,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            width: (MediaQuery.of(context).size.width/2 -MediaQuery.of(context).size.width/5.3),
                            // height:  490,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: likersList!=null?Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(AppLocalizations.of(context).lblLikes+
                                    ' ('+likersList.length.toString()+")",style: blueColorBoldStyle(18),),
                                ),
                                const Divider(),
                                Container(
                                  height: 425 ,
                                  width: double.infinity,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    clipBehavior: Clip.antiAlias,
                                    padding: const EdgeInsets.only(left: 20,top: 10),
                                    itemCount: likersList.length,
                                    itemBuilder: (context, index) =>
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children:  [
                                            CircleAvatar(
                                              // backgroundImage: NetworkImage(${model.authoruser.image}),
                                                backgroundImage:NetworkImage(likersList[index].image!=null?likersList[index].image:
                                                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png")
                                            ),
                                            const SizedBox(width: 20,),
                                            Container(
                                                margin: EdgeInsets.only(top: 6),
                                                child: Text(likersList[index].name,style: blueColorBoldStyle(16),)),
                                          ],
                                        ),
                                    separatorBuilder: (BuildContext context, int index)  => const SizedBox(height: 15,),
                                  ),
                                ),
                              ],
                            ):Container(),
                          ),
                        ],
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
  }
}
