import 'package:flutter/material.dart';

class AllAprovalsResponseModel {
  AllAprovalsResponseModel({
      int currentPage, 
      List<AllAprovalsResponseModelData> data,
      String firstPageUrl, 
      int from, 
      int lastPage, 
      String lastPageUrl, 
      List<Links> links, 
      String nextPageUrl, 
      String path, 
      int perPage, 
      dynamic prevPageUrl, 
      int to, 
      int total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  AllAprovalsResponseModel.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(AllAprovalsResponseModelData.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  int _currentPage;
  List<AllAprovalsResponseModelData> _data;
  String _firstPageUrl;
  int _from;
  int _lastPage;
  String _lastPageUrl;
  List<Links> _links;
  String _nextPageUrl;
  String _path;
  int _perPage;
  dynamic _prevPageUrl;
  int _to;
  int _total;

  int get currentPage => _currentPage;
  List<AllAprovalsResponseModelData> get data => _data;
  String get firstPageUrl => _firstPageUrl;
  int get from => _from;
  int get lastPage => _lastPage;
  String get lastPageUrl => _lastPageUrl;
  List<Links> get links => _links;
  String get nextPageUrl => _nextPageUrl;
  String get path => _path;
  int get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  int get to => _to;
  int get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// url : null
/// label : "&laquo; Previous"
/// active : false

class Links {
  Links({
      dynamic url, 
      String label, 
      bool active,}){
    _url = url;
    _label = label;
    _active = active;
}

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String _label;
  bool _active;

  dynamic get url => _url;
  String get label => _label;
  bool get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }

}

/// id : 96
/// title : "Ahmed"
/// user_id : 21
/// status : 3
/// created_at : "2022-05-09T08:18:56.000000Z"
/// updated_at : "2022-05-09T15:43:55.000000Z"
/// deleted_at : null
/// committee_id : 3
/// sender : {"id":21,"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","updated_at":"2022-05-13T19:48:46.000000Z","role_id":1,"phone":"9908798002","birthdate":"2000-08-22","team":3,"image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","status":1,"position":"Cyber security","two_auth":"1","verification_code":null,"signature":"uploads/approvals/NuiXsyKHgP.png","team_name":"Ijtimaati Team","role_name":"Organization Admins","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}}],"role":{"id":1,"name":"Organization Admins","slug":"Organization Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-02T22:39:27.000000Z","status":"1"}}
/// documents : [{"id":123,"approval_id":96,"library_id":611,"created_at":"2022-05-09T08:18:56.000000Z","updated_at":"2022-05-09T08:18:56.000000Z","url":null,"library":{"id":611,"user_id":21,"library_category_id":null,"name":"incident report.pdf","type":"application/pdf","created_at":"2022-05-07T18:19:27.000000Z","updated_at":"2022-05-07T18:19:27.000000Z","hidden":0,"file_url":"http://test.app.ijtimaati.com/api/public/uploads/library/1651947567100612.pdf","size":"191.59 KB","used_in":{"talkingpoints":[{"id":439,"meeting_id":573,"creator_id":21,"title":"تجربة 2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":611,"meeting":{"id":573,"title":"تجربة رقم2","owner_id":21,"committee_id":3,"description":"تجربة رقم 2","start_date":"2022-05-08 22:10:00","duration":60,"location":"Muscat","meeting_status_id":3,"virtual":0,"order":"TalkingPoints,Decisions,Actions","virtual_type":null,"mom":null,"mom_settings":null,"mom_conclusion":null,"attendance_status":"Pending","last_activity":"Ahmed Zaid Create action إجتماعاتي - حيث 2022-05-08 4:05 PM","current_member":{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":5411,"meeting_id":573,"user_id":null,"user_email":"ahm.z.942@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"e6ea5add31e0dfee35734a678d5bfd30","user":null,"type":"Viewer"},{"id":5382,"meeting_id":573,"user_id":1,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"test@test2.ijtimaati.local","image":"http://test.app.ijtimaati.com/api/public/uploads/images/FaNlH2ba4c.html","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5383,"meeting_id":573,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5384,"meeting_id":573,"user_id":6,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed 22","email":"s5i4enc2k@disbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5385,"meeting_id":573,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"for testing","token":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","position":"Cyber security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5386,"meeting_id":573,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5408,"meeting_id":573,"user_id":32,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.saleh@live.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/MN1EFjZ2SH.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5388,"meeting_id":573,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5389,"meeting_id":573,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5390,"meeting_id":573,"user_id":57,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5391,"meeting_id":573,"user_id":58,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/8zQQmEwkU0.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5392,"meeting_id":573,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/F94kewxlzN.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5393,"meeting_id":573,"user_id":61,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5394,"meeting_id":573,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer","email":"abeer@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/T9jg2Qm6RD.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5395,"meeting_id":573,"user_id":90,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"mahmoud bakr","email":"pluskora90@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5396,"meeting_id":573,"user_id":94,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Admins","email":"yaser2@tmpbox.net","image":"http://test.app.ijtimaati.com/api/public/uploads/images/baCRizZygW.png","position":"test d","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5397,"meeting_id":573,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Regular Users","email":"yaserabusamra@gmail.com","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5398,"meeting_id":573,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"test user","email":"admin@gmail.co","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5399,"meeting_id":573,"user_id":114,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"zainab","email":"zainab@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/bZvlF3caz2.png","position":"sales","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5400,"meeting_id":573,"user_id":120,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed Mizar","email":"ahmedmizar71@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5409,"meeting_id":573,"user_id":125,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Test Orgwerr","email":"ardfdf@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5401,"meeting_id":573,"user_id":126,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"YASER SAMRA","email":"yasersamra@tmpbox.net","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5402,"meeting_id":573,"user_id":127,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"AHMED_D","email":"ahmed_d@tmpbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5403,"meeting_id":573,"user_id":128,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"bf7t3pyjx@moakt.cc","email":"bf7t3pyjx@moakt.cc","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5404,"meeting_id":573,"user_id":129,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"yjvwziyfp@tmail.ws","email":"yjvwziyfp@tmail.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5405,"meeting_id":573,"user_id":130,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"xqy4xqshy@moakt.ws","email":"xqy4xqshy@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5406,"meeting_id":573,"user_id":132,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5410,"meeting_id":573,"user_id":135,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"colexyxoce","email":"lohuxyciw@mailinator.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5407,"meeting_id":573,"user_id":136,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed","email":"Ahemd@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"talkingpointsubpoints":[],"decisions":[],"actions":[]},"edited_file":[],"talkingpoints":[{"id":439,"meeting_id":573,"creator_id":21,"title":"تجربة 2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":611,"meeting":{"id":573,"title":"تجربة رقم2","owner_id":21,"committee_id":3,"description":"تجربة رقم 2","start_date":"2022-05-08 22:10:00","duration":60,"location":"Muscat","meeting_status_id":3,"virtual":0,"order":"TalkingPoints,Decisions,Actions","virtual_type":null,"mom":null,"mom_settings":null,"mom_conclusion":null,"attendance_status":"Pending","last_activity":"Ahmed Zaid Create action إجتماعاتي - حيث 2022-05-08 4:05 PM","current_member":{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":5411,"meeting_id":573,"user_id":null,"user_email":"ahm.z.942@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"e6ea5add31e0dfee35734a678d5bfd30","user":null,"type":"Viewer"},{"id":5382,"meeting_id":573,"user_id":1,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"test@test2.ijtimaati.local","image":"http://test.app.ijtimaati.com/api/public/uploads/images/FaNlH2ba4c.html","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5383,"meeting_id":573,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5384,"meeting_id":573,"user_id":6,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed 22","email":"s5i4enc2k@disbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5385,"meeting_id":573,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"for testing","token":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","position":"Cyber security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5386,"meeting_id":573,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5408,"meeting_id":573,"user_id":32,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.saleh@live.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/MN1EFjZ2SH.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5388,"meeting_id":573,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5389,"meeting_id":573,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5390,"meeting_id":573,"user_id":57,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5391,"meeting_id":573,"user_id":58,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/8zQQmEwkU0.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5392,"meeting_id":573,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/F94kewxlzN.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5393,"meeting_id":573,"user_id":61,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5394,"meeting_id":573,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer","email":"abeer@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/T9jg2Qm6RD.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5395,"meeting_id":573,"user_id":90,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"mahmoud bakr","email":"pluskora90@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5396,"meeting_id":573,"user_id":94,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Admins","email":"yaser2@tmpbox.net","image":"http://test.app.ijtimaati.com/api/public/uploads/images/baCRizZygW.png","position":"test d","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5397,"meeting_id":573,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Regular Users","email":"yaserabusamra@gmail.com","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5398,"meeting_id":573,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"test user","email":"admin@gmail.co","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5399,"meeting_id":573,"user_id":114,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"zainab","email":"zainab@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/bZvlF3caz2.png","position":"sales","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5400,"meeting_id":573,"user_id":120,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed Mizar","email":"ahmedmizar71@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5409,"meeting_id":573,"user_id":125,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Test Orgwerr","email":"ardfdf@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5401,"meeting_id":573,"user_id":126,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"YASER SAMRA","email":"yasersamra@tmpbox.net","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5402,"meeting_id":573,"user_id":127,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"AHMED_D","email":"ahmed_d@tmpbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5403,"meeting_id":573,"user_id":128,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"bf7t3pyjx@moakt.cc","email":"bf7t3pyjx@moakt.cc","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5404,"meeting_id":573,"user_id":129,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"yjvwziyfp@tmail.ws","email":"yjvwziyfp@tmail.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5405,"meeting_id":573,"user_id":130,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"xqy4xqshy@moakt.ws","email":"xqy4xqshy@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5406,"meeting_id":573,"user_id":132,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5410,"meeting_id":573,"user_id":135,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"colexyxoce","email":"lohuxyciw@mailinator.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5407,"meeting_id":573,"user_id":136,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed","email":"Ahemd@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"talkingpointsubpoints":[],"decisions":[],"actions":[]}}]
/// assignees : [{"id":207,"approval_id":96,"user_id":21,"status":3,"order":0,"created_at":"2022-05-09T08:18:56.000000Z","updated_at":"2022-05-09T15:42:15.000000Z","user":{"id":21,"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","updated_at":"2022-05-13T19:48:46.000000Z","role_id":1,"phone":"9908798002","birthdate":"2000-08-22","team":3,"image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","status":1,"position":"Cyber security","two_auth":"1","verification_code":null,"signature":"uploads/approvals/NuiXsyKHgP.png","team_name":"Ijtimaati Team","role_name":"Organization Admins","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}}],"role":{"id":1,"name":"Organization Admins","slug":"Organization Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-02T22:39:27.000000Z","status":"1"}},"assignee":{"id":21,"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","updated_at":"2022-05-13T19:48:46.000000Z","role_id":1,"phone":"9908798002","birthdate":"2000-08-22","team":3,"image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","status":1,"position":"Cyber security","two_auth":"1","verification_code":null,"signature":"uploads/approvals/NuiXsyKHgP.png","team_name":"Ijtimaati Team","role_name":"Organization Admins","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}}],"role":{"id":1,"name":"Organization Admins","slug":"Organization Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-02T22:39:27.000000Z","status":"1"}}},{"id":208,"approval_id":96,"user_id":35,"status":3,"order":1,"created_at":"2022-05-09T08:18:56.000000Z","updated_at":"2022-05-09T15:43:55.000000Z","user":{"id":35,"name":"Mazin","email":"mazin@ijtimaati.com","updated_at":"2022-05-13T20:07:13.000000Z","role_id":2,"phone":"97038101","birthdate":"1994-09-01","team":3,"image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","status":1,"position":"IT Support","two_auth":"1","verification_code":null,"signature":"uploads/approvals/EH5fN1ypUj.png","team_name":"Ijtimaati Team","role_name":"Regular Users","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":3}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-26T17:46:34.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":8}}],"role":{"id":2,"name":"Regular Users","slug":"Regular Users","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-12T17:30:04.000000Z","status":"1"}},"assignee":{"id":35,"name":"Mazin","email":"mazin@ijtimaati.com","updated_at":"2022-05-13T20:07:13.000000Z","role_id":2,"phone":"97038101","birthdate":"1994-09-01","team":3,"image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","status":1,"position":"IT Support","two_auth":"1","verification_code":null,"signature":"uploads/approvals/EH5fN1ypUj.png","team_name":"Ijtimaati Team","role_name":"Regular Users","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":3}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-26T17:46:34.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":8}}],"role":{"id":2,"name":"Regular Users","slug":"Regular Users","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-12T17:30:04.000000Z","status":"1"}}}]

class AllAprovalsResponseModelData {
  AllAprovalsResponseModelData({
      int id, 
      String title, 
      int userId, 
      int status,
    bool visible,
      String statusText,
      Color statusColor,
      String createdAt,
      String updatedAt, 
      dynamic deletedAt, 
      int committeeId, 
      Sender sender, 
      List<Documents> documents, 
      List<AllAprovalsResponseModelDataAssignees> assignees,}){
    _id = id;
    _title = title;
    _statusText = statusText;
    _visible = visible;
    _statusColor = statusColor;
    _userId = userId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _committeeId = committeeId;
    _sender = sender;
    _documents = documents;
    _assignees = assignees;
}

  AllAprovalsResponseModelData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _userId = json['user_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _committeeId = json['committee_id'];
    _sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
    if (json['documents'] != null) {
      _documents = [];
      json['documents'].forEach((v) {
        _documents.add(Documents.fromJson(v));
      });
    }
    if (json['assignees'] != null) {
      _assignees = [];
      json['assignees'].forEach((v) {
        _assignees.add(AllAprovalsResponseModelDataAssignees.fromJson(v));
      });
    }
  }
  int _id;
  String _title;
  String _statusText;
  Color _statusColor;
  bool _visible;
  int _userId;
  int _status;
  String _createdAt;
  String _updatedAt;
  dynamic _deletedAt;
  int _committeeId;
  Sender _sender;
  List<Documents> _documents;
  List<AllAprovalsResponseModelDataAssignees> _assignees;

  int get id => _id;
  String get title => _title;
  int get userId => _userId;
  int get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  int get committeeId => _committeeId;
  Sender get sender => _sender;
  List<Documents> get documents => _documents;
  List<AllAprovalsResponseModelDataAssignees> get assignees => _assignees;


  set status(int value) {
    _status = value;
  }

  String get statusText => _statusText;


  bool get visible => _visible;

  set visible(bool value) {
    _visible = value;
  }

  set statusText(String value) {
    _statusText = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['user_id'] = _userId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['committee_id'] = _committeeId;
    if (_sender != null) {
      map['sender'] = _sender.toJson();
    }
    if (_documents != null) {
      map['documents'] = _documents.map((v) => v.toJson()).toList();
    }
    if (_assignees != null) {
      map['assignees'] = _assignees.map((v) => v.toJson()).toList();
    }
    return map;
  }

  Color get statusColor => _statusColor;

  set statusColor(Color value) {
    _statusColor = value;
  }
}

/// id : 207
/// approval_id : 96
/// user_id : 21
/// status : 3
/// order : 0
/// created_at : "2022-05-09T08:18:56.000000Z"
/// updated_at : "2022-05-09T15:42:15.000000Z"
/// user : {"id":21,"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","updated_at":"2022-05-13T19:48:46.000000Z","role_id":1,"phone":"9908798002","birthdate":"2000-08-22","team":3,"image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","status":1,"position":"Cyber security","two_auth":"1","verification_code":null,"signature":"uploads/approvals/NuiXsyKHgP.png","team_name":"Ijtimaati Team","role_name":"Organization Admins","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}}],"role":{"id":1,"name":"Organization Admins","slug":"Organization Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-02T22:39:27.000000Z","status":"1"}}
/// assignee : {"id":21,"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","updated_at":"2022-05-13T19:48:46.000000Z","role_id":1,"phone":"9908798002","birthdate":"2000-08-22","team":3,"image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","status":1,"position":"Cyber security","two_auth":"1","verification_code":null,"signature":"uploads/approvals/NuiXsyKHgP.png","team_name":"Ijtimaati Team","role_name":"Organization Admins","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}}],"role":{"id":1,"name":"Organization Admins","slug":"Organization Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-02T22:39:27.000000Z","status":"1"}}

class AllAprovalsResponseModelDataAssignees {
  AllAprovalsResponseModelDataAssignees({
      int id,
      int index,
      int approvalId,
      int userId, 
      int status, 
      int order, 
      String createdAt, 
      String updatedAt, 
      User user, 
      Assignee assignee,}){
    _id = id;
    _index = index;
    _approvalId = approvalId;
    _userId = userId;
    _status = status;
    _order = order;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
    _assignee = assignee;
}

  AllAprovalsResponseModelDataAssignees.fromJson(dynamic json) {
    _id = json['id'];
    _approvalId = json['approval_id'];
    _userId = json['user_id'];
    _status = json['status'];
    _order = json['order'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _assignee = json['assignee'] != null ? Assignee.fromJson(json['assignee']) : null;
  }
  int _id;
  int _index;
  int _approvalId;
  int _userId;
  int _status;
  int _order;
  String _createdAt;
  String _updatedAt;
  User _user;
  Assignee _assignee;

  int get id => _id;
  int get approvalId => _approvalId;
  int get userId => _userId;
  int get status => _status;
  int get order => _order;
  int get index => _index;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  User get user => _user;
  Assignee get assignee => _assignee;


  set index(int value) {
    _index = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['approval_id'] = _approvalId;
    map['user_id'] = _userId;
    map['status'] = _status;
    map['order'] = _order;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user.toJson();
    }
    if (_assignee != null) {
      map['assignee'] = _assignee.toJson();
    }
    return map;
  }

}

/// id : 21
/// name : "Ahmed Zaid"
/// email : "ahmed@ijtimaati.com"
/// updated_at : "2022-05-13T19:48:46.000000Z"
/// role_id : 1
/// phone : "9908798002"
/// birthdate : "2000-08-22"
/// team : 3
/// image : "http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png"
/// status : 1
/// position : "Cyber security"
/// two_auth : "1"
/// verification_code : null
/// signature : "uploads/approvals/NuiXsyKHgP.png"
/// team_name : "Ijtimaati Team"
/// role_name : "Organization Admins"
/// committee : [{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}}]
/// role : {"id":1,"name":"Organization Admins","slug":"Organization Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-02T22:39:27.000000Z","status":"1"}

class Assignee {
  Assignee({
      int id, 
      String name, 
      String prefix="",
      String email,
      String updatedAt, 
      int roleId, 
      String phone, 
      String birthdate, 
      int team, 
      String image, 
      int status, 
      String position, 
      String twoAuth, 
      dynamic verificationCode, 
      String signature, 
      String teamName, 
      String roleName, 
      List<Committee> committee, 
      Role role,}){
    _id = id;
    _name = name;
    _prefix = prefix;
    _email = email;
    _updatedAt = updatedAt;
    _roleId = roleId;
    _phone = phone;
    _birthdate = birthdate;
    _team = team;
    _image = image;
    _status = status;
    _position = position;
    _twoAuth = twoAuth;
    _verificationCode = verificationCode;
    _signature = signature;
    _teamName = teamName;
    _roleName = roleName;
    _committee = committee;
    _role = role;
}

  Assignee.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _updatedAt = json['updated_at'];
    _roleId = json['role_id'];
    _phone = json['phone'];
    _birthdate = json['birthdate'];
    _team = json['team'];
    _image = json['image'];
    _status = json['status'];
    _position = json['position'];
    _twoAuth = json['two_auth'];
    _verificationCode = json['verification_code'];
    _signature = json['signature'];
    _teamName = json['team_name'];
    _roleName = json['role_name'];
    // _prefix = json['prefix']!=null?json['prefix']:"";
    if (json['committee'] != null) {
      _committee = [];
      json['committee'].forEach((v) {
        _committee.add(Committee.fromJson(v));
      });
    }
    _role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }
  int _id;
  String _name;
  String _prefix="";
  String _email;
  String _updatedAt;
  int _roleId;
  String _phone;
  String _birthdate;
  int _team;
  String _image;
  int _status;
  String _position;
  String _twoAuth;
  dynamic _verificationCode;
  String _signature;
  String _teamName;
  String _roleName;
  List<Committee> _committee;
  Role _role;

  int get id => _id;
  String get name => _name;
  String get prefix => _prefix;
  String get email => _email;
  String get updatedAt => _updatedAt;
  int get roleId => _roleId;
  String get phone => _phone;
  String get birthdate => _birthdate;
  int get team => _team;
  String get image => _image;
  int get status => _status;
  String get position => _position;
  String get twoAuth => _twoAuth;
  dynamic get verificationCode => _verificationCode;
  String get signature => _signature;
  String get teamName => _teamName;
  String get roleName => _roleName;
  List<Committee> get committee => _committee;
  Role get role => _role;


  set prefix(String value) {
    _prefix = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['updated_at'] = _updatedAt;
    map['role_id'] = _roleId;
    map['phone'] = _phone;
    map['birthdate'] = _birthdate;
    map['team'] = _team;
    map['image'] = _image;
    map['status'] = _status;
    map['position'] = _position;
    map['two_auth'] = _twoAuth;
    map['verification_code'] = _verificationCode;
    map['signature'] = _signature;
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    // map['prefix'] = _prefix!=null?_prefix:"";
    if (_committee != null) {
      map['committee'] = _committee.map((v) => v.toJson()).toList();
    }
    if (_role != null) {
      map['role'] = _role.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Organization Admins"
/// slug : "Organization Admins"
/// created_at : "2021-09-12T17:52:27.000000Z"
/// updated_at : "2022-01-02T22:39:27.000000Z"
/// status : "1"

class Role {
  Role({
      int id, 
      String name, 
      String slug, 
      String createdAt, 
      String updatedAt, 
      String status,}){
    _id = id;
    _name = name;
    _slug = slug;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _status = status;
}

  Role.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _status = json['status'];
  }
  int _id;
  String _name;
  String _slug;
  String _createdAt;
  String _updatedAt;
  String _status;

  int get id => _id;
  String get name => _name;
  String get slug => _slug;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['status'] = _status;
    return map;
  }

}

/// id : 3
/// name : "Ijtimaati Team"
/// description : "This is Ijtimaati team"
/// created_at : "2021-09-12T20:48:40.000000Z"
/// updated_at : "2022-02-06T18:44:11.000000Z"
/// deleted_at : null
/// status : "1"
/// pivot : {"user_id":21,"committee_id":3}

class Committee {
  Committee({
      int id, 
      String name, 
      String description, 
      String createdAt, 
      String updatedAt, 
      dynamic deletedAt, 
      String status, 
      Pivot pivot,}){
    _id = id;
    _name = name;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _status = status;
    _pivot = pivot;
}

  Committee.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _status = json['status'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  int _id;
  String _name;
  String _description;
  String _createdAt;
  String _updatedAt;
  dynamic _deletedAt;
  String _status;
  Pivot _pivot;

  int get id => _id;
  String get name => _name;
  String get description => _description;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String get status => _status;
  Pivot get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['status'] = _status;
    if (_pivot != null) {
      map['pivot'] = _pivot.toJson();
    }
    return map;
  }

}

/// user_id : 21
/// committee_id : 3

class Pivot {
  Pivot({
      int userId, 
      int committeeId,}){
    _userId = userId;
    _committeeId = committeeId;
}

  Pivot.fromJson(dynamic json) {
    _userId = json['user_id'];
    _committeeId = json['committee_id'];
  }
  int _userId;
  int _committeeId;

  int get userId => _userId;
  int get committeeId => _committeeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['committee_id'] = _committeeId;
    return map;
  }

}

/// id : 21
/// name : "Ahmed Zaid"
/// email : "ahmed@ijtimaati.com"
/// updated_at : "2022-05-13T19:48:46.000000Z"
/// role_id : 1
/// phone : "9908798002"
/// birthdate : "2000-08-22"
/// team : 3
/// image : "http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png"
/// status : 1
/// position : "Cyber security"
/// two_auth : "1"
/// verification_code : null
/// signature : "uploads/approvals/NuiXsyKHgP.png"
/// team_name : "Ijtimaati Team"
/// role_name : "Organization Admins"
/// committee : [{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}}]
/// role : {"id":1,"name":"Organization Admins","slug":"Organization Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-02T22:39:27.000000Z","status":"1"}

class User {
  User({
      int id, 
      String name, 
      String email, 
      String updatedAt, 
      int roleId, 
      String phone, 
      String birthdate, 
      int team, 
      String image, 
      int status, 
      String position, 
      String twoAuth, 
      dynamic verificationCode, 
      String signature, 
      String teamName, 
      String roleName, 
      List<Committee> committee, 
      Role role,}){
    _id = id;
    _name = name;
    _email = email;
    _updatedAt = updatedAt;
    _roleId = roleId;
    _phone = phone;
    _birthdate = birthdate;
    _team = team;
    _image = image;
    _status = status;
    _position = position;
    _twoAuth = twoAuth;
    _verificationCode = verificationCode;
    _signature = signature;
    _teamName = teamName;
    _roleName = roleName;
    _committee = committee;
    _role = role;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _updatedAt = json['updated_at'];
    _roleId = json['role_id'];
    _phone = json['phone'];
    _birthdate = json['birthdate'];
    _team = json['team'];
    _image = json['image'];
    _status = json['status'];
    _position = json['position'];
    _twoAuth = json['two_auth'];
    _verificationCode = json['verification_code'];
    _signature = json['signature'];
    _teamName = json['team_name'];
    _roleName = json['role_name'];
    if (json['committee'] != null) {
      _committee = [];
      json['committee'].forEach((v) {
        _committee.add(Committee.fromJson(v));
      });
    }
    _role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }
  int _id;
  String _name;
  String _email;
  String _updatedAt;
  int _roleId;
  String _phone;
  String _birthdate;
  int _team;
  String _image;
  int _status;
  String _position;
  String _twoAuth;
  dynamic _verificationCode;
  String _signature;
  String _teamName;
  String _roleName;
  List<Committee> _committee;
  Role _role;

  int get id => _id;
  String get name => _name;
  String get email => _email;
  String get updatedAt => _updatedAt;
  int get roleId => _roleId;
  String get phone => _phone;
  String get birthdate => _birthdate;
  int get team => _team;
  String get image => _image;
  int get status => _status;
  String get position => _position;
  String get twoAuth => _twoAuth;
  dynamic get verificationCode => _verificationCode;
  String get signature => _signature;
  String get teamName => _teamName;
  String get roleName => _roleName;
  List<Committee> get committee => _committee;
  Role get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['updated_at'] = _updatedAt;
    map['role_id'] = _roleId;
    map['phone'] = _phone;
    map['birthdate'] = _birthdate;
    map['team'] = _team;
    map['image'] = _image;
    map['status'] = _status;
    map['position'] = _position;
    map['two_auth'] = _twoAuth;
    map['verification_code'] = _verificationCode;
    map['signature'] = _signature;
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    if (_committee != null) {
      map['committee'] = _committee.map((v) => v.toJson()).toList();
    }
    if (_role != null) {
      map['role'] = _role.toJson();
    }
    return map;
  }

}


/// id : 123
/// approval_id : 96
/// library_id : 611
/// created_at : "2022-05-09T08:18:56.000000Z"
/// updated_at : "2022-05-09T08:18:56.000000Z"
/// url : null
/// library : {"id":611,"user_id":21,"library_category_id":null,"name":"incident report.pdf","type":"application/pdf","created_at":"2022-05-07T18:19:27.000000Z","updated_at":"2022-05-07T18:19:27.000000Z","hidden":0,"file_url":"http://test.app.ijtimaati.com/api/public/uploads/library/1651947567100612.pdf","size":"191.59 KB","used_in":{"talkingpoints":[{"id":439,"meeting_id":573,"creator_id":21,"title":"تجربة 2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":611,"meeting":{"id":573,"title":"تجربة رقم2","owner_id":21,"committee_id":3,"description":"تجربة رقم 2","start_date":"2022-05-08 22:10:00","duration":60,"location":"Muscat","meeting_status_id":3,"virtual":0,"order":"TalkingPoints,Decisions,Actions","virtual_type":null,"mom":null,"mom_settings":null,"mom_conclusion":null,"attendance_status":"Pending","last_activity":"Ahmed Zaid Create action إجتماعاتي - حيث 2022-05-08 4:05 PM","current_member":{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":5411,"meeting_id":573,"user_id":null,"user_email":"ahm.z.942@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"e6ea5add31e0dfee35734a678d5bfd30","user":null,"type":"Viewer"},{"id":5382,"meeting_id":573,"user_id":1,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"test@test2.ijtimaati.local","image":"http://test.app.ijtimaati.com/api/public/uploads/images/FaNlH2ba4c.html","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5383,"meeting_id":573,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5384,"meeting_id":573,"user_id":6,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed 22","email":"s5i4enc2k@disbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5385,"meeting_id":573,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"for testing","token":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","position":"Cyber security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5386,"meeting_id":573,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5408,"meeting_id":573,"user_id":32,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.saleh@live.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/MN1EFjZ2SH.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5388,"meeting_id":573,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5389,"meeting_id":573,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5390,"meeting_id":573,"user_id":57,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5391,"meeting_id":573,"user_id":58,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/8zQQmEwkU0.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5392,"meeting_id":573,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/F94kewxlzN.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5393,"meeting_id":573,"user_id":61,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5394,"meeting_id":573,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer","email":"abeer@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/T9jg2Qm6RD.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5395,"meeting_id":573,"user_id":90,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"mahmoud bakr","email":"pluskora90@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5396,"meeting_id":573,"user_id":94,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Admins","email":"yaser2@tmpbox.net","image":"http://test.app.ijtimaati.com/api/public/uploads/images/baCRizZygW.png","position":"test d","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5397,"meeting_id":573,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Regular Users","email":"yaserabusamra@gmail.com","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5398,"meeting_id":573,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"test user","email":"admin@gmail.co","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5399,"meeting_id":573,"user_id":114,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"zainab","email":"zainab@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/bZvlF3caz2.png","position":"sales","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5400,"meeting_id":573,"user_id":120,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed Mizar","email":"ahmedmizar71@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5409,"meeting_id":573,"user_id":125,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Test Orgwerr","email":"ardfdf@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5401,"meeting_id":573,"user_id":126,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"YASER SAMRA","email":"yasersamra@tmpbox.net","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5402,"meeting_id":573,"user_id":127,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"AHMED_D","email":"ahmed_d@tmpbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5403,"meeting_id":573,"user_id":128,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"bf7t3pyjx@moakt.cc","email":"bf7t3pyjx@moakt.cc","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5404,"meeting_id":573,"user_id":129,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"yjvwziyfp@tmail.ws","email":"yjvwziyfp@tmail.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5405,"meeting_id":573,"user_id":130,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"xqy4xqshy@moakt.ws","email":"xqy4xqshy@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5406,"meeting_id":573,"user_id":132,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5410,"meeting_id":573,"user_id":135,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"colexyxoce","email":"lohuxyciw@mailinator.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5407,"meeting_id":573,"user_id":136,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed","email":"Ahemd@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"talkingpointsubpoints":[],"decisions":[],"actions":[]},"edited_file":[],"talkingpoints":[{"id":439,"meeting_id":573,"creator_id":21,"title":"تجربة 2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":611,"meeting":{"id":573,"title":"تجربة رقم2","owner_id":21,"committee_id":3,"description":"تجربة رقم 2","start_date":"2022-05-08 22:10:00","duration":60,"location":"Muscat","meeting_status_id":3,"virtual":0,"order":"TalkingPoints,Decisions,Actions","virtual_type":null,"mom":null,"mom_settings":null,"mom_conclusion":null,"attendance_status":"Pending","last_activity":"Ahmed Zaid Create action إجتماعاتي - حيث 2022-05-08 4:05 PM","current_member":{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":5411,"meeting_id":573,"user_id":null,"user_email":"ahm.z.942@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"e6ea5add31e0dfee35734a678d5bfd30","user":null,"type":"Viewer"},{"id":5382,"meeting_id":573,"user_id":1,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"test@test2.ijtimaati.local","image":"http://test.app.ijtimaati.com/api/public/uploads/images/FaNlH2ba4c.html","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5383,"meeting_id":573,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5384,"meeting_id":573,"user_id":6,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed 22","email":"s5i4enc2k@disbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5385,"meeting_id":573,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"for testing","token":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","position":"Cyber security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5386,"meeting_id":573,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5408,"meeting_id":573,"user_id":32,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.saleh@live.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/MN1EFjZ2SH.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5388,"meeting_id":573,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5389,"meeting_id":573,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5390,"meeting_id":573,"user_id":57,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5391,"meeting_id":573,"user_id":58,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/8zQQmEwkU0.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5392,"meeting_id":573,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/F94kewxlzN.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5393,"meeting_id":573,"user_id":61,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5394,"meeting_id":573,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer","email":"abeer@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/T9jg2Qm6RD.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5395,"meeting_id":573,"user_id":90,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"mahmoud bakr","email":"pluskora90@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5396,"meeting_id":573,"user_id":94,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Admins","email":"yaser2@tmpbox.net","image":"http://test.app.ijtimaati.com/api/public/uploads/images/baCRizZygW.png","position":"test d","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5397,"meeting_id":573,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Regular Users","email":"yaserabusamra@gmail.com","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5398,"meeting_id":573,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"test user","email":"admin@gmail.co","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5399,"meeting_id":573,"user_id":114,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"zainab","email":"zainab@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/bZvlF3caz2.png","position":"sales","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5400,"meeting_id":573,"user_id":120,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed Mizar","email":"ahmedmizar71@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5409,"meeting_id":573,"user_id":125,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Test Orgwerr","email":"ardfdf@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5401,"meeting_id":573,"user_id":126,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"YASER SAMRA","email":"yasersamra@tmpbox.net","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5402,"meeting_id":573,"user_id":127,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"AHMED_D","email":"ahmed_d@tmpbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5403,"meeting_id":573,"user_id":128,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"bf7t3pyjx@moakt.cc","email":"bf7t3pyjx@moakt.cc","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5404,"meeting_id":573,"user_id":129,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"yjvwziyfp@tmail.ws","email":"yjvwziyfp@tmail.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5405,"meeting_id":573,"user_id":130,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"xqy4xqshy@moakt.ws","email":"xqy4xqshy@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5406,"meeting_id":573,"user_id":132,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5410,"meeting_id":573,"user_id":135,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"colexyxoce","email":"lohuxyciw@mailinator.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5407,"meeting_id":573,"user_id":136,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed","email":"Ahemd@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"talkingpointsubpoints":[],"decisions":[],"actions":[]}

class Documents {
  Documents({
      int id, 
      int approvalId, 
      int libraryId, 
      String createdAt, 
      String updatedAt, 
      dynamic url, 
      Library library,}){
    _id = id;
    _approvalId = approvalId;
    _libraryId = libraryId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _url = url;
    _library = library;
}

