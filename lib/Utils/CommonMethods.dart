
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pspdfkit_flutter/src/main.dart';
import 'package:http/http.dart' as http;

import 'Pdf/pspdfkit_annotations_example.dart';
// String getDoubleDigit(String value) {
//   if (value.length >= 2) return value;
//   return "0" + value;
// }
//
// String getFormattedDate(DateTime day) {
//   String formattedDate =
//       getDoubleDigit(day.year.toString()) + "-" +
//           getDoubleDigit(day.month.toString()) + "-" +
//           getDoubleDigit(day.day.toString())
//   ;
//   return formattedDate;
// }

Future<File> createFileOfPdfUrl(String filename,String url) async {
  http.Client _client = new http.Client();
  print("UrlForPrint"+url);
  var req = await _client.get(Uri.parse(url));
  var bytes = req.bodyBytes;
  String dir = (await getApplicationDocumentsDirectory()).path;
  File file = new File('$dir/$filename');
  await file.writeAsBytes(bytes);

  return file;
}

void showDocument(String url,BuildContext context) async {
  print("urlllll>>"+url.toString());
  try {
    // await Pspdfkit.se
    // await Pspdfkit.setLicenseKeys(Constants.android, Constants.ios);
    // await Pspdfkit.setLicenseKey(Constants.android);
    createFileOfPdfUrl("test",  url).then((value) async {
      // Pspdfkit.

      // final extractedDocument = await extractAsset(_documentPath);
      print("pathIs>>"+value.path.toString());
      // await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
      //     builder: (_) => PspdfkitAnnotationsExampleWidget(
      //         documentPath: value.path)));

      Pspdfkit.present(value.path,{
        // Common options:
        enableAnnotationEditing: true, // Annotation item on the main toolbar.
        toolbarTitle: 'Ijtimaat',

        iOSAllowToolbarTitleChange: false,
        // iOS-specific options:
        iOSRightBarButtonItems: [ // List of buttons to show on the right side of the main toolbar.
          'thumbnailsButtonItem',
          'activityButtonItem',
          'annotationButtonItem',
          'searchButtonItem'
        ],
        iOSLeftBarButtonItems: [ // List of buttons to show on the left side of the main toolbar. (Only one item supported.)
          'settingsButtonItem'
        ],

        // Android-specific options:
        androidShowSearchAction: true, // Search action on the main toolbar.
        androidShowThumbnailGridAction: true, // Document editor action on the main toolbar.
        androidShowShareAction: true, // Share action on the main toolbar.
        androidShowPrintAction: true, // Print item on the main toolbar and inside the sharing sheet.
        androidEnableDocumentEditor: true, // Enable document editing in thumbnail view.
      });
    });
    // if (await Pspdfkit.checkAndroidWriteExternalStoragePermission()) {
    //
    //   createFileOfPdfUrl("test",  url).then((value) {
    //     Pspdfkit.present(value.path,{
    //       // Common options:
    //       enableAnnotationEditing: true, // Annotation item on the main toolbar.
    //       toolbarTitle: 'Ijtimaat',
    //       iOSAllowToolbarTitleChange: false,
    //       // iOS-specific options:
    //       iOSRightBarButtonItems: [ // List of buttons to show on the right side of the main toolbar.
    //         'thumbnailsButtonItem',
    //         'activityButtonItem',
    //         'annotationButtonItem',
    //         'searchButtonItem'
    //       ],
    //       iOSLeftBarButtonItems: [ // List of buttons to show on the left side of the main toolbar. (Only one item supported.)
    //         'settingsButtonItem'
    //       ],
    //
    //       // Android-specific options:
    //       androidShowSearchAction: true, // Search action on the main toolbar.
    //       androidShowThumbnailGridAction: true, // Document editor action on the main toolbar.
    //       androidShowShareAction: true, // Share action on the main toolbar.
    //       androidShowPrintAction: true, // Print item on the main toolbar and inside the sharing sheet.
    //       androidEnableDocumentEditor: true, // Enable document editing in thumbnail view.
    //     });
    //   });
    // } else {
    //   AndroidPermissionStatus permissionStatus = await Pspdfkit.requestAndroidWriteExternalStoragePermission();
    //   if (permissionStatus == AndroidPermissionStatus.authorized) {
    //     createFileOfPdfUrl("test",  url)
    //         .then((value) {
    //       Pspdfkit.present(value.path);
    //     });
    //   } else if (permissionStatus == AndroidPermissionStatus.deniedNeverAsk) {
    //     // _showToast(context);
    //   }
    // }
  } on PlatformException catch (e) {
    print("Failed to open document: '${e.message}'.");
  }
}


bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

Route createRoute(Object page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,

    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // var begin = Offset(0.0, 1.0);
//         var begin = Offset(1.0, 1.0); //animation From bottmo Curve
      var begin = Offset(1.0, 0.0); //animation From left like android
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },

    // animation from Bottom
//      transitionsBuilder: (context, animation, secondaryAnimation, child) {
//        return child;
//      },

//      transitionsBuilder: (context, animation, secondaryAnimation, child) {
//        var begin = Offset(0.0, 1.0);
//        var end = Offset.zero;
//        var curve = Curves.ease;
//
//        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//        return SlideTransition(
//          position: animation.drive(tween),
//          child: child,
//        );
//      },
  );
}

void load(){
  EasyLoading.instance.loadingStyle=EasyLoadingStyle.custom;
  EasyLoading.show(status: 'loading...');
}

void showSuccessMsg(String msg){
  EasyLoading.showSuccess(msg);
}

void showSuccess(){
  // EasyLoading.showSuccess('Success!');
  // EasyLoading.showSuccess("loading...");
  // EasyLoading.showToast("");
  EasyLoading.dismiss();
}

void showError(){
  if(EasyLoading.isShow){
    EasyLoading.showError("please check Data");
  }
}

void showErrorWithMsg(String msg){
  // if(EasyLoading.isShow){
    EasyLoading.showError(msg);
  // }
}

void navigateTo(context, widget) => Navigator.push(
  context,
   createRoute(widget),
    // Navigator.of(context).push(createRoute(PrinterPage(leave)));
);

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (route) => false,
  );
}


const monthNames = ["January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
];

String getDoubleDigit(String value) {
  if (value.length >= 2) return value;
  return "0" + value;
}

String getFormattedDate(DateTime day) {
  String formattedDate =
      getDoubleDigit(day.day.toString()) + " " +
          getDoubleDigit(monthNames[day.month-1]) + " " +
          getDoubleDigit(day.year.toString());
  return formattedDate;
}

String getFormattedDateProfile(DateTime day) {
  String formattedDate =
  getDoubleDigit(day.year.toString())+"-"+
          getDoubleDigit(day.month.toString()) + "-" +
      getDoubleDigit(day.day.toString())
  ;
  return formattedDate;
}

DateTime stringToDateTime(String dateString){
  DateTime dateTime = DateTime.parse(dateString);
  print("dateTime"+dateTime.toString());
  return dateTime;
}

Future<TimeOfDay> selectTimeAlso(BuildContext context) async {
  TimeOfDay initialTime = TimeOfDay.now();
  TimeOfDay pickedTime = await showTimePicker(
    context: context,
    initialTime: initialTime,
    builder: (BuildContext context, Widget child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: child,
      );
    },
  );
  print("pickedTimeIs>>"+pickedTime.toString());
}

Future<TimeOfDay> selectTime(BuildContext context) {
  final now = DateTime.now();
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
      builder: (BuildContext context, Widget child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      }
  );
}

Future<DateTime> selectDateTime(BuildContext context) => showDatePicker(
  context: context,
  initialDate: DateTime.now().add(Duration(seconds: 1)),
  firstDate: DateTime.now(),
  lastDate: DateTime(2100),
);