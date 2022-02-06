class MeetingDetailsResponseModel {
  int _id;
  String _title;
  int _ownerId;
  int _committeeId;
  String _description;
  String _startDate;
  int _duration;
  dynamic _location;
  int _meetingStatusId;
  int _virtual;
  String _order;
  String _attendanceStatus;
  String _lastActivity;
  Current_member _currentMember;
  Status _status;
  List<Admins> _admins;
  Owner _owner;
  List<Agendas> _agendas;
  Committee _committee;
  List<MeetingDetailsResponseModelMembers> _members;
  List<MeetingDetailsResponseModelActivities> _activities;
  List<Zoom> _zoom;
  List<dynamic> _ijmeet;
  Note _note;
  List<MeetingDetailsResponseModelTalkingpoints> _talkingpoints;
  List<MeetingDetailsResponseModelDecisions> _decisions;
  List<MeetingDetailsResponseModelActions> _actions;

  int get id => _id;
  String get title => _title;
  int get ownerId => _ownerId;
  int get committeeId => _committeeId;
  String get description => _description;
  String get startDate => _startDate;
  int get duration => _duration;
  dynamic get location => _location;
  int get meetingStatusId => _meetingStatusId;
  int get virtual => _virtual;
  String get order => _order;
  String get attendanceStatus => _attendanceStatus;
  String get lastActivity => _lastActivity;
  Current_member get currentMember => _currentMember;
  Status get status => _status;
  List<Admins> get admins => _admins;
  Owner get owner => _owner;
  List<Agendas> get agendas => _agendas;
  Committee get committee => _committee;
  List<MeetingDetailsResponseModelMembers> get members => _members;
  List<MeetingDetailsResponseModelActivities> get activities => _activities;
  List<Zoom> get zoom => _zoom;
  List<dynamic> get ijmeet => _ijmeet;
  Note get note => _note;
  List<MeetingDetailsResponseModelTalkingpoints> get talkingpoints => _talkingpoints;
  List<MeetingDetailsResponseModelDecisions> get decisions => _decisions;
  List<MeetingDetailsResponseModelActions> get actions => _actions;

  MeetingDetailsResponseModel({
    int id,
    String title,
    int ownerId,
    int committeeId,
    String description,
    String startDate,
    int duration,
    dynamic location,
    int meetingStatusId,
    int virtual,
    String order,
    String attendanceStatus,
    String lastActivity,
    Current_member currentMember,
    Status status,
    List<Admins> admins,
    Owner owner,
    List<Agendas> agendas,
    Committee committee,
    List<MeetingDetailsResponseModelMembers> members,
    List<MeetingDetailsResponseModelActivities> activities,
    List<Zoom> zoom,
    List<dynamic> ijmeet,
    Note note,
    List<MeetingDetailsResponseModelTalkingpoints> talkingpoints,
    List<MeetingDetailsResponseModelDecisions> decisions,
    List<MeetingDetailsResponseModelActions> actions}){
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
    _talkingpoints = talkingpoints;
    _decisions = decisions;
    _actions = actions;
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
    _attendanceStatus = json['attendance_status'];
    _lastActivity = json['last_activity'];
    _currentMember = json['current_member'] != null ? Current_member.fromJson(json['current_member']) : null;
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
    // _committee = json['committee'] != null ? Committee.fromJson(json['committee']) : null;

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
        _zoom.add(Zoom.fromJson(v));
      });
    }
    if (json['ijmeet'] != null) {
      _ijmeet = [];
      json['ijmeet'].forEach((v) {
        // _ijmeet.add(dynamic.fromJson(v));
      });
    }
    _note = json['note'] != null ? Note.fromJson(json['note']) : null;
    if (json['talkingpoints'] != null) {
      _talkingpoints = [];
      json['talkingpoints'].forEach((v) {
        _talkingpoints.add(MeetingDetailsResponseModelTalkingpoints.fromJson(v));
      });
    }
    if (json['decisions'] != null) {
      _decisions = [];
      json['decisions'].forEach((v) {
        _decisions.add(MeetingDetailsResponseModelDecisions.fromJson(v));
      });
    }
    if (json['actions'] != null) {
      _actions = [];
      json['actions'].forEach((v) {
        _actions.add(MeetingDetailsResponseModelActions.fromJson(v));
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
    if (_note != null) {
      map['note'] = _note.toJson();
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


class MeetingDetailsResponseModelActions {
  int _id;
  int _meetingId;
  int _creatorId;
  String _title;
  String _openTill;
  String _priority;
  dynamic _description;
  int _order;
  List<Participants> _participants;
  List<MeetingDetailsResponseModelMembersAttachments> _attachments;
  List<Comments> _comments;

  int get id => _id;
  int get meetingId => _meetingId;
  int get creatorId => _creatorId;
  String get title => _title;
  String get openTill => _openTill;
  String get priority => _priority;
  dynamic get description => _description;
  int get order => _order;
  List<Participants> get participants => _participants;
  List<MeetingDetailsResponseModelMembersAttachments> get attachments => _attachments;
  List<Comments> get comments => _comments;

  MeetingDetailsResponseModelActions({
    int id,
    int meetingId,
    int creatorId,
    String title,
    String openTill,
    String priority,
    dynamic description,
    int order,
    List<Participants> participants,
    List<MeetingDetailsResponseModelMembersAttachments> attachments,
    List<Comments> comments}){
    _id = id;
    _meetingId = meetingId;
    _creatorId = creatorId;
    _title = title;
    _openTill = openTill;
    _priority = priority;
    _description = description;
    _order = order;
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

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['creator_id'] = _creatorId;
    map['title'] = _title;
    map['open_till'] = _openTill;
    map['priority'] = _priority;
    map['description'] = _description;
    map['order'] = _order;
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



class Participants {
  int _id;
  int _meetingActionId;
  int _userId;
  dynamic _userEmail;
  String _status;
  User _user;

  int get id => _id;
  int get meetingActionId => _meetingActionId;
  int get userId => _userId;
  dynamic get userEmail => _userEmail;
  String get status => _status;
  User get user => _user;

  Participants({
    int id,
    int meetingActionId,
    int userId,
    dynamic userEmail,
    String status,
    User user}){
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
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_action_id'] = _meetingActionId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['status'] = _status;
    if (_user != null) {
      map['user'] = _user.toJson();
    }
    return map;
  }

}


class User {
  String _name;
  String _email;
  String _image;
  String _teamName;
  String _roleName;
  dynamic _committee;
  dynamic _role;

  String get name => _name;
  String get email => _email;
  String get image => _image;
  String get teamName => _teamName;
  String get roleName => _roleName;
  dynamic get committee => _committee;
  dynamic get role => _role;

  User({
    String name,
    String email,
    String image,
    String teamName,
    String roleName,
    dynamic committee,
    dynamic role}){
    _name = name;
    _email = email;
    _image = image;
    _teamName = teamName;
    _roleName = roleName;
    _committee = committee;
    _role = role;
  }

  User.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _image = json['image'];
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
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    map['committee'] = _committee;
    map['role'] = _role;
    return map;
  }

}


class MeetingDetailsResponseModelDecisions {
  int _id;
  int _meetingId;
  int _creatorId;
  String _title;
  String _deadline;
  dynamic _description;
  int _order;
  List<Voters> _voters;
  List<MeetingDetailsResponseModelMembersAttachments> _attachments;
  List<Comments> _comments;

  int get id => _id;
  int get meetingId => _meetingId;
  int get creatorId => _creatorId;
  String get title => _title;
  String get deadline => _deadline;
  dynamic get description => _description;
  int get order => _order;
  List<Voters> get voters => _voters;
  List<MeetingDetailsResponseModelMembersAttachments> get attachments => _attachments;
  List<Comments> get comments => _comments;

  MeetingDetailsResponseModelDecisions({
    int id,
    int meetingId,
    int creatorId,
    String title,
    String deadline,
    dynamic description,
    int order,
    List<Voters> voters,
    List<MeetingDetailsResponseModelMembersAttachments> attachments,
    List<Comments> comments}){
    _id = id;
    _meetingId = meetingId;
    _creatorId = creatorId;
    _title = title;
    _deadline = deadline;
    _description = description;
    _order = order;
    _voters = voters;
    _attachments = attachments;
    _comments = comments;
  }

  MeetingDetailsResponseModelDecisions.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _creatorId = json['creator_id'];
    _title = json['title'];
    _deadline = json['deadline'];
    _description = json['description'];
    _order = json['order'];
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

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['creator_id'] = _creatorId;
    map['title'] = _title;
    map['deadline'] = _deadline;
    map['description'] = _description;
    map['order'] = _order;
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


class Voters {
  int _id;
  int _meetingDecisionId;
  int _userId;
  dynamic _userEmail;
  String _vote;
  dynamic _reason;
  User _user;

  int get id => _id;
  int get meetingDecisionId => _meetingDecisionId;
  int get userId => _userId;
  dynamic get userEmail => _userEmail;
  String get vote => _vote;
  dynamic get reason => _reason;
  User get user => _user;

  Voters({
    int id,
    int meetingDecisionId,
    int userId,
    dynamic userEmail,
    String vote,
    dynamic reason,
    User user}){
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
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_decision_id'] = _meetingDecisionId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['vote'] = _vote;
    map['reason'] = _reason;
    if (_user != null) {
      map['user'] = _user.toJson();
    }
    return map;
  }
}


class MeetingDetailsResponseModelTalkingpoints {
  int _id;
  int _meetingId;
  int _creatorId;
  String _title;
  int _duration;
  String _description;
  int _order;
  List<MeetingDetailsResponseModelSubpoints> _subpoints;
  List<MeetingDetailsResponseModelMembersPresenters> _presenters;
  List<Viewers> _viewers;
  List<MeetingDetailsResponseModelMembersAttachments> _attachments;
  List<Comments> _comments;

  int get id => _id;
  int get meetingId => _meetingId;
  int get creatorId => _creatorId;
  String get title => _title;
  int get duration => _duration;
  String get description => _description;
  int get order => _order;
  List<MeetingDetailsResponseModelSubpoints> get subpoints => _subpoints;
  List<MeetingDetailsResponseModelMembersPresenters> get presenters => _presenters;
  List<Viewers> get viewers => _viewers;
  List<MeetingDetailsResponseModelMembersAttachments> get attachments => _attachments;
  List<Comments> get comments => _comments;

  MeetingDetailsResponseModelTalkingpoints({
    int id,
    int meetingId,
    int creatorId,
    String title,
    int duration,
    String description,
    int order,
    List<MeetingDetailsResponseModelSubpoints> subpoints,
    List<MeetingDetailsResponseModelMembersPresenters> presenters,
    List<Viewers> viewers,
    List<MeetingDetailsResponseModelMembersAttachments> attachments,
    List<Comments> comments}){
    _id = id;
    _meetingId = meetingId;
    _creatorId = creatorId;
    _title = title;
    _duration = duration;
    _description = description;
    _order = order;
    _subpoints = subpoints;
    _presenters = presenters;
    _viewers = viewers;
    _attachments = attachments;
    _comments = comments;
  }

  MeetingDetailsResponseModelTalkingpoints.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _creatorId = json['creator_id'];
    _title = json['title'];
    _duration = json['duration'];
    _description = json['description'];
    _order = json['order'];
    if (json['subpoints'] != null) {
      _subpoints = [];
      json['subpoints'].forEach((v) {
        _subpoints.add(MeetingDetailsResponseModelSubpoints.fromJson(v));
      });
    }
    if (json['presenters'] != null) {
      _presenters = [];
      json['presenters'].forEach((v) {
        _presenters.add(MeetingDetailsResponseModelMembersPresenters.fromJson(v));
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
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['creator_id'] = _creatorId;
    map['title'] = _title;
    map['duration'] = _duration;
    map['description'] = _description;
    map['order'] = _order;
    if (_subpoints != null) {
      map['subpoints'] = _subpoints.map((v) => v.toJson()).toList();
    }
    if (_presenters != null) {
      map['presenters'] = _presenters.map((v) => v.toJson()).toList();
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
    return map;
  }

}

/// id : 82
/// commentable_id : "82"
/// commentable_type : "App\\Models\\MeetingTalkingPoint"
/// commented_id : "35"
/// commented_type : "App\\Models\\SubUser"
/// comment : "hello"
/// approved : true
/// rate : null
/// created_at : "2021-12-05T05:11:12.000000Z"
/// updated_at : "2021-12-05T05:11:12.000000Z"

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

/// id : 79
/// meeting_talking_point_id : 82
/// user_id : 35
/// user_email : null
/// file_name : null
/// file_path : null
/// library_id : 62
/// user : {"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","team_name":"","role_name":"","committee":null,"role":null}
/// url : null
/// library : {"id":62,"user_id":35,"library_category_id":null,"name":"IT WEEKLY REPORT 8th Nov.pdf","type":"application/pdf","created_at":"2021-11-16T04:47:46.000000Z","updated_at":"2021-11-23T07:24:45.000000Z","file_url":"http://test.app.ijtimaati.com/api/public/uploads/library/1637652285520826.","size":"1.32 MB","used_in":{"talkingpoints":[{"id":80,"meeting_id":106,"creator_id":35,"title":"M3","duration":120,"description":"Jamila","order":0,"laravel_through_key":62,"meeting":null},{"id":82,"meeting_id":159,"creator_id":21,"title":"Sales and Marketing Update","duration":60,"description":"Last week update","order":0,"laravel_through_key":62,"meeting":{"id":159,"title":"Ijtimaati management","owner_id":35,"committee_id":8,"description":"meeting description is here","start_date":"2021-12-13 09:52:00","duration":60,"location":null,"meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","attendance_status":"Going","last_activity":"Ahmed Zaid Update this meeting 2021-12-06 21:55:57","current_member":{"id":347,"meeting_id":159,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/Ut7NK4RANu.jpg","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},"members":[{"id":347,"meeting_id":159,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/Ut7NK4RANu.jpg","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":358,"meeting_id":159,"user_id":34,"user_email":null,"can_edit":0,"attendance_status":"Going","status_reason":null,"user":{"name":"Mohammed Tarek","email":"mohammed94.turki@gmail.com","image":"http://test.app.ijtimaati.com/api/public/avatar.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":350,"meeting_id":159,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":348,"meeting_id":159,"user_id":37,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"Jamila","email":"jamila@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/zQD6FoVtg2.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":349,"meeting_id":159,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":359,"meeting_id":159,"user_id":78,"user_email":null,"can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"mohamed ismail","email":"mohamedismail120827@gmail.com","image":"http://test.app.ijtimaati.com/api/public/avatar.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"}]}}],"decisions":[],"actions":[]},"talkingpoints":[{"id":80,"meeting_id":106,"creator_id":35,"title":"M3","duration":120,"description":"Jamila","order":0,"laravel_through_key":62,"meeting":null},{"id":82,"meeting_id":159,"creator_id":21,"title":"Sales and Marketing Update","duration":60,"description":"Last week update","order":0,"laravel_through_key":62,"meeting":{"id":159,"title":"Ijtimaati management","owner_id":35,"committee_id":8,"description":"meeting description is here","start_date":"2021-12-13 09:52:00","duration":60,"location":null,"meeting_status_id":3,"virtual":1,"order":"TalkingPoints,Decisions,Actions","attendance_status":"Going","last_activity":"Ahmed Zaid Update this meeting 2021-12-06 21:55:57","current_member":{"id":347,"meeting_id":159,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/Ut7NK4RANu.jpg","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},"members":[{"id":347,"meeting_id":159,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Going","status_reason":null,"user":{"name":"Ahmed Zaid","email":"ahmed@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/Ut7NK4RANu.jpg","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":358,"meeting_id":159,"user_id":34,"user_email":null,"can_edit":0,"attendance_status":"Going","status_reason":null,"user":{"name":"Mohammed Tarek","email":"mohammed94.turki@gmail.com","image":"http://test.app.ijtimaati.com/api/public/avatar.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":350,"meeting_id":159,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"Mazin F","email":"Mazin@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/UEvcaAL11E.jpeg","position":"IT Support","team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":348,"meeting_id":159,"user_id":37,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"Jamila","email":"jamila@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/zQD6FoVtg2.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":349,"meeting_id":159,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"http://test.app.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"},{"id":359,"meeting_id":159,"user_id":78,"user_email":null,"can_edit":0,"attendance_status":"Pending","status_reason":null,"user":{"name":"mohamed ismail","email":"mohamedismail120827@gmail.com","image":"http://test.app.ijtimaati.com/api/public/avatar.png","position":null,"team_name":"","role_name":"","committee":null,"role":null},"type":"Viewer"}]}}],"decisions":[],"actions":[]}

class MeetingDetailsResponseModelMembersAttachments {
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

  MeetingDetailsResponseModelMembersAttachments({
    int id,
    int meetingTalkingPointId,
    int userId,
    dynamic userEmail,
    dynamic fileName,
    dynamic filePath,
    int libraryId,
    User user,
    dynamic url,
    Library library}){
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

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
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
  int _id;
  int _userId;
  dynamic _libraryCategoryId;
  String _name;
  String _type;
  String _createdAt;
  String _updatedAt;
  String _fileUrl;
  String _size;
  Used_in _usedIn;
  List<MeetingDetailsResponseModelTalkingpoints> _talkingpoints;
  List<dynamic> _decisions;
  List<dynamic> _actions;

  int get id => _id;
  int get userId => _userId;
  dynamic get libraryCategoryId => _libraryCategoryId;
  String get name => _name;
  String get type => _type;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get fileUrl => _fileUrl;
  String get size => _size;
  Used_in get usedIn => _usedIn;
  List<MeetingDetailsResponseModelTalkingpoints> get talkingpoints => _talkingpoints;
  List<MeetingDetailsResponseModelDecisions> get decisions => _decisions;
  List<MeetingDetailsResponseModelActions> get actions => _actions;

  Library({
    int id,
    int userId,
    dynamic libraryCategoryId,
    String name,
    String type,
    String createdAt,
    String updatedAt,
    String fileUrl,
    String size,
    Used_in usedIn,
    List<MeetingDetailsResponseModelTalkingpoints> talkingpoints,
    List<MeetingDetailsResponseModelDecisions> decisions,
    List<MeetingDetailsResponseModelActions> actions}){
    _id = id;
    _userId = userId;
    _libraryCategoryId = libraryCategoryId;
    _name = name;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _fileUrl = fileUrl;
    _size = size;
    _usedIn = usedIn;
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
    _fileUrl = json['file_url'];
    _size = json['size'];
    _usedIn = json['used_in'] != null ? Used_in.fromJson(json['usedIn']) : null;
    if (json['talkingpoints'] != null) {
      _talkingpoints = [];
      json['talkingpoints'].forEach((v) {
        _talkingpoints.add(MeetingDetailsResponseModelTalkingpoints.fromJson(v));
      });
    }
    if (json['decisions'] != null) {
      _decisions = [];
      json['decisions'].forEach((v) {
        _decisions.add(MeetingDetailsResponseModelDecisions.fromJson(v));
      });
    }
    if (json['actions'] != null) {
      _actions = [];
      json['actions'].forEach((v) {
        _actions.add(MeetingDetailsResponseModelActions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['library_category_id'] = _libraryCategoryId;
    map['name'] = _name;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['file_url'] = _fileUrl;
    map['size'] = _size;
    if (_usedIn != null) {
      map['used_in'] = _usedIn.toJson();
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


class Used_in {
  List<MeetingDetailsResponseModelTalkingpoints> _talkingpoints;
  List<MeetingDetailsResponseModelDecisions> _decisions;
  List<MeetingDetailsResponseModelActions> _actions;

  List<MeetingDetailsResponseModelTalkingpoints> get talkingpoints => _talkingpoints;
  List<MeetingDetailsResponseModelDecisions> get decisions => _decisions;
  List<MeetingDetailsResponseModelActions> get actions => _actions;

  Used_in({
    List<MeetingDetailsResponseModelTalkingpoints> talkingpoints,
    List<MeetingDetailsResponseModelDecisions> decisions,
    List<MeetingDetailsResponseModelActions> actions}){
    _talkingpoints = talkingpoints;
    _decisions = decisions;
    _actions = actions;
  }

  Used_in.fromJson(dynamic json) {
    if (json!=null?json['talkingpoints'] != null:false) {
      _talkingpoints = [];
      json['talkingpoints'].forEach((v) {
        _talkingpoints.add(MeetingDetailsResponseModelTalkingpoints.fromJson(v));
      });
    }
    if (json!=null?json['decisions'] != null:false) {
      _decisions = [];
      json['decisions'].forEach((v) {
        _decisions.add(MeetingDetailsResponseModelDecisions.fromJson(v));
      });
    }
    if (json!=null?json['actions'] != null:false) {
      _actions = [];
      json['actions'].forEach((v) {
        _actions.add(MeetingDetailsResponseModelActions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
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


class Viewers {
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

  Viewers({
    int id,
    int meetingTalkingPointId,
    int userId,
    dynamic userEmail,
    User user}){
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
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
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


class MeetingDetailsResponseModelMembersPresenters {
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

  MeetingDetailsResponseModelMembersPresenters({
    int id,
    int meetingTalkingPointId,
    int userId,
    dynamic userEmail,
    User user}){
    _id = id;
    _meetingTalkingPointId = meetingTalkingPointId;
    _userId = userId;
    _userEmail = userEmail;
    _user = user;
  }

  MeetingDetailsResponseModelMembersPresenters.fromJson(dynamic json) {
    _id = json['id'];
    _meetingTalkingPointId = json['meeting_talking_point_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
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


class MeetingDetailsResponseModelSubpoints {
  int _id;
  int _meetingTalkingPointId;
  int _userId;
  dynamic _userEmail;
  String _title;
  int _duration;
  String _description;
  User _user;

  int get id => _id;
  int get meetingTalkingPointId => _meetingTalkingPointId;
  int get userId => _userId;
  dynamic get userEmail => _userEmail;
  String get title => _title;
  int get duration => _duration;
  String get description => _description;
  User get user => _user;

  MeetingDetailsResponseModelSubpoints({
    int id,
    int meetingTalkingPointId,
    int userId,
    dynamic userEmail,
    String title,
    int duration,
    String description,
    User user}){
    _id = id;
    _meetingTalkingPointId = meetingTalkingPointId;
    _userId = userId;
    _userEmail = userEmail;
    _title = title;
    _duration = duration;
    _description = description;
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
    return map;
  }

}

class Note {
  int _id;
  int _meetingId;
  int _userId;
  dynamic _userEmail;
  String _note;
  User _user;

  int get id => _id;
  int get meetingId => _meetingId;
  int get userId => _userId;
  dynamic get userEmail => _userEmail;
  String get note => _note;
  User get user => _user;

  Note({
    int id,
    int meetingId,
    int userId,
    dynamic userEmail,
    String note,
    User user}){
    _id = id;
    _meetingId = meetingId;
    _userId = userId;
    _userEmail = userEmail;
    _note = note;
    _user = user;
  }

  Note.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _userId = json['user_id'];
    _userEmail = json['user_email'];
    _note = json['note'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['user_id'] = _userId;
    map['user_email'] = _userEmail;
    map['note'] = _note;
    if (_user != null) {
      map['user'] = _user.toJson();
    }
    return map;
  }

}


class Zoom {
  int _id;
  int _meetingId;
  int _zoomId;
  Online_data _onlineData;

  int get id => _id;
  int get meetingId => _meetingId;
  int get zoomId => _zoomId;
  Online_data get onlineData => _onlineData;

  Zoom({
    int id,
    int meetingId,
    int zoomId,
    Online_data onlineData}){
    _id = id;
    _meetingId = meetingId;
    _zoomId = zoomId;
    _onlineData = onlineData;
  }

  Zoom.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _zoomId = json['zoom_id'];
    _onlineData = json['online_data'] != null ? Online_data.fromJson(json['onlineData']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['zoom_id'] = _zoomId;
    if (_onlineData != null) {
      map['online_data'] = _onlineData.toJson();
    }
    return map;
  }

}

class Online_data {
  String _uuid;
  int _id;
  String _hostId;
  String _hostEmail;
  String _assistantId;
  String _topic;
  int _type;
  String _status;
  String _startTime;
  int _duration;
  String _timezone;
  String _agenda;
  String _createdAt;
  String _startUrl;
  String _joinUrl;
  String _password;
  String _h323Password;
  String _pstnPassword;
  String _encryptedPassword;
  Settings _settings;
  bool _preSchedule;
  int _startAt;

  String get uuid => _uuid;
  int get id => _id;
  String get hostId => _hostId;
  String get hostEmail => _hostEmail;
  String get assistantId => _assistantId;
  String get topic => _topic;
  int get type => _type;
  String get status => _status;
  String get startTime => _startTime;
  int get duration => _duration;
  String get timezone => _timezone;
  String get agenda => _agenda;
  String get createdAt => _createdAt;
  String get startUrl => _startUrl;
  String get joinUrl => _joinUrl;
  String get password => _password;
  String get h323Password => _h323Password;
  String get pstnPassword => _pstnPassword;
  String get encryptedPassword => _encryptedPassword;
  Settings get settings => _settings;
  bool get preSchedule => _preSchedule;
  int get startAt => _startAt;

  Online_data({
    String uuid,
    int id,
    String hostId,
    String hostEmail,
    String assistantId,
    String topic,
    int type,
    String status,
    String startTime,
    int duration,
    String timezone,
    String agenda,
    String createdAt,
    String startUrl,
    String joinUrl,
    String password,
    String h323Password,
    String pstnPassword,
    String encryptedPassword,
    Settings settings,
    bool preSchedule,
    int startAt}){
    _uuid = uuid;
    _id = id;
    _hostId = hostId;
    _hostEmail = hostEmail;
    _assistantId = assistantId;
    _topic = topic;
    _type = type;
    _status = status;
    _startTime = startTime;
    _duration = duration;
    _timezone = timezone;
    _agenda = agenda;
    _createdAt = createdAt;
    _startUrl = startUrl;
    _joinUrl = joinUrl;
    _password = password;
    _h323Password = h323Password;
    _pstnPassword = pstnPassword;
    _encryptedPassword = encryptedPassword;
    _settings = settings;
    _preSchedule = preSchedule;
    _startAt = startAt;
  }

  Online_data.fromJson(dynamic json) {
    _id = json==null?null:json['id'];
    _uuid = json==null?null:json['uuid'];
    _hostId =json==null?null: json['host_id'];
    _hostEmail = json==null?null:json['host_email'];
    _assistantId =json==null?null: json['assistant_id'];
    _topic = json==null?null:json['topic'];
    _type = json==null?null:json['type'];
    _status = json==null?null:json['status'];
    _startTime =json==null?null: json['start_time'];
    _duration =json==null?null: json['duration'];
    _timezone = json==null?null:json['timezone'];
    _agenda =json==null?null: json['agenda'];
    _createdAt = json==null?null:json['created_at'];
    _startUrl =json==null?null: json['start_url'];
    _joinUrl = json==null?null:json['join_url'];
    _password =json==null?null: json['password'];
    _h323Password =json==null?null: json['h323_password'];
    _pstnPassword =json==null?null: json['pstn_password'];
    _encryptedPassword = json==null?null:json['encrypted_password'];
    _settings = json==null?null:json['settings'] != null ? Settings.fromJson(json==null?null:json['settings']) : null;
    _preSchedule =json==null?null: json['pre_schedule'];
    _startAt = json==null?null:json['start_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['id'] = _id;
    map['host_id'] = _hostId;
    map['host_email'] = _hostEmail;
    map['assistant_id'] = _assistantId;
    map['topic'] = _topic;
    map['type'] = _type;
    map['status'] = _status;
    map['start_time'] = _startTime;
    map['duration'] = _duration;
    map['timezone'] = _timezone;
    map['agenda'] = _agenda;
    map['created_at'] = _createdAt;
    map['start_url'] = _startUrl;
    map['join_url'] = _joinUrl;
    map['password'] = _password;
    map['h323_password'] = _h323Password;
    map['pstn_password'] = _pstnPassword;
    map['encrypted_password'] = _encryptedPassword;
    if (_settings != null) {
      map['settings'] = _settings.toJson();
    }
    map['pre_schedule'] = _preSchedule;
    map['start_at'] = _startAt;
    return map;
  }

}


class Settings {
  bool _hostVideo;
  bool _participantVideo;
  bool _cnMeeting;
  bool _inMeeting;
  bool _joinBeforeHost;
  int _jbhTime;
  bool _muteUponEntry;
  bool _watermark;
  bool _usePmi;
  int _approvalType;
  String _audio;
  String _autoRecording;
  bool _enforceLogin;
  String _enforceLoginDomains;
  String _alternativeHosts;
  bool _closeRegistration;
  bool _showShareButton;
  bool _allowMultipleDevices;
  bool _registrantsConfirmationEmail;
  bool _waitingRoom;
  bool _requestPermissionToUnmuteParticipants;
  bool _registrantsEmailNotification;
  bool _meetingAuthentication;
  String _encryptionType;
  Approved_or_denied_countries_or_regions _approvedOrDeniedCountriesOrRegions;
  Breakout_room _breakoutRoom;
  bool _alternativeHostsEmailNotification;
  bool _deviceTesting;
  bool _focusMode;

  bool get hostVideo => _hostVideo;
  bool get participantVideo => _participantVideo;
  bool get cnMeeting => _cnMeeting;
  bool get inMeeting => _inMeeting;
  bool get joinBeforeHost => _joinBeforeHost;
  int get jbhTime => _jbhTime;
  bool get muteUponEntry => _muteUponEntry;
  bool get watermark => _watermark;
  bool get usePmi => _usePmi;
  int get approvalType => _approvalType;
  String get audio => _audio;
  String get autoRecording => _autoRecording;
  bool get enforceLogin => _enforceLogin;
  String get enforceLoginDomains => _enforceLoginDomains;
  String get alternativeHosts => _alternativeHosts;
  bool get closeRegistration => _closeRegistration;
  bool get showShareButton => _showShareButton;
  bool get allowMultipleDevices => _allowMultipleDevices;
  bool get registrantsConfirmationEmail => _registrantsConfirmationEmail;
  bool get waitingRoom => _waitingRoom;
  bool get requestPermissionToUnmuteParticipants => _requestPermissionToUnmuteParticipants;
  bool get registrantsEmailNotification => _registrantsEmailNotification;
  bool get meetingAuthentication => _meetingAuthentication;
  String get encryptionType => _encryptionType;
  Approved_or_denied_countries_or_regions get approvedOrDeniedCountriesOrRegions => _approvedOrDeniedCountriesOrRegions;
  Breakout_room get breakoutRoom => _breakoutRoom;
  bool get alternativeHostsEmailNotification => _alternativeHostsEmailNotification;
  bool get deviceTesting => _deviceTesting;
  bool get focusMode => _focusMode;

  Settings({
    bool hostVideo,
    bool participantVideo,
    bool cnMeeting,
    bool inMeeting,
    bool joinBeforeHost,
    int jbhTime,
    bool muteUponEntry,
    bool watermark,
    bool usePmi,
    int approvalType,
    String audio,
    String autoRecording,
    bool enforceLogin,
    String enforceLoginDomains,
    String alternativeHosts,
    bool closeRegistration,
    bool showShareButton,
    bool allowMultipleDevices,
    bool registrantsConfirmationEmail,
    bool waitingRoom,
    bool requestPermissionToUnmuteParticipants,
    bool registrantsEmailNotification,
    bool meetingAuthentication,
    String encryptionType,
    Approved_or_denied_countries_or_regions approvedOrDeniedCountriesOrRegions,
    Breakout_room breakoutRoom,
    bool alternativeHostsEmailNotification,
    bool deviceTesting,
    bool focusMode}){
    _hostVideo = hostVideo;
    _participantVideo = participantVideo;
    _cnMeeting = cnMeeting;
    _inMeeting = inMeeting;
    _joinBeforeHost = joinBeforeHost;
    _jbhTime = jbhTime;
    _muteUponEntry = muteUponEntry;
    _watermark = watermark;
    _usePmi = usePmi;
    _approvalType = approvalType;
    _audio = audio;
    _autoRecording = autoRecording;
    _enforceLogin = enforceLogin;
    _enforceLoginDomains = enforceLoginDomains;
    _alternativeHosts = alternativeHosts;
    _closeRegistration = closeRegistration;
    _showShareButton = showShareButton;
    _allowMultipleDevices = allowMultipleDevices;
    _registrantsConfirmationEmail = registrantsConfirmationEmail;
    _waitingRoom = waitingRoom;
    _requestPermissionToUnmuteParticipants = requestPermissionToUnmuteParticipants;
    _registrantsEmailNotification = registrantsEmailNotification;
    _meetingAuthentication = meetingAuthentication;
    _encryptionType = encryptionType;
    _approvedOrDeniedCountriesOrRegions = approvedOrDeniedCountriesOrRegions;
    _breakoutRoom = breakoutRoom;
    _alternativeHostsEmailNotification = alternativeHostsEmailNotification;
    _deviceTesting = deviceTesting;
    _focusMode = focusMode;
  }

  Settings.fromJson(dynamic json) {
    _hostVideo = json['host_video'];
    _participantVideo = json['participant_video'];
    _cnMeeting = json['cn_meeting'];
    _inMeeting = json['in_meeting'];
    _joinBeforeHost = json['join_before_host'];
    _jbhTime = json['jbh_time'];
    _muteUponEntry = json['mute_upon_entry'];
    _watermark = json['watermark'];
    _usePmi = json['use_pmi'];
    _approvalType = json['approval_type'];
    _audio = json['audio'];
    _autoRecording = json['auto_recording'];
    _enforceLogin = json['enforce_login'];
    _enforceLoginDomains = json['enforce_login_domains'];
    _alternativeHosts = json['alternative_hosts'];
    _closeRegistration = json['close_registration'];
    _showShareButton = json['show_share_button'];
    _allowMultipleDevices = json['allow_multiple_devices'];
    _registrantsConfirmationEmail = json['registrants_confirmation_email'];
    _waitingRoom = json['waiting_room'];
    _requestPermissionToUnmuteParticipants = json['request_permission_to_unmute_participants'];
    _registrantsEmailNotification = json['registrants_email_notification'];
    _meetingAuthentication = json['meeting_authentication'];
    _encryptionType = json['encryption_type'];
    _approvedOrDeniedCountriesOrRegions = json['approved_or_denied_countries_or_regions'] != null ? Approved_or_denied_countries_or_regions.fromJson(json['approvedOrDeniedCountriesOrRegions']) : null;
    _breakoutRoom = json['breakout_room'] != null ? Breakout_room.fromJson(json['breakoutRoom']) : null;
    _alternativeHostsEmailNotification = json['alternative_hosts_email_notification'];
    _deviceTesting = json['device_testing'];
    _focusMode = json['focus_mode'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['host_video'] = _hostVideo;
    map['participant_video'] = _participantVideo;
    map['cn_meeting'] = _cnMeeting;
    map['in_meeting'] = _inMeeting;
    map['join_before_host'] = _joinBeforeHost;
    map['jbh_time'] = _jbhTime;
    map['mute_upon_entry'] = _muteUponEntry;
    map['watermark'] = _watermark;
    map['use_pmi'] = _usePmi;
    map['approval_type'] = _approvalType;
    map['audio'] = _audio;
    map['auto_recording'] = _autoRecording;
    map['enforce_login'] = _enforceLogin;
    map['enforce_login_domains'] = _enforceLoginDomains;
    map['alternative_hosts'] = _alternativeHosts;
    map['close_registration'] = _closeRegistration;
    map['show_share_button'] = _showShareButton;
    map['allow_multiple_devices'] = _allowMultipleDevices;
    map['registrants_confirmation_email'] = _registrantsConfirmationEmail;
    map['waiting_room'] = _waitingRoom;
    map['request_permission_to_unmute_participants'] = _requestPermissionToUnmuteParticipants;
    map['registrants_email_notification'] = _registrantsEmailNotification;
    map['meeting_authentication'] = _meetingAuthentication;
    map['encryption_type'] = _encryptionType;
    if (_approvedOrDeniedCountriesOrRegions != null) {
      map['approved_or_denied_countries_or_regions'] = _approvedOrDeniedCountriesOrRegions.toJson();
    }
    if (_breakoutRoom != null) {
      map['breakout_room'] = _breakoutRoom.toJson();
    }
    map['alternative_hosts_email_notification'] = _alternativeHostsEmailNotification;
    map['device_testing'] = _deviceTesting;
    map['focus_mode'] = _focusMode;
    return map;
  }

}


class Breakout_room {
  bool _enable;

  bool get enable => _enable;

  Breakout_room({
    bool enable}){
    _enable = enable;
  }

  Breakout_room.fromJson(dynamic json) {
    _enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['enable'] = _enable;
    return map;
  }

}


class Approved_or_denied_countries_or_regions {
  bool _enable;

  bool get enable => _enable;

  Approved_or_denied_countries_or_regions({
    bool enable}){
    _enable = enable;
  }

  Approved_or_denied_countries_or_regions.fromJson(dynamic json) {
    _enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['enable'] = _enable;
    return map;
  }

}

class MeetingDetailsResponseModelActivities {
  int _id;
  int _meetingId;
  int _userId;
  String _activity;

  int get id => _id;
  int get meetingId => _meetingId;
  int get userId => _userId;
  String get activity => _activity;

  MeetingDetailsResponseModelActivities({
    int id,
    int meetingId,
    int userId,
    String activity}){
    _id = id;
    _meetingId = meetingId;
    _userId = userId;
    _activity = activity;
  }

  MeetingDetailsResponseModelActivities.fromJson(dynamic json) {
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

class MeetingDetailsResponseModelMembers {
  int _id;
  int _meetingId;
  int _userId;
  String _userEmail;
  int _canEdit;
  String _attendanceStatus;
  String _statusReason;
  User _user;
  String _type;

  int get id => _id;
  int get meetingId => _meetingId;
  int get userId => _userId;
  String get userEmail => _userEmail;
  int get canEdit => _canEdit;
  String get attendanceStatus => _attendanceStatus;
  String get statusReason => _statusReason;
  User get user => _user;
  String get type => _type;

  MeetingDetailsResponseModelMembers({
    int id,
    int meetingId,
    int userId,
    String userEmail,
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

  MeetingDetailsResponseModelMembers.fromJson(dynamic json) {
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

class Agendas {
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

  Agendas({
    int id,
    int meetingId,
    String agendaType,
    int agendaTypeId,
    int order,
    String createdAt,
    String updatedAt,
    List<AgendasData> data}){
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

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
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

class AgendasData {
  int _index;
  int _id;
  int _meetingId;
  int _creatorId;
  String _title;
  int _duration;
  String _description;
  String _open_till;
  String _deadline;
  String _stauss;
  String _actionStauss;
  int _order;
  List<MeetingDetailsResponseModelSubpoints> _subpoints;
  List<MeetingDetailsResponseModelMembersPresenters> _presenters;
  List<Viewers> _viewers;
  List<MeetingDetailsResponseModelMembersAttachments> _attachments;
  List<Comments> _comments;
  List<Voters> _voters;
  List<Participants> _participants;
  List<MeetingDetailsResponseModelDecisions> _decisions;


  set setStauss(String value) {
    _stauss = value;
  }
  set setActionStauss(String value) {
    _actionStauss = value;
  }


  set setIndex(int value) {
    _index = value;
  }

  int get index =>  _index;
  int get id => _id;
  int get meetingId => _meetingId;
  int get creatorId => _creatorId;
  String get title => _title;
  int get duration => _duration;
  String get description => _description;
  String get open_till => _open_till;
  String get deadline => _deadline;
  String get stauss => _stauss;
  String get actionStauss => _actionStauss;
  int get order => _order;
  List<MeetingDetailsResponseModelSubpoints> get subpoints => _subpoints;
  List<MeetingDetailsResponseModelMembersPresenters> get presenters => _presenters;
  List<Viewers> get viewers => _viewers;
  List<MeetingDetailsResponseModelMembersAttachments> get attachments => _attachments;
  List<Comments> get comments => _comments;
  List<Voters> get voters => _voters;
  List<Participants> get participants => _participants;
  List<MeetingDetailsResponseModelDecisions> get decisions => _decisions;

  AgendasData({
    int index,
    int id,
    int meetingId,
    int creatorId,
    String title,
    int duration,
    String description,
    String open_till,
    String deadline,
    String stauss,
    int order,
    List<MeetingDetailsResponseModelSubpoints> subpoints,
    List<MeetingDetailsResponseModelMembersPresenters> presenters,
    List<Viewers> viewers,
    List<MeetingDetailsResponseModelMembersAttachments> attachments,
    List<Comments> comments,
  List<Voters> voters,
  List<Participants> participants,
  List<MeetingDetailsResponseModelDecisions> decisions,
  }){
    _index = index;
    _id = id;
    _meetingId = meetingId;
    _creatorId = creatorId;
    _title = title;
    _duration = duration;
    _description = description;
    _open_till = open_till;
    _deadline = deadline;
    _stauss = stauss;
    _order = order;
    _subpoints = subpoints;
    _presenters = presenters;
    _viewers = viewers;
    _attachments = attachments;
    _comments = comments;
    _voters = voters;
    _participants = participants;
    _decisions = decisions;
  }

  AgendasData.fromJson(dynamic json) {
    _id = json['id'];
    _meetingId = json['meeting_id'];
    _creatorId = json['creator_id'];
    _title = json['title'];
    _duration = json['duration'];
    _description = json['description'];
    _open_till = json['open_till'];
    _stauss = json['stauss'];
    _deadline = json['deadline'];
    _order = json['order'];
    if (json['subpoints'] != null) {
      _subpoints = [];
      json['subpoints'].forEach((v) {
        _subpoints.add(MeetingDetailsResponseModelSubpoints.fromJson(v));
      });
    }
    if (json['presenters'] != null) {
      _presenters = [];
      json['presenters'].forEach((v) {
        _presenters.add(MeetingDetailsResponseModelMembersPresenters.fromJson(v));
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
    if (json['participants'] != null) {
      _participants = [];
      json['participants'].forEach((v) {
        _participants.add(Participants.fromJson(v));
      });
    }

    if (json['decision'] != null) {
      _decisions = [];
      json['decision'].forEach((v) {
        _decisions.add(MeetingDetailsResponseModelDecisions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['meeting_id'] = _meetingId;
    map['creator_id'] = _creatorId;
    map['title'] = _title;
    map['duration'] = _duration;
    map['description'] = _description;
    map['open_till'] = _open_till;
    map['deadline'] = _deadline;
    map['order'] = _order;
    map['stauss'] =_stauss;
    if (_subpoints != null) {
      map['subpoints'] = _subpoints.map((v) => v.toJson()).toList();
    }
    if (_presenters != null) {
      map['presenters'] = _presenters.map((v) => v.toJson()).toList();
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
    if (_voters != null) {
      map['voters'] = _voters.map((v) => v.toJson()).toList();
    }
    if (_participants != null) {
      map['participants'] = _participants.map((v) => v.toJson()).toList();
    }
    if (_decisions != null) {
      map['decision'] = _decisions.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

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
  String _position;
  String _teamName;
  String _roleName;
  // Committee _committee;
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
  String get position => _position;
  String get teamName => _teamName;
  String get roleName => _roleName;
  // Committee get committee => _committee;
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
    String position,
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
    // _committee = committee;
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
    // _committee = json['committee'] != null ? Committee.fromJson(json['committee']) : null;
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
    // if (_committee != null) {
    //   map['committee'] = _committee.toJson();
    // }
    if (_role != null) {
      map['role'] = _role.toJson();
    }
    return map;
  }

}


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


class Admins {
  int _id;
  String _name;
  String _email;
  String _image;
  String _teamName;
  String _roleName;
  Pivot _pivot;
  List<Committee> _committee;
  Role _role;

  int get id => _id;
  String get name => _name;
  String get email => _email;
  String get image => _image;
  String get teamName => _teamName;
  String get roleName => _roleName;
  Pivot get pivot => _pivot;
  List<Committee> get committee => _committee;
  Role get role => _role;

  Admins({
    int id,
    String name,
    String email,
    String image,
    String teamName,
    String roleName,
    Pivot pivot,
    List<Committee> committee,
    Role role}){
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
    // _committee = json['committee'];
    // if (json['committee'] != null) {
    //   _committee = [];
    //   json['committee'].forEach((v) {
    //     _committee.add(Committee.fromJson(v));
    //   });
    // }
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['image'] = _image;
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    if (_pivot != null) {
      map['pivot'] = _pivot.toJson();
    }
    // map['committee'] = _committee;
    if (_committee != null) {
      map['committee'] = _committee.map((v) => v.toJson()).toList();
    }
    map['role'] = _role;
    return map;
  }

}


class Pivot {
  int _committeeId;
  int _userId;

  int get committeeId => _committeeId;
  int get userId => _userId;

  Pivot({
    int committeeId,
    int userId}){
    _committeeId = committeeId;
    _userId = userId;
  }

  Pivot.fromJson(dynamic json) {
    _committeeId = json['committee_id'];
    _userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['committee_id'] = _committeeId;
    map['user_id'] = _userId;
    return map;
  }

}


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


class Current_member {
  int _id;
  int _meetingId;
  int _userId;
  String _userEmail;
  int _canEdit;
  String _attendanceStatus;
  String _statusReason;
  User _user;
  String _type;

  int get id => _id;
  int get meetingId => _meetingId;
  int get userId => _userId;
  String get userEmail => _userEmail;
  int get canEdit => _canEdit;
  String get attendanceStatus => _attendanceStatus;
  String get statusReason => _statusReason;
  User get user => _user;
  String get type => _type;

  Current_member({
    int id,
    int meetingId,
    int userId,
    String userEmail,
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

  Current_member.fromJson(dynamic json) {
    _id = json==null?null:json['id'];
    _meetingId = json==null?null:json['meeting_id'];
    _userId = json==null?null:json['user_id'];
    _userEmail = json==null?null:json['user_email'];
    _canEdit =json==null?null: json['can_edit'];
    _attendanceStatus = json==null?null:json['attendance_status'];
    _statusReason = json==null?null:json['status_reason'];
    _user =json==null?null: json['user'] != null ? User.fromJson(json['user']) : null;
    _type = json==null?null:json['type'];
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


