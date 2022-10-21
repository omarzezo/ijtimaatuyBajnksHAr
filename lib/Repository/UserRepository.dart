
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
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/network/end_points.dart';
import 'package:itimaaty/network/remote/dio_helper.dart';

import '../Models/PostSecretSSoRequest.dart';
import '../Models/SsoRequestModel.dart';
import '../Models/SsoResponseModel.dart';

class UserRepository {
  DioHelper _helper = DioHelper();

  Future<LoginResponseModel> getLoginData(String baseUrl,LoginRequestModel loginRequestModel) async {
    var response ;
    String jsonUser = jsonEncode(loginRequestModel);
    print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.post(baseUrl,Constants.LOGIN,jsonUser);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:LoginResponseModel.fromJson(response);
  }

  Future<ChangePasswordResponseModel> getChangePassword(String baseUrl,String token,ChangePasswordRequestModel changePasswordRequestModel) async {
    var response ;
    String jsonUser = jsonEncode(changePasswordRequestModel);
    print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.CHANGE_PASSWORD,jsonUser,token);
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

  // Future<LoginResponseModel> getProfileData(String baseUrl ,String token) async {
  Future<String> getProfileData(String baseUrl ,String token) async {
    var response ;
    // String jsonUser = jsonEncode(loginRequestModel);
    // print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.getWithToken(baseUrl,token,Constants.PROFILE);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    // return response==null?null:LoginResponseModel.fromJson(response);
    return response==null?null:json.encode(response);
  }


  Future<UserChangeStatusResponseModel> changeUserStatus(String baseUrl,String token,int id,UserChangeStatusRequestModel model) async {
  // Future<Response> changeUserStatus(String token,int id,UserChangeStatusRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(model);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,"meetings/"+id.toString()+Constants.CHANGE_STATUS_USER,jsonUser,token);
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
      String baseUrl,
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

    print("UrlIs>>"+baseUrl+Constants.PROFILE);

    Response response = await dio.post(baseUrl+Constants.PROFILE, data: formData);
    print("Datais>>" +response.data.toString());
    return response;
  }


  Future<Response> authFactor (String baseUrl,String token,) async {
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["token"] = "${token}";
    print("UrlIs>>"+baseUrl+Constants.TWO_AUTH_FACTOR);
    Response response = await dio.post(baseUrl+Constants.TWO_AUTH_FACTOR, data: null);
    print("Datais>>" +response.data.toString());
    return response;
  }

  Future<LoginResponseModel> authVerfication(String baseUrl,AuthVerificationResponseModel authVerificationResponseModel) async {
    var response ;
    String jsonUser = jsonEncode(authVerificationResponseModel);
    print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.post(baseUrl,Constants.AUTH_VERIFICATION,jsonUser);
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

  Future<SsoResponseModel> getSSoData(String baseUrl,SsoRequestModel ssoRequestModel) async {
    var response ;
    String jsonUser = jsonEncode(ssoRequestModel);
    print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.post(baseUrl,Constants.SignInSSo,jsonUser);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:SsoResponseModel.fromJson(response);
  }

  // void userPostSecret({String baseUrl, String secret,}) {
  //   PostSecretSSoRequest postSecretSSoRequest =new PostSecretSSoRequest(secret);
  //   String jsonUser = jsonEncode(postSecretSSoRequest);
  //   print("jsonUserIs>>"+jsonUser.toString());
  //
  //   DioHelper.post(baseUrl, Constants.SSoExchange, jsonUser,).then((value) {
  //     loginResponseModel = LoginResponseModel.fromJson(value);
  //   }).catchError((error) {
  //     // EasyLoading.showError('Data Used');
  //     print("ErrorIs>>"+error.toString());
  //   });
  // }

  Future<LoginResponseModel> userPostSecret(String baseUrl,String secret) async {
    var response ;
    PostSecretSSoRequest postSecretSSoRequest =new PostSecretSSoRequest(secret);
    String jsonUser = jsonEncode(postSecretSSoRequest);
    print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.post(baseUrl,Constants.SSoExchange,jsonUser);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:LoginResponseModel.fromJson(response);
  }

}
