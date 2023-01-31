import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:itimaatysoharsohar/Models/LoginRequestModel.dart';
import 'package:itimaatysoharsohar/Models/LoginResponseModel.dart';
import 'package:itimaatysoharsohar/Utils/Constants.dart';
import 'package:itimaatysoharsohar/cubit/User/states.dart';
import 'package:itimaatysoharsohar/network/end_points.dart';
import 'package:itimaatysoharsohar/network/remote/dio_helper.dart';


class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  // List<Widget> pages = [
  //   HomeScreen(),
  //   UsersScreen(),
  //   NewsScreen(),
  //   UsersScreen(),
  //   ExtraScreen(),
  // ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppBottomNavBarState());
  }

  LoginResponseModel loginResponseModel;

  void getUsersData(String baseUrl) {
    // EasyLoading.instance.loadingStyle=EasyLoadingStyle.custom;
    // EasyLoading.show(status: 'loading...');
    LoginRequestModel loginRequestModel =new LoginRequestModel("said.saleh@live.com", "123123");
    String jsonUser = jsonEncode(loginRequestModel);
    print("jsonUserIs>>"+jsonUser.toString());
    emit(AppGetUsersDataLoadingState());
    DioHelper.post( baseUrl,Constants.LOGIN, jsonUser,).then((value) {
      loginResponseModel = LoginResponseModel.fromJson(value.data);
      emit(AppGetUsersDataSuccessState(loginResponseModel));
      // EasyLoading.showSuccess('Success!');
    }).catchError((error) {
      // EasyLoading.showError('Data Used');
      print("ErrorIs>>"+error.toString());
      emit(AppGetUsersDataErrorState());
    });
  }

}
