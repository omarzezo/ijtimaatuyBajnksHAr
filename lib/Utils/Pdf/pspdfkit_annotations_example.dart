import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pspdfkit_flutter/src/widgets/pspdfkit_widget_controller.dart';

class PspdfkitAnnotationsExampleWidget extends StatefulWidget {
  final String documentPath;
  final dynamic configuration;

  const PspdfkitAnnotationsExampleWidget(
      {Key key,  this.documentPath, this.configuration})
      : super(key: key);

  @override
  _PspdfkitAnnotationsExampleWidgetState createState() =>
      _PspdfkitAnnotationsExampleWidgetState();
}

class _PspdfkitAnnotationsExampleWidgetState
    extends State<PspdfkitAnnotationsExampleWidget> {
   PspdfkitWidgetController vieww;

  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = 'com.pspdfkit.widget';
    // const String viewType = 'com.itimaaty.itimaaty';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{
      'document': widget.documentPath,
      'configuration': widget.configuration
    };
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      return Scaffold(
          extendBodyBehindAppBar:
          defaultTargetPlatform == TargetPlatform.android,
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
                                gestureRecognizers: const <
                                    Factory<
                                        OneSequenceGestureRecognizer>>{},
                                hitTestBehavior:
                                PlatformViewHitTestBehavior.opaque,
                              );
                            },
                            onCreatePlatformView:
                                (PlatformViewCreationParams params) {
                              return PlatformViewsService
                                  .initSurfaceAndroidView(
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
                            })
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
                                await vieww.save();
                              },
                              child: const Text('Save Document'))
                        ]))
                  ]))));
    } else {
      return Text(
          '$defaultTargetPlatform is not yet supported by PSPDFKit for Flutter.');
    }
  }

  Future<void> onPlatformViewCreated(int id) async {
    vieww = PspdfkitWidgetController(id);
  }
}
