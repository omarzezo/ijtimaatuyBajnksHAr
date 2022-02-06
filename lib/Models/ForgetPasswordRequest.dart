class ForgetPasswordRequestModel {
  String email;


  ForgetPasswordRequestModel(String email) {
    this.email = email;
  }

  ForgetPasswordRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }
}