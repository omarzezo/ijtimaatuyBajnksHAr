/// vote : "Abstained"
/// reason : "test"

class ChangeVoteRequestModel {
  String _vote;
  String _reason;

  String get vote => _vote;
  String get reason => _reason;

  ChangeVoteRequestModel({
      String vote, 
      String reason}){
    _vote = vote;
    _reason = reason;
}

  ChangeVoteRequestModel.fromJson(dynamic json) {
    _vote = json['vote'];
    _reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['vote'] = _vote;
    map['reason'] = _reason;
    return map;
  }

}