import 'package:flutter/material.dart';

class NewsOfflineModel{
  int id;
  String response;

  String get _response => response;

  void seResponse(String value) {
    response = value;
  }

  int get _id => id;

  void setId(int value) {
    id = value;
  }
}