import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itimaaty/Models/ForgetPasswordRequest.dart';
import 'package:itimaaty/Models/ForgotPasswordResponseModel.dart';
import 'package:itimaaty/Models/LoginRequestModel.dart';
import 'package:itimaaty/Models/LoginResponseModel.dart';
import 'package:itimaaty/Models/OrganizationResponseModel.dart';
import 'package:itimaaty/Models/dashboard_response_model.dart';
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/cubit/Home/HomeStates.dart';
import 'package:itimaaty/network/end_points.dart';
import 'package:itimaaty/network/remote/dio_helper.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStatesInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  DashboardResponseModel dashboardResponseModel;


  void getDashboardData(String baseUrl ,String token) {
    emit(HomeStatesLoadingState());
    EasyLoading.instance.loadingStyle=EasyLoadingStyle.custom;
    EasyLoading.show(status: 'loading...');

    DioHelper.getWithToken(baseUrl,token, Constants.DASHBOARD,).then((value) {
      dashboardResponseModel = DashboardResponseModel.fromJson(value);
      emit(HomeStatesSuccessState(dashboardResponseModel));
      // EasyLoading.showSuccess('Success!');
      EasyLoading.dismiss();
    }).catchError((error) {
      // EasyLoading.showError('Data Used');
      if(EasyLoading.isShow){
        EasyLoading.showError("please check Data");
      }
      print("ErrorIs>>"+error.toString());
      emit(HomeStatesErrorState(error.toString()));
    });
  }

}