  Documents.fromJson(dynamic json) {
    _id = json['id'];
    _approvalId = json['approval_id'];
    _libraryId = json['library_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _url = json['url'];
    _library = json['library'] != null ? Library.fromJson(json['library']) : null;
  }
  int _id;
  int _approvalId;
  int _libraryId;
  String _createdAt;
  String _updatedAt;
  dynamic _url;
  Library _library;

  int get id => _id;
  int get approvalId => _approvalId;
  int get libraryId => _libraryId;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  dynamic get url => _url;
  Library get library => _library;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['approval_id'] = _approvalId;
    map['library_id'] = _libraryId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['url'] = _url;
    if (_library != null) {
      map['library'] = _library.toJson();
    }
    return map;
  }

}

/// id : 611
/// user_id : 21
/// library_category_id : null
/// name : "incident report.pdf"
/// type : "application/pdf"
/// created_at : "2022-05-07T18:19:27.000000Z"
/// updated_at : "2022-05-07T18:19:27.000000Z"
/// hidden : 0
/// file_url : "http://test.app.ijtimaati.com/api/public/uploads/library/1651947567100612.pdf"
/// size : "191.59 KB"
/// used_in : {"talkingpoints":[{"id":439,"meeting_id":573,"creator_id":21,"title":"تجربة 2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":611,"meeting":{"id":573,"title":"تجربة رقم2","owner_id":21,"committee_id":3,"description":"تجربة رقم 2","start_date":"2022-05-08 22:10:00","duration":60,"location":"Muscat","meeting_status_id":3,"virtual":0,"order":"TalkingPoints,Decisions,Actions","virtual_type":null,"mom":null,"mom_settings":null,"mom_conclusion":null,"attendance_status":"Pending","last_activity":"Ahmed Zaid Create action إجتماعاتي - حيث 2022-05-08 4:05 PM","current_member":{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":5411,"meeting_id":573,"user_id":null,"user_email":"ahm.z.942@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"e6ea5add31e0dfee35734a678d5bfd30","user":null,"type":"Viewer"},{"id":5382,"meeting_id":573,"user_id":1,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"test@test2.ijtimaati.local","image":"http://test.app.ijtimaati.com/api/public/uploads/images/FaNlH2ba4c.html","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5383,"meeting_id":573,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5384,"meeting_id":573,"user_id":6,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed 22","email":"s5i4enc2k@disbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5385,"meeting_id":573,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"for testing","token":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","position":"Cyber security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5386,"meeting_id":573,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5408,"meeting_id":573,"user_id":32,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.saleh@live.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/MN1EFjZ2SH.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5388,"meeting_id":573,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5389,"meeting_id":573,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5390,"meeting_id":573,"user_id":57,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5391,"meeting_id":573,"user_id":58,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/8zQQmEwkU0.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5392,"meeting_id":573,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/F94kewxlzN.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5393,"meeting_id":573,"user_id":61,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5394,"meeting_id":573,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer","email":"abeer@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/T9jg2Qm6RD.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5395,"meeting_id":573,"user_id":90,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"mahmoud bakr","email":"pluskora90@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5396,"meeting_id":573,"user_id":94,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Admins","email":"yaser2@tmpbox.net","image":"http://test.app.ijtimaati.com/api/public/uploads/images/baCRizZygW.png","position":"test d","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5397,"meeting_id":573,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Regular Users","email":"yaserabusamra@gmail.com","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5398,"meeting_id":573,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"test user","email":"admin@gmail.co","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5399,"meeting_id":573,"user_id":114,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"zainab","email":"zainab@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/bZvlF3caz2.png","position":"sales","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5400,"meeting_id":573,"user_id":120,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed Mizar","email":"ahmedmizar71@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5409,"meeting_id":573,"user_id":125,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Test Orgwerr","email":"ardfdf@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5401,"meeting_id":573,"user_id":126,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"YASER SAMRA","email":"yasersamra@tmpbox.net","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5402,"meeting_id":573,"user_id":127,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"AHMED_D","email":"ahmed_d@tmpbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5403,"meeting_id":573,"user_id":128,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"bf7t3pyjx@moakt.cc","email":"bf7t3pyjx@moakt.cc","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5404,"meeting_id":573,"user_id":129,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"yjvwziyfp@tmail.ws","email":"yjvwziyfp@tmail.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5405,"meeting_id":573,"user_id":130,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"xqy4xqshy@moakt.ws","email":"xqy4xqshy@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5406,"meeting_id":573,"user_id":132,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5410,"meeting_id":573,"user_id":135,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"colexyxoce","email":"lohuxyciw@mailinator.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5407,"meeting_id":573,"user_id":136,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed","email":"Ahemd@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}],"talkingpointsubpoints":[],"decisions":[],"actions":[]}
/// edited_file : []
/// talkingpoints : [{"id":439,"meeting_id":573,"creator_id":21,"title":"تجربة 2","duration":0,"description":null,"order":0,"mom_conclusion":null,"mom_active":1,"laravel_through_key":611,"meeting":{"id":573,"title":"تجربة رقم2","owner_id":21,"committee_id":3,"description":"تجربة رقم 2","start_date":"2022-05-08 22:10:00","duration":60,"location":"Muscat","meeting_status_id":3,"virtual":0,"order":"TalkingPoints,Decisions,Actions","virtual_type":null,"mom":null,"mom_settings":null,"mom_conclusion":null,"attendance_status":"Pending","last_activity":"Ahmed Zaid Create action إجتماعاتي - حيث 2022-05-08 4:05 PM","current_member":{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},"members":[{"id":5411,"meeting_id":573,"user_id":null,"user_email":"ahm.z.942@gmail.com","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":"e6ea5add31e0dfee35734a678d5bfd30","user":null,"type":"Viewer"},{"id":5382,"meeting_id":573,"user_id":1,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"test@test2.ijtimaati.local","image":"http://test.app.ijtimaati.com/api/public/uploads/images/FaNlH2ba4c.html","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5383,"meeting_id":573,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5384,"meeting_id":573,"user_id":6,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed 22","email":"s5i4enc2k@disbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5385,"meeting_id":573,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Not going","status_reason":"for testing","token":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/U6bqYEIb0o.png","position":"Cyber security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5386,"meeting_id":573,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5408,"meeting_id":573,"user_id":32,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.saleh@live.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/MN1EFjZ2SH.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5387,"meeting_id":573,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5388,"meeting_id":573,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5389,"meeting_id":573,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5390,"meeting_id":573,"user_id":57,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Salah Al Ghailani","email":"salah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5391,"meeting_id":573,"user_id":58,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ibrahim","email":"ibrahim@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/8zQQmEwkU0.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5392,"meeting_id":573,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/F94kewxlzN.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5393,"meeting_id":573,"user_id":61,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Al Reem","email":"alreem@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5394,"meeting_id":573,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer","email":"abeer@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/T9jg2Qm6RD.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5395,"meeting_id":573,"user_id":90,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"mahmoud bakr","email":"pluskora90@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5396,"meeting_id":573,"user_id":94,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Admins","email":"yaser2@tmpbox.net","image":"http://test.app.ijtimaati.com/api/public/uploads/images/baCRizZygW.png","position":"test d","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5397,"meeting_id":573,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Yaser Regular Users","email":"yaserabusamra@gmail.com","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5398,"meeting_id":573,"user_id":108,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"test user","email":"admin@gmail.co","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5399,"meeting_id":573,"user_id":114,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"zainab","email":"zainab@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/bZvlF3caz2.png","position":"sales","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5400,"meeting_id":573,"user_id":120,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed Mizar","email":"ahmedmizar71@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5409,"meeting_id":573,"user_id":125,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Test Orgwerr","email":"ardfdf@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5401,"meeting_id":573,"user_id":126,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"YASER SAMRA","email":"yasersamra@tmpbox.net","image":null,"position":"DEV","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5402,"meeting_id":573,"user_id":127,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"AHMED_D","email":"ahmed_d@tmpbox.net","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5403,"meeting_id":573,"user_id":128,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"bf7t3pyjx@moakt.cc","email":"bf7t3pyjx@moakt.cc","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5404,"meeting_id":573,"user_id":129,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"yjvwziyfp@tmail.ws","email":"yjvwziyfp@tmail.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5405,"meeting_id":573,"user_id":130,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"xqy4xqshy@moakt.ws","email":"xqy4xqshy@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5406,"meeting_id":573,"user_id":132,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5410,"meeting_id":573,"user_id":135,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"colexyxoce","email":"lohuxyciw@mailinator.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5407,"meeting_id":573,"user_id":136,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed","email":"Ahemd@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]}}]
/// talkingpointsubpoints : []
/// decisions : []
/// actions : []

class Library {
  Library({
      int id, 
      int userId, 
      dynamic libraryCategoryId, 
      String name, 
      String type, 
      String createdAt, 
      String updatedAt, 
      int hidden, 
      String fileUrl, 
      String size, 
      // UsedIn usedIn,
      List<dynamic> editedFile, 
      List<Talkingpoints> talkingpoints, 
      List<dynamic> talkingpointsubpoints, 
      List<dynamic> decisions, 
      List<dynamic> actions,}){
    _id = id;
    _userId = userId;
    _libraryCategoryId = libraryCategoryId;
    _name = name;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _hidden = hidden;
    _fileUrl = fileUrl;
    _size = size;
    // _usedIn = usedIn;
    _editedFile = editedFile;
    _talkingpoints = talkingpoints;
    _talkingpointsubpoints = talkingpointsubpoints;
    _decisions = decisions;
    _actions = actions;
}

