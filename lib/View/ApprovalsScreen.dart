import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/my_library_response_model.dart';
import 'package:itimaatysoharsohar/Repository/ApprovalsRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/View/ApprovalsDetailsScreen.dart';
import 'package:itimaatysoharsohar/Widgets/MyExpanation.dart';
import '../Models/AllAprovalsResponseModel.dart';
import '../Models/LoginResponseModel.dart';
import '../Models/SignatureStatusEnumModel.dart';
import '../Models/all_status_response.dart';
import '../Models/committee_response_model.dart';
import 'DrawerWidget.dart';
import 'FontsStyle.dart';
import 'SignInScreen.dart';

class ApprovalsScreen extends StatefulWidget {

  @override
  ApprovalsScreenTest createState() => ApprovalsScreenTest();

}


class ApprovalsScreenTest extends State<ApprovalsScreen> {

  ApprovalsRepository approvalsRepository;
  AllAprovalsResponseModel allAprovalsResponseModel =new AllAprovalsResponseModel();
  GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();
  TextEditingController controller = new TextEditingController();
  String userToken="";
  String baseUrl="";
  int indexClick=0;
  List<AllAprovalsResponseModelData> _listDetails = [];
  List<AllAprovalsResponseModelData> _searchResult = [];

  // ___________________________
  List<String> allStatusList = [];
  String statusValue;
  List<bool> _isChecked = [];
  List<String> _isCheckedItems = [];
  bool isStatusExpanded = false;

  List<CommitteeResponseModelData> allCommitteList = [];
  List<CommitteeResponseModelData> newAllCommitteList = [];
  String committeValue;
  List<bool> _isCheckedCommitte = [];
  List<String> _isCheckedItemsCommitte = [];
  bool isCommitteExpanded = false;
  // _____________________________
  int listLength=0;
  int firstPage=1;
  int currentPage=1;
  List<int> listedIntegers=[];
  int userId=0;
  int status;
  String committe_id;
  @override
  void initState() {
    Constants.draweItem="Approvals";
    getUser().then((value) {
      userId=value.id;
      SharedPreferencesHelper.getLoggedToken().then((value) {
        userToken=value;
          String baseUri= Constants.BASE_URL;
          baseUrl=baseUri;
          getAllAprovals(baseUrl,userToken,1);
          // });

      });
    });

  }

  fillStatusList(){
    allStatusList.add(AppLocalizations.of(context).lblNew);
    allStatusList.add(AppLocalizations.of(context).lblPartlySigned);
    allStatusList.add(AppLocalizations.of(context).lblFullySigned);
    allStatusList.add(AppLocalizations.of(context).lblApprovedSignature);
  }

