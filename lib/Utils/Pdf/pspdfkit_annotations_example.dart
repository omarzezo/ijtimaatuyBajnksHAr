///
///  Copyright © 2018-2022 PSPDFKit GmbH. All rights reserved.
///
///  THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY INTERNATIONAL COPYRIGHT LAW
///  AND MAY NOT BE RESOLD OR REDISTRIBUTED. USAGE IS BOUND TO THE PSPDFKIT LICENSE AGREEMENT.
///  UNAUTHORIZED REPRODUCTION OR DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES.
///  This notice may not be removed from this file.
///
import 'dart:async';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Models/ActionsScreen.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:http/http.dart' as http;
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/View/DecisionsScreen.dart';
import 'package:itimaaty/View/FontsStyle.dart';
import 'package:itimaaty/View/TalkingPointsScreen.dart';
import 'package:pspdfkit_flutter/src/widgets/pspdfkit_widget_controller.dart';

import '../../LocalDb/SharedPreferencesHelper.dart';
import '../../Models/AllAprovalsResponseModel.dart';
import '../../Models/UplodedResponseModel.dart';
import '../../Repository/MeetingRepository.dart';
import '../../View/MeetingDetailsScreen.dart';
import '../../network/end_points.dart';

const annotationJsonHashMap = {
  'uuid': 'A92AA288-B11D-490C-847B-D1A0BC64D3E9',
  'bbox': [
    267.4294738769531,
    335.1297607421875,
    97.16720581054688,
    10.305419921875
  ],
  'blendMode': 'normal',
  'updatedAt': '2020-04-01T12:31:15Z',
  'pageIndex': 0,
  'lineWidth': 4,
  'lines': {
    'points': [
      [
        [269.4294738769531, 343.4351806640625],
        [308.458984375, 341.7537841796875],
        [341.19342041015625, 339.6519775390625],
        [358.81964111328125, 339.6519775390625],
        [360.9179992675781, 339.2315673828125],
        [362.5966796875, 338.81121826171875],
        [361.7573547363281, 337.1297607421875]
      ]
    ],
    'intensities': [
      [
        1,
        0.42835134267807007,
        0.635690450668335,
        0.827924370765686,
        0.9846339821815491,
        0.9947978258132935,
        0.9675101041793823
      ]
    ]
  },
  'strokeColor': '#2492FB',
  'isDrawnNaturally': false,
  'opacity': 1,
  'type': 'pspdfkit/ink',
  'creatorName': 'pspdfkit',
  'createdAt': '2020-04-01T12:31:15Z',
  'name': 'A92AA288-B11D-490C-847B-D1A0BC64D3E9',
  'v': 1
};

const annotationJsonString = '''
{
"uuid": "F5EBE614-0917-49E8-89FE-4C0DDB467DC3", 
"bbox": [
  267.4294738769531, 
  335.1297607421875, 
  97.16720581054688, 
  10.305419921875
  ], 
  "updatedAt": "2020-04-01T12:31:15Z", 
  "pageIndex": 0, 
  "lineWidth": 4, 
  "lines": {
    "points": [
      [
        [269.4294738769531, 343.4351806640625], 
        [308.458984375, 341.7537841796875], 
        [341.19342041015625, 339.6519775390625], 
        [358.81964111328125, 339.6519775390625], 
        [360.9179992675781, 339.2315673828125], 
        [362.5966796875, 338.81121826171875], 
        [361.7573547363281, 337.1297607421875]
      ]
    ], 
    "intensities": 
    [
      [1, 0.42835134267807007, 0.635690450668335, 0.827924370765686, 0.9846339821815491, 0.9947978258132935, 0.9675101041793823]
      ]
    
  }, 
  "strokeColor": "#2492FB", 
  "isDrawnNaturally": false, 
  "opacity": 1, 
  "type": "pspdfkit/ink", 
  "creatorName": "pspdfkit", 
  "createdAt": "2020-04-01T12:31:15Z", 
  "name": "A92AA288-B11D-490C-847B-D1A0BC64D3E9", 
  "v": 1
}''';