  Library.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _libraryCategoryId = json['library_category_id'];
    _name = json['name'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _hidden = json['hidden'];
    _fileUrl = json['file_url'];
    _size = json['size'];
    // _usedIn = json['used_in'] != null ? UsedIn.fromJson(json['usedIn']) : null;
    if (json['edited_file'] != null) {
      _editedFile = [];
      json['edited_file'].forEach((v) {
        // _editedFile.add(Dynamic.fromJson(v));
      });
    }
    if (json['talkingpoints'] != null) {
      _talkingpoints = [];
      json['talkingpoints'].forEach((v) {
        _talkingpoints.add(Talkingpoints.fromJson(v));
      });
    }
    if (json['talkingpointsubpoints'] != null) {
      _talkingpointsubpoints = [];
      json['talkingpointsubpoints'].forEach((v) {
        // _talkingpointsubpoints.add(Dynamic.fromJson(v));
      });
    }
    if (json['decisions'] != null) {
      _decisions = [];
      json['decisions'].forEach((v) {
        // _decisions.add(Dynamic.fromJson(v));
      });
    }
    if (json['actions'] != null) {
      _actions = [];
      json['actions'].forEach((v) {
        // _actions.add(Dynamic.fromJson(v));
      });
    }
  }
  int _id;
  int _userId;
  dynamic _libraryCategoryId;
  String _name;
  String _type;
  String _createdAt;
  String _updatedAt;
  int _hidden;
  String _fileUrl;
  String _size;
  // UsedIn _usedIn;
  List<dynamic> _editedFile;
  List<Talkingpoints> _talkingpoints;
  List<dynamic> _talkingpointsubpoints;
  List<dynamic> _decisions;
  List<dynamic> _actions;

