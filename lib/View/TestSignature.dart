import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:itimaatysoharsohar/View/ApprovalsDetailsScreen.dart';
import 'package:signature/signature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:ui' as ui;


import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';



class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  PainterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _newController();

  }

  PainterController _newController() {
    PainterController controller = PainterController();

    controller.thickness = 2.0;

    controller.backgroundColor = Colors.white;
    return controller;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Painter(_controller)),
    );
  }

}



class Painter extends StatefulWidget {
  final PainterController painterController;

  Painter(PainterController painterController)
      : this.painterController = painterController,
        super(key: new ValueKey<PainterController>(painterController));

  @override
  _PainterState createState() => new _PainterState();
}

class _PainterState extends State<Painter> {
  bool _finished;

  @override
  void initState() {
    super.initState();
    _finished = false;
    widget.painterController._widgetFinish = _finish;
  }

  Size _finish() {
    setState(() {
      _finished = true;
    });
    return context.size;
  }

  @override
  Widget build(BuildContext context) {
    Widget child = new CustomPaint(
      willChange: true,
      painter: new _PainterPainter(widget.painterController._pathHistory,
          repaint: widget.painterController),
    );
    child = new ClipRect(child: child);
    if (!_finished) {
      child = new GestureDetector(
        child: child,
        onPanStart: _onPanStart,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
      );
    }
    return new Container(
      child: child,
      width: double.infinity,
      height: double.infinity,
    );
  }

  void _onPanStart(DragStartDetails start) {
    Offset pos = (context.findRenderObject() as RenderBox)
        .globalToLocal(start.globalPosition);
    widget.painterController._pathHistory.add(pos);
    widget.painterController._notifyListeners();
  }

  void _onPanUpdate(DragUpdateDetails update) {
    Offset pos = (context.findRenderObject() as RenderBox)
        .globalToLocal(update.globalPosition);
    widget.painterController._pathHistory.updateCurrent(pos);
    widget.painterController._notifyListeners();
  }

  void _onPanEnd(DragEndDetails end) {
    widget.painterController._pathHistory.endCurrent();
    widget.painterController._notifyListeners();
  }
}

class _PainterPainter extends CustomPainter {
  final _PathHistory _path;

  _PainterPainter(this._path, {Listenable repaint}) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    _path.draw(canvas, size);
  }

  @override
  bool shouldRepaint(_PainterPainter oldDelegate) {
    return true;
  }
}

class _PathHistory {
  List<MapEntry<Path, Paint>> _paths;
  Paint currentPaint;
  Paint _backgroundPaint;
  bool _inDrag;

  _PathHistory() {
    _paths = new List<MapEntry<Path, Paint>>();
    _inDrag = false;
    _backgroundPaint = new Paint();
  }

  void setBackgroundColor(Color backgroundColor) {
    _backgroundPaint.color = backgroundColor;
  }

  void undo() {
    if (!_inDrag) {
      _paths.removeLast();
    }
  }

  void clear() {
    if (!_inDrag) {
      _paths.clear();
    }
  }

  void add(Offset startPoint) {
    if (!_inDrag) {
      _inDrag = true;
      Path path = new Path();
      path.moveTo(startPoint.dx, startPoint.dy);
      _paths.add(new MapEntry<Path, Paint>(path, currentPaint));
    }
  }

  void updateCurrent(Offset nextPoint) {
    if (_inDrag) {
      Path path = _paths.last.key;
      path.lineTo(nextPoint.dx, nextPoint.dy);
    }
  }

  void endCurrent() {
    _inDrag = false;
  }

  void draw(Canvas canvas, Size size) {
    canvas.drawRect(
        new Rect.fromLTWH(0.0, 0.0, size.width, size.height), _backgroundPaint);
    for (MapEntry<Path, Paint> path in _paths) {
      canvas.drawPath(path.key, path.value);
    }
  }
}

typedef PictureDetails PictureCallback();

class PictureDetails {
  final Picture picture;
  final int width;
  final int height;

  const PictureDetails(this.picture, this.width, this.height);


  Future<ui.Image> toImage() async {
    return await picture.toImage(width, height);
  }

  Future<Uint8List> toPNG() async {
    Uint8List img;
    toImage().then((value) async {
      img = (await value.toByteData(format: ImageByteFormat.png))
          .buffer
          .asUint8List();
    });
    return await img;
  }
}

