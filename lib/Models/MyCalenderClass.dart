import 'package:flutter/material.dart';

class MyCalenderClass{
  DateTime _dateTime;
  String _title;
  Color _color;
  // String

  // MyCalenderClass(this.dateTime, this.title);
  DateTime get dateTime => _dateTime;

  void setDateTime(DateTime value) {
    _dateTime = value;
  }

  String get title => _title;

  void settitle(String value) {
    _title = value;
  }

  Color get color => _color;

  void setColor(Color value) {
    _color = value;
  }
}