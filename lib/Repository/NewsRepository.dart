import 'dart:convert';
import 'package:itimaaty/Models/MultipleLikeRequestModel.dart';
import 'package:itimaaty/Models/add_comment_response_model.dart';
import 'package:itimaaty/Models/add_news_comment.dart';
import 'package:itimaaty/Models/liked_response_model.dart';
import 'package:itimaaty/Models/news_details_response_model.dart';
import 'package:itimaaty/Models/news_response_model.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

import '../Models/DeleteCommentResponse.dart';
import '../Models/DeleteCommentsRequestModel.dart';

class NewsRepository {

  // Future<List<NewsResponseModel>> getNewsData(String baseUrl,String token) async {
  Future<String> getNewsData(String baseUrl,String token) async {
    var response ;
    // List<NewsResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json", 'token': token};
      print("UrlOfNewIs>>"+baseUrl + Constants.NEWS);
      response = await http.get(Uri.parse(baseUrl + Constants.NEWS),headers: headers);
      // String mm= jsonEncode(response);
      // print("ResponsIS>>"+json.decode(response.body).toString());
      // myModels = (json.decode(response.body) as List).map((i) => NewsResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // return response==null?[]: await myModels;
    return response==null?[]: await response.body;
  }


  // Future<NewsDetailsResponseModel> getNewsDetailsData(String baseUrl ,String token,int id) async {
  Future<String> getNewsDetailsData(String baseUrl ,String token,int id) async {
    var response ;
    // String jsonUser = jsonEncode(loginRequestModel);
    // print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.getWithToken(baseUrl,token,Constants.NEWS+"/"+id.toString());
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    // return response==null?null:NewsDetailsResponseModel.fromJson(response);
    return response==null?null:json.encode(response);
  }

  Future<LikedResponseModel> makeLike(String baseUrl ,String token,int id) async {
    // Future<Response> changeUserStatus(String token,int id,UserChangeStatusRequestModel model) async {
    var response ;
    // String jsonUser = jsonEncode(model);
    // print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.LIKE+"/"+id.toString(),null,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:LikedResponseModel.fromJson(response);
  }

  Future<LikedResponseModel> makeDisLike(String baseUrl ,String token,int id) async {
    // Future<Response> changeUserStatus(String token,int id,UserChangeStatusRequestModel model) async {
    var response ;
    // String jsonUser = jsonEncode(model);
    // print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.UN_LIKE+"/"+id.toString(),null,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:LikedResponseModel.fromJson(response);
  }


  Future<AddCommentResponseModel> addComment(String baseUrl ,String token,AddNewsComment addNewsComment,int id) async {
    // Future<Response> changeUserStatus(String token,int id,UserChangeStatusRequestModel model) async {
    var response ;
    String jsonUser = jsonEncode(addNewsComment);
    print("tokenIs>>>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.ADD_COMMENT_NEWS+"/"+id.toString(),jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:AddCommentResponseModel.fromJson(response);
  }

  // Future<AddCommentResponseModel> addMultipleNewsComments(String baseUrl ,String token,List<AddNewsComment> addNewsComment,int id) async {
  //   var response ;
  //   String jsonUser = jsonEncode(addNewsComment);
  //   print("tokenIs>>>>"+jsonUser.toString());
  //   try{
  //     response = await DioHelper.postWithToken(baseUrl,Constants.MultipleNEWSComments+"/"+id.toString(),jsonUser,token);
  //     print("ResponsIS>>"+response.toString());
  //   }catch (e){
  //     print("kkkkkkkkkkkkkk"+e.toString());
  //   }
  //   return response==null?null:AddCommentResponseModel.fromJson(response);
  // }
  Future<List<AddCommentResponseModel>> addMultipleNewsComments(String baseUrl ,String token,List<AddNewsComment> model,int id) async {
    String jsonUser = jsonEncode(model);
    var response ;
    List<AddCommentResponseModel> myModels;
    try{
      Map<String, String> headers = {"Content-type": "application/json", 'token': token};
      // print("usl>>"+id.toString());
      print("usl>>"+baseUrl + Constants.MultipleNEWSComments+"/"+id.toString());
      response = await http.post(Uri.parse(baseUrl + Constants.MultipleNEWSComments+"/"+id.toString()),headers: headers,body: jsonUser);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          AddCommentResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<DeleteCommentResponse> deleteComment(String baseUrl ,int id,String token) async {
    var response ;
    print("UrlIs>>"+baseUrl + Constants.DELETE_COMMENT+id.toString());
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.deleteWithToken(baseUrl,Constants.DELETE_COMMENT+"/"+id.toString(),token);
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:DeleteCommentResponse.fromJson(response);
  }

  Future<DeleteCommentResponse> deleteMultipleComment(String baseUrl,String token,List<DeleteCommentsRequestModel> model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    print("UrlIs>>"+baseUrl + Constants.DeleteMultipleComments);
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await DioHelper.postWithToken(baseUrl,Constants.DeleteMultipleComments,jsonUser,token);
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:DeleteCommentResponse.fromJson(response);
  }


  Future<LikedResponseModel> addMultipleLike(String baseUrl,String token,List<MultipleLikeRequestModel> model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    print("UrlIs>>"+baseUrl + Constants.MultipleLIKE);
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.MultipleLIKE,jsonUser,token);
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:LikedResponseModel.fromJson(response);
  }

  Future<LikedResponseModel> addMultipleUnLike(String baseUrl,String token,List<MultipleLikeRequestModel> model) async {
    String jsonUser = jsonEncode(model);
    var response ;
    print("UrlIs>>"+baseUrl + Constants.MultipleLIKE);
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.MultipleUnLIKE,jsonUser,token);
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?null:LikedResponseModel.fromJson(response);
  }

}
