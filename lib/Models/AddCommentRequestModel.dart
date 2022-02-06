/// comment : "Comment of dicision"

class AddCommentRequestModel {
  String _comment;

  String get comment => _comment;

  AddCommentRequestModel({
      String comment}){
    _comment = comment;
}

  AddCommentRequestModel.fromJson(dynamic json) {
    _comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['comment'] = _comment;
    return map;
  }

}