  int get id => _id;
  int get userId => _userId;
  dynamic get libraryCategoryId => _libraryCategoryId;
  String get name => _name;
  String get type => _type;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get hidden => _hidden;
  String get fileUrl => _fileUrl;
  String get size => _size;
  // UsedIn get usedIn => _usedIn;
  List<dynamic> get editedFile => _editedFile;
  List<Talkingpoints> get talkingpoints => _talkingpoints;
  List<dynamic> get talkingpointsubpoints => _talkingpointsubpoints;
  List<dynamic> get decisions => _decisions;
  List<dynamic> get actions => _actions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['library_category_id'] = _libraryCategoryId;
    map['name'] = _name;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['hidden'] = _hidden;
    map['file_url'] = _fileUrl;
    map['size'] = _size;
    // if (_usedIn != null) {
    //   map['used_in'] = _usedIn.toJson();
    // }
    if (_editedFile != null) {
      map['edited_file'] = _editedFile.map((v) => v.toJson()).toList();
    }
    if (_talkingpoints != null) {
      map['talkingpoints'] = _talkingpoints.map((v) => v.toJson()).toList();
    }
    if (_talkingpointsubpoints != null) {
      map['talkingpointsubpoints'] = _talkingpointsubpoints.map((v) => v.toJson()).toList();
    }
    if (_decisions != null) {
      map['decisions'] = _decisions.map((v) => v.toJson()).toList();
    }
    if (_actions != null) {
      map['actions'] = _actions.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Talkingpoints {
  Talkingpoints({
      int id, 
      int meetingId, 
      int creatorId, 
      String title, 
      int duration, 
      dynamic description, 
      int order, 
      dynamic momConclusion, 
      int momActive, 
      int laravelThroughKey, 
      Meeting meeting,}){
    _id = id;
    _meetingId = meetingId;
    _creatorId = creatorId;
    _title = title;
    _duration = duration;
    _description = description;
    _order = order;
    _momConclusion = momConclusion;
    _momActive = momActive;
    _laravelThroughKey = laravelThroughKey;
    _meeting = meeting;
}

  Talkingpoints.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _creatorId = json['creator_id'];
    _title = json['title'];
    _duration = json['duration'];
    _description = json['description'];
    _order = json['order'];
    _momConclusion = json['mom_conclusion'];
    _momActive = json['mom_active'];
    _laravelThroughKey = json['laravel_through_key'];
    _meeting = json['meeting'] != null ? Meeting.fromJson(json['meeting']) : null;
  }
  int _id;
  int _meetingId;
  int _creatorId;
  String _title;
  int _duration;
  dynamic _description;
  int _order;
  dynamic _momConclusion;
  int _momActive;
  int _laravelThroughKey;
  Meeting _meeting;

  int get id => _id;
  int get meetingId => _meetingId;
  int get creatorId => _creatorId;
  String get title => _title;
  int get duration => _duration;
  dynamic get description => _description;
  int get order => _order;
  dynamic get momConclusion => _momConclusion;
  int get momActive => _momActive;
  int get laravelThroughKey => _laravelThroughKey;
  Meeting get meeting => _meeting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['creator_id'] = _creatorId;
    map['title'] = _title;
    map['duration'] = _duration;
    map['description'] = _description;
    map['order'] = _order;
    map['mom_conclusion'] = _momConclusion;
    map['mom_active'] = _momActive;
    map['laravel_through_key'] = _laravelThroughKey;
    if (_meeting != null) {
      map['meeting'] = _meeting.toJson();
    }
    return map;
  }

}


class Meeting {
  Meeting({
      int id, 
      String title, 
      int ownerId, 
      int committeeId, 
      String description, 
      String startDate, 
      int duration, 
      String location, 
      int meetingStatusId, 
      int virtual, 
      String order, 
      dynamic virtualType, 
      dynamic mom, 
      dynamic momSettings, 
      dynamic momConclusion, 
      String attendanceStatus, 
      String lastActivity, 
      CurrentMember currentMember, 
      List<Members> members,}){
    _id = id;
    _title = title;
    _ownerId = ownerId;
    _committeeId = committeeId;
    _description = description;
    _startDate = startDate;
    _duration = duration;
    _location = location;
    _meetingStatusId = meetingStatusId;
    _virtual = virtual;
    _order = order;
    _virtualType = virtualType;
    _mom = mom;
    _momSettings = momSettings;
    _momConclusion = momConclusion;
    _attendanceStatus = attendanceStatus;
    _lastActivity = lastActivity;
    _currentMember = currentMember;
    _members = members;
}