class PspdfkitAnnotationsExampleWidget extends StatefulWidget {
  final AllAprovalsResponseModelData root;
  final String type;
  final String documentPath;
  final int meetingId;
  final int subId;
  final int id;
  final int library_Id;
  final dynamic configuration;

  const PspdfkitAnnotationsExampleWidget(
      {Key key, this.root, this.type,this.subId,this.documentPath,this.meetingId, this.id,this.library_Id,this.configuration})
      : super(key: key);

  @override
  _PspdfkitAnnotationsExampleWidgetState createState() =>
      _PspdfkitAnnotationsExampleWidgetState();
}

class _PspdfkitAnnotationsExampleWidgetState extends State<PspdfkitAnnotationsExampleWidget> {

  PspdfkitWidgetController view;
  MeetingRepository meetingRepository;
  bool saved=false;



bool isClicked=false;
  // Future<int> uploadImage (MultipartFile logoFile,int meeting_id,int library_id,String token) async {
  Future<int> uploadImage () async {
    onLoading(context);
    setState(() {
      isClicked=true;
    });
    // // http.MultipartRequest request = new http.MultipartRequest("POST", Uri.parse(BASE_URL+UPDATE_FILE+"/"+id.toString()));
    // // print("RemoteUrlIs>>"+BASE_URL+UPDATE_FILE);
    print("requestBody>>"+requestBody.toString());
    print("headers>>"+headers.toString());
    print("baseUrlbaseUrl>>"+baseUrl+Constants.UPDATE_FILE.toString());
    // print("baseUrlbaseUrl>>"+Constants.BASE_URL+Constants.UPDATE_FILE.toString());
    // print("library_id>>"+library_id.toString());
    http.MultipartRequest request = new http.MultipartRequest("POST", Uri.parse(baseUrl+Constants.UPDATE_FILE));
    // Map<String, String> headers = {"Content-type": "application/json",
    //   'token': token};
    // Map<String, String> requestBody = <String, String>{
    //   'meeting_id': meeting_id.toString(),
    //   'library_id': library_id.toString()
    // };


    request.fields.addAll(requestBody);
    request.files.add(MultipartFile('file', File(widget.documentPath).readAsBytes().asStream(),
        File(widget.documentPath).lengthSync(),
        filename: widget.documentPath.split("/").last));
    // request.files.add(await MultipartFile.fromPath(File(widget.documentPath).uri.pathSegments.last, File(widget.documentPath).path));
    request.headers.addAll(headers);
    request.send().then((response) {
      dismissLoading(context);
      setState(() {
        isClicked=false;
      });
      if (response.statusCode == 200||response.statusCode == 201){
        showSuccessMsg(AppLocalizations.of(context).lblSaveSuccessfuly);
        setState(() {
          saved=true;
        });
        print("Uploaded!");
      }else{
        print("errror!");
      }
    });
    // return res.statusCode;
  }

  void uploadFile(MultipartFile file){
    load();
    meetingRepository = new MeetingRepository();
    // onLoading(context);
    // Future<UplodedResponseModel> data =meetingRepository.uploadImage(file,widget.id,widget.library_Id,userToken);
    Future<int> data =meetingRepository.uploadImage(baseUrl,file,widget.id,widget.library_Id,userToken);
    data.then((value) {
      // print("dataaaaa>>"+value.toString());
      if(value!=null){
        if(value==200||value==201){
          showSuccess();
          setState(() {
            showSuccessMsg("Saved Successfully!");
            // print("data>>"+value.name.toString());
          });
        }else{

        }

        // dismissLoading(context);
      }else{
        // showSuccess();

        // final dir = Directory(widget.documentPath);
        // dir.deleteSync(recursive: true);
        // File(widget.documentPath).delete(recursive: true).then((value) {
        //   print("valueIsssssssss>>"+value.toString());
        // });
        // File(widget.documentPath).exists().then((value) {
        //   print("valueIsssssssss>>"+value.toString());
        // });
        // showSuccessMsg("Saved Successfully!");
        // showError();
        if(value==null){
          // navigateAndFinish(context, SignInScreen());
        }
      }
    });
  }

  String userToken;