class PainterController extends ChangeNotifier {
  Color _drawColor = new Color.fromARGB(255, 0, 0, 0);
  Color _backgroundColor = new Color.fromARGB(255, 255, 255, 255);

  double _thickness = 1.0;
  PictureDetails _cached;
  _PathHistory _pathHistory;
  ValueGetter<Size> _widgetFinish;

  PainterController() {
    _pathHistory = new _PathHistory();
  }

  Color get drawColor => _drawColor;
  set drawColor(Color color) {
    _drawColor = color;
    _updatePaint();
  }

  Color get backgroundColor => _backgroundColor;

  set backgroundColor(Color color) {
    _backgroundColor = color;
    _updatePaint();
  }

  double get thickness => _thickness;
  set thickness(double t) {
    _thickness = t;
    _updatePaint();
  }

  void _updatePaint() {
    Paint paint = new Paint();
    paint.color = drawColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = thickness;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    _pathHistory.currentPaint = paint;
    _pathHistory.setBackgroundColor(backgroundColor);
    notifyListeners();
  }

  void undo() {
    if (!isFinished()) {
      _pathHistory.undo();
      notifyListeners();
    }
  }

  void _notifyListeners() {
    notifyListeners();
  }

  void clear() {
    if (!isFinished()) {
      _pathHistory.clear();
      notifyListeners();
    }
  }

  PictureDetails finish() {
    // if (!isFinished()) {
    _cached = _render(_widgetFinish());
    // print("_cached>"+_cached.toString());
    // print("_cached>"+_cached.width.toString());
    _cached.toPNG();
    // }
    return _cached;
  }

  bool isStartPaint(){
    if(_pathHistory._paths.isEmpty){
      return false;
    }else{
      return true;
    }
  }
  // Unit
  PictureDetails _render(Size size) {
    PictureRecorder recorder = new PictureRecorder();
    Canvas canvas = new Canvas(recorder);

    _pathHistory.draw(canvas, size);
    return new PictureDetails(
        recorder.endRecording(), size.width.floor(), size.height.floor());
  }



  // Future<Uint8List> toPNG() async {
  //   Uint8List imgg=null;
  //   _cached.toPNG().then((value) {
  //     imgg=value;
  //   });
  //   return imgg;
  // }

  bool isFinished() {
    return _cached == null?false:true;
  }


}


// class SignatureBox extends StatefulWidget {
//   // const SignatureBox({Key key}) : super(key: key);
//   SignatureController controller;
//   SignatureBox(this.controller);
//
//   @override
//   SignatureBoxState createState() => SignatureBoxState();
//
// }
//
// class SignatureBoxState extends State<SignatureBox> {
//
//
//
//   @override
//   void initState() {
//     // we initialize the signature controller
//     // widget.controller = SignatureController(penStrokeWidth: 5, penColor: Colors.white);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // widget.controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Signature(
//       // width: MediaQuery.of(context).size.width/2-20,
//       controller: widget.controller,
//       backgroundColor: Colors.transparent,
//     );
//   }
//
//
//   Widget buttonWidgets(BuildContext context) => Container(
//     color: Colors.teal,
//     child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//       IconButton(
//           onPressed: () async {
//             if (widget.controller.isNotEmpty) {
//               final signature = await exportSignature();
//               widget.controller.clear();
//             }
//           },
//           iconSize: 40,
//           color: Colors.white,
//           icon: const Icon(Icons.check)),
//       IconButton(
//           onPressed: () {
//             widget.controller.clear();
//           },
//           iconSize: 40,
//           color: Colors.red,
//           icon: const Icon(Icons.close)),
//     ]),
//   );
//
//   Future<Uint8List> exportSignature() async {
//     final exportController = SignatureController(
//       penStrokeWidth: 2,
//       exportBackgroundColor: Colors.white,
//       penColor: Colors.black,
//       points: widget.controller.points,
//     );
//
//     final signature = exportController.toPngBytes();
//
//     //clean up the memory
//     exportController.dispose();
//
//     return signature;
//   }
// }




