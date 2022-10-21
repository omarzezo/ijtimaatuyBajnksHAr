import 'package:flutter/material.dart';

class MeetingDetailsResponseModel {


  MeetingDetailsResponseModel({
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
    String virtualType,
    dynamic mom,
    dynamic momSettings,
    dynamic momConclusion,
    String attendanceStatus,
    String lastActivity,
    CurrentMember currentMember,
    Status status,
    List<Admins> admins,
    Owner owner,
    List<Agendas> agendas,
    Committee committee,
    List<MeetingDetailsResponseModelMembers> members,
    List<MeetingDetailsResponseModelActivities> activities,
    List<dynamic> zoom,
    List<Ijmeet> ijmeet,

    Note note,}){
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
    _status = status;
    _admins = admins;
    _owner = owner;
    _agendas = agendas;
    _committee = committee;
    _members = members;
    _activities = activities;
    _zoom = zoom;
    _ijmeet = ijmeet;
    _note = note;
  }

  MeetingDetailsResponseModel.fromJson(dynamic json) {
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
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    if (json['admins'] != null) {
      _admins = [];
      json['admins'].forEach((v) {
        _admins.add(Admins.fromJson(v));
      });
    }
    _owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    if (json['agendas'] != null) {
      _agendas = [];
      json['agendas'].forEach((v) {
        _agendas.add(Agendas.fromJson(v));
      });
    }
    _committee = json['committee'] != null ? Committee.fromJson(json['committee']) : null;
    if (json['members'] != null) {
      _members = [];
      json['members'].forEach((v) {
        _members.add(MeetingDetailsResponseModelMembers.fromJson(v));
      });
    }
    if (json['activities'] != null) {
      _activities = [];
      json['activities'].forEach((v) {
        _activities.add(MeetingDetailsResponseModelActivities.fromJson(v));
      });
    }
    if (json['zoom'] != null) {
      _zoom = [];
      json['zoom'].forEach((v) {
        // _zoom.add(Dynamic.fromJson(v));
      });
    }
    if (json['ijmeet'] != null) {
      _ijmeet = [];
      json['ijmeet'].forEach((v) {
        _ijmeet.add(Ijmeet.fromJson(v));
      });
    }
    _note = json['note'] != null ? Note.fromJson(json['note']) : null;
    // _note = json['note'];
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
  String _virtualType;
  dynamic _mom;
  dynamic _momSettings;
  dynamic _momConclusion;
  String _attendanceStatus;
  String _lastActivity;
  CurrentMember _currentMember;
  Status _status;
  List<Admins> _admins;
  Owner _owner;
  List<Agendas> _agendas;
  Committee _committee;
  List<MeetingDetailsResponseModelMembers> _members;
  List<MeetingDetailsResponseModelActivities> _activities;
  List<dynamic> _zoom;
  List<Ijmeet> _ijmeet;
  Note _note;

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
  String get virtualType => _virtualType;
  dynamic get mom => _mom;
  dynamic get momSettings => _momSettings;
  dynamic get momConclusion => _momConclusion;
  String get attendanceStatus => _attendanceStatus;
  String get lastActivity => _lastActivity;
  CurrentMember get currentMember => _currentMember;
  Status get status => _status;
  List<Admins> get admins => _admins;
  Owner get owner => _owner;
  List<Agendas> get agendas => _agendas;
  Committee get committee => _committee;
  List<MeetingDetailsResponseModelMembers> get members => _members;
  List<MeetingDetailsResponseModelActivities> get activities => _activities;
  List<dynamic> get zoom => _zoom;
  List<Ijmeet> get ijmeet => _ijmeet;
  Note get note => _note;


  set attendanceStatus(String value) {
    _attendanceStatus = value;
  }

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
    if (_status != null) {
      map['status'] = _status.toJson();
    }
    if (_admins != null) {
      map['admins'] = _admins.map((v) => v.toJson()).toList();
    }
    if (_owner != null) {
      map['owner'] = _owner.toJson();
    }
    if (_agendas != null) {
      map['agendas'] = _agendas.map((v) => v.toJson()).toList();
    }
    if (_committee != null) {
      map['committee'] = _committee.toJson();
    }
    if (_members != null) {
      map['members'] = _members.map((v) => v.toJson()).toList();
    }
    if (_activities != null) {
      map['activities'] = _activities.map((v) => v.toJson()).toList();
    }
    if (_zoom != null) {
      map['zoom'] = _zoom.map((v) => v.toJson()).toList();
    }
    if (_ijmeet != null) {
      map['ijmeet'] = _ijmeet.map((v) => v.toJson()).toList();
    }
    // map['note'] = _note;

    if (_note != null) {
      map['note'] = _note.toJson();
    }

    return map;
  }

}

/// id : 99
/// meeting_id : 561
/// ijmeet_id : "6af9d4a"
/// online_data : {"meeting_id":"9459831650655585"}

class Status {
  int _id;
  String _name;
  String _bgcolor;
  String _color;

  int get id => _id;
  String get name => _name;
  String get bgcolor => _bgcolor;
  String get color => _color;


  set name(String value) {
    _name = value;
  }

  Status({
    int id,
    String name,
    String bgcolor,
    String color}){
    _id = id;
    _name = name;
    _bgcolor = bgcolor;
    _color = color;
  }

  Status.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _bgcolor = json['bgcolor'];
    _color = json['color'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['bgcolor'] = _bgcolor;
    map['color'] = _color;
    return map;
  }

}


class Ijmeet {
  Ijmeet({
    int id,
    int meetingId,
    String ijmeetId,
    OnlineData onlineData,}){
    _id = id;
    _meetingId = meetingId;
    _ijmeetId = ijmeetId;
    _onlineData = onlineData;
  }

  Ijmeet.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _ijmeetId = json['ijmeet_id'];
    _onlineData = json['online_data'] != null ? OnlineData.fromJson(json['online_data']) : null;
  }
  int _id;
  int _meetingId;
  String _ijmeetId;
  OnlineData _onlineData;

  int get id => _id;
  int get meetingId => _meetingId;
  String get ijmeetId => _ijmeetId;
  OnlineData get onlineData => _onlineData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['ijmeet_id'] = _ijmeetId;
    if (_onlineData != null) {
      map['online_data'] = _onlineData.toJson();
    }
    return map;
  }

}

/// meeting_id : "9459831650655585"

class OnlineData {
  OnlineData({
    String meetingId,}){
    _meetingId = meetingId;
  }

  OnlineData.fromJson(dynamic json) {
    _meetingId = json['meeting_id'];
  }
  String _meetingId;

  String get meetingId => _meetingId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meeting_id'] = _meetingId;
    return map;
  }

}

