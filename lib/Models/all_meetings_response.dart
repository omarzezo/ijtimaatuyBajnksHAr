import 'dart:convert';

AllMeetingsResponse allMeetingsResponseFromJson(String str) => AllMeetingsResponse.fromJson(json.decode(str));
String allMeetingsResponseToJson(AllMeetingsResponse data) => json.encode(data.toJson());
class AllMeetingsResponse {
  AllMeetingsResponse({
      int currentPage,
      List<AllMeetingsResponseData> data,
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

  AllMeetingsResponse.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data.add(AllMeetingsResponseData.fromJson(v));
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
  List<AllMeetingsResponseData> _data;
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
  List<AllMeetingsResponseData> get data => _data;
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

Links linksFromJson(String str) => Links.fromJson(json.decode(str));
String linksToJson(Links data) => json.encode(data.toJson());
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

/// id : 631
/// title : "Voluptate sit est e"
/// owner_id : 21
/// committee_id : 3
/// description : "Soluta sit illo null"
/// start_date : "2022-11-09 19:23:00"
/// duration : 60
/// location : "Muscat- Ghala"
/// meeting_status_id : 2
/// virtual : 0
/// updated_at : "2022-08-31T17:28:52.000000Z"
/// order : "TalkingPoints,Decisions,Actions"
/// virtual_type : null
/// mom : null
/// mom_settings : null
/// mom_conclusion : null
/// library_id : null
/// attendance_status : "Pending"
/// last_activity : "Ahmed ALReesi Update talking point Aut voluptatem Nam d 2022-10-08 1:11 AM"
/// current_member : {"id":5386,"meeting_id":631,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}
/// status : {"id":2,"name":"Scheduled","bgcolor":"#fff7e6","color":"#dda77b"}
/// owner : {"id":21,"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","updated_at":"2022-10-08T21:14:26.000000Z","role_id":1,"phone":"7892343434","birthdate":"2000-08-22","team":3,"image":"https://testing.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","status":1,"position":"cyber Security","two_auth":"1","verification_code":null,"signature":"uploads/approvals/GEQeI7Hv7X.png","deleted":"0","team_name":"Ijtimaati Team","role_name":"Admins","committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}},{"id":4,"name":"Jermaine Ruiz","description":"Fuga Nulla ea id ra","created_at":"2021-09-13T16:45:58.000000Z","updated_at":"2021-10-31T06:01:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":4}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-17T18:28:05.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":8}},{"id":23,"name":"IT Team","description":"Ijtimaati","created_at":"2021-10-31T07:30:08.000000Z","updated_at":"2022-02-03T13:17:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":23}},{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":34}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":37}},{"id":39,"name":"Ahmed Committee","description":"This is test","created_at":"2022-03-17T08:54:42.000000Z","updated_at":"2022-03-17T08:54:42.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":39}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":40}}],"role":{"id":1,"name":"Admins","slug":"Admins","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2022-04-05T05:48:25.000000Z","status":"1"}}
/// committee : {"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1"}
/// members : [{"id":5366,"meeting_id":631,"user_id":3,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"saeed saleh","email":"said.sale7@gmail.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5386,"meeting_id":631,"user_id":21,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5387,"meeting_id":631,"user_id":26,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Omar Abdelaziz","email":"zezoomar674@yahoo.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/GwvmPMsKbi.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5367,"meeting_id":631,"user_id":31,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Maryam AL Rasbi","email":"Maryam@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5388,"meeting_id":631,"user_id":35,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mazin F","email":"mazin@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/TWw0WsjDCY.xlsx","position":"IT Support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5368,"meeting_id":631,"user_id":38,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Hilal","email":"hilal@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/koU0KGKcAO.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5369,"meeting_id":631,"user_id":45,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Mr. Abdulaziz","email":"abdulaziz@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/jdNrfSL35P.png","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5370,"meeting_id":631,"user_id":59,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","position":"sales specialist","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5371,"meeting_id":631,"user_id":60,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Rayah Al Rasbi","email":"rayah@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5372,"meeting_id":631,"user_id":71,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Abeer Al Rawahi","email":"abeer@ijtimaati.com","image":null,"position":"Sales Account Manager","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5373,"meeting_id":631,"user_id":75,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5374,"meeting_id":631,"user_id":80,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Clariza Vale","email":"clariza@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/IMRRJEPsXj.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5375,"meeting_id":631,"user_id":81,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Waleed","email":"waleed@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5376,"meeting_id":631,"user_id":83,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"andullah","email":"abdullah@globcom-oman.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5377,"meeting_id":631,"user_id":85,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Qusai Mohammed","email":"qusai@ijtimaati.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5378,"meeting_id":631,"user_id":86,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Marwa Al Rawahi","email":"marwa@gcntoman.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/OjSEgHljVF.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5379,"meeting_id":631,"user_id":87,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"mhmood","email":"m.bakr@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/SZoXRjKD05.jpg","position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5380,"meeting_id":631,"user_id":98,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ahmed test","email":"ahm.z.942@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5381,"meeting_id":631,"user_id":103,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Joury","email":"hmz.942@gmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5389,"meeting_id":631,"user_id":104,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"amani alafari","email":"amani@ijtimaati.com","image":null,"position":"Project Coordinator","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5390,"meeting_id":631,"user_id":105,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Dhakara","email":"dhakara-93@outlook.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5382,"meeting_id":631,"user_id":106,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Thththaaa","email":"Thththaaa@hotmail.com","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5391,"meeting_id":631,"user_id":107,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"jamila","email":"jamila@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","position":"IT","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5383,"meeting_id":631,"user_id":109,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"position":null,"team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5384,"meeting_id":631,"user_id":114,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Reem AlZaabi","email":"reem.zaabi@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/h0s2SJNcf8.jfif","position":"support","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"},{"id":5385,"meeting_id":631,"user_id":120,"user_email":"","can_edit":0,"attendance_status":"Pending","status_reason":null,"token":null,"user":{"name":"Ayman","email":"AymanZaky2008@hotmail.com","image":null,"position":"QC Test Team Lead","team_name":"","role_name":"","committee":[],"role":null},"type":"Viewer"}]
/// admins : [{"id":3,"name":"saeed saleh","email":"said.sale7@gmail.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png","team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":3},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":3,"committee_id":3}},{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":3,"committee_id":30}}],"role":null},{"id":21,"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":21},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":3}},{"id":4,"name":"Jermaine Ruiz","description":"Fuga Nulla ea id ra","created_at":"2021-09-13T16:45:58.000000Z","updated_at":"2021-10-31T06:01:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":4}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-17T18:28:05.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":8}},{"id":23,"name":"IT Team","description":"Ijtimaati","created_at":"2021-10-31T07:30:08.000000Z","updated_at":"2022-02-03T13:17:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":23}},{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":34}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":37}},{"id":39,"name":"Ahmed Committee","description":"This is test","created_at":"2022-03-17T08:54:42.000000Z","updated_at":"2022-03-17T08:54:42.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":39}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":21,"committee_id":40}}],"role":null},{"id":26,"name":"Omar Abdelaziz","email":"zezoomar674@yahoo.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/GwvmPMsKbi.png","team_name":"Jermaine Ruiz","role_name":"","pivot":{"committee_id":3,"user_id":26},"committee":[{"id":4,"name":"Jermaine Ruiz","description":"Fuga Nulla ea id ra","created_at":"2021-09-13T16:45:58.000000Z","updated_at":"2021-10-31T06:01:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":26,"committee_id":4}},{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":26,"committee_id":30}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":26,"committee_id":40}}],"role":null},{"id":35,"name":"Mazin F","email":"mazin@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/TWw0WsjDCY.xlsx","team_name":"Jermaine Ruiz","role_name":"","pivot":{"committee_id":3,"user_id":35},"committee":[{"id":4,"name":"Jermaine Ruiz","description":"Fuga Nulla ea id ra","created_at":"2021-09-13T16:45:58.000000Z","updated_at":"2021-10-31T06:01:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":4}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-17T18:28:05.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":8}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":34}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":37}},{"id":39,"name":"Ahmed Committee","description":"This is test","created_at":"2022-03-17T08:54:42.000000Z","updated_at":"2022-03-17T08:54:42.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":39}},{"id":43,"name":"رؤية عمان 2040","description":"","created_at":"2022-04-03T04:50:24.000000Z","updated_at":"2022-04-03T04:50:24.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":43}},{"id":44,"name":"Only for testing","description":"in order to test all the functions well","created_at":"2022-06-14T10:39:53.000000Z","updated_at":"2022-06-14T10:39:53.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":35,"committee_id":44}}],"role":null},{"id":59,"name":"Abdullah alnaaimi","email":"abdullah@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/FuOfH87Gzn.png","team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":59},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":59,"committee_id":3}}],"role":null},{"id":71,"name":"Abeer Al Rawahi","email":"abeer@ijtimaati.com","image":null,"team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":71},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":71,"committee_id":3}}],"role":null},{"id":75,"name":"Zainab Al- Ajmi","email":"zainab@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/9jVzyIc1QF.jpg","team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":75},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":3}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":37}},{"id":41,"name":"sales2","description":"_","created_at":"2022-03-23T08:23:21.000000Z","updated_at":"2022-03-23T08:23:21.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":41}},{"id":43,"name":"رؤية عمان 2040","description":"","created_at":"2022-04-03T04:50:24.000000Z","updated_at":"2022-04-03T04:50:24.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":75,"committee_id":43}}],"role":null},{"id":86,"name":"Marwa Al Rawahi","email":"marwa@gcntoman.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/OjSEgHljVF.jpg","team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":86},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":86,"committee_id":3}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":86,"committee_id":40}}],"role":null},{"id":87,"name":"mhmood","email":"m.bakr@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/SZoXRjKD05.jpg","team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":87},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":87,"committee_id":3}},{"id":4,"name":"Jermaine Ruiz","description":"Fuga Nulla ea id ra","created_at":"2021-09-13T16:45:58.000000Z","updated_at":"2021-10-31T06:01:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":87,"committee_id":4}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-17T18:28:05.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":87,"committee_id":8}},{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":87,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":87,"committee_id":34}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":87,"committee_id":37}}],"role":null},{"id":104,"name":"amani alafari","email":"amani@ijtimaati.com","image":null,"team_name":"Ahmed","role_name":"","pivot":{"committee_id":3,"user_id":104},"committee":[{"id":55,"name":"Ahmed","description":"","created_at":"2022-10-07T21:18:43.000000Z","updated_at":"2022-10-07T21:18:43.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":104,"committee_id":55}}],"role":null},{"id":105,"name":"Dhakara","email":"dhakara-93@outlook.com","image":null,"team_name":"","role_name":"","pivot":{"committee_id":3,"user_id":105},"committee":[],"role":null},{"id":106,"name":"Thththaaa","email":"Thththaaa@hotmail.com","image":null,"team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":106},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":106,"committee_id":3}}],"role":null},{"id":107,"name":"jamila","email":"jamila@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/Z7UxNbpDWj.jpg","team_name":"","role_name":"","pivot":{"committee_id":3,"user_id":107},"committee":[],"role":null},{"id":109,"name":"ee361932141a@moakt.ws","email":"ee361932141a@moakt.ws","image":null,"team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":109},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":109,"committee_id":3}},{"id":4,"name":"Jermaine Ruiz","description":"Fuga Nulla ea id ra","created_at":"2021-09-13T16:45:58.000000Z","updated_at":"2021-10-31T06:01:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":109,"committee_id":4}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-17T18:28:05.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":109,"committee_id":8}},{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":109,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":109,"committee_id":34}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":109,"committee_id":37}},{"id":39,"name":"Ahmed Committee","description":"This is test","created_at":"2022-03-17T08:54:42.000000Z","updated_at":"2022-03-17T08:54:42.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":109,"committee_id":39}}],"role":null},{"id":120,"name":"Ayman","email":"AymanZaky2008@hotmail.com","image":null,"team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":120},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":120,"committee_id":3}},{"id":4,"name":"Jermaine Ruiz","description":"Fuga Nulla ea id ra","created_at":"2021-09-13T16:45:58.000000Z","updated_at":"2021-10-31T06:01:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":120,"committee_id":4}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-17T18:28:05.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":120,"committee_id":8}},{"id":23,"name":"IT Team","description":"Ijtimaati","created_at":"2021-10-31T07:30:08.000000Z","updated_at":"2022-02-03T13:17:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":120,"committee_id":23}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":120,"committee_id":34}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":120,"committee_id":36}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":120,"committee_id":40}}],"role":null},{"id":123,"name":"nojywox","email":"yaserabusamra@teml.net","image":null,"team_name":"Ijtimaati Team","role_name":"","pivot":{"committee_id":3,"user_id":123},"committee":[{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":123,"committee_id":3}},{"id":4,"name":"Jermaine Ruiz","description":"Fuga Nulla ea id ra","created_at":"2021-09-13T16:45:58.000000Z","updated_at":"2021-10-31T06:01:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":123,"committee_id":4}},{"id":8,"name":"Ijtimaati","description":"This is test","created_at":"2021-09-26T07:50:11.000000Z","updated_at":"2022-01-17T18:28:05.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":123,"committee_id":8}},{"id":23,"name":"IT Team","description":"Ijtimaati","created_at":"2021-10-31T07:30:08.000000Z","updated_at":"2022-02-03T13:17:51.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":123,"committee_id":23}},{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":123,"committee_id":30}},{"id":34,"name":"Executive Committee","description":"","created_at":"2022-02-19T15:28:25.000000Z","updated_at":"2022-02-19T15:28:25.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":123,"committee_id":34}},{"id":36,"name":"Board Committee","description":"","created_at":"2022-03-10T06:36:00.000000Z","updated_at":"2022-03-10T06:36:00.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":123,"committee_id":36}},{"id":37,"name":"sales committee","description":"","created_at":"2022-03-13T05:03:22.000000Z","updated_at":"2022-03-23T08:10:30.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":123,"committee_id":37}},{"id":39,"name":"Ahmed Committee","description":"This is test","created_at":"2022-03-17T08:54:42.000000Z","updated_at":"2022-03-17T08:54:42.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":123,"committee_id":39}},{"id":40,"name":"لجنة التحول الرقمي","description":"لجمة مختصة بتطوير البرامج المستخدمة فس الموؤسسات","created_at":"2022-03-21T05:10:29.000000Z","updated_at":"2022-03-21T05:10:29.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":123,"committee_id":40}}],"role":null}]

AllMeetingsResponseData dataFromJson(String str) => AllMeetingsResponseData.fromJson(json.decode(str));
String dataToJson(AllMeetingsResponseData data) => json.encode(data.toJson());
class AllMeetingsResponseData {
  AllMeetingsResponseData({
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
      String updatedAt, 
      String order, 
      dynamic virtualType, 
      dynamic mom, 
      dynamic momSettings, 
      dynamic momConclusion, 
      dynamic libraryId, 
      String attendanceStatus, 
      String lastActivity, 
      CurrentMember currentMember, 
      Status status, 
      Owner owner, 
      Committee committee, 
      List<MembersInAllMeeting> members,
      List<Admins> admins,}){
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
    _updatedAt = updatedAt;
    _order = order;
    _virtualType = virtualType;
    _mom = mom;
    _momSettings = momSettings;
    _momConclusion = momConclusion;
    _libraryId = libraryId;
    _attendanceStatus = attendanceStatus;
    _lastActivity = lastActivity;
    _currentMember = currentMember;
    _status = status;
    _owner = owner;
    _committee = committee;
    _members = members;
    _admins = admins;
}

  AllMeetingsResponseData.fromJson(dynamic json) {
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
    _updatedAt = json['updated_at'];
    _order = json['order'];
    _virtualType = json['virtual_type'];
    _mom = json['mom'];
    _momSettings = json['mom_settings'];
    _momConclusion = json['mom_conclusion'];
    _libraryId = json['library_id'];
    _attendanceStatus = json['attendance_status'];
    _lastActivity = json['last_activity'];
    _currentMember = json['current_member'] != null ? CurrentMember.fromJson(json['current_member']) : null;
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    _committee = json['committee'] != null ? Committee.fromJson(json['committee']) : null;
    if (json['members'] != null) {
      _members = [];
      json['members'].forEach((v) {
        _members.add(MembersInAllMeeting.fromJson(v));
      });
    }
    if (json['admins'] != null) {
      _admins = [];
      json['admins'].forEach((v) {
        _admins.add(Admins.fromJson(v));
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
  String _updatedAt;
  String _order;
  dynamic _virtualType;
  dynamic _mom;
  dynamic _momSettings;
  dynamic _momConclusion;
  dynamic _libraryId;
  String _attendanceStatus;
  String _lastActivity;
  CurrentMember _currentMember;
  Status _status;
  Owner _owner;
  Committee _committee;
  List<MembersInAllMeeting> _members;
  List<Admins> _admins;

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
  String get updatedAt => _updatedAt;
  String get order => _order;
  dynamic get virtualType => _virtualType;
  dynamic get mom => _mom;
  dynamic get momSettings => _momSettings;
  dynamic get momConclusion => _momConclusion;
  dynamic get libraryId => _libraryId;
  String get attendanceStatus => _attendanceStatus;
  String get lastActivity => _lastActivity;
  CurrentMember get currentMember => _currentMember;
  Status get status => _status;
  Owner get owner => _owner;
  Committee get committee => _committee;
  List<MembersInAllMeeting> get members => _members;
  List<Admins> get admins => _admins;

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
    map['updated_at'] = _updatedAt;
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
    if (_status != null) {
      map['status'] = _status.toJson();
    }
    if (_owner != null) {
      map['owner'] = _owner.toJson();
    }
    if (_committee != null) {
      map['committee'] = _committee.toJson();
    }
    if (_members != null) {
      map['members'] = _members.map((v) => v.toJson()).toList();
    }
    if (_admins != null) {
      map['admins'] = _admins.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// name : "saeed saleh"
/// email : "said.sale7@gmail.com"
/// image : "https://testing.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png"
/// team_name : "Ijtimaati Team"
/// role_name : ""
/// pivot : {"committee_id":3,"user_id":3}
/// committee : [{"id":3,"name":"Ijtimaati Team","description":"This is Ijtimaati team","created_at":"2021-09-12T20:48:40.000000Z","updated_at":"2021-11-01T19:33:28.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":3,"committee_id":3}},{"id":30,"name":"mesoft","description":"this committee is responsible for testing the applicatiuon","created_at":"2022-01-24T07:39:57.000000Z","updated_at":"2022-06-21T10:34:31.000000Z","deleted_at":null,"status":"1","pivot":{"user_id":3,"committee_id":30}}]
/// role : null

Admins adminsFromJson(String str) => Admins.fromJson(json.decode(str));
String adminsToJson(Admins data) => json.encode(data.toJson());
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

/// id : 3
/// name : "Ijtimaati Team"
/// description : "This is Ijtimaati team"
/// created_at : "2021-09-12T20:48:40.000000Z"
/// updated_at : "2021-11-01T19:33:28.000000Z"
/// deleted_at : null
/// status : "1"
/// pivot : {"user_id":3,"committee_id":3}

Committee committeeFromJson(String str) => Committee.fromJson(json.decode(str));
String committeeToJson(Committee data) => json.encode(data.toJson());
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

/// user_id : 3
/// committee_id : 3

Pivot pivotFromJson(String str) => Pivot.fromJson(json.decode(str));
String pivotToJson(Pivot data) => json.encode(data.toJson());
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



MembersInAllMeeting membersFromJson(String str) => MembersInAllMeeting.fromJson(json.decode(str));
String membersToJson(MembersInAllMeeting data) => json.encode(data.toJson());
class MembersInAllMeeting {
  MembersInAllMeeting({
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

  MembersInAllMeeting.fromJson(dynamic json) {
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

/// name : "saeed saleh"
/// email : "said.sale7@gmail.com"
/// image : "https://testing.ijtimaati.com/api/public/uploads/images/oNBWLjycUr.png"
/// position : null
/// team_name : ""
/// role_name : ""
/// committee : []
/// role : null

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String name, 
      String email, 
      String image, 
      dynamic position, 
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
  dynamic _position;
  String _teamName;
  String _roleName;
  List<Committee> _committee;
  dynamic _role;

  String get name => _name;
  String get email => _email;
  String get image => _image;
  dynamic get position => _position;
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

Owner ownerFromJson(String str) => Owner.fromJson(json.decode(str));
String ownerToJson(Owner data) => json.encode(data.toJson());
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
      String deleted, 
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
    _deleted = deleted;
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
    _deleted = json['deleted'];
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
  String _deleted;
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
  String get deleted => _deleted;
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
    map['deleted'] = _deleted;
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
/// name : "Admins"
/// slug : "Admins"
/// created_at : "2021-09-12T17:52:27.000000Z"
/// updated_at : "2022-04-05T05:48:25.000000Z"
/// status : "1"

Role roleFromJson(String str) => Role.fromJson(json.decode(str));
String roleToJson(Role data) => json.encode(data.toJson());
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



Status statusFromJson(String str) => Status.fromJson(json.decode(str));
String statusToJson(Status data) => json.encode(data.toJson());
class Status {
  Status({
      int id, 
      String name, 
      String bgcolor, 
      String color,}){
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['bgcolor'] = _bgcolor;
    map['color'] = _color;
    return map;
  }

}

/// id : 5386
/// meeting_id : 631
/// user_id : 21
/// user_email : ""
/// can_edit : 0
/// attendance_status : "Pending"
/// status_reason : null
/// token : null
/// user : {"name":"Ahmed ALReesi","email":"Ahmed@ijtimaati.com","image":"https://testing.ijtimaati.com/api/public/uploads/images/pGboWO5qTt.png","position":"cyber Security","team_name":"","role_name":"","committee":[],"role":null}
/// type : "Viewer"

CurrentMember currentMemberFromJson(String str) => CurrentMember.fromJson(json.decode(str));
String currentMemberToJson(CurrentMember data) => json.encode(data.toJson());
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