  Meeting.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _ownerId = json['owner_id'];
    _committeeId = json['committee_id'];
    _description = json['description'];
    _startDate = json['start_date'];
    _duration = json['duration'];
    _location = json['location'];
    _meetingStatusId = json['meeting_status_id'];
    _virtual = json['virtual'];
    _order = json['order'];
    _virtualType = json['virtual_type'];
    _mom = json['mom'];
    _momSettings = json['mom_settings'];
    _momConclusion = json['mom_conclusion'];
    _attendanceStatus = json['attendance_status'];
    _lastActivity = json['last_activity'];
    _currentMember = json['current_member'] != null ? CurrentMember.fromJson(json['current_member']) : null;
    if (json['members'] != null) {
      _members = [];
      json['members'].forEach((v) {
        _members.add(Members.fromJson(v));
      });
    }
  }
  int _id;
  String _title;
  int _ownerId;
  int _committeeId;
  String _description;
  String _startDate;
  int _duration;
  String _location;
  int _meetingStatusId;
  int _virtual;
  String _order;
  dynamic _virtualType;
  dynamic _mom;
  dynamic _momSettings;
  dynamic _momConclusion;
  String _attendanceStatus;
  String _lastActivity;
  CurrentMember _currentMember;
  List<Members> _members;

  int get id => _id;
  String get title => _title;
  int get ownerId => _ownerId;
  int get committeeId => _committeeId;
  String get description => _description;
  String get startDate => _startDate;
  int get duration => _duration;
  String get location => _location;
  int get meetingStatusId => _meetingStatusId;
  int get virtual => _virtual;
  String get order => _order;
  dynamic get virtualType => _virtualType;
  dynamic get mom => _mom;
  dynamic get momSettings => _momSettings;
  dynamic get momConclusion => _momConclusion;
  String get attendanceStatus => _attendanceStatus;
  String get lastActivity => _lastActivity;
  CurrentMember get currentMember => _currentMember;
  List<Members> get members => _members;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['owner_id'] = _ownerId;
    map['committee_id'] = _committeeId;
    map['description'] = _description;
    map['start_date'] = _startDate;
    map['duration'] = _duration;
    map['location'] = _location;
    map['meeting_status_id'] = _meetingStatusId;
    map['virtual'] = _virtual;
    map['order'] = _order;
    map['virtual_type'] = _virtualType;
    map['mom'] = _mom;
    map['mom_settings'] = _momSettings;
    map['mom_conclusion'] = _momConclusion;
    map['attendance_status'] = _attendanceStatus;
    map['last_activity'] = _lastActivity;
    if (_currentMember != null) {
      map['current_member'] = _currentMember.toJson();
    }
    if (_members != null) {
      map['members'] = _members.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 5411
/// meeting_id : 573
/// user_id : null
/// user_email : "ahm.z.942@gmail.com"
/// can_edit : 0
/// attendance_status : "Pending"
/// status_reason : null
/// token : "e6ea5add31e0dfee35734a678d5bfd30"
/// user : null
/// type : "Viewer"

class Members {
  Members({
      int id, 
      int meetingId, 
      dynamic userId, 
      String userEmail, 
      int canEdit, 
      String attendanceStatus, 
      dynamic statusReason, 
      String token, 
      dynamic user, 
      String type,}){
    _id = id;
    _meetingId = meetingId;
    _userId = userId;
    _userEmail = userEmail;
    _canEdit = canEdit;
    _attendanceStatus = attendanceStatus;
    _statusReason = statusReason;
    _token = token;
    _user = user;
    _type = type;
}

  Members.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _canEdit = json['can_edit'];
    _attendanceStatus = json['attendance_status'];
    _statusReason = json['status_reason'];
    _token = json['token'];
    _user = json['user'];
    _type = json['type'];
  }
  int _id;
  int _meetingId;
  dynamic _userId;
  String _userEmail;
  int _canEdit;
  String _attendanceStatus;
  dynamic _statusReason;
  String _token;
  dynamic _user;
  String _type;

  int get id => _id;
  int get meetingId => _meetingId;
  dynamic get userId => _userId;
  String get userEmail => _userEmail;
  int get canEdit => _canEdit;
  String get attendanceStatus => _attendanceStatus;
  dynamic get statusReason => _statusReason;
  String get token => _token;
  dynamic get user => _user;
  String get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['can_edit'] = _canEdit;
    map['attendance_status'] = _attendanceStatus;
    map['status_reason'] = _statusReason;
    map['token'] = _token;
    map['user'] = _user;
    map['type'] = _type;
    return map;
  }

}

