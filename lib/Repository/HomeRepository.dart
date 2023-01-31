
import 'dart:convert';

import 'package:itimaatysoharsohar/Models/dashboard_response_model.dart';
import 'package:itimaatysoharsohar/network/end_points.dart';
import 'package:itimaatysoharsohar/network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;
import '../Models/all_meetings_response.dart';
import '../Utils/CommonMethods.dart';
import '../Utils/Constants.dart';
import '../network/DioHelper.dart';

class HomeRepository {
  DioHelper _helper = DioHelper();

  // Future<DashboardResponseModel> getDashboardData(String baseUrl ,String token) async {
  Future<String> getDashboardData(String baseUrl ,String token) async {
    // hasNetwork().then((value) async {
    //   if(value){
        var response ;
        print("tokenIs>>>>"+token);
        try{
          response = await DioHelper.getWithToken(baseUrl,token,Constants.DASHBOARD);
          print("ResponsIS>>"+response.toString());
        }catch (e){
          print("kkkkkkkkkkkkkk"+e.toString());
        }
        // return response==null?null:DashboardResponseModel.fromJson(response);
        return response==null?null:json.encode(response);


      // }else{
      //  return "No Net";
      // }
    // });

  }

  // Future<DashboardResponseModel> getDashboardDataCache(String token) async {
  //   var response ;
  //   print("UrlIs>>"+Constants.BASE_URL + Constants.DASHBOARD);
  //   try{
  //     response = await DioHelperDio.getData(url: Constants.DASHBOARD,token: token);
  //     print("ResponsIS>>"+response.toString());
  //     // myModels = (response.data as List).map((i) => AllMeetingsResponse.fromJson(i)).toList();
  //   }catch (e){
  //     print("kkkkkkkkkkkkkk"+e.toString());
  //   }
  //   // return response==null?[]: await myModels;
  //   return response==null?null:DashboardResponseModel.fromJson(response.data);
  // }

  // Future<List<AllMeetingsResponse>> getAllMeetings(String baseUrl , String token) async {
  Future<String> getAllMeetings(String baseUrl , String token) async {
    var response ;
    // List<AllMeetingsResponse> myModels;
    print("UrlIsHere>>"+baseUrl + Constants.MEETINGS);
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token,
        'x-ijtimaati-using':"ios",
        'x-ijtimaati-version':"4",
        'x-isweb':'false'};
      response = await http.get(Uri.parse(baseUrl + Constants.MEETINGS),headers: headers);
      print("ResponsIS>>"+response.toString());

      // myModels = (json.decode(response.body) as List).map((i) => AllMeetingsResponse.fromJson(i)).toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // return response==null?[]: await myModels;
    return response==null?[]: await response.body;
  }

  Future<String> getAllMeetingsByDate(String baseUrl,String token,String date) async {
    var response ;
    // List<AllMeetingsResponse> myModels;
    // print("UrlIs>>"+baseUrl + Constants.MEETINGS+'?date='+date+"&page=1");
    try{
      Map<String, String> headers = {"Content-type": "application/json",
        'token': token,
        'x-ijtimaati-using':"ios",
        'x-ijtimaati-version':"4",
        'x-isweb':'false'};
      response = await http.get(Uri.parse(baseUrl + Constants.MEETINGS+'?date='+date),headers: headers);
      print("ResponsIS>>"+response.toString());
      // myModels = (json.decode(response.body) as List).map((i) => AllMeetingsResponse.fromJson(i))
      //     .toList();
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // return response==null?[]: await myModels;
    return response==null?[]: response.body;
  }



}