/// id : 5453
/// meeting_id : 561
/// user_id : 21
/// activity : "Create this meeting"
/// created_at : "2022-04-22 11:26 PM"
/// user : {"id":21,"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","updated_at":"2022-04-23T10:58:37.000000Z","role_id":1,"phone":"9908798002","birthdate":"2000-08-22","team":3,"image":"http://test.app.ijtimaati.com/api/public/uploads/images/1uxcRezT2Y.jpg","status":1,"position":"Cyber","two_auth":"1","verification_code":null,"signature":"uploads/approvals/pVg2LDRKKq.png","team_name":"Ijtimaati Team","role_name":"Organization Admins","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}}],"role":{"id":1,"name":"Organization Admins","slug":"Organization Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-02T22:39:27.000000Z","status":"1"}}

class MeetingDetailsResponseModelActivities {
  MeetingDetailsResponseModelActivities({
    int id,
    int meetingId,
    int userId,
    String activity,
    String createdAt,
    User user,}){
    _id = id;
    _meetingId = meetingId;
    _userId = userId;
    _activity = activity;
    _createdAt = createdAt;
    _user = user;
  }

  MeetingDetailsResponseModelActivities.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _userId = json['user_id'];
    _activity = json['activity'];
    _createdAt = json['created_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int _id;
  int _meetingId;
  int _userId;
  String _activity;
  String _createdAt;
  User _user;

  int get id => _id;
  int get meetingId => _meetingId;
  int get userId => _userId;
  String get activity => _activity;
  String get createdAt => _createdAt;
  User get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['user_id'] = _userId;
    map['activity'] = _activity;
    map['created_at'] = _createdAt;
    if (_user != null) {
      map['user'] = _user.toJson();
    }
    return map;
  }

}

/// id : 21
/// name : "Ahmed Zaid"
/// email : "ahmed@ijtimaati.com"
/// updated_at : "2022-04-23T10:58:37.000000Z"
/// role_id : 1
/// phone : "9908798002"
/// birthdate : "2000-08-22"
/// team : 3
/// image : "http://test.app.ijtimaati.com/api/public/uploads/images/1uxcRezT2Y.jpg"
/// status : 1
/// position : "Cyber"
/// two_auth : "1"
/// verification_code : null
/// signature : "uploads/approvals/pVg2LDRKKq.png"
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

/// id : 5159
/// meeting_id : 561
/// user_id : null
/// user_email : "yaserabusamra@gmail.com"
/// can_edit : 0
/// attendance_status : "Pending"
/// status_reason : null
/// token : "90970e60b649ad45aff94d487708d911"
/// user : null
/// type : "Viewer"

class MeetingDetailsResponseModelMembers {
  MeetingDetailsResponseModelMembers({
    int id,
    int meetingId,
    dynamic userId,
    String userEmail,
    String color,
    int canEdit,
    String attendanceStatus,
    dynamic statusReason,
    String token,
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
    _color = color;
    _user = user;
    _type = type;
  }

  MeetingDetailsResponseModelMembers.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _canEdit = json['can_edit'];
    _attendanceStatus = json['attendance_status'];
    _statusReason = json['status_reason'];
    _token = json['token'];
    // _user = json['user']!=null?json['user']:[];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _type = json['type'];
    _color = json['color'];
  }
  int _id;
  int _meetingId;
  dynamic _userId;
  String _userEmail;
  int _canEdit;
  String _attendanceStatus;
  dynamic _statusReason;
  String _token;
  User _user;
  String _type;
  String _color;

  int get id => _id;
  int get meetingId => _meetingId;
  dynamic get userId => _userId;
  String get userEmail => _userEmail;
  int get canEdit => _canEdit;
  String get attendanceStatus => _attendanceStatus;
  dynamic get statusReason => _statusReason;
  String get token => _token;
  User get user => _user;
  String get type => _type;


  String get color => _color;

  set setColor(String value) {
    _color = value;
  }

  set attendanceStatus(String value) {
    _attendanceStatus = value;
  }

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
    map['color'] = _color;
    return map;
  }

}

class Agendas {
  Agendas({
    int id,
    int meetingId,
    String agendaType,
    int agendaTypeId,
    int order,
    String createdAt,
    String updatedAt,
    List<AgendasData> data,}){
    _id = id;
    _meetingId = meetingId;
    _agendaType = agendaType;
    _agendaTypeId = agendaTypeId;
    _order = order;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _data = data;
  }