  Future<bool> _onWillPop() async {
    if(isClicked==false) {
      Navigator.pop(context);
      if (widget.type == "talking") {
        navigateTo(
            context, TalkingPointsScreen(widget.meetingId, widget.subId));
      } else if (widget.type == "actions") {
        navigateTo(
            context, ActionsScreen(widget.meetingId, widget.subId, null));
      } else if (widget.type == "decisions") {
        navigateTo(
            context, DecisionsScreen(widget.meetingId, widget.subId, null));
      }else if (widget.type == "approvals") {
        // km
        // navigateTo(context, DecisionsScreen(widget.meetingId, widget.subId, null));
      } else {
        navigateTo(context, MeetingDetailsScreen(widget.meetingId));
      }
    }else{
      return false;
    }
  }

  String baseUrl="";
  http.MultipartRequest request;
  // MultipartFile multipartFile;
  Map<String, String> headers;
  Map<String, String> requestBody;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferencesHelper.getLoggedToken().then((value) {
      userToken=value;
        String baseUri= Constants.BASE_URL;
        setState(()  {
          baseUrl=baseUri;
           request = new http.MultipartRequest("POST", Uri.parse(baseUrl+Constants.UPDATE_FILE));

          headers = {"Content-type": "application/json",
            'token': userToken};

           requestBody = <String, String>{
            'meeting_id': widget.meetingId.toString(),
            'library_id': widget.library_Id.toString()
          };
         // multipartFile = await MultipartFile('file', File(widget.documentPath).readAsBytes().asStream(),
         //      File(widget.documentPath).lengthSync(),
         //      filename: widget.documentPath.split("/").last);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'com.pspdfkit.widget';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{
      'document': widget.documentPath,
      // 'configuration': widget.configuration,
      'configuration': {
        // Common options:
        'enableAnnotationEditing': true, // Annotation item on the main toolbar.
        'toolbarTitle': 'Ijtimaat',

        'iOSAllowToolbarTitleChange': false,
        // iOS-specific options:
        'iOSRightBarButtonItems': [ // List of buttons to show on the right side of the main toolbar.
          'thumbnailsButtonItem',
          'activityButtonItem',
          'annotationButtonItem',
          'searchButtonItem'
        ],
        'iOSLeftBarButtonItems': [ // List of buttons to show on the left side of the main toolbar. (Only one item supported.)
          'settingsButtonItem'
        ],

        // Android-specific options:
        'androidShowSearchAction': true, // Search action on the main toolbar.
        'androidShowThumbnailGridAction': true, // Document editor action on the main toolbar.
        'androidShowShareAction': true, // Share action on the main toolbar.
        'androidShowPrintAction': true, // Print item on the main toolbar and inside the sharing sheet.
        'androidEnableDocumentEditor': true, // Enable document editing in thumbnail view.
      },
    };

    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            extendBodyBehindAppBar: defaultTargetPlatform == TargetPlatform.android,
            appBar: AppBar(),
            body: SafeArea(
                top: false,
                bottom: false,
                child: Container(
                    padding: defaultTargetPlatform == TargetPlatform.iOS
                        ? null
                        : const EdgeInsets.only(top: kToolbarHeight),
                    child: Column(children: <Widget>[
                      Expanded(
                          child: defaultTargetPlatform == TargetPlatform.android
                              ? PlatformViewLink(
                            viewType: viewType,
                            surfaceFactory: (BuildContext context,
                                PlatformViewController controller) {
                              return AndroidViewSurface(
                                controller:
                                controller as AndroidViewController,
                                gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
                                hitTestBehavior: PlatformViewHitTestBehavior.opaque,
                              );
                            },
                            onCreatePlatformView: (PlatformViewCreationParams params) {
                              return PlatformViewsService.initSurfaceAndroidView(
                                id: params.id,
                                viewType: viewType,
                                layoutDirection: TextDirection.ltr,
                                creationParams: creationParams,
                                creationParamsCodec:
                                const StandardMessageCodec(),
                                onFocus: () {
                                  params.onFocusChanged(true);
                                },
                              )
                                ..addOnPlatformViewCreatedListener(
                                    params.onPlatformViewCreated)
                                ..addOnPlatformViewCreatedListener(
                                    onPlatformViewCreated)
                                ..create();
                            },
                          )
                              : UiKitView(
                              viewType: viewType,
                              layoutDirection: TextDirection.ltr,
                              creationParams: creationParams,
                              onPlatformViewCreated: onPlatformViewCreated,
                              creationParamsCodec:
                              const StandardMessageCodec())),
                      SizedBox(
                          child: Column(children: <Widget>[
                            ElevatedButton(
                                onPressed: () async {
                                  // load();
                                   view.save().then((value) async {

                                     uploadImage();
                                     // File file = new File(widget.documentPath);
                                     // MultipartFile logoFileUpload=
                                     // MultipartFile('file',
                                     //     file.readAsBytes().asStream(), file.lengthSync(),
                                     //     filename: widget.documentPath.split("/").last);

                                     // if(file!=null) {
                                       // uploadImage(logoFileUpload,widget.meetingId,widget.library_Id,userToken);
                                       // uploadImage(
                                       //     file,
                                       //     widget.meetingId,
                                       //     widget.library_Id,userToken);
                                     // }


                                   });
                                },
                                child:  Text(AppLocalizations.of(context).lblSaveDocument,style: blueColorStyleMediumWithColor(18, Colors.white),))
                          ]))
                      // SizedBox(
                      //     child: Column(children: <Widget>[
                      //       ElevatedButton(
                      //           onPressed: () async {
                      //             await view.addAnnotation(annotationJsonHashMap);
                      //             // To test the `view#addAnnotation` method with an InstantJSON string
                      //             // simply use `annotationJsonString` instead or `annotationJsonHashMap`.
                      //             // E.g: `await view.addAnnotation(annotationJsonString);`
                      //           },
                      //           child: const Text('Add Annotation')),
                      //       if (defaultTargetPlatform == TargetPlatform.iOS)
                      //         ElevatedButton(
                      //             onPressed: () async {
                      //               dynamic annotationsJson =
                      //               await view.getAnnotations(0, 'all');
                      //               await view.removeAnnotation({
                      //                 'uuid': annotationsJson[0]['uuid'] as String
                      //               });
                      //             },
                      //             child: const Text('Remove Annotation')),
                      //       // ElevatedButton(
                      //       //     onPressed: () async {
                      //       //       const title = 'Annotation JSON';
                      //       //       dynamic annotationsJson =
                      //       //       await view.getAnnotations(0, 'all');
                      //       //       await showDialog<AlertDialog>(
                      //       //           context: context,
                      //       //           builder: (BuildContext context) => AlertDialog(
                      //       //               title: const Text(title),
                      //       //               content: Text('$annotationsJson'),
                      //       //               actions: [
                      //       //                 TextButton(
                      //       //                     onPressed: () {
                      //       //                       Navigator.of(context).pop();
                      //       //                     },
                      //       //                     child: const Text('OK'))
                      //       //               ]));
                      //       //     },
                      //       //     child: const Text('Get Annotations')),
                      //       // ElevatedButton(
                      //       //     onPressed: () async {
                      //       //       const title = 'Unsaved Annotations';
                      //       //       dynamic annotationsJson =
                      //       //       await view.getAllUnsavedAnnotations();
                      //       //       print(annotationsJson);
                      //       //       await showDialog<AlertDialog>(
                      //       //           context: context,
                      //       //           builder: (BuildContext context) => AlertDialog(
                      //       //             title: const Text(title),
                      //       //             content: Text('$annotationsJson'),
                      //       //             actions: [
                      //       //               TextButton(
                      //       //                   onPressed: () {
                      //       //                     Navigator.of(context).pop();
                      //       //                   },
                      //       //                   child: const Text('OK'))
                      //       //             ],
                      //       //           ));
                      //       //     },
                      //       //     child: const Text('Get All Unsaved Annotations'))
                      //     ]))
                    ])))),
      );
    } else {
      return Text(
          '$defaultTargetPlatform is not yet supported by PSPDFKit for Flutter.');
    }
  }

  Future<void> onPlatformViewCreated(int id) async {
    view = PspdfkitWidgetController(id);
  }
}