// class SignatureBox extends StatefulWidget {
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<SignatureBox> {
//   var color = Colors.black;
//   var strokeWidth = 3.0;
//   final _sign = GlobalKey<Signature1State>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//
//             _showCategory(),
//             _showSignaturePad()
//           ],
//         ),
//       )
//
//       ,
//     );
//   }
//
//   Widget _showCategory() {
//     return TextField(
//         onTap: () {
//           FocusScope.of(context).requestFocus(FocusNode());
//         },
//         style: TextStyle(fontSize: 12.0, height: 1.0),
//         decoration: InputDecoration(hintText: "TextView"));
//   }
//
//   Widget _showSignaturePad() {
//     return Container(
//       width: double.infinity,
//       height: 200,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           height: 200,
//           //color: Colors.red,
//           child: Signature1(
//             color: color,
//             key: _sign,
//             strokeWidth: strokeWidth,
//           ),
//         ),
//       ),
//       color: Colors.grey.shade300,
//     );
//   }
// }
// class Signature1 extends StatefulWidget {
//   final Color color;
//   final double strokeWidth;
//   final CustomPainter backgroundPainter;
//   final Function onSign;
//
//   Signature1({
//     this.color = Colors.black,
//     this.strokeWidth = 5.0,
//     this.backgroundPainter,
//     this.onSign,
//     Key key,
//   }) : super(key: key);
//
//   Signature1State createState() => Signature1State();
//
//   static Signature1State of(BuildContext context) {
//     return context.findAncestorStateOfType<Signature1State>();
//   }
// }
//
// class _SignaturePainter extends CustomPainter {
//   Size _lastSize;
//   final double strokeWidth;
//   final List<Offset> points;
//   final Color strokeColor;
//   Paint _linePaint;
//
//   _SignaturePainter({@required this.points, @required this.strokeColor, @required this.strokeWidth}) {
//     _linePaint = Paint()
//       ..color = strokeColor
//       ..strokeWidth = strokeWidth
//       ..strokeCap = StrokeCap.round;
//   }
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     _lastSize = size;
//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 1] != null) canvas.drawLine(points[i], points[i + 1], _linePaint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(_SignaturePainter other) => other.points != points;
// }
//
// class Signature1State extends State<Signature1> {
//   List<Offset> _points = <Offset>[];
//   _SignaturePainter _painter;
//   Size _lastSize;
//
//   Signature1State();
//
//   void _onDragStart(DragStartDetails details){
//     RenderBox referenceBox = context.findRenderObject();
//     Offset localPostion = referenceBox.globalToLocal(details.globalPosition);
//     setState(() {
//       _points = List.from(_points)
//         ..add(localPostion)
//         ..add(localPostion);
//     });
//   }
//   void _onDragUpdate (DragUpdateDetails details) {
//     RenderBox referenceBox = context.findRenderObject();
//     Offset localPosition = referenceBox.globalToLocal(details.globalPosition);
//
//     setState(() {
//       _points = List.from(_points)..add(localPosition);
//       if (widget.onSign != null) {
//         widget.onSign();
//       }
//     });
//   }
//   void _onDragEnd (DragEndDetails details) => _points.add(null);
//
//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstLayout(context));
//     _painter = _SignaturePainter(points: _points, strokeColor: widget.color, strokeWidth: widget.strokeWidth);
//     return ClipRect(
//       child: CustomPaint(
//         painter: widget.backgroundPainter,
//         foregroundPainter: _painter,
//         child: GestureDetector(
//
//             onVerticalDragStart: _onDragStart,
//             onVerticalDragUpdate: _onDragUpdate,
//             onVerticalDragEnd: _onDragEnd,
//
//             onPanStart: _onDragStart,
//             onPanUpdate: _onDragUpdate,
//             onPanEnd: _onDragEnd
//         ),
//       ),
//     );
//   }
//
//   Future<ui.Image> getData() {
//     var recorder = ui.PictureRecorder();
//     var origin = Offset(0.0, 0.0);
//     var paintBounds = Rect.fromPoints(_lastSize.topLeft(origin), _lastSize.bottomRight(origin));
//     var canvas = Canvas(recorder, paintBounds);
//     if(widget.backgroundPainter != null) {
//       widget.backgroundPainter.paint(canvas, _lastSize);
//     }
//     _painter.paint(canvas, _lastSize);
//     var picture = recorder.endRecording();
//     return picture.toImage(_lastSize.width.round(), _lastSize.height.round());
//   }
//
//   void clear() {
//     setState(() {
//       _points = [];
//     });
//   }
//
//   bool get hasPoints => _points.length > 0;
//
//   List<Offset> get points => _points;
//
//   afterFirstLayout(BuildContext context) {
//     _lastSize = context.size;
//   }
// }


class SignatureBox extends StatefulWidget {
  final Color color;
  final double strokeWidth;
  final CustomPainter backgroundPainter;
  final Function onSign;

  SignatureBox({
    this.color = Colors.black,
    this.strokeWidth = 5.0,
    this.backgroundPainter,
    this.onSign,
    Key key,
  }) : super(key: key);

  SignatureState createState() => SignatureState();

  static SignatureState of(BuildContext context) {
    return context.findAncestorStateOfType<SignatureState>();
  }
}

class CustomPanGestureRecognizer extends OneSequenceGestureRecognizer {
  final Function onPanStart;
  final Function onPanUpdate;
  final Function onPanEnd;

  CustomPanGestureRecognizer({@required this.onPanStart, @required this.onPanUpdate, @required this.onPanEnd});

  @override
  void addPointer(PointerEvent event) {
    onPanStart(event.position);
    startTrackingPointer(event.pointer);
    resolve(GestureDisposition.accepted);
  }

  @override
  void handleEvent(PointerEvent event) {
    if (event is PointerMoveEvent) {
      onPanUpdate(event.position);
    }
    if (event is PointerUpEvent) {
      onPanEnd(event.position);
      stopTrackingPointer(event.pointer);
    }
  }

  @override
  String get debugDescription => 'customPan';

  @override
  void didStopTrackingLastPointer(int pointer) {}
}

class _SignaturePainter extends CustomPainter {
  Size _lastSize;
  final double strokeWidth;
  final List<Offset> points;
  final Color strokeColor;
  Paint _linePaint;

  _SignaturePainter({@required this.points, @required this.strokeColor, @required this.strokeWidth}) {
    _linePaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _lastSize = size;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) canvas.drawLine(points[i], points[i + 1], _linePaint);
    }
  }

  @override
  bool shouldRepaint(_SignaturePainter other) => other.points != points;
}

