/// id : 85
/// commentable_id : "67"
/// commentable_type : "App\\Models\\MeetingDecision"
/// commented_id : "21"
/// commented_type : "App\\Models\\SubUser"
/// comment : "hiiiiiiiii"
/// approved : true
/// rate : null
/// created_at : "2021-12-12T13:25:52.000000Z"
/// updated_at : "2021-12-12T13:25:52.000000Z"

class AddCommentResponseModel {
  int _id;
  String _commentableId;
  String _commentableType;
  String _commentedId;
  String _commentedType;
  String _comment;
  bool _approved;
  dynamic _rate;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  String get commentableId => _commentableId;
  String get commentableType => _commentableType;
  String get commentedId => _commentedId;
  String get commentedType => _commentedType;
  String get comment => _comment;
  bool get approved => _approved;
  dynamic get rate => _rate;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  AddCommentResponseModel({
      int id, 
      String commentableId, 
      String commentableType, 
      String commentedId, 
      String commentedType, 
      String comment, 
      bool approved, 
      dynamic rate, 
      String createdAt, 
      String updatedAt}){
    _id = id;
    _commentableId = commentableId;
    _commentableType = commentableType;
    _commentedId = commentedId;
    _commentedType = commentedType;
    _comment = comment;
    _approved = approved;
    _rate = rate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  AddCommentResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _commentableId = json['commentable_id'];
    _commentableType = json['commentable_type'];
    _commentedId = json['commented_id'];
    _commentedType = json['commented_type'];
    _comment = json['comment'];
    _approved = json['approved'];
    _rate = json['rate'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['commentable_id'] = _commentableId;
    map['commentable_type'] = _commentableType;
    map['commented_id'] = _commentedId;
    map['commented_type'] = _commentedType;
    map['comment'] = _comment;
    map['approved'] = _approved;
    map['rate'] = _rate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}