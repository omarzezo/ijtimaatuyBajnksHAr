// ///
// ///  Copyright © 2018-2022 PSPDFKit GmbH. All rights reserved.
// ///
// ///  THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY INTERNATIONAL COPYRIGHT LAW
// ///  AND MAY NOT BE RESOLD OR REDISTRIBUTED. USAGE IS BOUND TO THE PSPDFKIT LICENSE AGREEMENT.
// ///  UNAUTHORIZED REPRODUCTION OR DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES.
// ///  This notice may not be removed from this file.
// ///
// import 'dart:io';
// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'package:pspdfkit_flutter/src/main.dart';
// import 'package:pspdfkit_flutter/src/widgets/pspdfkit_widget_controller.dart';
// import 'package:pspdfkit_flutter/src/widgets/pspdfkit_widget.dart';
//
// import 'Utils/Pdf/pspdfkit_annotation_processing_example.dart';
// import 'Utils/Pdf/pspdfkit_annotations_example.dart';
// import 'Utils/Pdf/pspdfkit_form_example.dart';
// import 'Utils/Pdf/pspdfkit_instantjson_example.dart';
//
// // import 'pspdfkit_form_example.dart';
// // import 'pspdfkit_instantjson_example.dart';
// // import 'pspdfkit_annotations_example.dart';
// // import 'pspdfkit_annotation_processing_example.dart';
//
// const String _documentPath = 'assets/test.pdf';
// const String _lockedDocumentPath = 'PDFs/protected.pdf';
// const String _imagePath = 'PDFs/PSPDFKit_Image_Example.jpg';
// const String _formPath = 'PDFs/Form_example.pdf';
// const String _instantDocumentJsonPath = 'PDFs/Instant/instant-document.json';
// const String _processedDocumentPath = 'PDFs/Embedded/PSPDFKit-processed.pdf';
//
// const String _pspdfkitFlutterPluginTitle =
//     'PSPDFKit Flutter Plugin example app';
//
// const String _basicExample = 'Basic Example';
// const String _basicPlatformStyleExample = 'Basic Example using Platform Style';
// const String _basicExampleSub = 'Opens a PDF Document.';
// const String _basicPlatformStyleExampleSub =
//     'Opens a PDF Document using Material page scaffolding for Android, and Cupertino page scaffolding for iOS.';
// const String _imageDocument = 'Image Document';
// const String _imageDocumentSub = 'Opens an image document.';
// const String _darkTheme = 'Dark Theme';
// const String _darkThemeSub =
//     'Opens a document in night mode with a custom dark theme.';
// const String _customConfiguration = 'Custom configuration options';
// const String _customConfigurationSub =
//     'Opens a document with custom configuration options.';
// const String _passwordProtectedDocument =
//     'Opens and unlocks a password protected document';
// const String _passwordProtectedDocumentSub =
//     'Programmatically unlocks a password protected document.';
//
// const String _formExample = 'Programmatic Form Filling Example';
// const String _formExampleSub =
//     'Programmatically sets and gets the value of a form field using a custom Widget.';
// const String _annotationsExample =
//     'Programmatically Adds and Removes Annotations';
// const String _annotationsExampleSub =
//     'Programmatically adds and removes annotations using a custom Widget.';
// const String _annotationProcessingExample = 'Process Annotations';
// const String _annotationProcessingExampleSub =
//     'Programmatically adds and removes annotations using a custom Widget.';
// const String _importInstantJsonExample = 'Import Instant Document JSON';
// const String _importInstantJsonExampleSub =
//     'Shows how to programmatically import Instant Document JSON using a custom Widget.';
// const String _widgetExampleFullScreen =
//     'Shows two PSPDFKit Widgets simultaneously';
// const String _widgetExampleFullScreenSub =
//     'Opens two different PDF documents simultaneously using two PSPDFKit Widgets.';
//
// const String _basicExampleGlobal = 'Basic Example';
// const String _basicExampleGlobalSub = 'Opens a PDF Document.';
// const String _imageDocumentGlobal = 'Image Document';
// const String _imageDocumentGlobalSub = 'Opens an image document.';
// const String _darkThemeGlobal = 'Dark Theme';
// const String _darkThemeGlobalSub =
//     'Opens a document in night mode with custom dark theme.';
// const String _customConfigurationGlobal = 'Custom configuration options';
// const String _customConfigurationGlobalSub =
//     'Opens a document with custom configuration options.';
// const String _passwordProtectedDocumentGlobal =
//     'Opens and unlocks a password protected document';
// const String _passwordProtectedDocumentGlobalSub =
//     'Programmatically unlocks a password protected document.';
// const String _formExampleGlobal = 'Programmatic Form Filling Example';
// const String _formExampleGlobalSub =
//     'Programmatically set and get the value of a form field.';
// const String _importInstantJsonExampleGlobal = 'Import Instant Document JSON';
// const String _importInstantJsonExampleGlobalSub =
//     'Shows how to programmatically import Instant Document JSON.';
// const String _pspdfkitWidgetExamples = 'PSPDFKit Widget Examples';
// const String _pspdfkitGlobalPluginExamples = 'PSPDFKit Modal View Examples';
//
// const String _pspdfkitFor = 'PSPDFKit for';
// const double _fontSize = 18.0;
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: HomePage());
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
//   static final ThemeData lightTheme = ThemeData(
//       backgroundColor: Colors.transparent,
//       primaryColor: Colors.black,
//       dividerColor: Colors.grey[400]);
//
//   static final ThemeData darkTheme = ThemeData(
//       backgroundColor: Colors.transparent,
//       primaryColor: Colors.white,
//       dividerColor: Colors.grey[800]);
//   String _frameworkVersion = '';
//   ThemeData currentTheme = lightTheme;
//
//   Future<File> extractAsset(String assetPath) async {
//     final bytes = await DefaultAssetBundle.of(context).load(assetPath);
//     final list = bytes.buffer.asUint8List();
//
//     final tempDir = await Pspdfkit.getTemporaryDirectory();
//     final tempDocumentPath = '${tempDir.path}/$assetPath';
//
//     final file = await File(tempDocumentPath);
//
//     // Do not overwrite the file it it already exists.
//     if (!file.existsSync()) {
//       file.create(recursive: true);
//       file.writeAsBytesSync(list);
//     }
//     return file;
//   }
//
//   bool isCupertino(BuildContext context) {
//     final defaultTargetPlatform = Theme.of(context).platform;
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.iOS:
//       case TargetPlatform.macOS:
//         return true;
//       case TargetPlatform.android:
//       case TargetPlatform.fuchsia:
//       case TargetPlatform.linux:
//       case TargetPlatform.windows:
//         return false;
//     }
//   }
//
//   void showDocument() async {
//     final extractedDocument = await extractAsset(_documentPath);
//     await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
//         builder: (_) => Scaffold(
//             extendBodyBehindAppBar: isCupertino(context) ? false : true,
//             appBar: AppBar(),
//             body: SafeArea(
//                 top: false,
//                 bottom: false,
//                 child: Container(
//                     padding: isCupertino(context)
//                         ? null
//                         : const EdgeInsets.only(top: kToolbarHeight),
//                     child: PspdfkitWidget(
//                         documentPath: extractedDocument.path))))));
//   }
//
//   void showDocumentPlatformStyle() async {
//     final extractedDocument = await extractAsset(_documentPath);
//
//     if (isCupertino(context)) {
//       await Navigator.of(context).push<dynamic>(CupertinoPageRoute<dynamic>(
//           builder: (_) => CupertinoPageScaffold(
//               navigationBar: const CupertinoNavigationBar(),
//               child: SafeArea(
//                   bottom: false,
//                   child:
//                   PspdfkitWidget(documentPath: extractedDocument.path)))));
//     } else {
//       await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
//           builder: (_) => Scaffold(
//               extendBodyBehindAppBar: true,
//               appBar: AppBar(),
//               body: SafeArea(
//                   top: false,
//                   bottom: false,
//                   child: Container(
//                       padding: const EdgeInsets.only(top: kToolbarHeight),
//                       child: PspdfkitWidget(
//                           documentPath: extractedDocument.path))))));
//     }
//   }
//
//   void showImage() async {
//     final extractedImage = await extractAsset(_imagePath);
//     await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
//         builder: (_) => Scaffold(
//             extendBodyBehindAppBar: isCupertino(context) ? false : true,
//             appBar: AppBar(),
//             body: SafeArea(
//                 top: false,
//                 bottom: false,
//                 child: Container(
//                     padding: isCupertino(context)
//                         ? null
//                         : const EdgeInsets.only(top: kToolbarHeight),
//                     child:
//                     PspdfkitWidget(documentPath: extractedImage.path))))));
//   }
//
//   void applyDarkTheme() async {
//     final extractedDocument = await extractAsset(_documentPath);
//     await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
//         builder: (_) => Scaffold(
//             extendBodyBehindAppBar: isCupertino(context) ? false : true,
//             appBar: AppBar(),
//             body: SafeArea(
//                 top: false,
//                 bottom: false,
//                 child: Container(
//                     padding: isCupertino(context)
//                         ? null
//                         : const EdgeInsets.only(top: kToolbarHeight),
//                     child: PspdfkitWidget(
//                         documentPath: extractedDocument.path,
//                         configuration: const {
//                           appearanceMode: appearanceModeNight,
//                           androidDarkThemeResource:
//                           'PSPDFKit.Theme.Example.Dark'
//                         }))))));
//   }
//
//   void applyCustomConfiguration() async {
//     final extractedDocument = await extractAsset(_documentPath);
//     await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
//         builder: (_) => Scaffold(
//             extendBodyBehindAppBar: isCupertino(context) ? false : true,
//             appBar: AppBar(),
//             body: SafeArea(
//                 top: false,
//                 bottom: false,
//                 child: Container(
//                     padding: isCupertino(context)
//                         ? null
//                         : const EdgeInsets.only(top: kToolbarHeight),
//                     child: PspdfkitWidget(
//                         documentPath: extractedDocument.path,
//                         configuration: const {
//                           scrollDirection: 'vertical',
//                           pageTransition: 'scrollContinuous',
//                           spreadFitting: 'fit',
//                           immersiveMode: false,
//                           userInterfaceViewMode: 'automaticBorderPages',
//                           androidShowSearchAction: true,
//                           inlineSearch: false,
//                           showThumbnailBar: 'floating',
//                           androidShowThumbnailGridAction: true,
//                           androidShowOutlineAction: true,
//                           androidShowAnnotationListAction: true,
//                           showPageLabels: true,
//                           documentLabelEnabled: false,
//                           invertColors: false,
//                           androidGrayScale: false,
//                           startPage: 2,
//                           enableAnnotationEditing: true,
//                           enableTextSelection: false,
//                           androidShowBookmarksAction: false,
//                           androidEnableDocumentEditor: false,
//                           androidShowShareAction: true,
//                           androidShowPrintAction: false,
//                           androidShowDocumentInfoView: true,
//                           appearanceMode: 'default',
//                           androidDefaultThemeResource: 'PSPDFKit.Theme.Example',
//                           iOSRightBarButtonItems: [
//                             'thumbnailsButtonItem',
//                             'activityButtonItem',
//                             'searchButtonItem',
//                             'annotationButtonItem'
//                           ],
//                           iOSLeftBarButtonItems: ['settingsButtonItem'],
//                           iOSAllowToolbarTitleChange: false,
//                           toolbarTitle: 'Custom Title',
//                           settingsMenuItems: [
//                             'pageTransition',
//                             'scrollDirection',
//                             'androidTheme',
//                             'iOSAppearance',
//                             'androidPageLayout',
//                             'iOSPageMode',
//                             'iOSSpreadFitting',
//                             'androidScreenAwake',
//                             'iOSBrightness'
//                           ],
//                           showActionNavigationButtons: false,
//                           pageMode: 'double',
//                           firstPageAlwaysSingle: true
//                         }))))));
//   }
//
//   void unlockPasswordProtectedDocument() async {
//     final extractedLockedDocument = await extractAsset(_lockedDocumentPath);
//     await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
//         builder: (_) => Scaffold(
//             extendBodyBehindAppBar: isCupertino(context) ? false : true,
//             appBar: AppBar(),
//             body: SafeArea(
//                 top: false,
//                 bottom: false,
//                 child: Container(
//                     padding: isCupertino(context)
//                         ? null
//                         : const EdgeInsets.only(top: kToolbarHeight),
//                     child: PspdfkitWidget(
//                         documentPath: extractedLockedDocument.path,
//                         configuration: const {password: 'test123'}))))));
//   }
//
//   void showFormDocumentExample() async {
//     final extractedFormDocument = await extractAsset(_formPath);
//     await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
//         builder: (_) => PspdfkitFormExampleWidget(
//             documentPath: extractedFormDocument.path,
//             onPspdfkitFormExampleWidgetCreated: onWidgetCreated)));
//   }
//
//   void importInstantJsonExample() async {
//     final extractedFormDocument = await extractAsset(_documentPath);
//     await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
//         builder: (_) => PspdfkitInstantJsonExampleWidget(
//             documentPath: extractedFormDocument.path,
//             instantJsonPath: _instantDocumentJsonPath)));
//   }
//
//   void annotationsExample() async {
//     final extractedDocument = await extractAsset(_documentPath);
//     await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
//         builder: (_) => PspdfkitAnnotationsExampleWidget(
//             documentPath: extractedDocument.path)));
//   }
//
//   void annotationProcessingExample() async {
//     final extractedDocument = await extractAsset(_documentPath);
//     await Navigator.of(context).push<dynamic>(MaterialPageRoute<dynamic>(
//         builder: (_) => PspdfkitAnnotationProcessingExampleWidget(
//             documentPath: extractedDocument.path,
//             exportPath: _processedDocumentPath)));
//   }
//
//   void pushTwoPspdfWidgetsSimultaneously() async {
//     try {
//       final extractedDocument = await extractAsset(_documentPath);
//       final extractedFormDocument = await extractAsset(_formPath);
//
//       if (isCupertino(context)) {
//         await Navigator.of(context).push<dynamic>(CupertinoPageRoute<dynamic>(
//             builder: (_) => CupertinoPageScaffold(
//                 navigationBar: CupertinoNavigationBar(),
//                 child: SafeArea(
//                     bottom: false,
//                     child: Column(children: <Widget>[
//                       Expanded(
//                           child: PspdfkitWidget(
//                               documentPath: extractedDocument.path)),
//                       Expanded(
//                           child: PspdfkitWidget(
//                               documentPath: extractedFormDocument.path,
//                               onPspdfkitWidgetCreated: onWidgetCreated))
//                     ])))));
//       } else {
//         // This example is only supported in iOS at the moment.
//         // Support for Android is coming soon.
//       }
//     } on PlatformException catch (e) {
//       print("Failed to present document: '${e.message}'.");
//     }
//   }
//
//   void onWidgetCreated(PspdfkitWidgetController view) async {
//     try {
//       await view.setFormFieldValue('Lastname', 'Name_Last');
//       await view.setFormFieldValue('0123456789', 'Telephone_Home');
//       await view.setFormFieldValue('City', 'City');
//       await view.setFormFieldValue('selected', 'Sex.0');
//       await view.setFormFieldValue('deselected', 'Sex.1');
//       await view.setFormFieldValue('selected', 'HIGH SCHOOL DIPLOMA');
//     } on PlatformException catch (e) {
//       print("Failed to set form field values '${e.message}'.");
//     }
//
//     String lastName;
//     try {
//       lastName = await view.getFormFieldValue('Name_Last');
//     } on PlatformException catch (e) {
//       print("Failed to get form field value '${e.message}'.");
//     }
//
//     if (lastName != null) {
//       print(
//           "Retrieved form field for fully qualified name 'Name_Last' is $lastName.");
//     }
//   }
//
//   void showDocumentGlobal() async {
//     final extractedDocument = await extractAsset(_documentPath);
//     await Pspdfkit.present(extractedDocument.path);
//   }
//
//   void showImageGlobal() async {
//     final extractedImage = await extractAsset(_imagePath);
//     await Pspdfkit.present(extractedImage.path);
//   }
//
//   void applyDarkThemeGlobal() async {
//     final extractedDocument = await extractAsset(_documentPath);
//     await Pspdfkit.present(extractedDocument.path, {
//       appearanceMode: appearanceModeNight,
//       androidDarkThemeResource: 'PSPDFKit.Theme.Example.Dark'
//     });
//   }
//
//   void applyCustomConfigurationGlobal() async {
//     final extractedDocument = await extractAsset(_documentPath);
//     await Pspdfkit.present(extractedDocument.path, {
//       scrollDirection: 'vertical',
//       pageTransition: 'scrollPerSpread',
//       spreadFitting: 'fit',
//       immersiveMode: false,
//       userInterfaceViewMode: 'automaticBorderPages',
//       androidShowSearchAction: true,
//       inlineSearch: false,
//       showThumbnailBar: 'floating',
//       androidShowThumbnailGridAction: true,
//       androidShowOutlineAction: true,
//       androidShowAnnotationListAction: true,
//       showPageLabels: true,
//       documentLabelEnabled: false,
//       invertColors: false,
//       androidGrayScale: false,
//       startPage: 2,
//       enableAnnotationEditing: true,
//       enableTextSelection: false,
//       androidShowBookmarksAction: false,
//       androidEnableDocumentEditor: false,
//       androidShowShareAction: true,
//       androidShowPrintAction: false,
//       androidShowDocumentInfoView: true,
//       appearanceMode: 'default',
//       androidDefaultThemeResource: 'PSPDFKit.Theme.Example',
//       iOSRightBarButtonItems: [
//         'thumbnailsButtonItem',
//         'activityButtonItem',
//         'searchButtonItem',
//         'annotationButtonItem'
//       ],
//       iOSLeftBarButtonItems: ['settingsButtonItem'],
//       iOSAllowToolbarTitleChange: false,
//       toolbarTitle: 'Custom Title',
//       settingsMenuItems: [
//         'pageTransition',
//         'scrollDirection',
//         'androidTheme',
//         'iOSAppearance',
//         'androidPageLayout',
//         'iOSPageMode',
//         'iOSSpreadFitting',
//         'androidScreenAwake',
//         'iOSBrightness'
//       ],
//       showActionNavigationButtons: false,
//       pageMode: 'double',
//       firstPageAlwaysSingle: true
//     });
//   }
//
//   void unlockPasswordProtectedDocumentGlobal() async {
//     final extractedLockedDocument = await extractAsset(_lockedDocumentPath);
//     await Pspdfkit.present(extractedLockedDocument.path, {password: 'test123'});
//   }
//
//   void showFormDocumentExampleGlobal() async {
//     final formDocument = await extractAsset(_formPath);
//     await Pspdfkit.present(formDocument.path);
//
//     try {
//       await Pspdfkit.setFormFieldValue('Lastname', 'Name_Last');
//       await Pspdfkit.setFormFieldValue('0123456789', 'Telephone_Home');
//       await Pspdfkit.setFormFieldValue('City', 'City');
//       await Pspdfkit.setFormFieldValue('selected', 'Sex.0');
//       await Pspdfkit.setFormFieldValue('deselected', 'Sex.1');
//       await Pspdfkit.setFormFieldValue('selected', 'HIGH SCHOOL DIPLOMA');
//     } on PlatformException catch (e) {
//       print("Failed to set form field values '${e.message}'.");
//     }
//
//     String lastName;
//     try {
//       lastName = await Pspdfkit.getFormFieldValue('Name_Last');
//     } on PlatformException catch (e) {
//       print("Failed to get form field value '${e.message}'.");
//     }
//
//     if (lastName != null) {
//       print(
//           "Retrieved form field for fully qualified name 'Name_Last' is $lastName.");
//     }
//   }
//
//   void importInstantJsonExampleGlobal() async {
//     final extractedDocument = await extractAsset(_documentPath);
//     await Pspdfkit.present(extractedDocument.path);
//
//     // Extract a string from a file.
//     final annotationsJson = await DefaultAssetBundle.of(context)
//         .loadString(_instantDocumentJsonPath);
//
//     try {
//       await Pspdfkit.applyInstantJson(annotationsJson);
//     } on PlatformException catch (e) {
//       print("Failed to import Instant Document JSON '${e.message}'.");
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance?.addObserver(this);
//     initPlatformState();
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance?.removeObserver(this);
//     super.dispose();
//   }
//
//   @override
//   void didChangePlatformBrightness() {
//     currentTheme =
//     WidgetsBinding.instance?.window.platformBrightness == Brightness.light
//         ? lightTheme
//         : darkTheme;
//     setState(() {
//       build(context);
//     });
//     super.didChangePlatformBrightness();
//   }
//
//   String frameworkVersion() {
//     return '$_pspdfkitFor $_frameworkVersion\n';
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   void initPlatformState() async {
//     String frameworkVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       frameworkVersion = await Pspdfkit.frameworkVersion;
//     } on PlatformException {
//       frameworkVersion = 'Failed to get platform version. ';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _frameworkVersion = frameworkVersion ?? '';
//     });
//
//     // By default, this example doesn't set a license key, but instead runs in
//     // trial mode (which is the default, and which requires no specific
//     // initialization). If you want to use a different license key for
//     // evaluation (e.g. a production license), you can uncomment the next line
//     // and set the license key.
//     //
//     // To set the license key for both platforms, use:
//     // await Pspdfkit.setLicenseKeys("YOUR_FLUTTER_ANDROID_LICENSE_KEY_GOES_HERE",
//     // "YOUR_FLUTTER_IOS_LICENSE_KEY_GOES_HERE");
//     //
//     // To set the license key for the currently running platform, use:
//     // await Pspdfkit.setLicenseKey("YOUR_FLUTTER_LICENSE_KEY_GOES_HERE");
//   }
//
//   void flutterPdfActivityOnPauseHandler() {
//     print('flutterPdfActivityOnPauseHandler');
//   }
//
//   void pdfViewControllerWillDismissHandler() {
//     print('pdfViewControllerWillDismissHandler');
//   }
//
//   void pdfViewControllerDidDismissHandler() {
//     print('pdfViewControllerDidDismissHandler');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Pspdfkit.flutterPdfActivityOnPause =
//         () => flutterPdfActivityOnPauseHandler();
//     Pspdfkit.pdfViewControllerWillDismiss =
//         () => pdfViewControllerWillDismissHandler();
//     Pspdfkit.pdfViewControllerDidDismiss =
//         () => pdfViewControllerDidDismissHandler();
//
//     currentTheme = MediaQuery.of(context).platformBrightness == Brightness.light
//         ? lightTheme
//         : darkTheme;
//
//     final listTiles = <Widget>[
//       Container(
//           color: Colors.grey[200],
//           padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//           child: Text(_pspdfkitWidgetExamples,
//               style: currentTheme.textTheme.headline4?.copyWith(
//                   fontSize: _fontSize, fontWeight: FontWeight.bold))),
//       // ListTile(
//       //     title: const Text(_basicExample),
//       //     subtitle: const Text(_basicExampleSub),
//       //     onTap: () => showDocument()),
//       // ListTile(
//       //     title: const Text(_imageDocument),
//       //     subtitle: const Text(_imageDocumentSub),
//       //     onTap: () => showImage()),
//       // ListTile(
//       //     title: const Text(_darkTheme),
//       //     subtitle: const Text(_darkThemeSub),
//       //     onTap: () => applyDarkTheme()),
//       // ListTile(
//       //     title: const Text(_customConfiguration),
//       //     subtitle: const Text(_customConfigurationSub),
//       //     onTap: () => applyCustomConfiguration()),
//       // ListTile(
//       //     title: const Text(_passwordProtectedDocument),
//       //     subtitle: const Text(_passwordProtectedDocumentSub),
//       //     onTap: () => unlockPasswordProtectedDocument()),
//       // ListTile(
//       //     title: const Text(_formExample),
//       //     subtitle: const Text(_formExampleSub),
//       //     onTap: () => showFormDocumentExample()),
//       ListTile(
//           title: const Text(_annotationsExample),
//           subtitle: const Text(_annotationsExampleSub),
//           onTap: () => annotationsExample()),
//       // The annotation processing example is supported by iOS only for now.
//       if (isCupertino(context))
//         ListTile(
//             title: const Text(_annotationProcessingExample),
//             subtitle: const Text(_annotationProcessingExampleSub),
//             onTap: () => annotationProcessingExample()),
//       // The import Instant JSON example is supported by iOS only for now.
//       if (isCupertino(context))
//         ListTile(
//             title: const Text(_importInstantJsonExample),
//             subtitle: const Text(_importInstantJsonExampleSub),
//             onTap: () => importInstantJsonExample()),
//       // The push two PspdfWidgets simultaneously example is supported by iOS only for now.
//       if (isCupertino(context))
//       //   ListTile(
//       //       title: const Text(_widgetExampleFullScreen),
//       //       subtitle: const Text(_widgetExampleFullScreenSub),
//       //       onTap: () => pushTwoPspdfWidgetsSimultaneously()),
//       // ListTile(
//       //     title: const Text(_basicPlatformStyleExample),
//       //     subtitle: const Text(_basicPlatformStyleExampleSub),
//       //     onTap: () => showDocumentPlatformStyle()),
//       Container(
//           color: Colors.grey[200],
//           padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//           child: Text(_pspdfkitGlobalPluginExamples,
//               style: currentTheme.textTheme.headline4?.copyWith(
//                   fontSize: _fontSize, fontWeight: FontWeight.bold))),
//       // ListTile(
//       //     title: const Text(_basicExampleGlobal),
//       //     subtitle: const Text(_basicExampleGlobalSub),
//       //     onTap: () => showDocumentGlobal()),
//       // ListTile(
//       //     title: const Text(_imageDocumentGlobal),
//       //     subtitle: const Text(_imageDocumentGlobalSub),
//       //     onTap: () => showImageGlobal()),
//       // ListTile(
//       //     title: const Text(_customConfigurationGlobal),
//       //     subtitle: const Text(_customConfigurationGlobalSub),
//       //     onTap: () => applyCustomConfigurationGlobal()),
//       // ListTile(
//       //     title: const Text(_darkThemeGlobal),
//       //     subtitle: const Text(_darkThemeGlobalSub),
//       //     onTap: () => applyDarkThemeGlobal()),
//       // ListTile(
//       //     title: const Text(_passwordProtectedDocumentGlobal),
//       //     subtitle: const Text(_passwordProtectedDocumentGlobalSub),
//       //     onTap: () => unlockPasswordProtectedDocumentGlobal()),
//       // ListTile(
//       //     title: const Text(_formExampleGlobal),
//       //     subtitle: const Text(_formExampleGlobalSub),
//       //     onTap: () => showFormDocumentExampleGlobal()),
//       // ListTile(
//       //     title: const Text(_importInstantJsonExampleGlobal),
//       //     subtitle: const Text(_importInstantJsonExampleGlobalSub),
//       //     onTap: () => importInstantJsonExampleGlobal()),
//     ];
//     return Scaffold(
//         appBar: AppBar(title: const Text(_pspdfkitFlutterPluginTitle)),
//         body: ExampleListView(currentTheme, frameworkVersion(), listTiles));
//   }
// }
//
// class ExampleListView extends StatelessWidget {
//   final ThemeData themeData;
//   final String frameworkVersion;
//   final List<Widget> widgets;
//
//   const ExampleListView(this.themeData, this.frameworkVersion, this.widgets,
//       {Key key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(mainAxisSize: MainAxisSize.max, children: [
//       Container(
//           color: Colors.transparent,
//           padding: const EdgeInsets.only(top: 24),
//           child: Center(
//               child: Text(frameworkVersion,
//                   style: themeData.textTheme.headline4?.copyWith(
//                       fontSize: _fontSize,
//                       fontWeight: FontWeight.bold,
//                       color: themeData.primaryColor)))),
//       Expanded(
//           child: ListView.separated(
//               itemCount: widgets.length,
//               separatorBuilder: (_, __) => const Divider(height: 1),
//               itemBuilder: (BuildContext context, int index) => widgets[index]))
//     ]);
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itimaaty/Utils/AppColors.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'View/SplashScreen.dart';
import 'BlocObserver/bloc_observer.dart';
import 'cubit/User/cubit.dart';
import 'cubit/User/states.dart';
import 'network/remote/dio_helper.dart';
import 'package:pspdfkit_flutter/src/main.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = MyBlocObserver();
  Widget widget=SplashScreen();
  runApp(MyApp(
    startWidget: widget,
  ));
  configLoading();
}

Future<void> configLoading() async {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..textColor=whiteColor
    ..progressColor = whiteColor
    ..backgroundColor = yellowColor
    ..indicatorColor = whiteColor
    ..textColor = whiteColor
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();

  await Pspdfkit.setLicenseKeys(Constants.ios, Constants.android);

  // await Pspdfkit.setLicenseKey(Constants.ios);
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return BlocProvider(
      create: (BuildContext context) => AppCubit()
      // ..getUsersData()
      ,

      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            title: 'Ijtimaati 4.0',
            // theme: lightTheme,
            // darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: startWidget,
            builder: EasyLoading.init(),
          );
        },
      ),

    );
  }
}


class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
      Widget child,
      AnimationController controller,
      AlignmentGeometry alignment,
      ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}