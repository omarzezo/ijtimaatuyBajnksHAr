import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/Utils/CommonMethods.dart';
import 'package:itimaaty/View/FontsStyle.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'dart:io';

class WebViewScreenForMirrorView extends StatefulWidget {
  String url ;
  WebViewScreenForMirrorView(this.url);
  // const WebViewScreen({ this.controller,this.url});

// final Completer<WebViewController> controller;

  @override
  State<WebViewScreenForMirrorView> createState() => WebViewScreenForMirrorViewState();
}

class WebViewScreenForMirrorViewState extends State<WebViewScreenForMirrorView> {
  // final controller = Completer<WebViewController>();

  var loadingPercentage = 0;
  InAppWebViewController webView;

  @override
  dispose() {
    webView.stopLoading();
    super.dispose();
  }

  @override
  void initState() {
    load();

    super.initState();
    // if (Platform.isAndroid) webView.pl = SurfaceAndroidWebView(); // <<== THIS
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
        body:  InAppWebView(
          onWebViewCreated: (controller) {
            webView = controller;
          },
          onLoadStop: ( controller,  url) {
            showSuccess();
          },
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              mediaPlaybackRequiresUserGesture: false,
              javaScriptCanOpenWindowsAutomatically:true,
              useShouldOverrideUrlLoading: true,
              javaScriptEnabled: true,
            ),
            android: AndroidInAppWebViewOptions(
              useHybridComposition: true,
              // allowContentAccess: true,
              // allowFileAccess: true,
              // hardwareAcceleration: true
            ),
            ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
            ),
          ),
          initialUrlRequest: URLRequest(
              url: Uri.parse(widget.url)
          ),

          onReceivedServerTrustAuthRequest: (controller, challenge) async {
            // print("challenge"+controller.);
            return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
          },
          onProgressChanged: ( controller,  progress){

          },gestureRecognizers: Set()
          ..add(
            Factory<DragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer(),
            ),
          ),

        )
    );
  }

}

