/// id : 149
/// meeting_id : 47
/// user_id : 3
/// user_email : null
/// can_edit : 0
/// attendance_status : "Not going"
/// status_reason : "knnknk"
/// user : {"name":"saeed saleh","email":"said.sale7@gmail.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":null,"role":null}
/// type : "Viewer"

class UserChangeStatusResponseModel {
  int _id;
  int _meetingId;
  int _userId;
  dynamic _userEmail;
  int _canEdit;
  String _attendanceStatus;
  String _statusReason;
  User _user;
  String _type;

  int get id => _id;
  int get meetingId => _meetingId;
  int get userId => _userId;
  dynamic get userEmail => _userEmail;
  int get canEdit => _canEdit;
  String get attendanceStatus => _attendanceStatus;
  String get statusReason => _statusReason;
  User get user => _user;
  String get type => _type;

  UserChangeStatusResponseModel({
      int id, 
      int meetingId, 
      int userId, 
      dynamic userEmail, 
      int canEdit, 
      String attendanceStatus, 
      String statusReason, 
      User user, 
      String type}){
    _id = id;
    _meetingId = meetingId;
    _userId = userId;
    _userEmail = userEmail;
    _canEdit = canEdit;
    _attendanceStatus = attendanceStatus;
    _statusReason = statusReason;
    _user = user;
    _type = type;
}

  UserChangeStatusResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _canEdit = json['can_edit'];
    _attendanceStatus = json['attendance_status'];
    _statusReason = json['status_reason'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['can_edit'] = _canEdit;
    map['attendance_status'] = _attendanceStatus;
    map['status_reason'] = _statusReason;
    if (_user != null) {
      map['user'] = _user.toJson();
    }
    map['type'] = _type;
    return map;
  }

}

/// name : "saeed saleh"
/// email : "said.sale7@gmail.com"
/// image : "http://test.app.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png"
/// position : null
/// team_name : ""
/// role_name : ""
/// committee : null
/// role : null

class User {
  String _name;
  String _email;
  String _image;
  dynamic _position;
  String _teamName;
  String _roleName;
  dynamic _committee;
  dynamic _role;

  String get name => _name;
  String get email => _email;
  String get image => _image;
  dynamic get position => _position;
  String get teamName => _teamName;
  String get roleName => _roleName;
  dynamic get committee => _committee;
  dynamic get role => _role;

  User({
      String name, 
      String email, 
      String image, 
      dynamic position, 
      String teamName, 
      String roleName, 
      dynamic committee, 
      dynamic role}){
    _name = name;
    _email = email;
    _image = image;
    _position = position;
    _teamName = teamName;
    _roleName = roleName;
    _committee = committee;
    _role = role;
}

  User.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _image = json['image'];
    _position = json['position'];
    _teamName = json['team_name'];
    _roleName = json['role_name'];
    _committee = json['committee'];
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['image'] = _image;
    map['position'] = _position;
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    map['committee'] = _committee;
    map['role'] = _role;
    return map;
  }

}