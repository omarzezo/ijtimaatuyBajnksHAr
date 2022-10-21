import 'package:flutter/material.dart';

class UsersAndComments {
  final int id;
  final String name;
  final String comment;
  final String img;
  final String date;
  final String commentedId;
  final bool fromApi;
  UsersAndComments({@required this.id,@required this.name,@required this.comment,@required this.fromApi,@required this.img,@required this.date,@required this.commentedId});

  String toString() => this.comment;
  String toStringColor() => this.img;
}