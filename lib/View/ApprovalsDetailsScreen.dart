import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart' hide Image;
import 'dart:ui';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itimaatysoharsohar/LocalDb/SharedPreferencesHelper.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Models/AllAprovalsResponseModel.dart';
import 'package:itimaatysoharsohar/Models/LoginResponseModel.dart';
import 'package:itimaatysoharsohar/Models/SignatureRequestModel.dart';
import 'package:itimaatysoharsohar/Models/SignatureResponseModel.dart';
import 'package:itimaatysoharsohar/Models/SignatureStatusEnumModel.dart';
import 'package:itimaatysoharsohar/Models/UsersAndComments.dart';
import 'package:itimaatysoharsohar/Models/actions_response_model.dart';
import 'package:itimaatysoharsohar/Repository/MeetingRepository.dart';
import 'package:itimaatysoharsohar/Utils/AppColors.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/Utils/PieChartUtils/pie_data.dart';
import 'package:itimaatysoharsohar/View/FontsStyle.dart';
import 'package:itimaatysoharsohar/View/WebViewScreenForMirrorView.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:screenshot/screenshot.dart';
import 'package:signature/signature.dart';
import 'package:url_launcher/url_launcher.dart';

import '../LocalDb/DbHelper.dart';
import 'TestSignature.dart';


class ApprovalsDetailsScreen extends StatefulWidget {

  AllAprovalsResponseModelData allAprovalsResponseModelData;
  ApprovalsDetailsScreen(this.allAprovalsResponseModelData);

  @override
  ApprovalsDetailsScreenState createState() => ApprovalsDetailsScreenState();
}

class ApprovalsDetailsScreenState extends State<ApprovalsDetailsScreen> {

  // PainterController _controller;
  ActionsResponseModel decisonResponseModel = new ActionsResponseModel();
  MeetingRepository meetingRepository;
  String userToken="";
  var writeCommentControler= TextEditingController();
  var voteControler= TextEditingController();
  int completePercent=0;
  int notCompletePercent=0;
  int inProgressPercent=0;

  int totalNum=0;
  List<String> complete=[];
  List<String> notComplete=[];
  List<String> inProgress=[];
  List<UsersAndComments> userAndCommentsList =[];
  List<String> votesList ;
  String votesValue;
  String status='';
  String statusBack = null;
  String firstChar='';
  int biggestPercent=0;
  static List<DataForPicChart> data = [];

  String baseUrl="";
  var dbHelper = DbHelper();
  int userId=0;
  String email="";
  String userImage;
  String userName;
  int indexClick=0;
  int indexColor=1;
  bool checkBack=false;
  File logoFile,_image;
  // MultipartFile logoFileUpload;
  String base64ImageUploaded;

  PainterController _newController() {
    PainterController controller = PainterController();
    controller.thickness = 4.0;

    controller.backgroundColor = Colors.white;
    return controller;
  }

  @override
  void initState() {
    // _controller = _newController();
    if(widget.allAprovalsResponseModelData!=null&&widget.allAprovalsResponseModelData.assignees.isNotEmpty){
      for(int i=0;i<widget.allAprovalsResponseModelData.assignees.length;i++){
        widget.allAprovalsResponseModelData.assignees[i].index=i;
        if(widget.allAprovalsResponseModelData.assignees[i].assignee!=null&&
            widget.allAprovalsResponseModelData.assignees[i].assignee.name!=null){
          if(widget.allAprovalsResponseModelData.assignees[i].assignee.prefix.isNotEmpty){
            widget.allAprovalsResponseModelData.assignees[i].assignee.prefix="";
          }
          for (int m = 0; m < widget.allAprovalsResponseModelData.assignees[i].assignee.name.split(" ").length; m++) {
            widget.allAprovalsResponseModelData.assignees[i].assignee.prefix +=
            widget.allAprovalsResponseModelData.assignees[i].assignee.name.split(" ")[m][0];
          }
        }
      }
      // print("cccccccccccccccc>"+widget.allAprovalsResponseModelData.visible.toString());
    }

    getUser().then((value) {
      userId=value.id;
      email=value.email;
      userImage=value.image!=null?value.image:"";
      userName=value.name!=null?value.name:"";
      SharedPreferencesHelper.getLoggedToken().then((value) {
        userToken=value;
              String baseUri= Constants.BASE_URL;
              setState(() {
                baseUrl=baseUri;
                hasNetwork().then((hasNet) {
                  if(hasNet){

                  }else{

                  }
                });
              });

      });
    });
  }

