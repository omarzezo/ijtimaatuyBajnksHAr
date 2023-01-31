import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:itimaatysoharsohar/Localizations/localization/localizations.dart';
import 'package:itimaatysoharsohar/Utils/CommonMethods.dart';
import 'package:itimaatysoharsohar/View/FontsStyle.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'dart:io';

class ViewPdfAFterDownload extends StatefulWidget {
  String urlPDFPath ;
  ViewPdfAFterDownload(this.urlPDFPath);

  @override
  State<ViewPdfAFterDownload> createState() => ViewPdfAFterDownloadState();
}

class ViewPdfAFterDownloadState extends State<ViewPdfAFterDownload> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  dispose() {
    super.dispose();
  }

  @override
  void initState() {
    print("uuuuuuu>>"+widget.urlPDFPath.toString());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // resizeToAvoidBottomInset:true,
        appBar: AppBar(title: Text("",style: blueColorBoldStyle(18),),backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),),
        body:SizedBox(
          // height: MediaQuery.of(context).size.height,
          child: PDFView(
            filePath: widget.urlPDFPath,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            fitEachPage: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              //Show some error message or UI
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              setState(() {
                _pdfViewController = vc;
              });
            },
            onPageChanged: (int page, int total) {
              setState(() {
                _currentPage = page;
              });
            },
            onPageError: (page, e) {},
          ),
        )
    );
  }

}