  Agendas.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _agendaType = json['agenda_type'];
    _agendaTypeId = json['agenda_type_id'];
    _order = json['order'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(AgendasData.fromJson(v));
      });
    }
  }
  int _id;
  int _meetingId;
  String _agendaType;
  int _agendaTypeId;
  int _order;
  String _createdAt;
  String _updatedAt;
  List<AgendasData> _data;

  int get id => _id;
  int get meetingId => _meetingId;
  String get agendaType => _agendaType;
  int get agendaTypeId => _agendaTypeId;
  int get order => _order;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  List<AgendasData> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['agenda_type'] = _agendaType;
    map['agenda_type_id'] = _agendaTypeId;
    map['order'] = _order;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_data != null) {
      map['data'] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class MeetingDetailsResponseModelSubpoints {
  int _id;
  int _meetingTalkingPointId;
  int _userId;
  dynamic _userEmail;
  String _title;
  int _duration;
  String _description;
  User _user;
  List<MeetingDetailsResponseModelMembersAttachments> _attachments;
  List<MeetingDetailsResponseModelDecisions> _decision;
  List<MeetingDetailsResponseModelActions> _action;


  int get id => _id;
  int get meetingTalkingPointId => _meetingTalkingPointId;
  int get userId => _userId;
  dynamic get userEmail => _userEmail;
  String get title => _title;
  int get duration => _duration;
  String get description => _description;
  User get user => _user;
  List<MeetingDetailsResponseModelMembersAttachments> get attachments => _attachments;
  List<MeetingDetailsResponseModelDecisions> get decision => _decision;
  List<MeetingDetailsResponseModelActions> get action => _action;

  MeetingDetailsResponseModelSubpoints({
    int id,
    int meetingTalkingPointId,
    int userId,
    dynamic userEmail,
    String title,
    int duration,
    String description,
    User user,
    List<MeetingDetailsResponseModelMembersAttachments> attachments,
    List<MeetingDetailsResponseModelDecisions> decision,
    List<MeetingDetailsResponseModelActions> action,
  }){
    _id = id;
    _meetingTalkingPointId = meetingTalkingPointId;
    _userId = userId;
    _userEmail = userEmail;
    _title = title;
    _duration = duration;
    _description = description;
    _attachments = attachments;
    _decision = decision;
    _action = action;
    _user = user;
  }

  MeetingDetailsResponseModelSubpoints.fromJson(dynamic json) {
    print("mmmmmmmmm>>"+json['user'].toString());
    _id = json['id'];
    _meetingTalkingPointId = json['meeting_talking_point_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _title = json['title'];
    _duration = json['duration'];
    _description = json['description'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments.add(MeetingDetailsResponseModelMembersAttachments.fromJson(v));
      });
    }
    if (json['decision'] != null) {
      _decision = [];
      json['decision'].forEach((v) {
        _decision.add(MeetingDetailsResponseModelDecisions.fromJson(v));
      });
    }    if (json['action'] != null) {
      _action = [];
      json['action'].forEach((v) {
        _action.add(MeetingDetailsResponseModelActions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_talking_point_id'] = _meetingTalkingPointId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['title'] = _title;
    map['duration'] = _duration;
    map['description'] = _description;
    map['user'] = _user;
    if (_attachments != null) {
      map['attachments'] = _attachments.map((v) => v.toJson()).toList();
    }
    if (_decision != null) {
      map['decision'] = _decision.map((v) => v.toJson()).toList();
    }
    if (_action != null) {
      map['action'] = _action.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AgendasData {
  AgendasData({
    int id,
    int meetingId,
    int creatorId,
    String title,
    int duration,
    int index,
    String stauss,
    String open_till,
    String deadline,
    String actionStauss,
    String description,
    int order,
    dynamic momConclusion,
    int momActive,
    List<MeetingDetailsResponseModelSubpoints> subpoints,
    List<Presenters> presenters,
    List<MeetingDetailsResponseModelDecisions> decision,
    List<Voters> voters,
    List<MeetingDetailsResponseModelActions> action,
    List<Viewers> viewers,
    List<Participants> participants,
    List<MeetingDetailsResponseModelMembersAttachments> attachments,
    List<Comments> comments,}){
    _id = id;
    _meetingId = meetingId;
    _creatorId = creatorId;
    _title = title;
    _duration = duration;
    _description = description;
    _order = order;
    _index = index;
    _stauss = stauss;
    _open_till = open_till;
    _deadline = deadline;
    _actionStauss = actionStauss;
    _momConclusion = momConclusion;
    _momActive = momActive;
    _subpoints = subpoints;
    _presenters = presenters;
    _decision = decision;
    _action = action;
    _voters = voters;
    _viewers = viewers;
    _attachments = attachments;
    _comments = comments;
    _participants = participants;
  }

  AgendasData.fromJson(dynamic json) {
    _id = json['id'];
    _index = json['index'];
    _stauss = json['stauss'];
    _actionStauss = json['actionStauss'];
    _meetingId = json['meeting_id'];
    _creatorId = json['creator_id'];
    _title = json['title'];
    _duration = json['duration'];
    _description = json['description'];
    _order = json['order'];
    _momConclusion = json['mom_conclusion'];
    _momActive = json['mom_active'];
    _open_till = json['open_till'];
    _deadline = json['deadline'];
    if (json['subpoints'] != null) {
      _subpoints = [];
      json['subpoints'].forEach((v) {
        _subpoints.add(MeetingDetailsResponseModelSubpoints.fromJson(v));
      });
    }
    if (json['participants'] != null) {
      _participants = [];
      json['participants'].forEach((v) {
        _participants.add(Participants.fromJson(v));
      });
    }
    if (json['presenters'] != null) {
      _presenters = [];
      json['presenters'].forEach((v) {
        _presenters.add(Presenters.fromJson(v));
      });
    }
    if (json['decision'] != null) {
      _decision = [];
      json['decision'].forEach((v) {
        _decision.add(MeetingDetailsResponseModelDecisions.fromJson(v));
      });
    }
    if (json['action'] != null) {
      _action = [];
      json['action'].forEach((v) {
        _action.add(MeetingDetailsResponseModelActions.fromJson(v));
      });
    }
    if (json['viewers'] != null) {
      _viewers = [];
      json['viewers'].forEach((v) {
        _viewers.add(Viewers.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments.add(MeetingDetailsResponseModelMembersAttachments.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments.add(Comments.fromJson(v));
      });
    }
    if (json['voters'] != null) {
      _voters = [];
      json['voters'].forEach((v) {
        _voters.add(Voters.fromJson(v));
      });
    }
  }
  int _id;
  int _meetingId;
  int _creatorId;
  String _title;
  int _duration;
  String _description;
  int _order;
  dynamic _momConclusion;
  int _momActive;
  String _stauss;
  String _open_till;
  String _deadline;
  String _actionStauss;
  int _index;
  List<MeetingDetailsResponseModelSubpoints> _subpoints;
  List<Participants> _participants;
  List<Presenters> _presenters;
  List<MeetingDetailsResponseModelDecisions> _decision;
  List<MeetingDetailsResponseModelActions> _action;
  List<Viewers> _viewers;
  List<MeetingDetailsResponseModelMembersAttachments> _attachments;
  List<Comments> _comments;
  List<Voters> _voters;

    set setStauss(String value) {
    _stauss = value;
  }
  set actionStauss(String value) {
    _actionStauss = value;
  }


  set setIndex(int value) {
    _index = value;
  }

  int get index =>  _index;
  String get stauss =>  _stauss;
  String get actionStauss =>  _actionStauss;


  // set setStauss(String value) {
  //   _stauss = value;
  // }

  String get deadline => _deadline;

  set deadline(String value) {
    _deadline = value;
  }

  set title(String value) {
    _title = value;
  }

  int get id => _id;
  int get meetingId => _meetingId;
  int get creatorId => _creatorId;
  String get title => _title;
  int get duration => _duration;
  String get description => _description;
  int get order => _order;

  String get open_till => _open_till;

  dynamic get momConclusion => _momConclusion;
  int get momActive => _momActive;
  List<MeetingDetailsResponseModelSubpoints> get subpoints => _subpoints;
  List<Presenters> get presenters => _presenters;
  List<MeetingDetailsResponseModelDecisions> get decision => _decision;
  List<MeetingDetailsResponseModelActions> get action => _action;
  List<Viewers> get viewers => _viewers;
  List<MeetingDetailsResponseModelMembersAttachments> get attachments => _attachments;
  List<Comments> get comments => _comments;
  List<Participants> get participants => _participants;
  List<Voters> get voters => _voters;


  set decision(List<MeetingDetailsResponseModelDecisions> value) {
    _decision = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['index'] = _index;
    map['stauss'] = _stauss;
    map['actionStauss'] = _actionStauss;
    map['meeting_id'] = _meetingId;
    map['creator_id'] = _creatorId;
    map['title'] = _title;
    map['duration'] = _duration;
    map['description'] = _description;
    map['order'] = _order;
    map['mom_conclusion'] = _momConclusion;
    map['mom_active'] = _momActive;
    map['open_till'] = _open_till;
    map['deadline'] = _deadline;
    if (_subpoints != null) {
      map['subpoints'] = _subpoints.map((v) => v.toJson()).toList();
    }
    if (_presenters != null) {
      map['presenters'] = _presenters.map((v) => v.toJson()).toList();
    }
    if (_decision != null) {
      map['decision'] = _decision.map((v) => v.toJson()).toList();
    }
    if (_action != null) {
      map['action'] = _action.map((v) => v.toJson()).toList();
    }
    if (_viewers != null) {
      map['viewers'] = _viewers.map((v) => v.toJson()).toList();
    }
    if (_attachments != null) {
      map['attachments'] = _attachments.map((v) => v.toJson()).toList();
    }
    if (_comments != null) {
      map['comments'] = _comments.map((v) => v.toJson()).toList();
    }
    if (_participants != null) {
      map['participants'] = _participants.map((v) => v.toJson()).toList();
    }

    if (_voters != null) {
      map['voters'] = _voters.map((v) => v.toJson()).toList();
    }
    return map;
  }

  set action(List<MeetingDetailsResponseModelActions> value) {
    _action = value;
  }
}

class Comments {
  int _id;
  String _commentableId;
  String _commentableType;
  String _commentedId;
  String _commentedType;
  String _comment;
  bool _approved;
  dynamic _rate;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  String get commentableId => _commentableId;
  String get commentableType => _commentableType;
  String get commentedId => _commentedId;
  String get commentedType => _commentedType;
  String get comment => _comment;
  bool get approved => _approved;
  dynamic get rate => _rate;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Comments({
    int id,
    String commentableId,
    String commentableType,
    String commentedId,
    String commentedType,
    String comment,
    bool approved,
    dynamic rate,
    String createdAt,
    String updatedAt}){
    _id = id;
    _commentableId = commentableId;
    _commentableType = commentableType;
    _commentedId = commentedId;
    _commentedType = commentedType;
    _comment = comment;
    _approved = approved;
    _rate = rate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _commentableId = json['commentable_id'];
    _commentableType = json['commentable_type'];
    _commentedId = json['commented_id'];
    _commentedType = json['commented_type'];
    _comment = json['comment'];
    _approved = json['approved'];
    _rate = json['rate'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['commentable_id'] = _commentableId;
    map['commentable_type'] = _commentableType;
    map['commented_id'] = _commentedId;
    map['commented_type'] = _commentedType;
    map['comment'] = _comment;
    map['approved'] = _approved;
    map['rate'] = _rate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class MeetingDetailsResponseModelMembersAttachments {
  Attachments({
    int id,
    int meetingTalkingPointId,
    int userId,
    dynamic userEmail,
    dynamic fileName,
    dynamic filePath,
    int libraryId,
    User user,
    dynamic url,
    Library library,}){
    _id = id;
    _meetingTalkingPointId = meetingTalkingPointId;
    _userId = userId;
    _userEmail = userEmail;
    _fileName = fileName;
    _filePath = filePath;
    _libraryId = libraryId;
    _user = user;
    _url = url;
    _library = library;
  }


  MeetingDetailsResponseModelMembersAttachments.fromJson(dynamic json) {
    _id = json['id'];
    _meetingTalkingPointId = json['meeting_talking_point_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _fileName = json['file_name'];
    _filePath = json['file_path'];
    _libraryId = json['library_id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _url = json['url'];
    _library = json['library'] != null ? Library.fromJson(json['library']) : null;
  }
  int _id;
  int _meetingTalkingPointId;
  int _userId;
  dynamic _userEmail;
  dynamic _fileName;
  dynamic _filePath;
  int _libraryId;
  User _user;
  dynamic _url;
  Library _library;

  int get id => _id;
  int get meetingTalkingPointId => _meetingTalkingPointId;
  int get userId => _userId;
  dynamic get userEmail => _userEmail;
  dynamic get fileName => _fileName;
  dynamic get filePath => _filePath;
  int get libraryId => _libraryId;
  User get user => _user;
  dynamic get url => _url;
  Library get library => _library;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_talking_point_id'] = _meetingTalkingPointId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['file_name'] = _fileName;
    map['file_path'] = _filePath;
    map['library_id'] = _libraryId;
    if (_user != null) {
      map['user'] = _user.toJson();
    }
    map['url'] = _url;
    if (_library != null) {
      map['library'] = _library.toJson();
    }
    return map;
  }

}


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
    UsedIn usedIn,
    List<dynamic> editedFile,
    List<Talkingpoints> talkingpoints,
    List<Decisions> decisions,
    List<Actions> actions,}){
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
    _usedIn = usedIn;
    _editedFile = editedFile;
    _talkingpoints = talkingpoints;
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
    _usedIn = json['used_in'] != null ? UsedIn.fromJson(json['used_in']) : null;
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
    if (json['decisions'] != null) {
      _decisions = [];
      json['decisions'].forEach((v) {
        _decisions.add(Decisions.fromJson(v));
      });
    }
    if (json['actions'] != null) {
      _actions = [];
      json['actions'].forEach((v) {
        _actions.add(Actions.fromJson(v));
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
  UsedIn _usedIn;
  List<dynamic> _editedFile;
  List<Talkingpoints> _talkingpoints;
  List<Decisions> _decisions;
  List<Actions> _actions;

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
  UsedIn get usedIn => _usedIn;
  List<dynamic> get editedFile => _editedFile;
  List<Talkingpoints> get talkingpoints => _talkingpoints;
  List<Decisions> get decisions => _decisions;
  List<Actions> get actions => _actions;

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
    if (_usedIn != null) {
      map['used_in'] = _usedIn.toJson();
    }
    if (_editedFile != null) {
      map['edited_file'] = _editedFile.map((v) => v.toJson()).toList();
    }
    if (_talkingpoints != null) {
      map['talkingpoints'] = _talkingpoints.map((v) => v.toJson()).toList();
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

class Actions {
  Actions({
    int id,
    int meetingId,
    int creatorId,
    String title,
    String openTill,
    String priority,
    String description,
    int order,
    dynamic momConclusion,
    int momActive,
    dynamic talkingpointId,
    dynamic talkingpointSubpointId,
    int laravelThroughKey,
    Meeting meeting,}){
    _id = id;
    _meetingId = meetingId;
    _creatorId = creatorId;
    _title = title;
    _openTill = openTill;
    _priority = priority;
    _description = description;
    _order = order;
    _momConclusion = momConclusion;
    _momActive = momActive;
    _talkingpointId = talkingpointId;
    _talkingpointSubpointId = talkingpointSubpointId;
    _laravelThroughKey = laravelThroughKey;
    _meeting = meeting;
  }

  Actions.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _creatorId = json['creator_id'];
    _title = json['title'];
    _openTill = json['open_till'];
    _priority = json['priority'];
    _description = json['description'];
    _order = json['order'];
    _momConclusion = json['mom_conclusion'];
    _momActive = json['mom_active'];
    _talkingpointId = json['talkingpoint_id'];
    _talkingpointSubpointId = json['talkingpoint_subpoint_id'];
    _laravelThroughKey = json['laravel_through_key'];
    _meeting = json['meeting'] != null ? Meeting.fromJson(json['meeting']) : null;
  }
  int _id;
  int _meetingId;
  int _creatorId;
  String _title;
  String _openTill;
  String _priority;
  String _description;
  int _order;
  dynamic _momConclusion;
  int _momActive;
  dynamic _talkingpointId;
  dynamic _talkingpointSubpointId;
  int _laravelThroughKey;
  Meeting _meeting;

  int get id => _id;
  int get meetingId => _meetingId;
  int get creatorId => _creatorId;
  String get title => _title;
  String get openTill => _openTill;
  String get priority => _priority;
  String get description => _description;
  int get order => _order;
  dynamic get momConclusion => _momConclusion;
  int get momActive => _momActive;
  dynamic get talkingpointId => _talkingpointId;
  dynamic get talkingpointSubpointId => _talkingpointSubpointId;
  int get laravelThroughKey => _laravelThroughKey;
  Meeting get meeting => _meeting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['creator_id'] = _creatorId;
    map['title'] = _title;
    map['open_till'] = _openTill;
    map['priority'] = _priority;
    map['description'] = _description;
    map['order'] = _order;
    map['mom_conclusion'] = _momConclusion;
    map['mom_active'] = _momActive;
    map['talkingpoint_id'] = _talkingpointId;
    map['talkingpoint_subpoint_id'] = _talkingpointSubpointId;
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
    String virtualType,
    dynamic mom,
    dynamic momSettings,
    dynamic momConclusion,
    String attendanceStatus,
    String lastActivity,
    CurrentMember currentMember,
    List<MeetingDetailsResponseModelMembers> members,}){
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
        _members.add(MeetingDetailsResponseModelMembers.fromJson(v));
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
  String _virtualType;
  dynamic _mom;
  dynamic _momSettings;
  dynamic _momConclusion;
  String _attendanceStatus;
  String _lastActivity;
  CurrentMember _currentMember;
  List<MeetingDetailsResponseModelMembers> _members;

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
  String get virtualType => _virtualType;
  dynamic get mom => _mom;
  dynamic get momSettings => _momSettings;
  dynamic get momConclusion => _momConclusion;
  String get attendanceStatus => _attendanceStatus;
  String get lastActivity => _lastActivity;
  CurrentMember get currentMember => _currentMember;
  List<MeetingDetailsResponseModelMembers> get members => _members;

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


  set attendanceStatus(String value) {
    _attendanceStatus = value;
  }

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



class Decisions {
  Decisions({
    int id,
    int meetingId,
    int creatorId,
    String title,
    String deadline,
    String description,
    String createdAt,
    int order,
    dynamic talkingpointId,
    dynamic momConclusion,
    int momActive,
    dynamic talkingpointSubpointId,
    int laravelThroughKey,
    Meeting meeting,}){
    _id = id;
    _meetingId = meetingId;
    _creatorId = creatorId;
    _title = title;
    _deadline = deadline;
    _description = description;
    _createdAt = createdAt;
    _order = order;
    _talkingpointId = talkingpointId;
    _momConclusion = momConclusion;
    _momActive = momActive;
    _talkingpointSubpointId = talkingpointSubpointId;
    _laravelThroughKey = laravelThroughKey;
    _meeting = meeting;
  }

  Decisions.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _creatorId = json['creator_id'];
    _title = json['title'];
    _deadline = json['deadline'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _order = json['order'];
    _talkingpointId = json['talkingpoint_id'];
    _momConclusion = json['mom_conclusion'];
    _momActive = json['mom_active'];
    _talkingpointSubpointId = json['talkingpoint_subpoint_id'];
    _laravelThroughKey = json['laravel_through_key'];
    _meeting = json['meeting'] != null ? Meeting.fromJson(json['meeting']) : null;
  }
  int _id;
  int _meetingId;
  int _creatorId;
  String _title;
  String _deadline;
  String _description;
  String _createdAt;
  int _order;
  dynamic _talkingpointId;
  dynamic _momConclusion;
  int _momActive;
  dynamic _talkingpointSubpointId;
  int _laravelThroughKey;
  Meeting _meeting;

  int get id => _id;
  int get meetingId => _meetingId;
  int get creatorId => _creatorId;
  String get title => _title;
  String get deadline => _deadline;
  String get description => _description;
  String get createdAt => _createdAt;
  int get order => _order;
  dynamic get talkingpointId => _talkingpointId;
  dynamic get momConclusion => _momConclusion;
  int get momActive => _momActive;
  dynamic get talkingpointSubpointId => _talkingpointSubpointId;
  int get laravelThroughKey => _laravelThroughKey;
  Meeting get meeting => _meeting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['creator_id'] = _creatorId;
    map['title'] = _title;
    map['deadline'] = _deadline;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['order'] = _order;
    map['talkingpoint_id'] = _talkingpointId;
    map['mom_conclusion'] = _momConclusion;
    map['mom_active'] = _momActive;
    map['talkingpoint_subpoint_id'] = _talkingpointSubpointId;
    map['laravel_through_key'] = _laravelThroughKey;
    if (_meeting != null) {
      map['meeting'] = _meeting.toJson();
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
    String description,
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
  String _description;
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
  String get description => _description;
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



class UsedIn {
  UsedIn({
    List<Talkingpoints> talkingpoints,
    List<Decisions> decisions,
    List<Actions> actions,}){
    _talkingpoints = talkingpoints;
    _decisions = decisions;
    _actions = actions;
  }

  UsedIn.fromJson(dynamic json) {
    try {

    if (json['talkingpoints'] != null) {
      _talkingpoints = [];
      json['talkingpoints'].forEach((v) {
        _talkingpoints.add(Talkingpoints.fromJson(v));
      });
    }
      }catch(e){}
    if (json['decisions'] != null) {
      _decisions = [];
      json['decisions'].forEach((v) {
        _decisions.add(Decisions.fromJson(v));
      });
    }
    if (json['actions'] != null) {
      _actions = [];
      json['actions'].forEach((v) {
        _actions.add(Actions.fromJson(v));
      });
    }
  }
  List<Talkingpoints> _talkingpoints;
  List<Decisions> _decisions;
  List<Actions> _actions;

  List<Talkingpoints> get talkingpoints => _talkingpoints;
  List<Decisions> get decisions => _decisions;
  List<Actions> get actions => _actions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_talkingpoints != null) {
      map['talkingpoints'] = _talkingpoints.map((v) => v.toJson()).toList();
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


/// id : 9992
/// meeting_talking_point_id : 422
/// user_id : null
/// user_email : "yaserabusamra@gmail.com"
/// user : null

class Viewers {
  Viewers({
    int id,
    int meetingTalkingPointId,
    dynamic userId,
    String userEmail,
    User user,}){
    _id = id;
    _meetingTalkingPointId = meetingTalkingPointId;
    _userId = userId;
    _userEmail = userEmail;
    _user = user;
  }

  Viewers.fromJson(dynamic json) {
    _id = json['id'];
    _meetingTalkingPointId = json['meeting_talking_point_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    // _user = json['user'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int _id;
  int _meetingTalkingPointId;
  dynamic _userId;
  String _userEmail;
  User _user;

  int get id => _id;
  int get meetingTalkingPointId => _meetingTalkingPointId;
  dynamic get userId => _userId;
  String get userEmail => _userEmail;
  User get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_talking_point_id'] = _meetingTalkingPointId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['user'] = _user;
    return map;
  }

}

/// id : 229
/// meeting_id : 561
/// creator_id : 21
/// title : "Placerat accumsan metus."
/// open_till : "2022-04-29 23:34:28"
/// priority : "Normal"
/// description : "Praesent et felis in purus ultricies laoreet. Aliquam enim lorem, fermentum a lectus ut, placerat accumsan metus. Quisque nec metus ex. Duis convallis ultrices efficitur. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce eleifend mattis nisl, ultrices congue orci varius et."
/// order : 0
/// mom_conclusion : null
/// mom_active : 1
/// talkingpoint_id : 422
/// talkingpoint_subpoint_id : null
/// participants : [{"id":1427,"meeting_action_id":229,"user_id":null,"user_email":"yaserabusamra@gmail.com","status":"In Progress","user":null},{"id":1428,"meeting_action_id":229,"user_id":21,"user_email":null,"status":"In Progress","user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/1uxcRezT2Y.jpg","team_name":"","role_name":"","committee":[],"role":null}},{"id":1429,"meeting_action_id":229,"user_id":35,"user_email":null,"status":"In Progress","user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","team_name":"","role_name":"","committee":[],"role":null}},{"id":1430,"meeting_action_id":229,"user_id":59,"user_email":null,"status":"In Progress","user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/F94kewxlzN.png","team_name":"","role_name":"","committee":[],"role":null}},{"id":1431,"meeting_action_id":229,"user_id":94,"user_email":null,"status":"In Progress","user":{"name":"Yaser Admins","email":"yaser2@tmpbox.net","image":"http://test.app.ijtimaati.com/api/public/uploads/images/baCRizZygW.png","team_name":"","role_name":"","committee":[],"role":null}},{"id":1432,"meeting_action_id":229,"user_id":114,"user_email":null,"status":"In Progress","user":{"name":"zainab","email":"zainab@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/bZvlF3caz2.png","team_name":"","role_name":"","committee":[],"role":null}},{"id":1433,"meeting_action_id":229,"user_id":121,"user_email":null,"status":"In Progress","user":{"name":"a4ppizelu@moakt.co","email":"a4ppizelu@moakt.co","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":1434,"meeting_action_id":229,"user_id":125,"user_email":null,"status":"In Progress","user":{"name":"Test Orgwerr","email":"ardfdf@gmail.com","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":1435,"meeting_action_id":229,"user_id":126,"user_email":null,"status":"In Progress","user":{"name":"YASER SAMRA","email":"yasersamra@tmpbox.net","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":1436,"meeting_action_id":229,"user_id":128,"user_email":null,"status":"In Progress","user":{"name":"bf7t3pyjx@moakt.cc","email":"bf7t3pyjx@moakt.cc","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":1437,"meeting_action_id":229,"user_id":129,"user_email":null,"status":"In Progress","user":{"name":"yjvwziyfp@tmail.ws","email":"yjvwziyfp@tmail.ws","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":1438,"meeting_action_id":229,"user_id":130,"user_email":null,"status":"In Progress","user":{"name":"xqy4xqshy@moakt.ws","email":"xqy4xqshy@moakt.ws","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":1439,"meeting_action_id":229,"user_id":132,"user_email":null,"status":"In Progress","user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":1440,"meeting_action_id":229,"user_id":136,"user_email":null,"status":"In Progress","user":{"name":"Ahmed","email":"Ahemd@ijtimaati.com","image":null,"team_name":"","role_name":"","committee":[],"role":null}}]
/// attachments : []
/// comments : []

class MeetingDetailsResponseModelActions {
  MeetingDetailsResponseModelActions({
    int id,
    int meetingId,
    int creatorId,
    String title,
    String openTill,
    String status,
    String colorStatus,
    String priority,
    String description,
    int order,
    dynamic momConclusion,
    int momActive,
    int talkingpointId,
    dynamic talkingpointSubpointId,
    List<Participants> participants,
    List<MeetingDetailsResponseModelMembersAttachments> attachments,
    List<Comments> comments,}){
    _id = id;
    _meetingId = meetingId;
    _creatorId = creatorId;
    _title = title;
    _openTill = openTill;
    _status = status;
    _priority = priority;
    _colorStatus = colorStatus;
    _description = description;
    _order = order;
    _momConclusion = momConclusion;
    _momActive = momActive;
    _talkingpointId = talkingpointId;
    _talkingpointSubpointId = talkingpointSubpointId;
    _participants = participants;
    _attachments = attachments;
    _comments = comments;
  }

  MeetingDetailsResponseModelActions.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _creatorId = json['creator_id'];
    _title = json['title'];
    _openTill = json['open_till'];
    _priority = json['priority'];
    _description = json['description'];
    _order = json['order'];
    _colorStatus = json['colorStatus'];
    _momConclusion = json['mom_conclusion'];
    _momActive = json['mom_active'];
    _talkingpointId = json['talkingpoint_id'];
    _status = json['status'];
    _talkingpointSubpointId = json['talkingpoint_subpoint_id'];
    if (json['participants'] != null) {
      _participants = [];
      json['participants'].forEach((v) {
        _participants.add(Participants.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments.add(MeetingDetailsResponseModelMembersAttachments.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments.add(Comments.fromJson(v));
      });
    }
  }
  int _id;
  int _meetingId;
  int _creatorId;
  String _title;
  String _openTill;
  String _priority;
  String _description;
  String _status;
  String _colorStatus;
  int _order;
  dynamic _momConclusion;
  int _momActive;
  int _talkingpointId;
  dynamic _talkingpointSubpointId;
  List<Participants> _participants;
  List<MeetingDetailsResponseModelMembersAttachments> _attachments;
  List<Comments> _comments;

  int get id => _id;
  int get meetingId => _meetingId;
  int get creatorId => _creatorId;
  String get title => _title;
  String get openTill => _openTill;
  String get priority => _priority;
  String get description => _description;
  String get getStatus => _status;
  String get getColor => _colorStatus;
  int get order => _order;
  dynamic get momConclusion => _momConclusion;
  int get momActive => _momActive;
  int get talkingpointId => _talkingpointId;
  dynamic get talkingpointSubpointId => _talkingpointSubpointId;
  List<Participants> get participants => _participants;
  List<MeetingDetailsResponseModelMembersAttachments> get attachments => _attachments;
  List<Comments> get comments => _comments;


  set setStatus(String value) {
    _status = value;
  }
  set setColor(String value) {
    _colorStatus = value;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['creator_id'] = _creatorId;
    map['title'] = _title;
    map['open_till'] = _openTill;
    map['priority'] = _priority;
    map['description'] = _description;
    map['order'] = _order;
    map['status'] = _status;
    map['colorStatus'] = _colorStatus;
    map['mom_conclusion'] = _momConclusion;
    map['mom_active'] = _momActive;
    map['talkingpoint_id'] = _talkingpointId;
    map['talkingpoint_subpoint_id'] = _talkingpointSubpointId;
    if (_participants != null) {
      map['participants'] = _participants.map((v) => v.toJson()).toList();
    }
    if (_attachments != null) {
      map['attachments'] = _attachments.map((v) => v.toJson()).toList();
    }
    if (_comments != null) {
      map['comments'] = _comments.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1427
/// meeting_action_id : 229
/// user_id : null
/// user_email : "yaserabusamra@gmail.com"
/// status : "In Progress"
/// user : null

class Participants {
  Participants({
    int id,
    int meetingActionId,
    dynamic userId,
    String userEmail,
    String status,
    User user,}){
    _id = id;
    _meetingActionId = meetingActionId;
    _userId = userId;
    _userEmail = userEmail;
    _status = status;
    _user = user;
  }

  Participants.fromJson(dynamic json) {
    _id = json['id'];
    _meetingActionId = json['meeting_action_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _status = json['status'];
    // _user = json['user'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int _id;
  int _meetingActionId;
  dynamic _userId;
  String _userEmail;
  String _status;
  User _user;

  int get id => _id;
  int get meetingActionId => _meetingActionId;
  dynamic get userId => _userId;
  String get userEmail => _userEmail;
  String get status => _status;

  User get user => _user;


  set status(String value) {
    _status = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_action_id'] = _meetingActionId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['status'] = _status;
    map['user'] = _user;
    return map;
  }

}

/// id : 412
/// meeting_id : 561
/// creator_id : 21
/// title : "Maecenas eleifend semper ligula."
/// deadline : "2022-04-27 23:24:38"
/// description : "Curabitur ullamcorper, orci at dictum gravida, nibh nulla rutrum enim, eu fermentum diam purus ut odio. Nam efficitur, purus feugiat rhoncus vehicula, erat purus sagittis quam, sed lobortis neque ante et justo."
/// created_at : "2022-04-22T21:25:12.000000Z"
/// order : 0
/// talkingpoint_id : 422
/// mom_conclusion : null
/// mom_active : 1
/// talkingpoint_subpoint_id : null
/// voters : [{"id":2671,"meeting_decision_id":412,"user_id":null,"user_email":"yaserabusamra@gmail.com","vote":"Pending","reason":null,"user":null},{"id":2672,"meeting_decision_id":412,"user_id":21,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/1uxcRezT2Y.jpg","team_name":"","role_name":"","committee":[],"role":null}},{"id":2673,"meeting_decision_id":412,"user_id":35,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"Mazin","email":"mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/dZsgwPPzGx.jpeg","team_name":"","role_name":"","committee":[],"role":null}},{"id":2674,"meeting_decision_id":412,"user_id":59,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/F94kewxlzN.png","team_name":"","role_name":"","committee":[],"role":null}},{"id":2675,"meeting_decision_id":412,"user_id":94,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"Yaser Admins","email":"yaser2@tmpbox.net","image":"http://test.app.ijtimaati.com/api/public/uploads/images/baCRizZygW.png","team_name":"","role_name":"","committee":[],"role":null}},{"id":2676,"meeting_decision_id":412,"user_id":114,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"zainab","email":"zainab@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/bZvlF3caz2.png","team_name":"","role_name":"","committee":[],"role":null}},{"id":2677,"meeting_decision_id":412,"user_id":121,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"a4ppizelu@moakt.co","email":"a4ppizelu@moakt.co","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":2678,"meeting_decision_id":412,"user_id":125,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"Test Orgwerr","email":"ardfdf@gmail.com","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":2679,"meeting_decision_id":412,"user_id":126,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"YASER SAMRA","email":"yasersamra@tmpbox.net","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":2680,"meeting_decision_id":412,"user_id":128,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"bf7t3pyjx@moakt.cc","email":"bf7t3pyjx@moakt.cc","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":2681,"meeting_decision_id":412,"user_id":129,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"yjvwziyfp@tmail.ws","email":"yjvwziyfp@tmail.ws","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":2682,"meeting_decision_id":412,"user_id":130,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"xqy4xqshy@moakt.ws","email":"xqy4xqshy@moakt.ws","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":2683,"meeting_decision_id":412,"user_id":132,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"amani","email":"amani@ijtimaati.com","image":null,"team_name":"","role_name":"","committee":[],"role":null}},{"id":2684,"meeting_decision_id":412,"user_id":136,"user_email":null,"vote":"Pending","reason":null,"user":{"name":"Ahmed","email":"Ahemd@ijtimaati.com","image":null,"team_name":"","role_name":"","committee":[],"role":null}}]
/// attachments : []
/// comments : []

class MeetingDetailsResponseModelDecisions {
  MeetingDetailsResponseModelDecisions({
    int id,
    int meetingId,
    int creatorId,
    String title,
    String status,
    String deadline,
    String description,
    String createdAt,
    int order,
    int talkingpointId,
    dynamic momConclusion,
    int momActive,
    dynamic talkingpointSubpointId,
    List<Voters> voters,
    List<MeetingDetailsResponseModelMembersAttachments> attachments,
    List<Comments> comments,}){
    _id = id;
    _meetingId = meetingId;
    _creatorId = creatorId;
    _title = title;
    _status = status;
    _deadline = deadline;
    _description = description;
    _createdAt = createdAt;
    _order = order;
    _talkingpointId = talkingpointId;
    _momConclusion = momConclusion;
    _momActive = momActive;
    _talkingpointSubpointId = talkingpointSubpointId;
    _voters = voters;
    _attachments = attachments;
    _comments = comments;
  }

  MeetingDetailsResponseModelDecisions.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _creatorId = json['creator_id'];
    _title = json['title'];
    _status = json['status'];
    _deadline = json['deadline'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _order = json['order'];
    _talkingpointId = json['talkingpoint_id'];
    _momConclusion = json['mom_conclusion'];
    _momActive = json['mom_active'];
    _talkingpointSubpointId = json['talkingpoint_subpoint_id'];
    if (json['voters'] != null) {
      _voters = [];
      json['voters'].forEach((v) {
        _voters.add(Voters.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments.add(MeetingDetailsResponseModelMembersAttachments.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments.add(Comments.fromJson(v));
      });
    }
  }
  int _id;
  int _meetingId;
  int _creatorId;
  String _title;
  String _status;
  String _deadline;
  String _description;
  String _createdAt;
  int _order;
  int _talkingpointId;
  dynamic _momConclusion;
  int _momActive;
  dynamic _talkingpointSubpointId;
  List<Voters> _voters;
  List<MeetingDetailsResponseModelMembersAttachments> _attachments;
  List<Comments> _comments;

  int get id => _id;
  int get meetingId => _meetingId;
  int get creatorId => _creatorId;
  String get title => _title;
  String get status => _status;

  set status(String value) {
    _status = value;
  }

  String get deadline => _deadline;
  String get description => _description;
  String get createdAt => _createdAt;
  int get order => _order;
  int get talkingpointId => _talkingpointId;
  dynamic get momConclusion => _momConclusion;
  int get momActive => _momActive;
  dynamic get talkingpointSubpointId => _talkingpointSubpointId;
  List<Voters> get voters => _voters;
  List<MeetingDetailsResponseModelMembersAttachments> get attachments => _attachments;
  List<Comments> get comments => _comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['creator_id'] = _creatorId;
    map['title'] = _title;
    map['status'] = _status;
    map['deadline'] = _deadline;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['order'] = _order;
    map['talkingpoint_id'] = _talkingpointId;
    map['mom_conclusion'] = _momConclusion;
    map['mom_active'] = _momActive;
    map['talkingpoint_subpoint_id'] = _talkingpointSubpointId;
    if (_voters != null) {
      map['voters'] = _voters.map((v) => v.toJson()).toList();
    }
    if (_attachments != null) {
      map['attachments'] = _attachments.map((v) => v.toJson()).toList();
    }
    if (_comments != null) {
      map['comments'] = _comments.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2671
/// meeting_decision_id : 412
/// user_id : null
/// user_email : "yaserabusamra@gmail.com"
/// vote : "Pending"
/// reason : null
/// user : null

class Voters {
  Voters({
    int id,
    int meetingDecisionId,
    dynamic userId,
    String userEmail,
    String vote,
    dynamic reason,
    User user,}){
    _id = id;
    _meetingDecisionId = meetingDecisionId;
    _userId = userId;
    _userEmail = userEmail;
    _vote = vote;
    _reason = reason;
    _user = user;
  }

  Voters.fromJson(dynamic json) {
    _id = json['id'];
    _meetingDecisionId = json['meeting_decision_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _vote = json['vote'];
    _reason = json['reason'];
    // _user = json['user'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int _id;
  int _meetingDecisionId;
  dynamic _userId;
  String _userEmail;
  String _vote;
  dynamic _reason;
  User _user;

  int get id => _id;
  int get meetingDecisionId => _meetingDecisionId;
  dynamic get userId => _userId;
  String get userEmail => _userEmail;
  String get vote => _vote;
  dynamic get reason => _reason;
  User get user => _user;


  set vote(String value) {
    _vote = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_decision_id'] = _meetingDecisionId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['vote'] = _vote;
    map['reason'] = _reason;
    map['user'] = _user;
    return map;
  }

}

/// id : 1452
/// meeting_talking_point_id : 422
/// user_id : 21
/// user_email : null
/// user : {"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/1uxcRezT2Y.jpg","team_name":"","role_name":"","committee":[],"role":null}

class Presenters {
  Presenters({
    int id,
    int meetingTalkingPointId,
    int userId,
    dynamic userEmail,
    User user,}){
    _id = id;
    _meetingTalkingPointId = meetingTalkingPointId;
    _userId = userId;
    _userEmail = userEmail;
    _user = user;
  }

  Presenters.fromJson(dynamic json) {
    _id = json['id'];
    _meetingTalkingPointId = json['meeting_talking_point_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int _id;
  int _meetingTalkingPointId;
  int _userId;
  dynamic _userEmail;
  User _user;

  int get id => _id;
  int get meetingTalkingPointId => _meetingTalkingPointId;
  int get userId => _userId;
  dynamic get userEmail => _userEmail;
  User get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_talking_point_id'] = _meetingTalkingPointId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    if (_user != null) {
      map['user'] = _user.toJson();
    }
    return map;
  }

}




/// id : 21
/// name : "Ahmed Zaid"
/// email : "ahmed@ijtimaati.com"
/// updated_at : "2022-04-23T10:58:37.000000Z"
/// role_id : 1
/// phone : "9908798002"
/// birthdate : "2000-08-22"
/// team : 3
/// image : "http://test.app.ijtimaati.com/api/public/uploads/images/1uxcRezT2Y.jpg"
/// status : 1
/// position : "Cyber"
/// two_auth : "1"
/// verification_code : null
/// signature : "uploads/approvals/pVg2LDRKKq.png"
/// team_name : "Ijtimaati Team"
/// role_name : "Organization Admins"
/// committee : [{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}}]
/// role : {"id":1,"name":"Organization Admins","slug":"Organization Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-01-02T22:39:27.000000Z","status":"1"}

class Owner {
  Owner({
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

  Owner.fromJson(dynamic json) {
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

/// id : 21
/// name : "Ahmed Zaid"
/// email : "ahmed@ijtimaati.com"
/// image : "http://test.app.ijtimaati.com/api/public/uploads/images/1uxcRezT2Y.jpg"
/// team_name : "Ijtimaati Team"
/// role_name : ""
/// pivot : {"committee_id":8,"user_id":21}
/// committee : [{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2022-02-06T18:44:11.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}}]
/// role : null

class Admins {
  Admins({
    int id,
    String name,
    String email,
    String image,
    String teamName,
    String roleName,
    Pivot pivot,
    List<Committee> committee,
    dynamic role,}){
    _id = id;
    _name = name;
    _email = email;
    _image = image;
    _teamName = teamName;
    _roleName = roleName;
    _pivot = pivot;
    _committee = committee;
    _role = role;
  }

  Admins.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _image = json['image'];
    _teamName = json['team_name'];
    _roleName = json['role_name'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    if (json['committee'] != null) {
      _committee = [];
      json['committee'].forEach((v) {
        _committee.add(Committee.fromJson(v));
      });
    }
    _role = json['role'];
  }
  int _id;
  String _name;
  String _email;
  String _image;
  String _teamName;
  String _roleName;
  Pivot _pivot;
  List<Committee> _committee;
  dynamic _role;

  int get id => _id;
  String get name => _name;
  String get email => _email;
  String get image => _image;
  String get teamName => _teamName;
  String get roleName => _roleName;
  Pivot get pivot => _pivot;
  List<Committee> get committee => _committee;
  dynamic get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['image'] = _image;
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    if (_pivot != null) {
      map['pivot'] = _pivot.toJson();
    }
    if (_committee != null) {
      map['committee'] = _committee.map((v) => v.toJson()).toList();
    }
    map['role'] = _role;
    return map;
  }

}


class Note {
  int id;
  int meetingId;
  int userId;
  String userEmail;
  String note;
  User user;

  Note({this.id, this.meetingId, this.userId, this.userEmail, this.note, this.user});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    meetingId = json['meeting_id'];
    userId = json['user_id'];
    userEmail = json['user_email'];
    note = json['note'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['meeting_id'] = this.meetingId;
    data['user_id'] = this.userId;
    data['user_email'] = this.userEmail;
    data['note'] = this.note;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