/// id : 5387
/// meeting_id : 573
/// user_id : 35
/// user_email : ""
/// can_edit : 0
/// attendance_status : "Pending"
/// status_reason : null
/// token : null
/// user : {"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null}
/// type : "Viewer"

class CurrentMember {
  CurrentMember({
      int id, 
      int meetingId, 
      int userId, 
      String userEmail, 
      int canEdit, 
      String attendanceStatus, 
      dynamic statusReason, 
      dynamic token, 
      User user, 
      String type,}){
    _id = id;
    _meetingId = meetingId;
    _userId = userId;
    _userEmail = userEmail;
    _canEdit = canEdit;
    _attendanceStatus = attendanceStatus;
    _statusReason = statusReason;
    _token = token;
    _user = user;
    _type = type;
}

  CurrentMember.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _canEdit = json['can_edit'];
    _attendanceStatus = json['attendance_status'];
    _statusReason = json['status_reason'];
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _type = json['type'];
  }
  int _id;
  int _meetingId;
  int _userId;
  String _userEmail;
  int _canEdit;
  String _attendanceStatus;
  dynamic _statusReason;
  dynamic _token;
  User _user;
  String _type;

  int get id => _id;
  int get meetingId => _meetingId;
  int get userId => _userId;
  String get userEmail => _userEmail;
  int get canEdit => _canEdit;
  String get attendanceStatus => _attendanceStatus;
  dynamic get statusReason => _statusReason;
  dynamic get token => _token;
  User get user => _user;
  String get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['can_edit'] = _canEdit;
    map['attendance_status'] = _attendanceStatus;
    map['status_reason'] = _statusReason;
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user.toJson();
    }
    map['type'] = _type;
    return map;
  }

}



