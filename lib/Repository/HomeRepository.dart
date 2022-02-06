
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/network/end_points.dart';
import 'package:itimaaty/network/remote/dio_helper.dart';

class HomeRepository {
  DioHelper _helper = DioHelper();

  Future<DashboardResponseModel> getDashboardData(String token) async {
    var response ;
    print("tokenIs>>>>"+token);
    try{
       response = await DioHelper.getWithToken(token,DASHBOARD);
      print("ResponsIS>>"+response.toString());
    }catch (e){
      print("kkkkkkkkkkkkkk"+e.toString());
    }
    // print("current_memberIS>>"+response['ongoing'].toString());
    // return DashboardResponseModel.fromJson(response);
    return response==null?null:DashboardResponseModel.fromJson(response);
  }

}
