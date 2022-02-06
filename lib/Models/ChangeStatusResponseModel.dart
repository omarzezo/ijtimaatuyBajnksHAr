/// status : "In progress"

class ChangeStatusResponseModel {
  String _status;

  String get status => _status;

  ChangeStatusResponseModel({
      String status}){
    _status = status;
}

  ChangeStatusResponseModel.fromJson(dynamic json) {
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }

}