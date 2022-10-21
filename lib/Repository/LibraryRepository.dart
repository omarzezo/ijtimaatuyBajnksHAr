import 'dart:convert';

import 'package:itimaaty/Models/add_to_favorite_response_model.dart';
import 'package:itimaaty/Models/add_to_favourite_request_model.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Models/favourite_response_model.dart';
import 'package:itimaaty/Models/libary_response_model.dart';
import 'package:itimaaty/Models/my_library_response_model.dart';
import 'package:itimaaty/network/end_points.dart';
import 'package:itimaaty/network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

import '../Utils/Constants.dart';
class LibraryRepository {
  DioHelper _helper = DioHelper();

  Future<MyLibraryResponseModel> getLibrary(String baseUrl ,String token) async {
    var response ;
    print("tokenIs>>>>"+token);
    try{
      response = await DioHelper.getWithToken(baseUrl,token,Constants.LIBRARY);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:MyLibraryResponseModel.fromJson(response);
  }

  Future<List<FavouriteResponseModel>> getFavourite(String baseUrl,String token) async {
    var response ;
    List<FavouriteResponseModel> myModels;
    try{
      print("UrlIs>>"+baseUrl + Constants.FAVOURITE);
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token};
      response = await http.get(Uri.parse(baseUrl + Constants.FAVOURITE),headers: headers);
      print("StatusIS>>"+response.toString());

      myModels = (json.decode(response.body) as List).map((i) =>
          FavouriteResponseModel.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    return response==null?[]: await myModels;
  }

  Future<AddToFavoriteResponseModel> addToFavourite(String baseUrl ,String token,AddToFavouriteRequestModel addToFavouriteRequestModel) async {
    var response ;
    String jsonUser = jsonEncode(addToFavouriteRequestModel);
    print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.postWithToken(baseUrl,Constants.ADD_TO_FAVOURITE,jsonUser,token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
      // if(e.toString()=="Invalid Request: {""message"":""Old password is wrong""}"){
      //   print("hhhhhhhhhhhhhhhhhhhhh");
      // }
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:AddToFavoriteResponseModel.fromJson(response);
  }

  Future<AddToFavoriteResponseModel> deleteFavourite(String baseUrl,String token,int id) async {
    var response ;
    // String jsonUser = jsonEncode(addToFavouriteRequestModel);
    // print("jsonUserIs>>"+jsonUser.toString());
    try{
      response = await DioHelper.deleteWithToken(baseUrl,Constants.ADD_TO_FAVOURITE+"/"+id.toString(),token);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
      // if(e.toString()=="Invalid Request: {""message"":""Old password is wrong""}"){
      //   print("hhhhhhhhhhhhhhhhhhhhh");
      // }
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:AddToFavoriteResponseModel.fromJson(response);
  }

}
