/// title : "omar"
/// description : "omar description here"
/// start_date : "2021-09-22 11:00"
/// committee_id : "1"
/// duration : "90"
/// virtual : 0
/// location : "مهندسين مصر"
/// meeting_status_id : 1
/// owner_id : 21
/// id : 164
/// attendance_status : null
/// last_activity : "Ahmed Zaid Create this meeting 2021-12-06 20:51:02"
/// current_member : null
/// activities : [{"id":1027,"meeting_id":164,"user_id":21,"activity":"Create this meeting"}]
/// status : {"id":1,"name":"Draft","bgcolor":"#f4f6f8","color":"#909497"}
/// committee : null
/// owner : {"id":21,"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","role_id":1,"phone":"01111886440","birthdate":"2000-08-22","team":3,"image":"http://test.app.ijtimaati.com/api/public/uploads/images/Ut7NK4RANu.jpg","status":1,"position":null,"team_name":"Ijtimaati Team","role_name":"Organization Admins","committee":{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null},"role":{"id":1,"name":"Organization Admins","slug":"admin","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2021-09-12T17:52:27.000000Z"}}
/// members : []

class AddMeetingResponseModel {
  String _title;
  String _description;
  String _startDate;
  String _committeeId;
  String _duration;
  int _virtual;
  String _location;
  int _meetingStatusId;
  int _ownerId;
  int _id;
  dynamic _attendanceStatus;
  String _lastActivity;
  dynamic _currentMember;
  List<Activities> _activities;
  Status _status;
  dynamic _committee;
  Owner _owner;
  List<dynamic> _members;

  String get title => _title;
  String get description => _description;
  String get startDate => _startDate;
  String get committeeId => _committeeId;
  String get duration => _duration;
  int get virtual => _virtual;
  String get location => _location;
  int get meetingStatusId => _meetingStatusId;
  int get ownerId => _ownerId;
  int get id => _id;
  dynamic get attendanceStatus => _attendanceStatus;
  String get lastActivity => _lastActivity;
  dynamic get currentMember => _currentMember;
  List<Activities> get activities => _activities;
  Status get status => _status;
  dynamic get committee => _committee;
  Owner get owner => _owner;
  List<dynamic> get members => _members;

  AddMeetingResponseModel({
      String title, 
      String description, 
      String startDate, 
      String committeeId, 
      String duration, 
      int virtual, 
      String location, 
      int meetingStatusId, 
      int ownerId, 
      int id, 
      dynamic attendanceStatus, 
      String lastActivity, 
      dynamic currentMember, 
      List<Activities> activities, 
      Status status, 
      dynamic committee, 
      Owner owner, 
      List<dynamic> members}){
    _title = title;
    _description = description;
    _startDate = startDate;
    _committeeId = committeeId;
    _duration = duration;
    _virtual = virtual;
    _location = location;
    _meetingStatusId = meetingStatusId;
    _ownerId = ownerId;
    _id = id;
    _attendanceStatus = attendanceStatus;
    _lastActivity = lastActivity;
    _currentMember = currentMember;
    _activities = activities;
    _status = status;
    _committee = committee;
    _owner = owner;
    _members = members;
}

