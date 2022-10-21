/// id : 1

class DeleteCommentsRequestModel {
  DeleteCommentsRequestModel({
      int comment,}){
    _comment = comment;
}

  DeleteCommentsRequestModel.fromJson(dynamic json) {
    _comment = json['comment'];
  }
  int _comment;

  int get comment => _comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['comment'] = _comment;
    return map;
  }

}