class SignatureState extends State<SignatureBox> {
  List<Offset> _points = <Offset>[];
  _SignaturePainter _painter;
  Size _lastSize;

  SignatureState();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstLayout(context));
    _painter = _SignaturePainter(points: _points, strokeColor: widget.color, strokeWidth: widget.strokeWidth);
    return ClipRect(
      child: CustomPaint(
        painter: widget.backgroundPainter,
        foregroundPainter: _painter,
        child: RawGestureDetector(
          gestures: {
            CustomPanGestureRecognizer: GestureRecognizerFactoryWithHandlers<CustomPanGestureRecognizer>(
                  () => CustomPanGestureRecognizer(
                onPanStart: (position) {
                  RenderBox referenceBox = context.findRenderObject();
                  Offset localPostion = referenceBox.globalToLocal(position);
                  setState(() {
                    _points = List.from(_points)..add(localPostion)..add(localPostion);
                  });
                  return true;
                },
                onPanUpdate: (position) {
                  RenderBox referenceBox = context.findRenderObject();
                  Offset localPosition = referenceBox.globalToLocal(position);

                  setState(() {
                    _points = List.from(_points)..add(localPosition);
                    if (widget.onSign != null) {
                      widget.onSign();
                    }
                  });
                },
                onPanEnd: (position) {
                  _points.add(null);
                },
              ),
                  (CustomPanGestureRecognizer instance) {},
            ),
          },
        ),
      ),
    );
  }

  Future<ui.Image> getData() {
    var recorder = ui.PictureRecorder();
    // var origin = Offset(0.0, 0.0);
    // var paintBounds = Rect.fromPoints(_lastSize.topLeft(origin), _lastSize.bottomRight(origin));
    // var canvas = Canvas(recorder, paintBounds);
    // if (widget.backgroundPainter != null) {
    //   widget.backgroundPainter.paint(canvas, _lastSize);
    // }
    // _painter.paint(canvas, _lastSize);

    var picture = recorder.endRecording();
    // print("picture>>"+picture.toString());
    return picture.toImage(_lastSize.width.round(), _lastSize.height.round()).then((value) async {
      final pngByteData = await value.toByteData(format: ImageByteFormat.png);
      String base64String = base64Encode(pngByteData.buffer.asUint8List());
      String header = "data:image/png;base64,";
      log("base64String>>" + header + base64String.toString());
    });
  }

  void clear() {
    setState(() {
      _points = [];
    });
  }

  bool get hasPoints => _points.length > 0;

  List<Offset> get points => _points;

  afterFirstLayout(BuildContext context) {
    _lastSize = context.size;
  }
}

