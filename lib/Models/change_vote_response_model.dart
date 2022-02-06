/// message : "vote changed"

class ChangeVoteResponseModel {
  String _message;

  String get message => _message;

  ChangeVoteResponseModel({
      String message}){
    _message = message;
}

  ChangeVoteResponseModel.fromJson(dynamic json) {
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}