class MyLibraryResponseModel {
  MyLibraryResponseModel({
      List<Dirs> dirs, 
      List<Files> files,}){
    _dirs = dirs;
    _files = files;
}

  MyLibraryResponseModel.fromJson(dynamic json) {
    if (json['dirs'] != null) {
      _dirs = [];
      json['dirs'].forEach((v) {
        _dirs.add(Dirs.fromJson(v));
      });
    }
    if (json['files'] != null) {
      _files = [];
      json['files'].forEach((v) {
        _files.add(Files.fromJson(v));
      });
    }
  }
  List<Dirs> _dirs;
  List<Files> _files;

  List<Dirs> get dirs => _dirs;
  List<Files> get files => _files;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dirs != null) {
      map['dirs'] = _dirs.map((v) => v.toJson()).toList();
    }
    if (_files != null) {
      map['files'] = _files.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 594
/// user_id : 21
/// library_category_id : null
/// name : "interrog.html"
/// type : "text/html"
/// file_path : "uploads/library/1658564306993832.html"
/// created_at : "2022-07-23T08:18:26.000000Z"
/// updated_at : "2022-07-23T08:18:26.000000Z"
/// hidden : 0
/// file_url : "http://test.ijtimaati.com/api/public/uploads/library/1658564306993832.html"
/// size : "1.68 KB"
/// used_in : {"talkingpoints":[],"talkingpointsubpoints":[],"decisions":[],"actions":[]}
/// share : []
/// fav : []
/// edited_file : []
/// talkingpoints : []
/// talkingpointsubpoints : []
/// decisions : []
/// actions : []

class Files {
  Files({
      int id, 
      int userId, 
      dynamic libraryCategoryId, 
      String name, 
      String type, 
      String filePath, 
      String createdAt, 
      String updatedAt, 
      int hidden, 
      String fileUrl, 
      String size, 
      UsedIn usedIn, 
      List<dynamic> share, 
      List<dynamic> fav, 
      List<dynamic> editedFile, 
      List<dynamic> talkingpoints, 
      List<dynamic> talkingpointsubpoints, 
      List<dynamic> decisions, 
      List<dynamic> actions,}){
    _id = id;
    _userId = userId;
    _libraryCategoryId = libraryCategoryId;
    _name = name;
    _type = type;
    _filePath = filePath;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _hidden = hidden;
    _fileUrl = fileUrl;
    _size = size;
    _usedIn = usedIn;
    _share = share;
    _fav = fav;
    _editedFile = editedFile;
    _talkingpoints = talkingpoints;
    _talkingpointsubpoints = talkingpointsubpoints;
    _decisions = decisions;
    _actions = actions;
}

  Files.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _libraryCategoryId = json['library_category_id'];
    _name = json['name'];
    _type = json['type'];
    _filePath = json['file_path'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _hidden = json['hidden'];
    _fileUrl = json['file_url'];
    _size = json['size'];
    _usedIn = json['used_in'] != null ? UsedIn.fromJson(json['used_in']) : null;
    if (json['share'] != null) {
      _share = [];
      json['share'].forEach((v) {
        _share.add(Share.fromJson(v));
      });
    }
    if (json['fav'] != null) {
      _fav = [];
      json['fav'].forEach((v) {
        // _fav.add(Dynamic.fromJson(v));
      });
    }
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
  String _filePath;
  String _createdAt;
  String _updatedAt;
  int _hidden;
  String _fileUrl;
  String _size;
  UsedIn _usedIn;
  List<Share> _share;
  List<dynamic> _fav;
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
  String get filePath => _filePath;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get hidden => _hidden;
  String get fileUrl => _fileUrl;
  String get size => _size;
  UsedIn get usedIn => _usedIn;
  List<dynamic> get share => _share;
  List<dynamic> get fav => _fav;
  List<dynamic> get editedFile => _editedFile;
  List<dynamic> get talkingpoints => _talkingpoints;
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
    map['file_path'] = _filePath;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['hidden'] = _hidden;
    map['file_url'] = _fileUrl;
    map['size'] = _size;
    if (_usedIn != null) {
      map['used_in'] = _usedIn.toJson();
    }
    if (_share != null) {
      map['share'] = _share.map((v) => v.toJson()).toList();
    }
    if (_fav != null) {
      map['fav'] = _fav.map((v) => v.toJson()).toList();
    }
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

/// talkingpoints : []
/// talkingpointsubpoints : []
/// decisions : []
/// actions : []

class UsedIn {
  UsedIn({
      List<dynamic> talkingpoints, 
      List<dynamic> talkingpointsubpoints, 
      List<dynamic> decisions, 
      List<dynamic> actions,}){
    _talkingpoints = talkingpoints;
    _talkingpointsubpoints = talkingpointsubpoints;
    _decisions = decisions;
    _actions = actions;
}

  UsedIn.fromJson(dynamic json) {
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
  List<Talkingpoints> _talkingpoints;
  List<dynamic> _talkingpointsubpoints;
  List<dynamic> _decisions;
  List<dynamic> _actions;

  List<dynamic> get talkingpoints => _talkingpoints;
  List<dynamic> get talkingpointsubpoints => _talkingpointsubpoints;
  List<dynamic> get decisions => _decisions;
  List<dynamic> get actions => _actions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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


class Dirs {
  Dirs({
      int id, 
      int userId, 
      String name, 
      dynamic parentId, 
      String createdAt, 
      String updatedAt, 
      int committeeId, 
      List<dynamic> dirs, 
      List<Files> files, 
      List<Share> share, 
      List<dynamic> fav,}){
    _id = id;
    _userId = userId;
    _name = name;
    _parentId = parentId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _committeeId = committeeId;
    _dirs = dirs;
    _files = files;
    _share = share;
    _fav = fav;
}

  Dirs.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _parentId = json['parent_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _committeeId = json['committee_id'];
    if (json['dirs'] != null) {
      _dirs = [];
      json['dirs'].forEach((v) {
        _dirs.add(Dirs.fromJson(v));
      });
    }
    if (json['files'] != null) {
      _files = [];
      json['files'].forEach((v) {
        _files.add(Files.fromJson(v));
      });
    }
    if (json['share'] != null) {
      _share = [];
      json['share'].forEach((v) {
        _share.add(Share.fromJson(v));
      });
    }
    if (json['fav'] != null) {
      _fav = [];
      json['fav'].forEach((v) {
        // _fav.add(Dynamic.fromJson(v));
      });
    }
  }
  int _id;
  int _userId;
  String _name;
  dynamic _parentId;
  String _createdAt;
  String _updatedAt;
  int _committeeId;
  List<Dirs> _dirs;
  List<Files> _files;
  List<Share> _share;
  List<dynamic> _fav;

  int get id => _id;
  int get userId => _userId;
  String get name => _name;
  dynamic get parentId => _parentId;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get committeeId => _committeeId;
  List<Dirs> get dirs => _dirs;
  List<Files> get files => _files;
  List<Share> get share => _share;
  List<dynamic> get fav => _fav;


  set dirs(List<Dirs> value) {
    _dirs = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['parent_id'] = _parentId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['committee_id'] = _committeeId;
    if (_dirs != null) {
      map['dirs'] = _dirs.map((v) => v.toJson()).toList();
    }
    if (_files != null) {
      map['files'] = _files.map((v) => v.toJson()).toList();
    }
    if (_share != null) {
      map['share'] = _share.map((v) => v.toJson()).toList();
    }
    if (_fav != null) {
      map['fav'] = _fav.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Share {
  Share({
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
      String deleted, 
      String teamName, 
      String roleName, 
      Pivot pivot, 
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
    _deleted = deleted;
    _teamName = teamName;
    _roleName = roleName;
    _pivot = pivot;
    _committee = committee;
    _role = role;
}

  Share.fromJson(dynamic json) {
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
    _deleted = json['deleted'];
    _teamName = json['team_name'];
    _roleName = json['role_name'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
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
  String _deleted;
  String _teamName;
  String _roleName;
  Pivot _pivot;
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
  String get deleted => _deleted;
  String get teamName => _teamName;
  String get roleName => _roleName;
  Pivot get pivot => _pivot;
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
    map['deleted'] = _deleted;
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    if (_pivot != null) {
      map['pivot'] = _pivot.toJson();
    }
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
/// name : "Admins"
/// slug : "Admins"
/// created_at : "2021-09-12T17:52:27.000000Z"
/// updated_at : "2022-04-05T05:48:25.000000Z"
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

/// id : 4
/// name : "Jermaine Ruiz"
/// description : "Fuga Nulla ea id ra"
/// created_at : "2021-09-13T16:45:58.000000Z"
/// updated_at : "2021-10-31T06:01:51.000000Z"
/// deleted_at : null
/// status : "1"
/// pivot : {"user_id":35,"committee_id":4}

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

/// user_id : 35
/// committee_id : 4

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
      String momSettings, 
      dynamic momConclusion, 
      dynamic libraryId, 
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
    _libraryId = libraryId;
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
    _libraryId = json['library_id'];
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
  String _virtualType;
  dynamic _mom;
  String _momSettings;
  dynamic _momConclusion;
  dynamic _libraryId;
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
  String get virtualType => _virtualType;
  dynamic get mom => _mom;
  String get momSettings => _momSettings;
  dynamic get momConclusion => _momConclusion;
  dynamic get libraryId => _libraryId;
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
    map['library_id'] = _libraryId;
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

/// id : 1717
/// meeting_id : 336
/// user_id : 21
/// user_email : ""
/// can_edit : 0
/// attendance_status : "Going"
/// status_reason : null
/// token : null
/// user : {"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"http://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null}
/// type : "Viewer"

class Members {
  Members({
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

  Members.fromJson(dynamic json) {
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

/// name : "Ahmed ALReesi"
/// email : "Ahmed@ijtimaati.com"
/// image : "http://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png"
/// position : "cyber Security"
/// team_name : ""
/// role_name : ""
/// committee : []
/// role : null

class User {
  User({
      String name,
      String email,
      String image,
      String position,
      String teamName,
      String roleName,
      List<dynamic> committee,
      dynamic role,}){
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
    if (json['committee'] != null) {
      _committee = [];
      json['committee'].forEach((v) {
        _committee.add(Committee.fromJson(v));
      });
    }
    _role = json['role'];
  }
  String _name;
  String _email;
  String _image;
  String _position;
  String _teamName;
  String _roleName;
  List<Committee> _committee;
  dynamic _role;

  String get name => _name;
  String get email => _email;
  String get image => _image;
  String get position => _position;
  String get teamName => _teamName;
  String get roleName => _roleName;
  List<dynamic> get committee => _committee;
  dynamic get role => _role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['image'] = _image;
    map['position'] = _position;
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    if (_committee != null) {
      map['committee'] = _committee.map((v) => v.toJson()).toList();
    }
    map['role'] = _role;
    return map;
  }

}

/// id : 1717
/// meeting_id : 336
/// user_id : 21
/// user_email : ""
/// can_edit : 0
/// attendance_status : "Going"
/// status_reason : null
/// token : null
/// user : {"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"http://test.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null}
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

