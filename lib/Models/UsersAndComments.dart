import 'package:flutter/material.dart';

class UsersAndComments {
  final int id;
  final String name;
  final String comment;
  final String img;
  final String date;
  UsersAndComments({@required this.id,@required this.name,@required this.comment,@required this.img,@required this.date});

  String toString() => this.comment;
  String toStringColor() => this.img;
}