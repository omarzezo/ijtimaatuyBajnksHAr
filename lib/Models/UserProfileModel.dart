import 'package:flutter/material.dart';

class UserProfileModel {
   String image;
   String fileName;
   String name;
   String position;
   String phone;
   String date;
   String email;
  UserProfileModel({@required this.image,
    @required this.name,
    @required this.fileName,
    @required this.position,@required this.phone,@required this.date,@required this.email});

   UserProfileModel.fromJson(dynamic json) {
     image = json['image'];
    fileName = json['fileName'];
    name = json['name'];
    position = json['position'];
    phone = json['phone'];
    date = json['date'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['image'] = image;
    map['fileName'] = fileName;
    map['name'] = name;
    map['position'] = position;
    map['phone'] = phone;
    map['date'] = date;
    map['email'] = email;
    return map;
  }
}