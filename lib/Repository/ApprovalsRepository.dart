import 'dart:convert';

import 'package:itimaatysoharsohar/Models/AllAprovalsResponseModel.dart';
import 'package:itimaatysoharsohar/Models/add_to_favorite_response_model.dart';
import 'package:itimaatysoharsohar/Models/add_to_favourite_request_model.dart';
import 'package:itimaatysoharsohar/Models/dashboard_response_model.dart';
import 'package:itimaatysoharsohar/Models/favourite_response_model.dart';
import 'package:itimaatysoharsohar/Models/libary_response_model.dart';
import 'package:itimaatysoharsohar/Models/my_library_response_model.dart';
import 'package:itimaatysoharsohar/network/end_points.dart';
import 'package:itimaatysoharsohar/network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;

import '../Models/all_status_response.dart';
import '../Utils/Constants.dart';
class ApprovalsRepository {

  Future<AllAprovalsResponseModel> getAllApprovals(String baseUrl ,String token,int pageNum,int status,String comitte_id) async {
    var response ;
    print("tokenIs>>>>"+token);
    // print("status>>>>"+status.toString());
    try{
      response = await DioHelper.getWithToken(baseUrl,token,Constants.AllApprovals+"?page="+pageNum.toString()+"&per_page=10"
      +(status.toString()!="null"?"&status="+status.toString():"")
          +(comitte_id.toString()!="null"?"&committee_id="+comitte_id.toString():""));
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:AllAprovalsResponseModel.fromJson(response);
  }

  Future<AllAprovalsResponseModel> getWaitMe(String baseUrl ,String token,int pageNum,int status,String comitte_id) async {
    var response ;
    print("tokenIs>>>>"+token);
    try{
      response = await DioHelper.getWithToken(baseUrl,token,Constants.WaitMe+"?page="+pageNum.toString()+"&per_page=10"
          +(status.toString()!="null"?"&status="+status.toString():"")
          +(comitte_id.toString()!="null"?"&committee_id="+comitte_id.toString():""));
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:AllAprovalsResponseModel.fromJson(response);
  }

  Future<AllAprovalsResponseModel> getWaitOther(String baseUrl ,String token,int pageNum,int status,String comitte_id) async {
    var response ;
    print("tokenIs>>>>"+token);
    try{
      response = await DioHelper.getWithToken(baseUrl,token,Constants.WaitOther+"?page="+pageNum.toString()+"&per_page=10"
          +(status.toString()!="null"?"&status="+status.toString():"")
          +(comitte_id.toString()!="null"?"&committee_id="+comitte_id.toString():""));
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:AllAprovalsResponseModel.fromJson(response);
  }

  Future<AllAprovalsResponseModel> getCompleted(String baseUrl ,String token,int pageNum,int status,String comitte_id) async {
    var response ;
    print("tokenIs>>>>"+token);
    try{
      response = await DioHelper.getWithToken(baseUrl,token,Constants.Completed+"?page="+pageNum.toString()+"&per_page=10"
          +(status.toString()!="null"?"&status="+status.toString():"")
          +(comitte_id.toString()!="null"?"&committee_id="+comitte_id.toString():""));
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:AllAprovalsResponseModel.fromJson(response);
  }

  // Future<List<AllStatusResponse>> getAllStatus(String baseUrl ,String token) async {
  //   print("baseUrl>>>>"+baseUrl);
  //   var response ;
  //   List<AllStatusResponse> myModels;
  //   try{
  //     Map<String, String> headers = {"Content-type": "application/json",
  //       'token': token};
  //     response = await http.get(Uri.parse(baseUrl + Constants.STATUS),headers: headers);
  //     print("StatusIS>>"+response.toString());
  //
  //     myModels = (json.decode(response.body) as List).map((i) =>
  //         AllStatusResponse.fromJson(i)).toList();
  //   }catch (e){
  //     print("kkkkkkkkkkkkkk"+e.toString());
  //   }
  //   return response==null?[]: await myModels;
  // }

  Future<String> getAllCommittes(String baseUrl ,String token) async {
    var response ;
    print("tokenIs>>>>"+token);
    try{
      response = await DioHelper.getWithToken(baseUrl,token,Constants.COMMITTEES);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    // dynamic x = something();
    // return response==null?null:CommitteeResponseModel.fromJson(response);
    String data = json.encode(response);
    // print("data>>>>"+data.toString());
    return response==null?null:data;
  }


}
