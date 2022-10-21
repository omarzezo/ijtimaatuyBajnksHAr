import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:itimaaty/Localizations/localization/localizations.dart';
import 'package:itimaaty/View/FontsStyle.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'dart:io';

class WebViewScreen extends StatefulWidget {
  String url ;
  WebViewScreen(this.url);
  // const WebViewScreen({ this.controller,this.url});

// final Completer<WebViewController> controller;

  @override
  State<WebViewScreen> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewScreen> {
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
    super.initState();
    // if (Platform.isAndroid) webView.pl = SurfaceAndroidWebView(); // <<== THIS

  }
  Future<void> backAction(String msg) async {
    await Future.delayed(const Duration(milliseconds: 100));
    Navigator.pop(context,msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
        // resizeToAvoidBottomInset:true,
      appBar: AppBar(title: Text(AppLocalizations.of(context).lblSignInSso,style: blueColorBoldStyle(18),),backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),),
      body:  InAppWebView(
          onWebViewCreated: (controller) {
            webView = controller;
          },
        onLoadStop: ( controller,  url) {
            print("urlurlurl>>"+url.toString());
            if(url!=null) {

              // controller.getUrl().then((value) {
              // print("Uri>>"+value.toString());
              // print("path>>"+value.path.toString());
              // print("host>>"+value.host.toString());
              // print("queryParameters>>"+value.queryParameters['secret'].toString());
              if (url.queryParametersAll.containsKey('success') &&
                  url.queryParametersAll.containsKey('secret') &&
                  url.queryParameters['secret'] != null) {
                if(controller!=null){
                  controller.stopLoading();
                  backAction(url.queryParameters['secret'].toString());
                }
                // print("success>>"+value.queryParametersAll.containsKey('success').toString());
                // Navigator.pop(context);
                // Future.delayed(Duration.zero, () {
                //   Navigator.pop(context,value.queryParameters['secret'].toString());
                // });
              }
            }
              // });
            // }
          // webView = controller;
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
          print("challenge"+challenge.toString());
          // print("challenge"+controller.);
          return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
        },
        onProgressChanged: ( controller,  progress){
          // if(controller!=null){
          //   controller.getUrl().then((value) {
          //     print("Uri>>"+value.toString());
          //     // print("path>>"+value.path.toString());
          //     // print("host>>"+value.host.toString());
          //     print("queryParameters>>"+value.queryParameters['secret'].toString());
          //     if(value.queryParametersAll.containsKey('success')&&value.queryParametersAll.containsKey('secret')&&value.queryParameters['secret']!=null){
          //       // print("success>>"+value.queryParametersAll.containsKey('success').toString());
          //       // Navigator.pop(context);
          //       // backAction(value.queryParameters['secret'].toString());
          //       // Future.delayed(Duration.zero, () {
          //       //   Navigator.pop(context,value.queryParameters['secret'].toString());
          //       // });
          //     }
          //   });
          // }
        },gestureRecognizers: Set()
          ..add(
            Factory<DragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer(),
            ),
          ),

      )
      // WebView(
      //   // initialUrl: widget.url,
      //   initialUrl: "https://test.app.ijtimaati.com/auth/login",
      //   // initialUrl: "https://www.google.com/",
      //   onWebViewCreated: (webViewController) {
      //     controller.complete(webViewController);
      //   },
      //
      //   onPageStarted: (url) {
      //     setState(() {
      //       loadingPercentage = 0;
      //       print("loadingPercentage>>"+"00");
      //     });
      //   },
      //   onProgress: (progress) {
      //     setState(() {
      //       loadingPercentage = progress;
      //       print("loadingPercentage>>"+"11");
      //     });
      //   },
      //   onPageFinished: (url) {
      //     setState(() {
      //       loadingPercentage = 100;
      //       print("loadingPercentage>>"+"22");
      //       print("loadingPercentage>>"+url);
      //     });
      //   },
      //   navigationDelegate: (navigation) {
      //     final host = Uri.parse(navigation.url).host;
      //     print("host>>"+host.toString());
      //     if (host.contains('youtube.com')) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(
      //           content: Text(
      //             'Blocking navigation to $host',
      //           ),
      //         ),
      //       );
      //       return NavigationDecision.prevent;
      //     }
      //     return NavigationDecision.navigate;
      //   },
      //   javascriptMode: JavascriptMode.unrestricted,
      //   javascriptChannels: _createJavascriptChannels(context),
      //
      // ),
    );
  }

  // Set<JavascriptChannel> _createJavascriptChannels(BuildContext context) {
  //   return {
  //     JavascriptChannel(
  //       name: 'SnackBar',
  //       onMessageReceived: (message) {
  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text(message.message)));
  //       },
  //     ),
  //   };
  // }
}

// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// import 'package:itimaaty/Localizations/localization/localizations.dart';
//
//
// class WebViewScreen extends StatefulWidget {
//   String selectedUrl;
//   WebViewScreen(this.selectedUrl);
//   @override
//   WebViewScreenState createState() => WebViewScreenState();
//
// }
//
// const kAndroidUserAgent =
//     'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';
//
// // String selectedUrl = 'https://flutter.io';
//
// // ignore: prefer_collection_literals
// final Set<JavascriptChannel> jsChannels = [
//   JavascriptChannel(
//       name: 'Print',
//       onMessageReceived: (JavascriptMessage message) {
//         print(message.message);
//       }),
// ].toSet();
//
//
//
// class WebViewScreenState extends State<WebViewScreen> {
//
//
//   final flutterWebViewPlugin = FlutterWebviewPlugin();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(AppLocalizations.of(context).lblSignInSso,),),
//       body: WebviewScaffold(
//         url: widget.selectedUrl,
//         // appBar: new AppBar(
//         //   title: const Text('Widget webview'),
//         // ),
//         withZoom: true,
//         withLocalStorage: true,
//         hidden: true,
//
//         initialChild: Container(
//           // color: Colors.redAccent,
//           child: const Center(
//             child: Text('Waiting.....'),
//           ),
//         ),
//       ),
//     );
//   }
// }
