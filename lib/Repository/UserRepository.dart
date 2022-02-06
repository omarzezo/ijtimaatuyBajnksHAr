
import 'dart:convert';

import 'package:dio/dio.dart';
// import 'package:http/http.dart';
import 'package:itimaaty/Models/LoginRequestModel.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';
import 'package:itimaaty/Models/UserChangeStatusRequestModel.dart';
import 'package:itimaaty/Models/auth_verification_response_model.dart';
import 'package:itimaaty/Models/change_password_request_model.dart';
import 'package:itimaaty/Models/change_password_response_model.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Models/user_change_status_response_model.dart';
import 'package:itimaaty/network/end_points.dart';
import 'package:itimaaty/network/remote/dio_helper.dart';

class UserRepository {
  DioHelper _helper = DioHelper();

  Future<LoginResponseModel> getLoginData(LoginRequestModel loginRequestModel) async {
    var response ;
    String jsonUser = jsonEncode(loginRequestModel);
    print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.post(LOGIN,jsonUser);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:LoginResponseModel.fromJson(response);
  }

  Future<ChangePasswordResponseModel> getChangePassword(String token,ChangePasswordRequestModel changePasswordRequestModel) async {
    var response ;
    String jsonUser = jsonEncode(changePasswordRequestModel);
    print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(CHANGE_PASSWORD,jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
      // if(e.toString()=="Invalid Request: {""message"":""Old password is wrong""}"){
      //   print("hhhhhhhhhhhhhhhhhhhhh");
      // }
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:ChangePasswordResponseModel.fromJson(response);
  }

  Future<LoginResponseModel> getProfileData(String token) async {
    var response ;
    // String jsonUser = jsonEncode(loginRequestModel);
    // print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.getWithToken(token,PROFILE);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:LoginResponseModel.fromJson(response);
  }


  Future<UserChangeStatusResponseModel> changeUserStatus(String token,int id,UserChangeStatusRequestModel model) async {
  // Future<Response> changeUserStatus(String token,int id,UserChangeStatusRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken("meetings/"+id.toString()+CHANGE_STATUS_USER,jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
      // if(response.)
      //   return response;
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    // return response==null?null:UserChangeStatusRequestModel.fromJson(response);
    return response==null?null:UserChangeStatusResponseModel.fromJson(response);
  }

  Future<Response> updateProfile (
      String token,
      MultipartFile image,
      String name,
      String email,
      String phone,
      String position,
      String birthdate,
      ) async {

    FormData formData;
    // 2000-08-22
    print("ommmmmmmmmmmmmmmmmmmmmmm");
    print("token>"+token);
    birthdate="2000-08-22";

    formData = new FormData.fromMap(
        {
          "name": name,
          "email": email,
          "phone": phone,
          "position": position,
          "birthdate": birthdate,
        }
    );
    // formData = new FormData.fromMap();

    try{
      if(image!=null) {
        formData.files.add(MapEntry('image', image));
        print("logoFile");
      }
    }catch(err){
      print("errorIsHersLogo>>");
      print("errorIs>>"+err.toString());
    }

    Dio dio = new Dio();

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["token"] = "${token}";

    print("UrlIs>>"+BASE_URL+PROFILE);

    Response response = await dio.post(BASE_URL+PROFILE, data: formData);
    print("Datais>>" +response.data.toString());
    return response;
  }


  Future<Response> authFactor (String token,) async {
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["token"] = "${token}";
    print("UrlIs>>"+BASE_URL+PROFILE);
    Response response = await dio.post(BASE_URL+TWO_AUTH_FACTOR, data: null);
    print("Datais>>" +response.data.toString());
    return response;
  }

  Future<LoginResponseModel> authVerfication(AuthVerificationResponseModel authVerificationResponseModel) async {
    var response ;
    String jsonUser = jsonEncode(authVerificationResponseModel);
    print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.post(AUTH_VERIFICATION,jsonUser);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
      // if(e.toString()=="Invalid Request: {""message"":""Old password is wrong""}"){
      //   print("hhhhhhhhhhhhhhhhhhhhh");
      // }
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:LoginResponseModel.fromJson(response);
  }
}
