/// meeting_status_id : 2

class ChangeMeetingStatusRequestModel {
  int _meetingStatusId;

  int get meetingStatusId => _meetingStatusId;

  ChangeMeetingStatusRequestModel({
      int meetingStatusId}){
    _meetingStatusId = meetingStatusId;
}

  ChangeMeetingStatusRequestModel.fromJson(dynamic json) {
    _meetingStatusId = json['meeting_status_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['meeting_status_id'] = _meetingStatusId;
    return map;
  }

}