 Future<File> getImageFromGallery() async {
    final picker = ImagePicker();

    try {
      final image = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 75,
        maxHeight: 300,
        maxWidth: 400,
      );
      print("ImageIs>>"+image.toString());
      setState(() {
        logoFile = File(image.path);
         base64ImageUploaded = base64Encode(logoFile.readAsBytesSync());
         log("base64ImageUploaded>"+base64ImageUploaded);
      });
      // setState(() {
      //   _image=logoFile;
      // });
    } catch (e) {
    }
    return logoFile;
  }

  Future<bool> _onWillPop() async {
    Navigator.pop(context,checkBack);
  }

  void postSignature(BuildContext mcontext,String baseUrl ,String token,int id,SignatureRequestModel model) {
    Navigator.pop(mcontext);
    load();
    meetingRepository = new MeetingRepository();
    Future<SignatureResponseModel> allList = meetingRepository.postSignature(baseUrl,token,id,model);
    allList.then((string) async{
      if (string != null) {
        setState(() {
          print("stringIS>>"+string.message.toString());
          showSuccess();
          widget.allAprovalsResponseModelData.status=5;
          widget.allAprovalsResponseModelData.visible=false;
          widget.allAprovalsResponseModelData.statusColor=Colors.green;
          checkBack=true;
        });

      }else{
        showError();
      }
      // });
    });
  }

  void rejectSignature(BuildContext mcontext,String baseUrl ,String token,int id,SignatureRequestModel model) {
    // Navigator.pop(mcontext);
    load();
    meetingRepository = new MeetingRepository();
    Future<SignatureResponseModel> allList = meetingRepository.rejectSignature(baseUrl,token,id,model);
    allList.then((string) async{
      if (string != null) {
        setState(() {
          print("stringIS>>"+string.message.toString());
          showSuccess();
          widget.allAprovalsResponseModelData.status= 6;//rejecct
          widget.allAprovalsResponseModelData.visible=false;
          widget.allAprovalsResponseModelData.statusColor=Colors.red;
          checkBack=true;
        });

      }else{
        showError();
      }
      // });
    });
  }

  _createFolder(Dio dio, String url)async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    new Directory(appDocDirectory.path+'/'+'dir').create(recursive: true)
        .then((Directory directory) {
      print('Path of New Dir: '+directory.path);
    });
    // final folderName = "Ijtimaati_FIles";
    // // final path = Directory("storage/emulated/0/$folderName");
    // final path = Directory("storage/$folderName");
    // if ((await path.exists())) {
    //   // TODO:
    //   print("exist");
    //   download(Dio(), url, path.path);
    // } else {
    //   // TODO:
    //   print("not exist");
    //   path.create().then((value) {
    //     download(Dio(), url, value.path);
    //   });
    // }
  }

  Future download(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        // onReceiveProgress: updateProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) { return status < 500; }
        ),
      );
      var file = File(savePath).openSync(mode: FileMode.write);
      file.writeFromSync(response.data);
      await file.close();

      // Here, you're catching an error and printing it. For production
      // apps, you should display the warning to the user and give them a
      // way to restart the download.
    } catch (e) {
      print(e);
    }
  }

  Widget leaveRowForAttachments(int id,Documents leave,int index,BuildContext context) {
    String url;
    // print("fileUrl>>"+leave.);
    String icon="assets/images/ic_word.webp";
    if(leave.library!=null&&leave.library.name!=null) {
      print("fileUrl>>"+"http://test.app.ijtimaati.com/doc-view?doc="+leave.library.fileUrl.toString()+"&id="+leave.libraryId.toString()+'&e=1');
      url="http://test.app.ijtimaati.com/doc-view?doc="+leave.library.fileUrl.toString()+"&id="+leave.libraryId.toString();
      if (leave.library.name.contains('pdf')) {
        icon = "assets/images/ic_pdf.webp";
      } else if (leave.library.name.contains('docx')) {
        icon = "assets/images/ic_word.webp";
      } else if (leave.library.name.contains('pot')||leave.library.name.contains('ppt')||leave.library.name.contains('pptx')) {
        icon = "assets/images/ic_power_point.webp";
      }else if(leave.library.name.contains(".xlsx")){
        icon="assets/images/ic_excel.webp";
      } else {
        // icon = "assets/images/ic_pdf.webp";
        // icon = "assets/images/ic_folder.webp";
      }
    }
    return leave.library!=null?InkWell(
      onTap: () {

        hasNetwork().then((value) {
          if(value){
            if(leave.library.name.contains('pot')||leave.library.name.contains('ppt')||leave.library.name.contains('pptx')
            ||leave.library.name.contains('xlsx')){
              SharedPreferencesHelper.getLoggedToken().then((value) {
                  String baseUri= Constants.BASE_URL+"/presentation/"+id.toString()+"/"+leave.library.id.toString()+"?auth="+value;
                  print("powerPointUrl>>"+baseUri);
                  navigateTo(context,WebViewScreenForMirrorView(baseUri));
                  // launchUrl(Uri.parse(baseUri));
              });
            }else {
              showDocumentForApprovals(widget.allAprovalsResponseModelData,
                  "approvals", 0, id, leave.id, leave.library.id, leave.library.name, leave.library.fileUrl.toString(), context);
            }

          }else{
            showErrorWithMsg(AppLocalizations.of(context).lblNoInternet);
          }
        });

      },
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        // width: 200,
        padding: EdgeInsets.only(left: 20,right: 40,top: 10,bottom: 10),
        // padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 40),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(14.0),
            border: Border.all(
                color: grayRoundedColor,// set border color
                width: 2.0
            )
        ),child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.,
          children: [
            Expanded(
              flex: 9,
              child: Row(
              children: [
                Image.asset(icon,width: 26,height: 26),
                const SizedBox(width: 14,),
                Flexible(
                  child: Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(leave.library!=null?leave.library.name: " ",style: blueColorStyleMedium(18),)),
                )
              ],
              ),
            ),
            // Expanded(
            //     flex: 1,
            //     child: InkWell(
            //         onTap: () async {
            //           downloadFileandOpen(context, leave.library.fileUrl, leave.library.name);
            //         },
            //         child: Icon(Icons.download,color: Colors.black,size: 24,)))
          ],
        ),
      ),
    ):const SizedBox();
  }

  Widget leaveRowForSigingInDiagram(AllAprovalsResponseModelDataAssignees leave,int index,BuildContext context) {

    return leave.assignee!=null?
    Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                  child: Text(leave.assignee.name.toString(), style: blueColorBoldStyle(16),)),
              const SizedBox(width: 14,),
              Container(
                // padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 13),
                padding: EdgeInsets.all(5),
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
                child: Text(leave.assignee.prefix.toString(), style: yellowColorStyleBold(16),),
                // Text(firstChar.toString(), style: yellowColorStyleBold(22),),
              )
            ],
          ),
        ),
        Divider(color: grayTextColor,height: 1,thickness: 0.2,),
        // const SizedBox(height: 12,),
      ],
    )
        :const SizedBox();
  }

  Widget bodyData(List<AllAprovalsResponseModelDataAssignees> list,BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          sortColumnIndex: 1,
          sortAscending: true,
          showCheckboxColumn: false,
          columns: <DataColumn>[
            DataColumn(
              label: Text(AppLocalizations.of(context).lblSteps,
                  style: blueColorBoldStyle(16)),
            ),
            DataColumn(
              label: Text(AppLocalizations.of(context).lblRecipients,
                  style:blueColorBoldStyle(16)),
            ),
            DataColumn(
              label: Text(AppLocalizations.of(context).lblStatus,
                  style: blueColorBoldStyle(16)),
            ),
            DataColumn(
              label: Text(AppLocalizations.of(context).lblLastModified,
                  style: blueColorBoldStyle(16)),
            ),

          ],
          rows: list.map((row) => DataRow(
            // color:selected? MaterialStateProperty.all(yellowColor):MaterialStateProperty.all(Colors.transparent),
            onSelectChanged: (value) {
              if (value) {
                // setState(() {
                //   selected=true;
                // });
                // print("customerId>"+customerId.toString());
                // Navigator.of(context).push(createRoute(CollectYearDetails(row,customerId)));
              }
            },
            cells: [
              DataCell(
                  Text(row.index!=null?row.index.toString():"",
                      style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'regular',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                      ))
              ),
              DataCell(
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 4,right: 4),
                        child: ClipOval(
                            child:
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.transparent,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor:Colors.transparent ,
                                backgroundImage: NetworkImage(
                                  row.assignee!=null&&row.assignee.image!=null?
                                  row.assignee.image:
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                                ),
                              ),
                            )
                        ),
                      ),
                      const SizedBox(width: 4,),
                      Text(row.assignee!=null&&row.assignee.name!=null?row.assignee.name.toString():"",
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'regular',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                          )),
                    ],
                  )
              ),
              DataCell(
                Text(
                    row.assignee!=null&&row.assignee.status!=null?row.assignee.status.toString():"",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    )),
              ),
              DataCell(
                Text(row.assignee!=null&&row.assignee.updatedAt!=null?getFormattedDate(stringToDateTime(widget.allAprovalsResponseModelData.updatedAt)):"",
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'regular',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    )),
              ),

            ],
          ),
          )
              .toList()),
    );
  }

  // ScreenshotController screenshotController = ScreenshotController();

  Future<Uint8List> exportSignature(Color penColor) async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      penColor: penColor,
      exportBackgroundColor: Colors.white,
      points: controller.points,
    );
    final signature = await exportController.toPngBytes();
    exportController.dispose();
    return signature;
  }

  bool isCLear=false;
  SignatureController controller = new  SignatureController(penStrokeWidth: 5, penColor: Colors.black);

  openSignatureDialog(BuildContext mCtx) {
    if(logoFile!=null){
      logoFile=null;
      base64ImageUploaded=null;
    }
    indexColor=1;
    // _controller = _newController();
    return showDialog(
        context: mCtx,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0))),
                contentPadding: EdgeInsets.only(top: 10.0),
                content: Container(
                  padding: EdgeInsets.only(left: 16,right: 16,top: 20,bottom: 20),
                  width: MediaQuery.of(context).size.width/2,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(mCtx).lblAddSignature,
                              style: blueColorBoldStyle(18),
                            ),
                            InkWell(
                                onTap:(){
                                  controller = new  SignatureController(penStrokeWidth: 5, penColor: Colors.black);
                                  Navigator.pop(context);
                                },child: Icon(Icons.clear,size: 30,color: grayTextColor,)),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        // SizedBox(height: 5.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  // if(_controller.isStartPaint()){
                                  //   _controller.clear();
                                    controller.clear();
                                  // }
                                  indexClick=0;
                                });
                              },
                              child: Text(
                                AppLocalizations.of(mCtx).lblDraw,
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: indexClick==0?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  fontFamily: 'regular',
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
                                  // controller.dispose();
                                  if(indexClick==0){
                                    logoFile=null;
                                  }
                                   controller = new  SignatureController(penStrokeWidth: 5, penColor: Colors.black);
                                  indexClick=1;

                                });
                              },
                              child: Text(
                                AppLocalizations.of(mCtx).lblImage,
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: indexClick==1?yellowColor:grayTextColor,
                                        offset: Offset(0, -18))
                                  ],
                                  fontFamily: 'regular',
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor:indexClick==1?yellowColor:Colors.transparent,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),

                          ],
                        ),

                        Divider(
                          color: Colors.grey,
                          height: 4.0,
                        ),
                        const SizedBox(height: 14,),

                       indexClick==0? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      indexColor=1;
                                    });
                                    // _controller.drawColor=Colors.black;
                                    controller.setPenColor(Colors.black);
                                  },
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:indexColor==1? yellowColor:Colors.transparent),
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                    indexColor=2;
                                    });
                                    controller.setPenColor(Colors.blue);
                                      // _controller.drawColor=Colors.blue;
                                  },
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: indexColor==2? yellowColor:Colors.transparent),
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      indexColor=3;
                                    });
                                    // _controller.drawColor=Colors.indigo;
                                    controller.setPenColor(Colors.indigo);
                                     // controller = new  SignatureController(penStrokeWidth: 5, penColor: Colors.indigo);
                                  },
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: indexColor==3? yellowColor:Colors.transparent),
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.indigo),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 14,),
                            DottedBorder(
                              color: Colors.black,
                              strokeWidth: 1,
                              child: Container(
                                width: MediaQuery.of(context).size.width/2-20,
                                height: MediaQuery.of(context).size.height/3,
                                child: Signature(
                                  controller: controller,
                                  backgroundColor: Colors.white,
                                ),
                              )
                              // Container(
                              //   width: MediaQuery.of(context).size.width/2-20,
                              //   height: MediaQuery.of(context).size.height/3,
                              //   // child:SignatureBox(controller),
                              //   // child:SignatureBox(),
                              //   child:Painter(_controller),
                              // ),
                            ),
                            const SizedBox(height: 14,),
                            Center(
                              child: Text(
                                AppLocalizations.of(mCtx).lblSignHere,
                                style: TextStyle(
                                  fontFamily: 'regular',
                                  color: Colors.grey.shade700,
                                  decorationThickness: 2,
                                  fontSize: 18,
                                  // decorationStyle: TextDecorationStyle.double,
                                ),
                              ),
                            ),
                            const SizedBox(height: 14,),
                          ],
                        ):
                       Row(
                         children: [
                           TextButton(
                             onPressed: () {
                               getImageFromGallery().then((value) {
                                 setState(() {
                                   logoFile=value;
                                   if(logoFile!=null){
                                     print("heerrsrd");
                                     // _controller.clear();
                                     controller.clear();
                                   }
                                 });
                               });
                             },
                             child: Text(
                               " + "+AppLocalizations.of(mCtx).lblUploadSignature,
                               style: TextStyle(
                                 fontFamily: 'regular',
                                 color: yellowColor,
                                 fontWeight: FontWeight.bold,
                                 // decoration: TextDecoration.underline,
                                 // decorationColor: indexClick==0?yellowColor:Colors.transparent,
                                 decorationThickness: 2,
                                 fontSize: 18,
                                 // decorationStyle: TextDecorationStyle.double,
                               ),
                             ),
                           ),

                           const SizedBox(width: 20,),
                           logoFile!=null?CircleAvatar(
                             backgroundImage:
                             new FileImage(logoFile) ,
                             backgroundColor: Colors.white,maxRadius: 50,
                             child:Container(),
                           ):Container()
                         ],
                       ),



                        Divider(
                          color: Colors.grey,
                          height: 4.0,
                        ),
                        const SizedBox(height: 14,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            InkWell(
                              onTap:(){
                                setState(() {
                                  // isCLear=true;
                                  if(indexClick==1){
                                    Navigator.pop(context);
                                  }else{
                                    // _controller.clear();
                                    controller.clear();
                                  }
                                });
                              },
                              child: Container(
                                  padding: EdgeInsets.only(top: 7,bottom: 7,left: 20,right: 20),
                                  decoration: BoxDecoration(
                                    // color: yellowColor,
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(14))
                                  ),
                                  child: Center(
                                    // child: Text(AppLocalizations.of(mCtx).lblClear,style: TextStyle(
                                    child: Text(AppLocalizations.of(mCtx).lblCancel,style: TextStyle(
                                      color: Colors.red ,
                                      fontFamily: "medium",
                                      fontSize: 18,
                                      // fontWeight: FontWeight.bold
                                    ),),
                                  )
                              ),
                            ),

                            const SizedBox(width: 14,),
                            InkWell(
                              onTap:(){
                                // https://test.ijtimaati.com/api/approvals/49/approve



                                if(indexClick==1){
                                  // print("base64ImageUploadedkk>"+base64ImageUploaded);
                                  String header = "data:image/png;base64,";
                                  postSignature(context,
                                      baseUrl,
                                      userToken,
                                      widget.allAprovalsResponseModelData.id,
                                      new SignatureRequestModel(file: header+base64ImageUploaded)
                                  );
                                  log("base64String1>>" + header + base64ImageUploaded.toString());
                                }else{
                                  // if(_controller.isStartPaint()){
                                  //   _controller.finish().toImage().then((value) {
                                  //     print("kmmkmkmOM>"+value.toString());
                                  //     value.toByteData(format: ImageByteFormat.png).then((val) {
                                  //       String base64String = base64Encode(val.buffer.asUint8List());
                                  //       String header = "data:image/png;base64,";
                                  //       // log("base64String>>" + header + base64String.toString());
                                  //       // print("id1>>"+ widget.allAprovalsResponseModelData.sender.id.toString());
                                  //       // print("userTokenuserToken>>"+ userToken.toString());
                                  //       // postSignature(context,
                                  //       //     baseUrl,
                                  //       //     userToken,
                                  //       //     widget.allAprovalsResponseModelData.id,
                                  //       //     new SignatureRequestModel(file: header + base64String)
                                  //       // );
                                  //       log("base64String2>>" + header + base64String.toString());
                                  //     });
                                  //   });
                                  //   print("id0000>>");
                                  // }else{
                                  //   print("id111>>");
                                  // }
                                  if(controller!=null){
                                    exportSignature(indexColor==3?Colors.indigo:indexColor==2?Colors.blue:Colors.black).then((value) {
                                      String base64String = base64Encode(value);
                                      String header = "data:image/png;base64,";
                                      // log("base64String>>" + header + base64String.toString());
                                       postSignature(context,
                                           baseUrl,
                                           userToken,
                                           widget.allAprovalsResponseModelData.id,
                                           new SignatureRequestModel(file: header + base64String)
                                       );
                                    });
                                  }
                                }


                              },
                              child: Container(
                                  padding: EdgeInsets.only(top: 7,bottom: 7,left: 25,right: 25),
                                  decoration: BoxDecoration(
                                      color: yellowColor,

                                      border: Border.all(
                                        color: yellowColor,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(14))
                                  ),
                                  child: Center(
                                    child: Text(AppLocalizations.of(mCtx).lblSUBMIT,style: TextStyle(
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
                        const SizedBox(height: 14,),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: grayColor,
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              print("sddsd");
                              // Navigator.pop(context,statusBack);
                              _onWillPop();
                            },
                            child: Icon(Icons.chevron_left,color: Colors.black,size: 40,)),
                        Image.asset("assets/images/ic_action.webp",width: 24,height: 24,color: Colors.black,),
                        Container(
                          child: Text(
                            AppLocalizations.of(context).lblCompanyContract,
                            style: blueColorBoldStyle(26),
                          ),margin: EdgeInsets.only(top: 8,left: 16,right: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 14),
                  height: 0.3,color: grayTextColor,),
                const SizedBox(height: 20,),


                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
                                  Expanded(
                                    flex:1,
                                    child: Container(
                                      padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.circular(14.0),
                                          border: Border.all(
                                              color: grayRoundedColor,// set border color
                                              width: 2.0
                                          )
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context).lblSender, style: blueColorBoldStyle(20),),
                                          const SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: 4,right: 4),
                                                child: ClipOval(
                                                    child:
                                                    CircleAvatar(
                                                      radius: 18,
                                                      backgroundColor: Colors.transparent,
                                                      child: CircleAvatar(
                                                        backgroundColor:Colors.transparent ,
                                                        radius: 18,
                                                        backgroundImage: NetworkImage(
                                                          widget.allAprovalsResponseModelData!=null&&widget.allAprovalsResponseModelData.sender!=null?
                                                          widget.allAprovalsResponseModelData.sender!=null&&widget.allAprovalsResponseModelData.sender.image!=null?!widget.allAprovalsResponseModelData.sender.image.contains(".html")?
                                                          widget.allAprovalsResponseModelData.sender.image:
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png":
                                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/450px-No_image_available.svg.png",
                                                        ),
                                                      ),
                                                    )
                                                ),
                                              ),
                                              widget.allAprovalsResponseModelData!=null&&
                                                  widget.allAprovalsResponseModelData.sender!=null&&
                                                  widget.allAprovalsResponseModelData.sender.name!=null?
                                              Flexible(
                                                child: Text(widget.allAprovalsResponseModelData.sender.name,
                                                style: blueColorBoldStyle(14),),
                                              ):Container()
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Expanded(
                                    flex:1,
                                    child: Container(
                                      padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.circular(14.0),
                                          border: Border.all(
                                              color: grayRoundedColor,// set border color
                                              width: 2.0
                                          )
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context).lblCreatedAt, style: blueColorBoldStyle(20),),
                                          const SizedBox(height: 14,),
                                          Text(widget.allAprovalsResponseModelData.createdAt!=null?
                                          getFormattedDate(stringToDateTime(widget.allAprovalsResponseModelData.createdAt)):"2021 oct ",style:
                                          grayTextColorStyleMedium(16),)
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Expanded(
                                    flex:1,
                                    child: InkWell(
                                      onTap: () {

                                      },
                                      child: Container(
                                        padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: new BorderRadius.circular(14.0),
                                            border: Border.all(
                                                color: grayRoundedColor,// set border color
                                                width: 2.0
                                            )
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Text(AppLocalizations.of(context).lblLastModified, style: blueColorBoldStyle(20),),
                                            const SizedBox(height: 10,),
                                            Text(widget.allAprovalsResponseModelData.updatedAt!=null?
                                            getFormattedDate(stringToDateTime(widget.allAprovalsResponseModelData.updatedAt)):"2021 oct ",style:
                                            grayTextColorStyleMedium(16),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Expanded(
                                    flex:1,
                                    child: InkWell(
                                      onTap: () {
                                        // openBottomSheetChangeVote("date");
                                      },
                                      child: Container(
                                        padding:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 14),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: new BorderRadius.circular(14.0),
                                            border: Border.all(
                                                color: grayRoundedColor,// set border color
                                                width: 2.0
                                            )
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Text(AppLocalizations.of(context).lblStatus, style: blueColorBoldStyle(20),),
                                            const SizedBox(height: 10,),
                                            Text(widget.allAprovalsResponseModelData.status!=null?
                                            widget.allAprovalsResponseModelData.statusText.toString():"",style:
                                            grayTextColorStyleMedium(16),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20,),

                              Container(
                                margin: EdgeInsets.only(top: 0),
                                padding: EdgeInsets.only(bottom: 24,top: 10,left: 14,right: 14),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: grayRoundedColor,// set border color
                                        width: 2.0
                                    )
                                ),
                                // padding: EdgeInsets.only(left: 16,right: 16,top: 30),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            // padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                                            child: Text(AppLocalizations.of(context).lblYourDecision, style: blueColorBoldStyle(20),)),

                                        Container(
                                            // margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
                                            padding: EdgeInsets.only(left: 16,right: 16,top: 6,bottom: 4),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(14.0),
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                stops: [0.1, 0.9],
                                                colors: [
                                                  widget.allAprovalsResponseModelData.status!=null?
                                                  (widget.allAprovalsResponseModelData.status==SignatureStatusEnumModel.newSignature.index+1||
                                                      widget.allAprovalsResponseModelData.status==SignatureStatusEnumModel.partlySigned.index+1)?
                                                  Colors.black.withOpacity(0.1):widget.allAprovalsResponseModelData.status==6?Colors.red
                                                      :Color(0xff4a976e):Color(0xff4a976e).withOpacity(0.1),
                                                  // Color(0xffe5fbf3),
                                                  // Color(0xffe5fbf3)
                                                  widget.allAprovalsResponseModelData.status!=null?
                                                  (widget.allAprovalsResponseModelData.status==SignatureStatusEnumModel.newSignature.index+1||
                                                      widget.allAprovalsResponseModelData.status==SignatureStatusEnumModel.partlySigned.index+1)?
                                                  Colors.black.withOpacity(0.1):widget.allAprovalsResponseModelData.status==6?Colors.red
                                                      :Color(0xff4a976e):Color(0xff4a976e).withOpacity(0.1)
                                                ],
                                              ),
                                            ),
                                            child: Text(
                                              widget.allAprovalsResponseModelData.status!=null?
                                              (widget.allAprovalsResponseModelData.status==SignatureStatusEnumModel.newSignature.index+1||
                                                  widget.allAprovalsResponseModelData.status==SignatureStatusEnumModel.partlySigned.index+1)?
                                                  AppLocalizations.of(context).lblNeedToSign:
                                              widget.allAprovalsResponseModelData.status==6?AppLocalizations.of(context).lblReject
                                              :AppLocalizations.of(context).lblApprovedSignature:"",
                                              style: TextStyle(
                                                // color: Color(0xff98e0c5) ,
                                                // color: Color(0xff4a976e) ,
                                                color: widget.allAprovalsResponseModelData.status!=null?
                                                (widget.allAprovalsResponseModelData.status==SignatureStatusEnumModel.newSignature.index+1||
                                                    widget.allAprovalsResponseModelData.status==SignatureStatusEnumModel.partlySigned.index+1)?
                                                Colors.black:widget.allAprovalsResponseModelData.status==6?Colors.white
                                                    :Colors.white:Color(0xff4a976e) ,
                                                fontFamily: "black",
                                                fontSize: 16,
                                              ),
                                            )
                                        )

                                      ],
                                    ),

                                    // widget.allAprovalsResponseModelData.status!=null?
                                    // (userId==widget.allAprovalsResponseModelData.userId&&(widget.allAprovalsResponseModelData.status==SignatureStatusEnumModel.newSignature.index+1||
                                    //     widget.allAprovalsResponseModelData.status==SignatureStatusEnumModel.partlySigned.index+1))?
                                widget.allAprovalsResponseModelData.visible!=null&&widget.allAprovalsResponseModelData.visible==true?
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            urlImageToBase64(baseUrl+"public/"+widget.allAprovalsResponseModelData.sender.signature).then((value) {
                                              log(value);
                                              rejectSignature(context,
                                                  baseUrl,
                                                  userToken,
                                                  widget.allAprovalsResponseModelData.id,
                                                  new SignatureRequestModel(file: value)
                                              );
                                            });
                                            // if(widget.allAprovalsResponseModelData.assignees.isNotEmpty&&widget.allAprovalsResponseModelData.assignees!=null){
                                            //   for(int i=0; i<widget.allAprovalsResponseModelData.assignees.length;i++){
                                            //
                                            //     var product = widget.allAprovalsResponseModelData.assignees.firstWhere((product) => product.userId == userId, orElse: () => null);
                                            //     if(product!=null){
                                            //       print("kknknk>"+widget.allAprovalsResponseModelData.assignees[i].assignee.signature.toString());
                                            //       urlImageToBase64(baseUrl+"public/"+widget.allAprovalsResponseModelData.assignees[i].assignee.signature).then((value) {
                                            //         log(value);
                                            //         rejectSignature(context,
                                            //             baseUrl,
                                            //             userToken,
                                            //             widget.allAprovalsResponseModelData.id,
                                            //             new SignatureRequestModel(file: value)
                                            //         );
                                            //       });
                                            //       break;
                                            //     }else{
                                            //
                                            //     }
                                            //   }
                                            // }
                                            // print("img>>>"+baseUrl+"public/"+widget.allAprovalsResponseModelData.sender.signature);

                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 7,bottom: 7,left: 20,right: 20),
                                              decoration: BoxDecoration(
                                                // color: yellowColor,
                                                  border: Border.all(
                                                    color: Colors.red,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(14))
                                              ),
                                              child: Center(
                                                child: Text(AppLocalizations.of(context).lblReject,style: TextStyle(
                                                  color: Colors.red ,
                                                  fontFamily: "medium",
                                                  fontSize: 18,
                                                  // fontWeight: FontWeight.bold
                                                ),),
                                              )
                                          ),
                                        ),
                                        const SizedBox(width: 14,),
                                        InkWell(
                                          onTap:(){

                                            openSignatureDialog(context);
                                            // signature Dialog
                                          },
                                          child: Container(
                                              padding: EdgeInsets.only(top: 7,bottom: 7,left: 25,right: 25),
                                              decoration: BoxDecoration(
                                                  color: yellowColor,
                                                  border: Border.all(
                                                    color: yellowColor,
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(14))
                                              ),
                                              child: Center(
                                                child: Text(AppLocalizations.of(context).lblSign,style: TextStyle(
                                                  color: Colors.white ,
                                                  fontFamily: "medium",
                                                  fontSize: 18,
                                                  // fontWeight: FontWeight.bold
                                                ),),
                                              )
                                          ),
                                        ),
                                      ],
                                    ):Container()

                                  ],
                                ),
                              ),


                              const SizedBox(height: 20,),


                              Container(
                                padding:EdgeInsets.only(left: 4,right: 4,top: 10,bottom: 10),
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
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          widget.allAprovalsResponseModelData!=null&&widget.allAprovalsResponseModelData.assignees!=null
                                              &&widget.allAprovalsResponseModelData.assignees.isNotEmpty? SizedBox(
                                            // height: 60,
                                            // width: 200,
                                              child:bodyData(widget.allAprovalsResponseModelData.assignees, context)
                                          ):Container(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),


                        const SizedBox(width: 16,),


                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [

                              // const SizedBox(height: 14,),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                padding: EdgeInsets.only(top: 1,right: 10,bottom: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: grayRoundedColor,// set border color
                                        width: 2.0
                                    )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                        child: Text(AppLocalizations.of(context).lblDocuments, style: blueColorBoldStyle(20),)),
                                    Divider(color: grayTextColor,height: 1,thickness: 0.2,),
                                    const SizedBox(height: 12,),
                                    widget.allAprovalsResponseModelData!=null&&widget.allAprovalsResponseModelData.documents!=null
                                        &&widget.allAprovalsResponseModelData.documents.isNotEmpty? SizedBox(
                                      // height: 60,
                                      // width: 200,
                                        child:ListView.builder(
                                          padding: EdgeInsets.all(0),
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: widget.allAprovalsResponseModelData.documents.length,
                                          itemBuilder: (context, index) {
                                            return leaveRowForAttachments(widget.allAprovalsResponseModelData.id,
                                                widget.allAprovalsResponseModelData.documents[index],index,context);
                                          },
                                        )
                                    ):Container(),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 10,),
                              Container(
                                margin: EdgeInsets.only(top: 18),
                                padding: EdgeInsets.only(top: 1,right: 10,bottom: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: grayRoundedColor,// set border color
                                        width: 2.0
                                    )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                        child: Text(AppLocalizations.of(context).lblSigningDiagram, style: blueColorBoldStyle(20),)),
                                    Divider(color: grayTextColor,height: 1,thickness: 0.2,),
                                    const SizedBox(height: 12,),
                                    widget.allAprovalsResponseModelData!=null&&widget.allAprovalsResponseModelData.assignees!=null
                                        &&widget.allAprovalsResponseModelData.assignees.isNotEmpty? SizedBox(
                                      // height: 60,
                                      // width: 200,
                                        child:ListView.builder(
                                          padding: EdgeInsets.all(0),
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: widget.allAprovalsResponseModelData.assignees.length,
                                          itemBuilder: (context, index) {
                                            return leaveRowForSigingInDiagram(widget.allAprovalsResponseModelData.assignees[index],index,context);
                                          },
                                        )
                                    ):Container(),
                                    Container(
                                      margin: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                              child: Text(AppLocalizations.of(context).lblCompleted, style: blueColorBoldStyle(16),)),
                                          const SizedBox(width: 14,),
                                          Container(
                                            // padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 13),
                                            padding: EdgeInsets.all(5),
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
                                            child: Icon(Icons.check,color: Color(0xffFEC20E),),
                                            // Text(firstChar.toString(), style: yellowColorStyleBold(22),),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              // Row(
                              //   children: [
                              //     ,
                              //   ],
                              // )

                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          );
        },),
      ),
    );
  }
}



