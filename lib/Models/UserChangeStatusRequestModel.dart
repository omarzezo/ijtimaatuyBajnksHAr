/// status : "Not going"
/// reason : "knnknk"

class UserChangeStatusRequestModel {
  String _status;
  String _reason;

  String get status => _status;
  String get reason => _reason;

  UserChangeStatusRequestModel({
      String status, 
      String reason}){
    _status = status;
    _reason = reason;
}

  UserChangeStatusRequestModel.fromJson(dynamic json) {
    _status = json['status'];
    _reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['reason'] = _reason;
    return map;
  }

}