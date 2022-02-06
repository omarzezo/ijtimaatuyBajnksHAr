class LoginRequestModel {
  String email;
  String password;


  LoginRequestModel(String email,String password) {
    this.email = email;
    this.password = password;
  }

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}