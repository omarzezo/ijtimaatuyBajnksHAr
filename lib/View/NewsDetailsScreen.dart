import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/NewsOfflineModel.dart';
import 'package:itimaatysoharsohar/Models/add_comment_response_model.dart';
import 'package:itimaatysoharsohar/Models/add_news_comment.dart';
import 'package:itimaatysoharsohar/Models/liked_response_model.dart';
import 'package:itimaatysoharsohar/Models/news_details_response_model.dart';
import 'package:itimaatysoharsohar/Models/news_response_model.dart';
import 'package:itimaatysoharsohar/Repository/NewsRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/VideoExample.dart';
import 'package:itimaatysoharsohar/View/FontsStyle.dart';

import '../LocalDb/DbHelper.dart';
import '../LocalDb/DecisionTableOffline.dart';
import '../LocalDb/OfflineDataLocalModel.dart';
import '../Models/DeleteCommentResponse.dart';
import '../Models/DeleteCommentsRequestModel.dart';
import '../Models/LoginResponseModel.dart';
import '../Models/MultipleLikeRequestModel.dart';
import '../Utils/Constants.dart';
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
  var dbHelper = DbHelper();

  getOfflineData(){
    print("lllllllllllllll");
    List<NewsDetailsResponseModel> list=[];
    SharedPreferencesHelper.getNewsDetails().then((value) async {
      if(value!=null){
        if(value.isNotEmpty) {
          for (var i in value) {
            Map<String, dynamic> map = jsonDecode(i);
            NewsDetailsResponseModel newsDetailsResponseModel = NewsDetailsResponseModel.fromJson(map);
            list.add(newsDetailsResponseModel);
          }
        }
      }else{
      }
    }).then((value) {
      if(list.isNotEmpty) {
        setState(() {
          NewsDetailsResponseModel tile = list.firstWhere((item) => item.id == widget.id, orElse: () => null);
          if (tile != null) {
            newsDetailsResponseModel=tile;
            name=newsDetailsResponseModel.authoruser.name;
            image=newsDetailsResponseModel.authoruser.image;
            like=newsDetailsResponseModel.liked;
            commentsList=newsDetailsResponseModel.comments;
            likersList=newsDetailsResponseModel.likers;
          } else {
          }
        });

      }
    });
  }


 getConvertedList(NewsDetailsResponseModel model) {
      List<NewsDetailsResponseModel> list=[];
    SharedPreferencesHelper.getNewsDetails().then((value) async {
      if(value!=null){
        if(value.isNotEmpty) {
          for (var i in value) {
            Map<String, dynamic> map = jsonDecode(i);
            NewsDetailsResponseModel newsDetailsResponseModel = NewsDetailsResponseModel.fromJson(map);
            list.add(newsDetailsResponseModel);
            print("list11>>" + list.length.toString());
          }
        }
      }else{
        list.add(model);
        List<String> strList = list.map((person) => jsonEncode(person.toJson())).toList();
        SharedPreferencesHelper.setNewsDetails(strList);
      }
    }).then((value) {
          NewsDetailsResponseModel tile = list.firstWhere((item) =>
          item.id == widget.id, orElse: () => null);
          if (tile != null) {
            tile = model;
            List<String> strList = list.map((person) => jsonEncode(person.toJson())).toList();
            SharedPreferencesHelper.setNewsDetails(strList);
            print("modelIsExist");
          } else {
            list.add(model);
            List<String> strList = list.map((person) => jsonEncode(person.toJson())).toList();
            SharedPreferencesHelper.setNewsDetails(strList);
            print("modelIsNotExist");
          }
    });
  }


  saveDataToDb(NewsDetailsResponseModel model) async {
    Future<List<NewsDetailsResponseModel>> getList=  getConvertedList(model);
    getList.then((list) {
      print("list44>>" + list.length.toString());
      NewsDetailsResponseModel tile = list.firstWhere((item) => item.id == widget.id, orElse: () => null);
      if(tile!=null){
        tile=model;
        List<String> strList = list.map((person) => jsonEncode(person.toJson())).toList();
        SharedPreferencesHelper.setNewsDetails(strList);
      }else{
        list.add(model);
        List<String> strList = list.map((person) => jsonEncode(person.toJson())).toList();
        SharedPreferencesHelper.setNewsDetails(strList);
      }
    });
  }

  void getNewsData(String baseUrl,String token){
    hasNetwork().then((value) {
      if(value){
        load();
        newsRepository=NewsRepository();
        // Future<NewsDetailsResponseModel> newsData = newsRepository.getNewsDetailsData(baseUrl,token,widget.id);
        Future<String> newsData = newsRepository.getNewsDetailsData(baseUrl,token,widget.id);
        newsData.then((string) {
          if(string!=null) {
            showSuccess();
            setState(() {
              NewsDetailsResponseModel value =  NewsDetailsResponseModel.fromJson(json.decode(string));
              newsDetailsResponseModel = value;
              name=newsDetailsResponseModel.authoruser.name;
              image=newsDetailsResponseModel.authoruser.image;
              like=newsDetailsResponseModel.liked;
              commentsList=value.comments;
              likersList=value.likers;
              addOrUpdateOfflineNews(string);
              // saveDataToDb(value);
              // getConvertedList(value);
            });
          }else{
            showError();
            if(string==null){
              navigateAndFinish(context, SignInScreen(false));
            }
          }
        });
      }else{
        // getOfflineData();
        getOfflineNews();
      }
    });
  }

  Future getOfflineNews() async {
    var orgainzationsFuture = dbHelper.getOfflineData();
    orgainzationsFuture.then((data) {
      setState(()  {
        // this.offlineMeetings = data;
        for(int i=0;i<data.length;i++){
          OfflineDataLocalModel localModel =data[i];
          if(localModel.url==baseUrl+Constants.NEWS+"/"+widget.id.toString()) {
            setState(() {
              NewsDetailsResponseModel value =  NewsDetailsResponseModel.fromJson(json.decode(localModel.newsDetails));
              newsDetailsResponseModel = value;
              name=newsDetailsResponseModel.authoruser.name;
              image=newsDetailsResponseModel.authoruser.image;
              like=newsDetailsResponseModel.liked;
              commentsList=value.comments;
              likersList=value.likers;
            });
            break;
          }
          // allFilterdMeetingList = allMeetingList;
        }
      });
    });
  }

  Future<bool> addOrUpdateOfflineNews(String string) async {
    // var orgainzationsFuture = dbHelper.getOfflineData();
    var orgainzationsFuture = dbHelper.getNewsDetailsColumn(baseUrl+Constants.NEWS+"/"+widget.id.toString());
    bool m=false;
    orgainzationsFuture.then((data) async {
      for(int i=0;i<data.length;i++){
        OfflineDataLocalModel localModel =data[i];
        if(localModel.url==baseUrl+Constants.NEWS+"/"+widget.id.toString()) {
          m =true;
          break;
        }else{
          m=false;
        }
      }
    }).then((value) async {
      print("inserstinserst>>"+m.toString());
      if(m){
        var result = await dbHelper.updateNewsDetails(baseUrl+Constants.NEWS+"/"+widget.id.toString(),string);
      }else{
        var result = await dbHelper.insertOfflineData(OfflineDataLocalModel(
          url: baseUrl+Constants.NEWS+"/"+widget.id.toString(),
          newsDetails: string,
        ));
      }
    });
  }


  void getNewsData2(String token){
    // load();
    newsRepository=NewsRepository();
    Future<String> newsData = newsRepository.getNewsDetailsData(baseUrl,token,widget.id);
    newsData.then((string) {
      if(string!=null) {
        // showSuccess();
        setState(() {
          NewsDetailsResponseModel value =  NewsDetailsResponseModel.fromJson(json.decode(string));
          newsDetailsResponseModel = value;
          name=newsDetailsResponseModel.authoruser.name;
          image=newsDetailsResponseModel.authoruser.image;
          like=newsDetailsResponseModel.liked;
          commentsList=value.comments;
          likersList=value.likers;
        });
      }else{
        // showError();
        if(string==null){
          navigateAndFinish(context, SignInScreen(false));
        }
      }
    });
  }

  void deleteComment(String token, int id) {
    load();
    newsRepository = new NewsRepository();
    Future<DeleteCommentResponse> allList = newsRepository.deleteComment(baseUrl,id,token);
    allList.then((value) {
      setState(() {
        if (value != null) {
          if(value.message.contains('successfully')) {
            showSuccessMsg("Deleted Successfully");
            getNewsData2(token);
          }else{
            showErrorWithMsg('this item not deleted');
          }

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

  void addComment(String token,String note) {
    load();
    newsRepository = new NewsRepository();
    AddNewsComment addNewsComment =new AddNewsComment(rate: "5",comment:note!=null?note:"" );
    Future<AddCommentResponseModel> allList = newsRepository.addComment(baseUrl,token,addNewsComment,widget.id);
    allList.then((value) {
      setState(() {
        if (value != null) {
          commentsList=[];
          writeCommentControler.text='';
          showSuccess();
          getNewsData(baseUrl,token);
        }else{
          showError();
          if(value==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });
  }

  int userId=0;
  String baseUrl;
  String userImage;
  String userName;
  Future<bool> _onWillPop() async {
    Navigator.pop(context,true);
  }

  @override
  void initState() {
    getUser().then((value) {
      userId=value.id;
      userImage=value.image!=null?value.image:"";
      userName=value.name!=null?value.name:"";
      SharedPreferencesHelper.getLoggedToken().then((value) {
        token=value;
        SharedPreferencesHelper.getLoggedUserName().then((valueSecond) {
          for(int i=0;i<valueSecond.split(" ").length ;i++){
            firstChar+=valueSecond.split(" ")[i][0];
          }
            String baseUri= Constants.BASE_URL;
            setState(() {
              baseUrl=baseUri;
            });
            getOfflineComments();


        });

      });
    });

    super.initState();
  }

  //For Add Comment << __________________________________________________________

  Future<int> addOfflineComment(String comment) async {
    var result = await dbHelper.insertRequestsData(DecisionTableOffline(
      url: baseUrl+"news/"+widget.id.toString()+Constants.MultipleNEWSComments,
      addDecisionComment: comment,
    ));
    print("result>>"+result.toString());
    return result;
  }

  Future<bool> addOfflineCommentToAPi(List<AddNewsComment> model) {
    bool m = false ;
    load();
    newsRepository = new NewsRepository();
    Future<List<AddCommentResponseModel>> allList = newsRepository.addMultipleNewsComments(baseUrl,token,model,widget.id);
    allList.then((value) {
      setState(() {
        if (value != null) {
          dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+"news/"+widget.id.toString()+Constants.MultipleNEWSComments]);
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
    var orgainzationsFuture = dbHelper.getNewsComment(baseUrl+"news/"+widget.id.toString()+Constants.MultipleNEWSComments);
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
      url: baseUrl+Constants.DeleteMultipleComments+"news/"+widget.id.toString(),
      deleteDecisionComment: commentId,
    ));
    print("resultmmmm>"+result.toString());
  }

  Future<bool> getOfflineDeleteComments() async {
    var orgainzationsFuture = dbHelper.getDeleteDecisionComment(baseUrl+Constants.DeleteMultipleComments+"news/"+widget.id.toString());
    orgainzationsFuture.then((data) async {
      print("lemgthHere>>"+data.toString());
      if(data.isNotEmpty) {
        await deleteOfflineCommentToAPi(token,data);
      }else{
        // getOfflineVote();
        getNewsData(baseUrl,token);
      }
    }).then((value) {
    });
    //
  }

  Future<bool> deleteOfflineCommentToAPi(String token,List<DeleteCommentsRequestModel> model) {
    bool m = false ;
    load();
    newsRepository = new NewsRepository();
    Future<DeleteCommentResponse> allList = newsRepository.deleteMultipleComment(baseUrl,token,model);
    allList.then((value) {
      setState(() {
        if (value != null) {
          dbHelper.deleteAllDecisionComments(whereArgs: [baseUrl+Constants.DeleteMultipleComments+"news/"+widget.id.toString()]);
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

  fillComments(String comment,int id) {
    setState(() {
      DateFormat dateFormat;
      if (AppLocalizations.of(context).locale == "en") {
        dateFormat = DateFormat('yyyy-MM-dd hh:mm', 'en');
      } else {
        dateFormat = DateFormat('yyyy-MM-dd hh:mm', 'ar');
      }
      String date = dateFormat.format(DateTime.now());

      commentsList.add(NewsDetailsResponseModelComments(
          comment: comment,
          id: id,
          // commented: userId,
          commentedId: userId.toString(),
          userImage: userImage != null ? userImage : "",
          userName: userName != null ? userName : "",
          createdAt: date));
      writeCommentControler.text="";
      String dataString= json.encode(newsDetailsResponseModel.toJson());
      addOrUpdateOfflineNews(dataString);
    });
  }

  fillDeleteComments(int index,int id,String comment,int num) {
    setState(() {
      commentsList.removeWhere((item) => item.id == id);
      // commentsList.removeAt(index);
      String dataString= json.encode(newsDetailsResponseModel.toJson());
      addOrUpdateOfflineNews(dataString);
      if(num==0){
        addDeleteOfflineComment(id);
      }
    });
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
            ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  margin: EdgeInsets.only(left: 1,right: 1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(30.0),
                      border: Border.all(
                          color: grayRoundedColor,// set border color
                          width: 1.0
                      )
                  ),
                  child: CachedNetworkImage(
                      width: double.infinity,
                      height: 40,
                      fit: BoxFit.cover,
                      imageUrl: leave.userImage!=null?leave.userImage:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"),
                )),
            // ClipOval(
            //     child:
            //     CircleAvatar(
            //       radius: 22,
            //       backgroundColor: Colors.red,
            //       child: CircleAvatar(
            //         radius: 22,
            //         backgroundImage: NetworkImage(
            //             // "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"
            //           leave.userImage!=null?leave.userImage:
            //           "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"
            //           // "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
            //         ),
            //       ),
            //     )
            // ),
            Container(
              // width: MediaQuery.of(context).size.width/2,
              margin: EdgeInsets.only(left: 14,right: 14),
              padding: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
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
                  const SizedBox(height: 10,),
                 // userId==leave.commented.id? InkWell(
                 userId.toString()==leave.commentedId? InkWell(
                    onTap: () {
                      hasNetwork().then((value) {
                        if(value){
                          deleteComment(token, leave.id);
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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                            // Navigator.pop(context);
                            // Navigator.pop(context,true);
                            _onWillPop();
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
                        hasNetwork().then((value) {
                          if(value){
                            if(like){
                              makeDisLike(token, widget.id);
                            }else{
                              makeLike(token, widget.id);
                            }
                          }else{
                            if(like){
                              addUnLikeOffline(widget.id).then((value) {
                                setState(() {
                                  like=!like;
                                  newsDetailsResponseModel.liked=false;
                                  String string= jsonEncode(newsDetailsResponseModel);
                                  addOrUpdateOfflineNews(string);
                                });
                              });
                            }else{
                              addLikeOffline(widget.id).then((value) {
                                setState(() {
                                  like=!like;
                                  newsDetailsResponseModel.liked=true;
                                  String string= jsonEncode(newsDetailsResponseModel);
                                  addOrUpdateOfflineNews(string);
                                });
                              });
                            }
                          }
                        });

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

                                    itemBuilder: (context, index) {
                                      if(newsDetailsResponseModel.gallery[index].image!=null){
                                        if(newsDetailsResponseModel.gallery[index].image.contains('mp4')){
                                          return Stack(
                                              children: <Widget>[
                                          VideoScreen(newsDetailsResponseModel.gallery[index].image),
                                              Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 40),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: List.generate(
                                                        newsDetailsResponseModel
                                                            .gallery.length,
                                                            (index) =>
                                                            InkWell(
                                                                onTap: () {
                                                                  print("index>>" +
                                                                      index
                                                                          .toString());
                                                                  _controller
                                                                      .jumpToPage(
                                                                      index);
                                                                },
                                                                child: buildDot(
                                                                    index: index)),
                                                      ),
                                                    ),
                                                  ))
                                          ]
                                          );
                                        }else {
                                          return Stack(
                                            children: <Widget>[
                                              Container(
                                                height: 420,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius
                                                      .circular(20),
                                                ),
                                                // margin: const EdgeInsets.only(right: 20),
                                                child: CachedNetworkImage(
                                                    width: double.infinity,
                                                    height: 245,
                                                    fit: BoxFit.cover,
                                                    placeholder: (context, url) =>
                                                        Image.asset(
                                                          "assets/images/loade_color.gif",
                                                          width: 100, height: 100,),
                                                    // imageUrl:  "https://elyafta.com/tmp/public/images/companies/"+path,
                                                    imageUrl: newsDetailsResponseModel
                                                        .gallery[index].image !=
                                                        null ?
                                                    newsDetailsResponseModel
                                                        .gallery[index].image :
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
                                                    margin: EdgeInsets.only(
                                                        bottom: 40),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .center,
                                                      children: List.generate(
                                                        newsDetailsResponseModel
                                                            .gallery.length,
                                                            (index) =>
                                                            InkWell(
                                                                onTap: () {
                                                                  print("index>>" +
                                                                      index
                                                                          .toString());
                                                                  _controller
                                                                      .jumpToPage(
                                                                      index);
                                                                },
                                                                child: buildDot(
                                                                    index: index)),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          );
                                        }
                                      }else{
                                        return Stack(
                                          children: <Widget>[
                                            Container(
                                              height: 420,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .circular(20),
                                              ),
                                              // margin: const EdgeInsets.only(right: 20),
                                              child: CachedNetworkImage(
                                                  width: double.infinity,
                                                  height: 245,
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Image.asset(
                                                        "assets/images/loade_color.gif",
                                                        width: 100, height: 100,),
                                                  // imageUrl:  "https://elyafta.com/tmp/public/images/companies/"+path,
                                                  imageUrl: newsDetailsResponseModel
                                                      .gallery[index].image !=
                                                      null ?
                                                  newsDetailsResponseModel
                                                      .gallery[index].image :
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
                                                  margin: EdgeInsets.only(
                                                      bottom: 40),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: List.generate(
                                                      newsDetailsResponseModel
                                                          .gallery.length,
                                                          (index) =>
                                                          InkWell(
                                                              onTap: () {
                                                                print("index>>" +
                                                                    index
                                                                        .toString());
                                                                _controller
                                                                    .jumpToPage(
                                                                    index);
                                                              },
                                                              child: buildDot(
                                                                  index: index)),
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        );
                                      }

                                    }

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
                                // width: MediaQuery.of(context).size.width/2,
                                padding:  EdgeInsets.only(left:  10.0,right: 10,top: 20,bottom: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: grayRoundedColor,// set border color
                                        width: 2.0
                                    )
                                ),
                                child: Text(
                                  newsDetailsResponseModel.name!=null?newsDetailsResponseModel.name:"",
                                  style: blueColorBoldStyle(18),
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
                                                  width:MediaQuery.of(context).size.width/2-210,
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
                                                          addComment(token, writeCommentControler.text==null?"": writeCommentControler.text);
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
                                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                                    child: Text(AppLocalizations.of(context).lblLikes+
                                      ' ('+likersList.length.toString()+")",style: blueColorBoldStyle(18),),
                                  ),
                                  const Divider(),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,right: 20),
                                    height: 350 ,
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
                                              ClipRRect(borderRadius: BorderRadius.circular(10),
                                                  child: Container(
                                                    width: 35.0,
                                                    height: 35.0,
                                                    margin: EdgeInsets.only(left: 1,right: 1),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: new BorderRadius.circular(30.0),
                                                        border: Border.all(
                                                            color: grayRoundedColor,// set border color
                                                            width: 1.0
                                                        )
                                                    ),
                                                    child: CachedNetworkImage(
                                                        width: double.infinity,
                                                        height: 40,
                                                        fit: BoxFit.cover,
                                                        imageUrl: likersList[index].image!=null?likersList[index].image:
                                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png"),
                                                  )),
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
      ),
    );
  }
}
