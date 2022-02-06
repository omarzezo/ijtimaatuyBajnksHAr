/// status : "In progress"

class ChangeActionStatusRequestModel {
  String _status;

  String get status => _status;

  ChangeActionStatusRequestModel({
      String status}){
    _status = status;
}

  ChangeActionStatusRequestModel.fromJson(dynamic json) {
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }

}