  // void getAllAprovals(String baseUrl ,String token,int pageNum,int status,int comitte_id) {
  void getAllAprovals(String baseUrl ,String token,int pageNum) {
    load();
    approvalsRepository = new ApprovalsRepository();
    Future<AllAprovalsResponseModel> allList = approvalsRepository.getAllApprovals(baseUrl,token,pageNum,status,committe_id);
    // Future<AllAprovalsResponseModel> allList = approvalsRepository.getAllApprovals(baseUrl,token,pageNum,0,0);
    allList.then((value) {
      setState(() {
        if (value != null) {
          showSuccess();
          // allAprovalsResponseModel = value;
          setState(() {
            _listDetails=value.data;

            listLength = value.lastPage;
            currentPage = value.currentPage;

            listedIntegers=[];
            for(int i=0;i<listLength;i++){
              if(i<=listLength) {
                listedIntegers.add(i + 1);
              }
            }

            // print("to>>"+value.to.toString());
            setStatusText(_listDetails);
            if(allCommitteList!=null&&allCommitteList.isEmpty&&allStatusList.isEmpty) {
              getAllCommites(baseUrl, userToken);
            }
            print("_listDetails>>"+_listDetails.toString());
          });
        }else{
          showError();
          if(value==null){
            // navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
  }

  void setStatusText(List<AllAprovalsResponseModelData>  list){
    if(list.isNotEmpty&&list!=null){
      for(int i=0; i<list.length;i++){
        if(list[i]!=null){
          if(list[i].status==SignatureStatusEnumModel.newSignature.index+1){
            list[i].statusText=AppLocalizations.of(context).lblNew;
            list[i].statusColor=Colors.black54;
          }else if(list[i].status==SignatureStatusEnumModel.partlySigned.index+1){
            list[i].statusText=AppLocalizations.of(context).lblPartlySigned;
            list[i].statusColor=yellowColor;
          }else if(list[i].status==SignatureStatusEnumModel.fullySigned.index+1){
            list[i].statusText=AppLocalizations.of(context).lblFullySigned;
            list[i].statusColor=Colors.indigoAccent;
          }else if(list[i].status==SignatureStatusEnumModel.approved.index+1){
            list[i].statusText=AppLocalizations.of(context).lblApprovedSignature;
            list[i].statusColor=Color(0xff4a976e);
          }
        }
      }
    }
    setVisibilistySignature(_listDetails);
  }

  void setVisibilistySignature(List<AllAprovalsResponseModelData>  list){
    if(list.isNotEmpty&&list!=null){
      for(int i=0; i<list.length;i++){

        var product = list[i].assignees.firstWhere((product) => product.userId == userId, orElse: () => null);
        if(product!=null&& (list[i].status==SignatureStatusEnumModel.newSignature.index+1||
            list[i].status==SignatureStatusEnumModel.partlySigned.index+1)){
          list[i].visible=true;
          break;
        }else{
          list[i].visible=false;
        }
      }
    }
  }

  void getAllCommites(String baseUrl,String token) {
    print("tokenISSSS>"+token.toString());
    this.userToken=token;
    load();
    approvalsRepository = new ApprovalsRepository();
    Future<String> allList = approvalsRepository.getAllCommittes(baseUrl,token);
    allList.then((string) {
      setState(() {
        if (string != null) {
          showSuccess();
          final jsonData = jsonDecode(string);

          CommitteeResponseModel value =  CommitteeResponseModel.fromJson(jsonData);
          if(value.data!=null){
            for(int i=0;i<value.data.length;i++){
              if(value.data[i].admins!=null){
                var product = value.data[i].admins.firstWhere((product) => product.id == userId, orElse: () => null);
                // var product2 = value.data[i].users.firstWhere((product) => product.id == userId, orElse: () => null);
                if(product!=null){
                  allCommitteList.add(value.data[i]);
                  _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
                  _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
                }
                // for(int m=0;m<value.data[i].admins.length;m++){
                //   if(value.data[i].admins[m].id==userId){
                //     allCommitteList.add(value.data[i]);
                //     _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
                //     _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
                //   }
                // }
              }
            }
          }
          print("allCommitteList>>"+allCommitteList.toList().toString());
          fillStatusList();
          // allCommitteList = value.data;
        }else{
          showError();
          if(string==null){
            navigateAndFinish(context, SignInScreen(false));
          }
        }
      });
    });
  }

  // void getAllStatus(String baseUrl ,String token) {
  //   load();
  //   approvalsRepository = new ApprovalsRepository();
  //   Future<List<AllStatusResponse>> allList = approvalsRepository.getAllStatus(baseUrl,token);
  //   allList.then((value) {
  //     showSuccess();
  //     setState(() {
  //       if (value != null) {
  //         setState(() {
  //           for(int i=0;i<value.length;i++){
  //             print("nameValue>>"+value[i].name.toString());
  //           }
  //         });
  //       }else{
  //         showError();
  //         if(value==null){
  //           // navigateAndFinish(context, SignInScreen());
  //         }
  //       }
  //     });
  //   });
  // }

  void getWaitMe(String baseUrl ,String token,int pageNum) {
    load();
    approvalsRepository = new ApprovalsRepository();
    Future<AllAprovalsResponseModel> allList = approvalsRepository.getWaitMe(baseUrl,token,pageNum,status,committe_id);
    allList.then((value) {
      setState(() {
        if (value != null) {
          showSuccess();
          // allAprovalsResponseModel = value;
          _listDetails=value.data;
          listedIntegers=[];
          listLength = value.lastPage;
          currentPage = value.currentPage;
          for(int i=0;i<listLength;i++){
            if(i<=listLength) {
              listedIntegers.add(i + 1);
            }
          }
          setStatusText(_listDetails);
        }else{
          showError();
          if(value==null){
            // navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
  }

  void getWaitOther(String baseUrl ,String token,int pageNum) {
    load();
    approvalsRepository = new ApprovalsRepository();
    Future<AllAprovalsResponseModel> allList = approvalsRepository.getWaitOther(baseUrl,token,pageNum,status,committe_id);
    allList.then((value) {
      setState(() {
        if (value != null) {
          showSuccess();
          // allAprovalsResponseModel = value;
          _listDetails=value.data;
          listedIntegers=[];
          listLength = value.lastPage;
          currentPage = value.currentPage;
          for(int i=0;i<listLength;i++){
            if(i<=listLength) {
              listedIntegers.add(i + 1);
            }
          }
          setStatusText(_listDetails);
        }else{
          showError();
          if(value==null){
            // navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
  }

  void getCompleted(String baseUrl ,String token ,int pageNum) {
    load();
    approvalsRepository = new ApprovalsRepository();
    Future<AllAprovalsResponseModel> allList = approvalsRepository.getCompleted(baseUrl,token,pageNum,status,committe_id);
    allList.then((value) {
      setState(() {
        if (value != null) {
          showSuccess();
          // allAprovalsResponseModel = value;
          _listDetails=value.data;
          listedIntegers=[];
          listLength = value.lastPage;
          currentPage = value.currentPage;
          for(int i=0;i<listLength;i++){
            if(i<=listLength) {
              listedIntegers.add(i + 1);
            }
          }
          setStatusText(_listDetails);
        }else{
          showError();
          if(value==null){
            // navigateAndFinish(context, SignInScreen());
          }
        }
      });
    });
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    // _searchResult = _listDetails.where((x) =>
    //     x.title.contains(controller.text)?true:false)
    // ).toList();


    _listDetails.forEach((userDetail) {
      if (userDetail.title.toLowerCase().contains(text) || userDetail.title.toLowerCase().contains(text))
        _searchResult.add(userDetail);
    });
    setState(() {});
  }

  Widget leaveRowForMembers(AllAprovalsResponseModelDataAssignees leave,int index) {
    return
      Container(
        width: 45,
        height: 45,
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left:3,right: 3),
              child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey.shade200,
                  child: new Container(
                    width: 30.0,
                    height: 30.0,
                    margin: EdgeInsets.only(left: 1,right: 1),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new CachedNetworkImageProvider(
                          leave.user!=null?leave.user.image!=null?!leave.user.image.contains(".html")?leave.user.image:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                        ),
                      ),
                    ),
                  )
              ),
            ),
            new Align(alignment: Alignment.bottomRight,
              child: new Container(
                width: 15.0,
                height: 15.0,
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle
                ),
                alignment: Alignment.center,
                child: new Text(leave.order.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 8),),
              ),)
          ],),
      );
  }

  Widget _buildTiles(AllAprovalsResponseModelData root,int index) {
    return InkWell(
      onTap: () async {
        // navigateTo(context, ApprovalsDetailsScreen(root));
        bool change = await Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ApprovalsDetailsScreen(root)));
        if(change==true){
          if(indexClick==0){
            getAllAprovals(baseUrl,userToken,currentPage);
          }else if(indexClick==1){
            getWaitMe(baseUrl,userToken,currentPage);
          }else if(indexClick==2){
            getWaitOther(baseUrl,userToken,currentPage);
          }else if(indexClick==3){
            getCompleted(baseUrl,userToken,currentPage);
          }
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 12,bottom: 12),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(root.title.toString(),style: blueColorStyleMediumWithColor(18,Colors.black),),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  SizedBox(
                    height: 30,
                    // width: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: root.assignees.length>=2?2:root.assignees.length,
                      // itemCount: 6,
                      itemBuilder: (context, index) {
                        return leaveRowForMembers(root.assignees[index],index);
                      },
                    ),
                  ),
                  root.assignees.length>2? Container(
                    margin: EdgeInsets.only(left: 4,right: 4),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: yellowColor),
                      shape: BoxShape.circle,
                      // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: yellowColor,
                    ),
                    child:Align(
                      alignment: Alignment.center,
                      child: Text("+"+(root.assignees.length-2).toString(),style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'regular'
                      ),),
                    ),
                  ):const SizedBox()
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child:
              Align(
                alignment: AppLocalizations.of(context).locale=="en"?Alignment.centerLeft:Alignment.centerRight,
                child: Container(
                    padding: EdgeInsets.only(left: 16,right: 16,top: 6,bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [0.1, 0.9],
                        colors: [
                          root.statusColor==null?Color(0xff4a976e):root.statusColor.withOpacity(0.1),
                          root.statusColor==null?Color(0xff4a976e):root.statusColor.withOpacity(0.1),
                          // Color(0xffe5fbf3)
                        ],
                      ),
                    ),
                    child: Text(
                      // root.status.toString(),
                      root.statusText.toString(),
                      style: TextStyle(
                        // color: Color(0xff98e0c5) ,
                        color: root.statusColor==null?Color(0xff4a976e):root.statusColor ,
                        fontFamily: "black",
                        fontSize: 16,
                      ),
                    )
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(root.createdAt!=null?getFormattedDate(stringToDateTime(root.createdAt)).toString():"",style: blueColorStyleMediumWithColor(18,grayTextColor),),
            ),
            Expanded(
              flex: 1,
              child: Text(root.updatedAt!=null?getFormattedDate(stringToDateTime(root.updatedAt)).toString():"",style: blueColorStyleMediumWithColor(18,grayTextColor),),
            ),
            // Expanded(
            //   flex: 1,
            //   child: InkWell(
            //     onTap: () {
            //       print("njbjbj"+index.toString());
            //       // openDialogForDire(root);
            //     },
            //     child: Icon(Icons.more_vert,size: 30,),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  String applyCommitee(){
    setState(() {
      if(newAllCommitteList.isNotEmpty) {
        List<int> charCodes = [];
        newAllCommitteList.forEach((element) {
          charCodes.add(element.id);
        });
        // return charCodes.map((i) => i.toString()).join(",");
        committe_id = charCodes.map((i) => i.toString()).join(",");
      }else{
        committe_id=null;
      }
    });
  }

  void filterFunc(){
    setState(() {
      _searchResult.clear();
      applyCommitee();
      // _searchResult = _listDetails.where((x) => statusValue==x.statusText ||
      //     (x.committeeId!=null&&newAllCommitteList.isNotEmpty? newAllCommitteList.any((element) => element.id == x.committeeId):true)
      // ).toList();

      // newAllCommitteList.any((element) {
      //   print("elementIs>"+element.id.toString());
      // });
      if(indexClick==0){
        getAllAprovals(baseUrl,userToken,currentPage);
      }else if(indexClick==1){
        getWaitMe(baseUrl,userToken,currentPage);
      }else if(indexClick==2){
        getWaitOther(baseUrl,userToken,currentPage);
      }else if(indexClick==3){
        getCompleted(baseUrl,userToken,currentPage);
      }
      // getAllAprovals(baseUrl,userToken,currentPage);
    });
  }

  void openBottomSheetForFilter(BuildContext _context){
    isStatusExpanded=false;
    isCommitteExpanded=false;

    showModalBottomSheet(
        isScrollControlled: true,
        // isDismissible: false,
        context: _context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return StatefulBuilder( builder: (BuildContext context, StateSetter setStateHere /*You can rename this!*/) {
            return Container(
              // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(_context).size.width,
                color: Colors.transparent,
                child:Row(
                  children: [
                    Expanded(
                      flex:4,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Expanded(
                      flex:2,
                      child: Container(
                        color: Colors.white,
                        // width: MediaQuery.of(context).size.width - 200,
                        child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 20,left: 16,right: 16,top: 30),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Container(
                                    margin:
                                    EdgeInsets.only(
                                        top: 10),
                                    child: Text(AppLocalizations.of(_context).lblFilterBy,
                                      style: blueColorBoldStyle(26),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setStateHere((){
                                        isStatusExpanded=false;
                                        isCommitteExpanded=false;

                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Icon(Icons.clear,color: Colors.black,),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  // height:MediaQuery.of(context).size.height-200 ,
                                  margin: EdgeInsets.only(left:16,right: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [



                                      Text(
                                        AppLocalizations.of(
                                            _context)
                                            .lblStatus, style: grayTextColorStyleBlack(20),),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        padding:
                                        EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 12,
                                            bottom: 12),
                                        width: MediaQuery.of(
                                            _context)
                                            .size
                                            .width,
                                        // height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: grayTextColor
                                                    .withOpacity(
                                                    0.6),
                                                width: 0.6),
                                            borderRadius: BorderRadius
                                                .all(Radius
                                                .circular(
                                                16))),
                                        child: Container(
                                          // padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                          height: 40,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 8,
                                                // width:MediaQuery.of(context).size.width-100,
                                                child: InkWell(
                                                  onTap: () {
                                                    setStateHere(() {
                                                      isStatusExpanded = !isStatusExpanded;
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(top: 2),
                                                    child: Text(
                                                      statusValue!=null?statusValue:"",
                                                      style: TextStyle(fontSize: 18, fontFamily: 'medium', color: Color(0xff617287)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child:
                                                  InkWell(
                                                    onTap:
                                                        () {
                                                      setStateHere(() {
                                                        isStatusExpanded = !isStatusExpanded;
                                                      });
                                                    },
                                                    child: isStatusExpanded
                                                        ? Icon(
                                                      Icons.keyboard_arrow_down_rounded,
                                                      size: 24,
                                                      color: grayTextColor,
                                                    )
                                                        : Icon(
                                                      Icons.keyboard_arrow_up,
                                                      size: 24,
                                                      color: grayTextColor,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      isStatusExpanded ? SizedBox(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                14),
                                            border: Border.all(
                                                color: Colors.grey, // set border color
                                                width: 1.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors
                                                      .black12,
                                                  blurRadius:
                                                  10)
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 10,),
                                              InkWell(
                                                onTap: () {
                                                  setStateHere(() {
                                                    isStatusExpanded=!isStatusExpanded;
                                                  },
                                                  );
                                                },
                                                child:  Container(
                                                  child: Icon(Icons.clear,color: Colors.white,size: 18,),
                                                  decoration: BoxDecoration(
                                                    color: yellowColor,
                                                    borderRadius: BorderRadius.circular(14),
                                                    border: Border.all(color: yellowColor, width: 1.0),
                                                    boxShadow: [
                                                      BoxShadow(color: Colors.black12, blurRadius: 10)
                                                    ],
                                                  ),
                                                  padding: EdgeInsets.all(2),
                                                ),
                                              ),

                                              const SizedBox(height: 10,),
                                              ListView.builder(
                                                physics: const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: allStatusList?.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      setStateHere((){
                                                        statusValue=allStatusList[index];
                                                        if(statusValue==AppLocalizations.of(context).lblNew){
                                                          status=1;
                                                        }else if(statusValue==AppLocalizations.of(context).lblPartlySigned){
                                                          status=2;
                                                        }else if(statusValue==AppLocalizations.of(context).lblFullySigned){
                                                          status=3;
                                                        }else if(statusValue==AppLocalizations.of(context).lblApprovedSignature){
                                                          status=4;
                                                        }
                                                        isStatusExpanded=!isStatusExpanded;
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.transparent,
                                                          ),
                                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                                        color: statusValue==allStatusList[index]?yellowColor:Colors.transparent
                                                      ),
                                                      margin: EdgeInsets.only(left: 16,right: 16,bottom: 6),
                                                      padding: EdgeInsets.only(top: 4,bottom: 2,left: 6,right: 6),
                                                      child: Text(allStatusList[index],style:
                                                      TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: 'medium',
                                                        color: statusValue==allStatusList[index]?Colors.white:Colors.black
                                                      ),),
                                                    ),
                                                  );
                                                },
                                              ),

                                              const SizedBox(height: 10,),
                                            ],
                                          ),
                                        ),
                                      ) : Container(),
                                      InkWell(
                                          onTap: () {
                                            setStateHere(() {
                                              isStatusExpanded=false;
                                              isCommitteExpanded=false;
                                            },
                                            );

                                          },
                                          child:  Container(height: 20,)),

                                      Text(
                                        AppLocalizations.of(_context).lblCommittee,
                                        style: grayTextColorStyleBlack(20),
                                      ),
                                      const SizedBox(height: 4,),
                                      Container(
                                        padding:
                                        EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 12,
                                            bottom: 12),
                                        width: MediaQuery.of(
                                            _context)
                                            .size
                                            .width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: grayTextColor
                                                    .withOpacity(
                                                    0.6),
                                                width: 0.6),
                                            borderRadius: BorderRadius
                                                .all(Radius
                                                .circular(
                                                16))),
                                        child:Container(
                                          // padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                                          height: 40,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 8,
                                                // width:MediaQuery.of(context).size.width-100,
                                                child: InkWell(
                                                  onTap: () {
                                                    setStateHere(() {
                                                      isCommitteExpanded = !isCommitteExpanded;
                                                    });
                                                  },
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      scrollDirection: Axis.horizontal,
                                                      itemCount: newAllCommitteList.length,
                                                      itemBuilder: (context, index) {
                                                        return Container(
                                                          margin: EdgeInsets.only(left: 8, right: 8),
                                                          padding: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 2),
                                                          decoration: BoxDecoration(
                                                              color: Color(0xffeaeaea),
                                                              // color: Colors.red,
                                                              border: Border.all(color: Color(0xffeaeaea), width: 0.6),
                                                              borderRadius: BorderRadius.all(Radius.circular(9))),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                                            crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(top: 2),
                                                                child: Text(
                                                                  newAllCommitteList[index].name,
                                                                  style: TextStyle(fontSize: 18, fontFamily: 'medium', color: Color(0xff617287)),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              InkWell(
                                                                  onTap: () {
                                                                    setStateHere(() {
                                                                      for(int i=0;i<_isCheckedItemsCommitte.length;i++){
                                                                        if(newAllCommitteList[index].name==_isCheckedItemsCommitte[i]||
                                                                            newAllCommitteList[index].name==' '+_isCheckedItemsCommitte[i]){
                                                                          newAllCommitteList.removeAt(index);
                                                                          _isCheckedCommitte[i]=false;
                                                                          _isCheckedItemsCommitte[i]='';
                                                                          break;
                                                                          print("Intsdid");
                                                                        }else{
                                                                          print("Oustsdid");
                                                                        }
                                                                      }
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    size: 20,
                                                                    color: grayTextColor,
                                                                  ))
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child:
                                                  InkWell(
                                                    onTap:
                                                        () {
                                                      setStateHere(() {
                                                        isCommitteExpanded = !isCommitteExpanded;
                                                      });
                                                    },
                                                    child: isCommitteExpanded
                                                        ? Icon(
                                                      Icons.keyboard_arrow_down_rounded,
                                                      size: 24,
                                                      color: grayTextColor,
                                                    )
                                                        : Icon(
                                                      Icons.keyboard_arrow_up,
                                                      size: 24,
                                                      color: grayTextColor,
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      isCommitteExpanded ? SizedBox(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                14),
                                            border: Border.all(
                                                color: Colors.grey, // set border color
                                                width: 1.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors
                                                      .black12,
                                                  blurRadius:
                                                  10)
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 10,),
                                              InkWell(
                                                onTap: () {
                                                  setStateHere(() {
                                                    isCommitteExpanded=!isCommitteExpanded;
                                                  },
                                                  );
                                                },
                                                child:  Container(
                                                  child: Icon(Icons.clear,color: Colors.white,size: 18,),
                                                  decoration: BoxDecoration(
                                                    color: yellowColor,
                                                    borderRadius: BorderRadius.circular(14),
                                                    border: Border.all(color: yellowColor, width: 1.0),
                                                    boxShadow: [
                                                      BoxShadow(color: Colors.black12, blurRadius: 10)
                                                    ],
                                                  ),
                                                  padding: EdgeInsets.all(2),
                                                ),
                                              ),

                                              const SizedBox(height: 10,),

                                              ListView.builder(
                                                physics: const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: allCommitteList?.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  return CheckboxListTile(
                                                    checkColor: Colors.white,
                                                    activeColor: Colors.amberAccent,
                                                    title: Text(allCommitteList[index].name,
                                                      style:  TextStyle(
                                                          fontSize: 22
                                                      ),),
                                                    value: _isCheckedCommitte[index],
                                                    onChanged: (val) {
                                                      setStateHere(
                                                            () {
                                                          _isCheckedCommitte[index] = val;
                                                          if (val) {
                                                            _isCheckedItemsCommitte[index]=allCommitteList[index].name;
                                                          }else{
                                                            _isCheckedItemsCommitte[index]='';
                                                          }
                                                          print("checkelength>>" + _isCheckedCommitte.length.toString());
                                                          print("isCheckeIs>>" + _isCheckedCommitte.toString());
                                                          print("isCheckeIs>>" + _isCheckedItemsCommitte.toString());
                                                          print("nameIs>>" + allCommitteList[index].name.toString());
                                                          if(val){
                                                            setStateHere(() {
                                                              newAllCommitteList.add(CommitteeResponseModelData(name:allCommitteList[index].name,id:allCommitteList[index].id));
                                                              // newAllCommitteList.add(CommitteeResponseModelData(id:allCommitteList[index].id));
                                                              // print("insideOMMMMM>>" + newAllCommitteList[0].id.toString());
                                                            },
                                                            );
                                                          }else{
                                                            setStateHere(() {
                                                              print("insideFalse");
                                                              for(int i=0;i<newAllCommitteList.length;i++){
                                                                print("nameFor"+newAllCommitteList[i].name);
                                                                if(allCommitteList[index].name==newAllCommitteList[i].name){
                                                                  print("insideFor");
                                                                  newAllCommitteList.removeAt(i);
                                                                  break;
                                                                }else{
                                                                  print("OutsideFor");
                                                                }
                                                              }
                                                            },
                                                            );

                                                          }
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                              const SizedBox(height: 10,),
                                            ],
                                          ),
                                        ),
                                      ) : Container(),
                                      InkWell(
                                          onTap: () {
                                            setStateHere(() {
                                              isStatusExpanded=false;
                                              isCommitteExpanded=false;
                                            },
                                            );

                                          },
                                          child:  Container(height: 20,)),

                                      Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setStateHere((){
                                                  statusValue=null;
                                                  status=null;
                                                  committe_id=null;
                                                  newAllCommitteList.clear();
                                                  _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
                                                  _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    _searchResult.clear();
                                                  });

                                                  if(indexClick==0){
                                                    getAllAprovals(baseUrl,userToken,1);
                                                  }else if(indexClick==1){
                                                    getWaitMe(baseUrl,userToken,1);
                                                  }else if(indexClick==2){
                                                    getWaitOther(baseUrl,userToken,1);
                                                  }else if(indexClick==3){
                                                    getCompleted(baseUrl,userToken,1);
                                                  }
                                                  // clearFilteredData();
                                                });
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.only(top: 5),
                                                  // padding: EdgeInsets.only(top: 8,bottom:6,left: 30,right: 30),
                                                  height:50,
                                                  width: MediaQuery.of(context).size.width/8,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: blueColor,
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(14))
                                                  ),
                                                  child: Center(
                                                    child: Text(AppLocalizations.of(_context).lblReset,style: blueColorStyleMedium(18),),
                                                  )
                                              ),
                                            ),
                                            const SizedBox(width: 10,),
                                            InkWell(
                                              onTap: () {
                                                setStateHere((){
                                                  isStatusExpanded=false;
                                                  isCommitteExpanded=false;
                                                });

                                                Navigator.pop(context);
                                                print("Hereeeee");
                                                filterFunc();
                                              },
                                              child: Container(
                                                // padding: EdgeInsets.only(top: 10),
                                                // height:50,
                                                // width: 180,
                                                  padding: EdgeInsets.only(top: 5),
                                                  // padding: EdgeInsets.only(top: 8,bottom:6,left: 30,right: 30),
                                                  height:50,
                                                  width: MediaQuery.of(context).size.width/8,
                                                  decoration: BoxDecoration(
                                                      color: yellowColor,
                                                      border: Border.all(
                                                        color: yellowColor,
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(14))
                                                  ),
                                                  child: Center(
                                                    child: Text(AppLocalizations.of(_context).lblFilter,style: TextStyle(
                                                      color: Colors.white ,
                                                      fontFamily: "medium",
                                                      fontSize: 18,
                                                      // fontWeight: FontWeight.bold
                                                    ),),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ),
                    )
                  ],
                )

            );
          },);
        });
  }

  void sortCreatedAt(int action){
    setState(() {
      if(action==1) {
        _listDetails.sort((a, b) { //sorting in ascending order
          return DateTime.parse(a.createdAt).compareTo(DateTime.parse(b.createdAt));
        });
      }else{
        _listDetails.sort((a, b){ //sorting in descending order
          return DateTime.parse(b.createdAt).compareTo(DateTime.parse(a.createdAt));
        });
      }
      if(_searchResult.isNotEmpty){
        if(action==1) {
          _searchResult.sort((a, b) { //sorting in ascending order
            return DateTime.parse(a.createdAt).compareTo(DateTime.parse(b.createdAt));
          });
        }else{
          _searchResult.sort((a, b){ //sorting in descending order
            return DateTime.parse(b.createdAt).compareTo(DateTime.parse(a.createdAt));
          });
        }
      }
      print("_listDetails>>"+_listDetails.toString());
    });
  }

  void sortLastModifiedAdt(int action){
    setState(() {
      if(action==1) {
        _listDetails.sort((a, b) { //sorting in ascending order
          return DateTime.parse(a.updatedAt).compareTo(DateTime.parse(b.updatedAt));
        });
      }else{
        _listDetails.sort((a, b){ //sorting in descending order
          return DateTime.parse(b.updatedAt).compareTo(DateTime.parse(a.updatedAt));
        });
      }
      if(_searchResult.isNotEmpty){
        if(action==1) {
          _searchResult.sort((a, b) { //sorting in ascending order
            return DateTime.parse(a.updatedAt).compareTo(DateTime.parse(b.updatedAt));
          });
        }else{
          _searchResult.sort((a, b){ //sorting in descending order
            return DateTime.parse(b.updatedAt).compareTo(DateTime.parse(a.updatedAt));
          });
        }
      }
      print("_listDetails>>"+_listDetails.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKeyDrawer,
        backgroundColor: grayColor,
        drawer: DrawerWidget(6),
        body:Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 16,right: 16),
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
                          AppLocalizations.of(context).lblApprovals
                          ,
                          style: blueColorBoldStyle(26),
                        ),margin: EdgeInsets.only(top: 0,left: 16,right: 16),
                      ),
                    ],
                  ),
                  Row(
                    children: [

                      InkWell(
                          onTap: () {
                            // openBottomSheetForFilter();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width/3,
                            // color: Theme.of(context).primaryColor,
                            child: new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Card(
                                child: new ListTile(
                                  leading: new Icon(Icons.search),
                                  title: new TextField(
                                    controller: controller,
                                    decoration: new InputDecoration(
                                        hintText: AppLocalizations.of(context).lblSearch,
                                        border: InputBorder.none),
                                    style: TextStyle(
                                      fontFamily: 'regular',
                                      color: Colors.black
                                    ),
                                    onChanged: onSearchTextChanged,
                                  ),
                                  trailing: new IconButton(icon: new Icon(Icons.cancel), onPressed: () {
                                    controller.clear();
                                    _searchResult.clear();
                                    onSearchTextChanged('');
                                  },),
                                ),
                              ),
                            ),
                          )
                          // Icon(
                          //   Icons.filter_alt_outlined,
                          //   size: 24,
                          //   color: grayTextColor,
                          // )
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            openBottomSheetForFilter(context);
                          },
                          child: Icon(
                            Icons.filter_alt_outlined,
                            size: 24,
                            color: grayTextColor,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 10),
              height: 0.4,color: grayTextColor,),
            Expanded(
              child:



              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    children: [

                      Container(
                        margin: EdgeInsets.only(top: 30,bottom: 0),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  statusValue=null;
                                  newAllCommitteList.clear();
                                  _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
                                  _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
                                  setState(() {
                                    _searchResult.clear();
                                  });
                                  indexClick=0;
                                  status=null;
                                  committe_id=null;
                                  getAllAprovals(baseUrl, userToken,1);
                                });
                              },
                              child: Text(
                                AppLocalizations.of(context).lblAllApprovals,
                                style: TextStyle(
                                  fontFamily: 'regular',
                                  shadows: [
                                    Shadow(
                                        color: indexClick==0?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: indexClick==0?yellowColor:Colors.transparent,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40,),
                            TextButton(
                              onPressed:(){
                                setState(() {
                                  statusValue=null;
                                  newAllCommitteList.clear();
                                  _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
                                  _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
                                  setState(() {
                                    _searchResult.clear();
                                  });
                                  indexClick=1;
                                  status=null;
                                  committe_id=null;
                                  getWaitMe(baseUrl, userToken,1);
                                });
                              },
                              child: Text(
                                AppLocalizations.of(context).lblActionRequired,
                                style: TextStyle(
                                  fontFamily: 'regular',
                                  shadows: [
                                    Shadow(
                                        color: indexClick==1?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor:indexClick==1?yellowColor:Colors.transparent,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40,),
                            TextButton(
                              onPressed:(){
                                setState(() {
                                  statusValue=null;
                                  newAllCommitteList.clear();
                                  _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
                                  _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
                                  setState(() {
                                    _searchResult.clear();
                                  });
                                  indexClick=2;
                                  status=null;
                                  committe_id=null;
                                  getWaitOther(baseUrl, userToken,1);
                                });
                              },
                              child: Text(
                                AppLocalizations.of(context).lblWaitingForOthers,
                                style: TextStyle(
                                  fontFamily: 'regular',
                                  shadows: [
                                    Shadow(
                                        color: indexClick==2?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: indexClick==2?yellowColor:Colors.transparent,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            const SizedBox(width: 40,),
                            TextButton(
                              onPressed:(){
                                setState(() {
                                  statusValue=null;
                                  newAllCommitteList.clear();
                                  _isCheckedCommitte = List<bool>.filled(allCommitteList.length, false);
                                  _isCheckedItemsCommitte = List<String>.filled(allCommitteList.length, '');
                                  setState(() {
                                    _searchResult.clear();
                                  });
                                  indexClick=3;
                                  status=null;
                                  committe_id=null;
                                  getCompleted(baseUrl, userToken,1);
                                });
                              },
                              child: Text(
                                AppLocalizations.of(context).lblCompleted,
                                style: TextStyle(
                                  fontFamily: 'regular',
                                  shadows: [
                                    Shadow(
                                        color: indexClick==3?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: indexClick==3?yellowColor:Colors.transparent,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 0,left: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: Text(
                                AppLocalizations.of(context).lblSubject,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'black'
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Text(
                                AppLocalizations.of(context).lblAssignedTo,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'black'
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Text(
                                AppLocalizations.of(context).lblStatus,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'black'
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).lblCreatedAt,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'black'
                                      // decorationStyle: TextDecorationStyle.double,
                                    ),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(left: 0,right: 0,top: 14,bottom:14),
                                    child: Column(
                                      children: [
                                        InkWell(child: new Icon(Icons.arrow_drop_up),
                                        onTap:(){
                                          sortCreatedAt(2);
                                        }),
                                        InkWell(child: new Icon(Icons.arrow_drop_down),
                                            onTap:(){
                                              sortCreatedAt(1);
                                            }),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context).lblLastModified,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'black'
                                      // decorationStyle: TextDecorationStyle.double,
                                    ),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(left: 0,right: 0,top: 14,bottom:14),
                                    child: Column(
                                      children: [
                                        InkWell(child: new Icon(Icons.arrow_drop_up),
                                            onTap:(){
                                              sortLastModifiedAdt(2);
                                            }),
                                        InkWell(child: new Icon(Icons.arrow_drop_down),
                                            onTap:(){
                                              sortLastModifiedAdt(1);
                                            }),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Expanded(
                            //   flex:1,
                            //   child: Text(
                            //     "",
                            //     style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 18,
                            //         fontFamily: 'black'
                            //       // decorationStyle: TextDecorationStyle.double,
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                     _searchResult.isEmpty? _listDetails!=null &&  _listDetails.isNotEmpty?
                      new ListView.builder(
                        itemCount: _listDetails.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) =>
                            _buildTiles(_listDetails[index],index),
                      ):Center(
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
                      ): new ListView.builder(
                       itemCount: _searchResult.length,
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       padding: EdgeInsets.zero,
                       itemBuilder: (BuildContext context, int index) =>
                           _buildTiles(_searchResult[index],index),
                     ),


                      // _listDetails!=null &&  _listDetails.isNotEmpty?
                      // Container(
                      //   margin: EdgeInsets.only(left: 8),
                      //   child: SizedBox(
                      //     child:
                      //     _searchResult.length != 0 || controller.text.isNotEmpty
                      //         ? new ListView.builder(
                      //       itemCount: _searchResult.length,
                      //       shrinkWrap: true,
                      //       physics: NeverScrollableScrollPhysics(),
                      //       padding: EdgeInsets.zero,
                      //       itemBuilder: (BuildContext context, int index) =>
                      //           _buildTiles(_searchResult[index],index),
                      //     )
                      //         : (_searchResult.length==0 &&(statusValue!=null||newAllCommitteList.isNotEmpty))?Center(
                      //       child: Container(
                      //         margin: EdgeInsets.only(top: 140),
                      //         height: 250,
                      //         width: 250,
                      //         color: Colors.white,
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Image.asset("assets/images/no_data.png"),
                      //             const SizedBox(height: 10,),
                      //             Text(AppLocalizations.of(context).lblNoData,style: blueColorStyleMediumWithColor(18,Colors.black),)
                      //           ],
                      //         ),
                      //       ),
                      //     ):new ListView.builder(
                      //       itemCount: _listDetails.length,
                      //       shrinkWrap: true,
                      //       physics: NeverScrollableScrollPhysics(),
                      //       padding: EdgeInsets.zero,
                      //       itemBuilder: (BuildContext context, int index) =>
                      //           _buildTiles(_listDetails[index],index),
                      //     ),
                      //
                      //
                      //   ),
                      // ) : Center(
                      //   child: Container(
                      //     margin: EdgeInsets.only(top: 140),
                      //     height: 250,
                      //     width: 250,
                      //     color: Colors.white,
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         Image.asset("assets/images/no_data.png"),
                      //         const SizedBox(height: 10,),
                      //         Text(AppLocalizations.of(context).lblNoData,style: blueColorStyleMediumWithColor(18,Colors.black),)
                      //       ],
                      //     ),
                      //   ),
                      // ),




                      const SizedBox(height: 20,),
                      SizedBox(
                        // width: 150,
                        height: 30,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if(currentPage==1){

                                }else{
                                  if(indexClick==0){
                                    getAllAprovals(baseUrl,userToken,currentPage-1);
                                  }else if(indexClick==1){
                                    getWaitMe(baseUrl,userToken,currentPage-1);
                                  }else if(indexClick==2){
                                    getWaitOther(baseUrl,userToken,currentPage-1);
                                  }else if(indexClick==3){
                                    getCompleted(baseUrl,userToken,currentPage-1);
                                  }

                                }
                              },
                              child: Icon(Icons.arrow_back_ios_outlined,size: 14,),
                            ),
                            const SizedBox(width: 6,),
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listLength,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                    onTap: () {

                                      if(indexClick==0){
                                        getAllAprovals(baseUrl,userToken,listedIntegers[index]);
                                      }else if(indexClick==1){
                                        getWaitMe(baseUrl,userToken,listedIntegers[index]);
                                      }else if(indexClick==2){
                                        getWaitOther(baseUrl,userToken,listedIntegers[index]);
                                      }else if(indexClick==3){
                                        getCompleted(baseUrl,userToken,listedIntegers[index]);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(left: 3,right: 3),
                                      padding: EdgeInsets.only(left: 7,right: 7,bottom: 6),
                                      child: Center(
                                        child: Text((listedIntegers[index].toString()).toString(),
                                          style: TextStyle(
                                              fontSize: 16,fontFamily: 'regular',color:
                                          currentPage==index+1?Colors.white:Colors.black
                                          ),),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          stops: [0.1, 0.9],
                                          colors: [
                                            currentPage==index+1?Color(0xffFEC20E):Colors.transparent,
                                            currentPage==index+1?Color(0xffFEC20E):Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                            ),
                            const SizedBox(width: 6,),
                            InkWell(
                              onTap: () {
                                print("indexClick>>"+indexClick.toString());
                                if(currentPage==listLength){

                                }else{
                                  if(indexClick==0){
                                    getAllAprovals(baseUrl,userToken,currentPage+1);
                                  }else if(indexClick==1){
                                    getWaitMe(baseUrl,userToken,currentPage+1);
                                  }else if(indexClick==2){
                                    getWaitOther(baseUrl,userToken,currentPage+1);
                                  }else if(indexClick==3){
                                    getCompleted(baseUrl,userToken,currentPage+1);
                                  }
                                }
                              },
                              child: Icon(Icons.arrow_forward_ios,size: 14,),
                            ),
                          ],
                        )

                      ),
                      const SizedBox(height: 20,),
                    ],

                  ),
                ),
              ),
            ),
          ],
        )


    );
  }
}


