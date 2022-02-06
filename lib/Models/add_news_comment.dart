/// comment : "test"
/// rate : "5"

class AddNewsComment {
  String _comment;
  String _rate;

  String get comment => _comment;
  String get rate => _rate;

  AddNewsComment({
      String comment, 
      String rate}){
    _comment = comment;
    _rate = rate;
}

  AddNewsComment.fromJson(dynamic json) {
    _comment = json['comment'];
    _rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['comment'] = _comment;
    map['rate'] = _rate;
    return map;
  }

}