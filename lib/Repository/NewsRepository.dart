import 'dart:convert';
import 'package:itimaaty/Models/add_comment_response_model.dart';
import 'package:itimaaty/Models/add_news_comment.dart';
import 'package:itimaaty/Models/liked_response_model.dart';
import 'package:itimaaty/Models/news_details_response_model.dart';
import 'package:itimaaty/Models/news_response_model.dart';
import 'package:itimaaty/network/end_points.dart';
import 'package:itimaaty/network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  DioHelper _helper = DioHelper();


  Future<List<NewsResponseModel>> getNewsData(String token) async {
    var response ;
    List<NewsResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json", 'token': token};
      print("UrlIs>>"+BASE_URL + NEWS);
      response = await http.get(Uri.parse(BASE_URL + NEWS),headers: headers);
      print("ResponsIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) => NewsResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }


  Future<NewsDetailsResponseModel> getNewsDetailsData(String token,int id) async {
    var response ;
    // String jsonUser = jsonEncode(loginRequestModel);
    // print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.getWithToken(token,NEWS+"/"+id.toString());
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:NewsDetailsResponseModel.fromJson(response);
  }

  Future<LikedResponseModel> makeLike(String token,int id) async {
    // Future<Response> changeUserStatus(String token,int id,UserChangeStatusRequestModel model) async {
    var response ;
    // String jsonUser = jsonEncode(model);
    // print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(LIKE+"/"+id.toString(),null,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:LikedResponseModel.fromJson(response);
  }

  Future<LikedResponseModel> makeDisLike(String token,int id) async {
    // Future<Response> changeUserStatus(String token,int id,UserChangeStatusRequestModel model) async {
    var response ;
    // String jsonUser = jsonEncode(model);
    // print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(UN_LIKE+"/"+id.toString(),null,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:LikedResponseModel.fromJson(response);
  }


  Future<AddCommentResponseModel> addComment(String token,AddNewsComment addNewsComment,int id) async {
    // Future<Response> changeUserStatus(String token,int id,UserChangeStatusRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(addNewsComment);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(ADD_COMMENT_NEWS+"/"+id.toString(),jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:AddCommentResponseModel.fromJson(response);
  }
}
