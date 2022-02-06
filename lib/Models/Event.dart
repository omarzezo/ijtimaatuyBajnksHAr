import 'package:flutter/foundation.dart';

class Event {
  final String title;
  final String bgColor;
  Event({@required this.title,@required this.bgColor});

  String toString() => this.title;
  String toStringColor() => this.bgColor;
}