  AddMeetingResponseModel.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _startDate = json['start_date'];
    _committeeId = json['committee_id'];
    _duration = json['duration'];
    _virtual = json['virtual'];
    _location = json['location'];
    _meetingStatusId = json['meeting_status_id'];
    _ownerId = json['owner_id'];
    _id = json['id'];
    _attendanceStatus = json['attendance_status'];
    _lastActivity = json['last_activity'];
    _currentMember = json['current_member'];
    if (json['activities'] != null) {
      _activities = [];
      json['activities'].forEach((v) {
        _activities.add(Activities.fromJson(v));
      });
    }
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _committee = json['committee'];
    _owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    if (json['members'] != null) {
      _members = [];
      json['members'].forEach((v) {
        // _members.add(dynamic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['start_date'] = _startDate;
    map['committee_id'] = _committeeId;
    map['duration'] = _duration;
    map['virtual'] = _virtual;
    map['location'] = _location;
    map['meeting_status_id'] = _meetingStatusId;
    map['owner_id'] = _ownerId;
    map['id'] = _id;
    map['attendance_status'] = _attendanceStatus;
    map['last_activity'] = _lastActivity;
    map['current_member'] = _currentMember;
    if (_activities != null) {
      map['activities'] = _activities.map((v) => v.toJson()).toList();
    }
    if (_status != null) {
      map['status'] = _status.toJson();
    }
    map['committee'] = _committee;
    if (_owner != null) {
      map['owner'] = _owner.toJson();
    }
    if (_members != null) {
      map['members'] = _members.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 21
/// name : "Ahmed Zaid"
/// email : "ahmed@ijtimaati.com"
/// role_id : 1
/// phone : "01111886440"
/// birthdate : "2000-08-22"
/// team : 3
/// image : "http://test.app.ijtimaati.com/api/public/uploads/images/Ut7NK4RANu.jpg"
/// status : 1
/// position : null
/// team_name : "Ijtimaati Team"
/// role_name : "Organization Admins"
/// committee : {"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null}
/// role : {"id":1,"name":"Organization Admins","slug":"admin","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2021-09-12T17:52:27.000000Z"}

class Owner {
  int _id;
  String _name;
  String _email;
  int _roleId;
  String _phone;
  String _birthdate;
  int _team;
  String _image;
  int _status;
  dynamic _position;
  String _teamName;
  String _roleName;
  Committee _committee;
  Role _role;

  int get id => _id;
  String get name => _name;
  String get email => _email;
  int get roleId => _roleId;
  String get phone => _phone;
  String get birthdate => _birthdate;
  int get team => _team;
  String get image => _image;
  int get status => _status;
  dynamic get position => _position;
  String get teamName => _teamName;
  String get roleName => _roleName;
  Committee get committee => _committee;
  Role get role => _role;

  Owner({
      int id, 
      String name, 
      String email, 
      int roleId, 
      String phone, 
      String birthdate, 
      int team, 
      String image, 
      int status, 
      dynamic position, 
      String teamName, 
      String roleName, 
      Committee committee, 
      Role role}){
    _id = id;
    _name = name;
    _email = email;
    _roleId = roleId;
    _phone = phone;
    _birthdate = birthdate;
    _team = team;
    _image = image;
    _status = status;
    _position = position;
    _teamName = teamName;
    _roleName = roleName;
    _committee = committee;
    _role = role;
}

  Owner.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _roleId = json['role_id'];
    _phone = json['phone'];
    _birthdate = json['birthdate'];
    _team = json['team'];
    _image = json['image'];
    _status = json['status'];
    _position = json['position'];
    _teamName = json['team_name'];
    _roleName = json['role_name'];
    _committee = json['committee'] != null ? Committee.fromJson(json['committee']) : null;
    _role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['role_id'] = _roleId;
    map['phone'] = _phone;
    map['birthdate'] = _birthdate;
    map['team'] = _team;
    map['image'] = _image;
    map['status'] = _status;
    map['position'] = _position;
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    if (_committee != null) {
      map['committee'] = _committee.toJson();
    }
    if (_role != null) {
      map['role'] = _role.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Organization Admins"
/// slug : "admin"
/// created_at : "2021-09-12T17:52:27.000000Z"
/// updated_at : "2021-09-12T17:52:27.000000Z"

class Role {
  int _id;
  String _name;
  String _slug;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  String get name => _name;
  String get slug => _slug;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Role({
      int id, 
      String name, 
      String slug, 
      String createdAt, 
      String updatedAt}){
    _id = id;
    _name = name;
    _slug = slug;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Role.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 3
/// name : "Ijtimaati Team"
/// description : "This is Ijtimaati team"
/// created_at : "2021-09-12T20:48:40.000000Z"
/// updated_at : "2021-11-01T19:33:28.000000Z"
/// deleted_at : null

class Committee {
  int _id;
  String _name;
  String _description;
  String _createdAt;
  String _updatedAt;
  dynamic _deletedAt;

  int get id => _id;
  String get name => _name;
  String get description => _description;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Committee({
      int id, 
      String name, 
      String description, 
      String createdAt, 
      String updatedAt, 
      dynamic deletedAt}){
    _id = id;
    _name = name;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  Committee.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}

/// id : 1
/// name : "Draft"
/// bgcolor : "#f4f6f8"
/// color : "#909497"

class Status {
  int _id;
  String _name;
  String _bgcolor;
  String _color;

  int get id => _id;
  String get name => _name;
  String get bgcolor => _bgcolor;
  String get color => _color;

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

/// id : 1027
/// meeting_id : 164
/// user_id : 21
/// activity : "Create this meeting"

class Activities {
  int _id;
  int _meetingId;
  int _userId;
  String _activity;

  int get id => _id;
  int get meetingId => _meetingId;
  int get userId => _userId;
  String get activity => _activity;

  Activities({
      int id, 
      int meetingId, 
      int userId, 
      String activity}){
    _id = id;
    _meetingId = meetingId;
    _userId = userId;
    _activity = activity;
}

  Activities.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _userId = json['user_id'];
    _activity = json['activity'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['user_id'] = _userId;
    map['activity'] = _activity;
    return map;
  }

}