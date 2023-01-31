
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/Utils/Pdf/view_pdf_after_download.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:pspdfkit_flutter/src/main.dart';
import 'package:http/http.dart' as http;
import 'package:signature/signature.dart';

import '../Models/AllAprovalsResponseModel.dart';
import 'AppColors.dart';
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

Set<Map<String,String>> getRoleList(BuildContext context){
  var roleList={
    {
      "name": AppLocalizations.of(context).lblAll,
      "value": "All",
    },
    {
      "name": AppLocalizations.of(context).lblOrganizer,
      "value": "Admin",
    },
    {
      "name": AppLocalizations.of(context).lblEditor,
      "value": "Editor",
    },
    {
      "name": AppLocalizations.of(context).lblParticipate,
      "value": "Viewer",
    },
  };
  return roleList;
}

String convetIntList(List<int>list){
  List<int>listNew = list.where((spacecraft) => spacecraft != -1).toList();
   String returenedItem=listNew.join(",");
  return returenedItem;
}
void downloadFileandOpen(BuildContext context, String url, String fileName) async {

  var directory = Platform.isAndroid
      ? await getExternalStorageDirectory() //FOR ANDROID
      : await getApplicationSupportDirectory();

  String dir = directory.path;

  File file = new File('$dir/$fileName');

  if (await file.exists()) {
    // showSuccessMsg(AppLocalizations.of(context).lblSaveSuccessfuly);
    showSuccessMsg("File Already Downloaded");
    // OpenFile.open(file.path);
  } else {
    load();
    // Utils.showLoaderDialogwithTitle(context, "Downloading...");

    HttpClient httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      print(response.statusCode);
      if (response.statusCode == 200) {

        var bytes = await consolidateHttpClientResponseBytes(response);
        print(file.path);
        await file.writeAsBytes(bytes).then((value) {
          showSuccess();
          showSuccessMsg("Successfully Downloaded");
        });
      }

      // Navigator.pop(context);
    } catch (ex) {
      showError();
      // Navigator.pop(context);
      print(ex.toString());
      // Utils.displayToast(context, ex.toString());
    } finally {
      // OpenFile.open(file.path);
    }
  }}


Future<File> createFileOfPdfUrl(String filename,String url) async {
  // print("filenameIs>>"+url.toString());
  if(filename==null||filename.isEmpty){
    filename="emptyFile";
  }
  http.Client _client = new http.Client();
  // print("UrlForPrint"+url);
  var req = await _client.get(Uri.parse(url));
  var bytes = req.bodyBytes;
  // String dir = (await getApplicationDocumentsDirectory()).absolute.path;
  String dir = (await getApplicationDocumentsDirectory()).path;
  File file = new File('$dir/$filename');
  await file.writeAsBytes(bytes);

  return file;
}

void showDocumentForApprovals(AllAprovalsResponseModelData root,String type, int subId,int meetingId,int id ,int library_id,String name ,String url,BuildContext context) async {
  onLoading(context);
  print("urlllll>>"+url.toString());
  try {
    createFileOfPdfUrl(name,  url).then((value) async {
      dismissLoading(context);
      navigateTo(context,ViewPdfAFterDownload(value.path ?? ''));
      // Navigator.pop(context);
      // await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
      //     builder: (_) => PspdfkitAnnotationsExampleWidget(
      //       type: type,
      //       subId: subId,
      //       documentPath: value.path,
      //       meetingId: meetingId,
      //       id: id,
      //       library_Id: library_id,)));

    });

  } on PlatformException catch (e) {
    print("Failed to open document: '${e.message}'.");
  }
}

void showDocument(String type, int subId,int meetingId,int id ,int library_id,String name ,String url,BuildContext context) async {
  onLoading(context);
  print("urllllloooooooooo>>"+url.toString());

  try {
    createFileOfPdfUrl(name,  url).then((value) async {
      // print("valuevalueIs>>"+value.toString());
      // print("pathIs>>"+value.path.toString());
      dismissLoading(context);
      navigateTo(context,ViewPdfAFterDownload(value.path ?? ''));
      // Navigator.pop(context);
      // await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
      //     builder: (_) => PspdfkitAnnotationsExampleWidget(
      //       type: type,
      //         subId: subId,
      //         documentPath: value.path,
      //     meetingId: meetingId,
      //     id: id,
      //     library_Id: library_id,)));

    });

  } on PlatformException catch (e) {
    print("Failed to open document: '${e.message}'.");
  }
}

void onLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => WillPopScope(
      onWillPop: () => Future.value(false),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(grayColor),
              strokeWidth: 10,
            )
        ),
      ),
    ),
  );
}
void dismissLoading(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop(context);
  // Navigator.of(context).maybePop();
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

String getFormattedDateForCalender(DateTime day) {
  String formattedDate =
      getDoubleDigit(day.year.toString()) + "/" +
          // getDoubleDigit(monthNames[day.month-1]) ;
          getDoubleDigit(day.month.toString()) ;
  return formattedDate;
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

Future<Uint8List> exportSignature(SignatureController controller) async {
  final exportController = SignatureController(
    penStrokeWidth: 2,
    exportBackgroundColor: Colors.white,
    penColor: Colors.black,
    points: controller.points,
  );

  final signature = exportController.toPngBytes();

  //clean up the memory
  exportController.dispose();

  return signature;
}

Future<String> urlImageToBase64(String imageUrl) async {
  http.Response response = await http.get(Uri.parse(imageUrl));
  final bytes = response?.bodyBytes;
  return (bytes != null ? base64Encode(bytes) : null);
}