class ResetPasswordRequestModel {
  String token;
  String password;
  String password_confirmation;


  ResetPasswordRequestModel(String token,String password,String password_confirmation) {
    this.token = token;
    this.password = password;
    this.password_confirmation = password_confirmation;
  }

  ResetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    password = json['password'];
    password_confirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['password'] = this.password;
    data['password_confirmation'] = this.password_confirmation;
    return data;
  }
}