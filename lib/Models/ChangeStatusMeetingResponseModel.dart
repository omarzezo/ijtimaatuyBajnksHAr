/// id : 47
/// title : "Steering Committee Meeting"
/// owner_id : 35
/// committee_id : 3
/// description : "Steering Committee Meeting 32"
/// start_date : "2021-12-07 06:00:00"
/// duration : 60
/// location : "Meeting room"
/// meeting_status_id : 2
/// virtual : 1
/// order : "TalkingPoints,Decisions,Actions"
/// attendance_status : "Pending"
/// last_activity : "Ahmed Zaid change meeting status to Scheduled 2021-12-13 17:56:05"
/// current_member : {"id":111,"meeting_id":47,"user_id":21,"user_email":null,"can_edit":0,"attendance_status":"Maybe","status_reason":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/Ut7NK4RANu.jpg","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"}
/// members : [{"id":149,"meeting_id":47,"user_id":3,"user_email":null,"can_edit":0,"attendance_status":"Not going","status_reason":"ssssssss","user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":111,"meeting_id":47,"user_id":21,"user_email":null,"can_edit":0,"attendance_status":"Maybe","status_reason":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/Ut7NK4RANu.jpg","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":303,"meeting_id":47,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/Ut7NK4RANu.jpg","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":306,"meeting_id":47,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":304,"meeting_id":47,"user_id":37,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"Jamila","email":"jamila@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/zQD6FoVtg2.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":305,"meeting_id":47,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"}]

class ChangeStatusMeetingResponseModel {
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
  String _attendanceStatus;
  String _lastActivity;
  Current_member _currentMember;
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
  String get attendanceStatus => _attendanceStatus;
  String get lastActivity => _lastActivity;
  Current_member get currentMember => _currentMember;
  List<Members> get members => _members;

  ChangeStatusMeetingResponseModel({
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
      String attendanceStatus, 
      String lastActivity, 
      Current_member currentMember, 
      List<Members> members}){
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
    _attendanceStatus = attendanceStatus;
    _lastActivity = lastActivity;
    _currentMember = currentMember;
    _members = members;
}

  ChangeStatusMeetingResponseModel.fromJson(dynamic json) {
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
    _attendanceStatus = json['attendance_status'];
    _lastActivity = json['last_activity'];
    _currentMember = json['current_member'] != null ? Current_member.fromJson(json['current_member']) : null;
    if (json['members'] != null) {
      _members = [];
      json['members'].forEach((v) {
        _members.add(Members.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
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

/// id : 149
/// meeting_id : 47
/// user_id : 3
/// user_email : null
/// can_edit : 0
/// attendance_status : "Not going"
/// status_reason : "ssssssss"
/// user : {"name":"saeed saleh","email":"said.sale7@gmail.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":null,"role":null}
/// type : "Viewer"

class Members {
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

  Members({
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

  Members.fromJson(dynamic json) {
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

/// id : 111
/// meeting_id : 47
/// user_id : 21
/// user_email : null
/// can_edit : 0
/// attendance_status : "Maybe"
/// status_reason : null
/// user : {"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/Ut7NK4RANu.jpg","position":null,"team_name":"","role_name":"","committee":null,"role":null}
/// type : "Viewer"

class Current_member {
  int _id;
  int _meetingId;
  int _userId;
  dynamic _userEmail;
  int _canEdit;
  String _attendanceStatus;
  dynamic _statusReason;
  User _user;
  String _type;

  int get id => _id;
  int get meetingId => _meetingId;
  int get userId => _userId;
  dynamic get userEmail => _userEmail;
  int get canEdit => _canEdit;
  String get attendanceStatus => _attendanceStatus;
  dynamic get statusReason => _statusReason;
  User get user => _user;
  String get type => _type;

  Current_member({
      int id, 
      int meetingId, 
      int userId, 
      dynamic userEmail, 
      int canEdit, 
      String attendanceStatus, 
      dynamic statusReason, 
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

  Current_member.fromJson(dynamic json) {
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