class Sender {
  Sender({
      int id, 
      String name, 
      String email, 
      String updatedAt, 
      int roleId, 
      String phone, 
      String birthdate, 
      int team, 
      String image, 
      int status, 
      String position, 
      String twoAuth, 
      dynamic verificationCode, 
      String signature, 
      String teamName, 
      String roleName, 
      List<Committee> committee, 
      Role role,}){
    _id = id;
    _name = name;
    _email = email;
    _updatedAt = updatedAt;
    _roleId = roleId;
    _phone = phone;
    _birthdate = birthdate;
    _team = team;
    _image = image;
    _status = status;
    _position = position;
    _twoAuth = twoAuth;
    _verificationCode = verificationCode;
    _signature = signature;
    _teamName = teamName;
    _roleName = roleName;
    _committee = committee;
    _role = role;
}

  Sender.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _updatedAt = json['updated_at'];
    _roleId = json['role_id'];
    _phone = json['phone'];
    _birthdate = json['birthdate'];
    _team = json['team'];
    _image = json['image'];
    _status = json['status'];
    _position = json['position'];
    _twoAuth = json['two_auth'];
    _verificationCode = json['verification_code'];
    _signature = json['signature'];
    _teamName = json['team_name'];
    _roleName = json['role_name'];
    if (json['committee'] != null) {
      _committee = [];
      json['committee'].forEach((v) {
        _committee.add(Committee.fromJson(v));
      });
    }
    _role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }
  int _id;
  String _name;
  String _email;
  String _updatedAt;
  int _roleId;
  String _phone;
  String _birthdate;
  int _team;
  String _image;
  int _status;
  String _position;
  String _twoAuth;
  dynamic _verificationCode;
  String _signature;
  String _teamName;
  String _roleName;
  List<Committee> _committee;
  Role _role;

  int get id => _id;
  String get name => _name;
  String get email => _email;
  String get updatedAt => _updatedAt;
  int get roleId => _roleId;
  String get phone => _phone;
  String get birthdate => _birthdate;
  int get team => _team;
  String get image => _image;
  int get status => _status;
  String get position => _position;
  String get twoAuth => _twoAuth;
  dynamic get verificationCode => _verificationCode;
  String get signature => _signature;
  String get teamName => _teamName;
  String get roleName => _roleName;
  List<Committee> get committee => _committee;
  Role get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['updated_at'] = _updatedAt;
    map['role_id'] = _roleId;
    map['phone'] = _phone;
    map['birthdate'] = _birthdate;
    map['team'] = _team;
    map['image'] = _image;
    map['status'] = _status;
    map['position'] = _position;
    map['two_auth'] = _twoAuth;
    map['verification_code'] = _verificationCode;
    map['signature'] = _signature;
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    if (_committee != null) {
      map['committee'] = _committee.map((v) => v.toJson()).toList();
    }
    if (_role != null) {
      map['role'] = _role.toJson();
    }
    return map;
  }

}
