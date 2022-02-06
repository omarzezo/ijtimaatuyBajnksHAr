import 'package:shared_preferences/shared_preferences.dart';

/// id : 26
/// name : "Omar Abdelaziz"
/// email : "zezoomar674@yahoo.com"
/// role_id : 1
/// phone : "1111111111"
/// birthdate : "1981-08-22"
/// team : 2
/// image : "http://test.ijtimaati.com/api/public/uploads/images/GwvmPMsKbi.png"
/// status : 1
/// position : null
/// token : "9f0c6a127c70dec0d41f3c00a3978bd1"
/// team_name : ""
/// role_name : "Organization Admins"
/// committee_admin : []
/// committee : null
/// role : {"id":1,"name":"Organization Admins","slug":"admin","created_at":"2021-09-12T17:52:27.000000Z","updated_at":"2021-09-12T17:52:27.000000Z"}

class LoginResponseModel {
  int _id;
  String _name;
  String _email;
  int _roleId;
  String _phone;
  String _birthdate;
  int _team;
  String _image;
  int _status;
  dynamic _position;
  String _token;
  String _teamName;
  String _roleName;
  List<dynamic> _committeeAdmin;
  dynamic _committee;
  Role _role;

  int get id => _id;
  String get name => _name;
  String get email => _email;
  int get roleId => _roleId;
  String get phone => _phone;
  String get birthdate => _birthdate;
  int get team => _team;
  String get image => _image;
  int get status => _status;
  dynamic get position => _position;
  String get token => _token;
  String get teamName => _teamName;
  String get roleName => _roleName;
  List<dynamic> get committeeAdmin => _committeeAdmin;
  dynamic get committee => _committee;
  Role get role => _role;

  LoginResponseModel({
      int id, 
      String name, 
      String email, 
      int roleId, 
      String phone, 
      String birthdate, 
      int team, 
      String image, 
      int status, 
      dynamic position, 
      String token, 
      String teamName, 
      String roleName, 
      List<dynamic> committeeAdmin, 
      dynamic committee, 
      Role role}){
    _id = id;
    _name = name;
    _email = email;
    _roleId = roleId;
    _phone = phone;
    _birthdate = birthdate;
    _team = team;
    _image = image;
    _status = status;
    _position = position;
    _token = token;
    _teamName = teamName;
    _roleName = roleName;
    _committeeAdmin = committeeAdmin;
    _committee = committee;
    _role = role;
}

  LoginResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _roleId = json['role_id'];
    _phone = json['phone'];
    _birthdate = json['birthdate'];
    _team = json['team'];
    _image = json['image'];
    _status = json['status'];
    _position = json['position'];
    _token = json['token'];
    _teamName = json['team_name'];
    _roleName = json['role_name'];
    if (json['committee_admin'] != null) {
      _committeeAdmin = [];
      json['committee_admin'].forEach((v) {
        // _committeeAdmin.add(dynamic.fromJson(v));
      });
    }
    _committee = json['committee'];
    _role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['role_id'] = _roleId;
    map['phone'] = _phone;
    map['birthdate'] = _birthdate;
    map['team'] = _team;
    map['image'] = _image;
    map['status'] = _status;
    map['position'] = _position;
    map['token'] = _token;
    map['team_name'] = _teamName;
    map['role_name'] = _roleName;
    if (_committeeAdmin != null) {
      map['committee_admin'] = _committeeAdmin.map((v) => v.toJson()).toList();
    }
    map['committee'] = _committee;
    if (_role != null) {
      map['role'] = _role.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Organization Admins"
/// slug : "admin"
/// created_at : "2021-09-12T17:52:27.000000Z"
/// updated_at : "2021-09-12T17:52:27.000000Z"

class Role {
  int _id;
  String _name;
  String _slug;
  String _createdAt;
  String _updatedAt;

  int get id => _id;
  String get name => _name;
  String get slug => _slug;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Role({
      int id, 
      String name, 
      String slug, 
      String createdAt, 
      String updatedAt}){
    _id = id;
    _name = name;
    _slug = slug;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Role.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

Future<bool> saveUser(LoginResponseModel user) async {
  try {
    print("Start save user");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("id", user.id);
    await prefs.setString("name", user.name);
    return true ;
  }catch(Excption){
    print("save to shared faild   :  $Excption");
    return false ;
  }
}


Future<LoginResponseModel > getUser () async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return new LoginResponseModel(
    id: prefs.getInt("id"),
    name: prefs.getString("name"),
  );
}

Future<bool > removeUser () async {
  try {
    print("Start save user");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("id", null);
    await prefs.setString("name", null);
    return true ;
  }catch(Excption){
    print("save to shared faild   :  $Excption");
    return false ;
  }
}