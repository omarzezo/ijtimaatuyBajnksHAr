class OfflineDataLocalModel {
  int id;
  String url;
  String dashboard;
  String allMeetings;
  String allMeetingsDashboard;
  String allMeetingsDetails;
  String profile;
  String news;
  String newsDetails;
  String talkingPoint;
  String decision;
  String action;

  OfflineDataLocalModel({this.url,this.dashboard,this.talkingPoint,this.decision,this.action,this.allMeetingsDashboard,this.allMeetings,this.allMeetingsDetails, this.profile,this.news,this.newsDetails});
  OfflineDataLocalModel.withId({this.id,this.url,this.dashboard,this.talkingPoint,this.decision,this.action,this.allMeetingsDashboard,this.allMeetings,this.allMeetingsDetails, this.profile,this.news,this.newsDetails});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["url"] = url;
    map["dashboard"] = dashboard;
    map["allMeetings"] = allMeetings;
    map["allMeetingsDashboard"] = allMeetingsDashboard;
    map["allMeetingsDetails"] = allMeetingsDetails;
    map["profile"] = profile;
    map["news"] = news;
    map["newsDetails"] = newsDetails;
    map["talkingPoint"] = talkingPoint;
    map["decision"] = decision;
    map["action"] = action;
    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  OfflineDataLocalModel.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString());
    this.url = o["url"];
    this.dashboard = o["dashboard"];
    this.allMeetingsDashboard = o["allMeetingsDashboard"];
    this.allMeetings = o["allMeetings"];
    this.allMeetingsDetails = o["allMeetingsDetails"];
    this.profile = o["profile"];
    this.news = o["news"];
    this.newsDetails = o["newsDetails"];
    this.talkingPoint = o["talkingPoint"];
    this.decision = o["decision"];
    this.action = o["action"];
  }
}
