/// title : "test"
/// description : "test description here"
/// start_date : "2021-09-22 16:00"
/// committee_id : "1"
/// duration : "90"
/// virtual : 0
/// location : ""

class AddMeetingRequestModel {
  String _title;
  String _description;
  String _startDate;
  String _committeeId;
  String _duration;
  int _virtual;
  String _location;

  String get title => _title;
  String get description => _description;
  String get startDate => _startDate;
  String get committeeId => _committeeId;
  String get duration => _duration;
  int get virtual => _virtual;
  String get location => _location;

  AddMeetingRequestModel({
      String title, 
      String description, 
      String startDate, 
      String committeeId, 
      String duration, 
      int virtual, 
      String location}){
    _title = title;
    _description = description;
    _startDate = startDate;
    _committeeId = committeeId;
    _duration = duration;
    _virtual = virtual;
    _location = location;
}

  AddMeetingRequestModel.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _startDate = json['start_date'];
    _committeeId = json['committee_id'];
    _duration = json['duration'];
    _virtual = json['virtual'];
    _location = json['location'];
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
    return map;
  }

}