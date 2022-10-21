/// file : "iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAARElEQVR42u3PMREAAAgEoDe50TWDqwcNqEw6D5SIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIyMUCa5JKzyMlqNAAAAAASUVORK5CYII="

class SignatureRequestModel {
  SignatureRequestModel({
      String file,}){
    _file = file;
}

  SignatureRequestModel.fromJson(dynamic json) {
    _file = json['file'];
  }
  String _file;

  String get file => _file;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = _file;
    return map;
  }

}