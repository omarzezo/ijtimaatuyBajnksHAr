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
import 'package:itimaaty/Utils/Constants.dart';
import 'package:itimaaty/network/end_points.dart';
import 'package:itimaaty/network/remote/dio_helper.dart';

import '../../Models/PostSecretSSoRequest.dart';
import 'user_states.dart';


class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(LoginInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  LoginResponseModel loginResponseModel;
  ForgotPasswordResponseModel forgotPasswordResponseModel;


  void userLoginFunc({
    @required String baseUrl,
    @required String email,
    @required String password,
  }) {
    emit(LoginLoadingState());
    EasyLoading.instance.loadingStyle=EasyLoadingStyle.custom;
    EasyLoading.show(status: 'loading...');
    LoginRequestModel loginRequestModel =new LoginRequestModel(email, password);
    String jsonUser = jsonEncode(loginRequestModel);
    print("jsonUserIs>>"+jsonUser.toString());

    DioHelper.post(baseUrl, Constants.LOGIN, jsonUser,).then((value) {
      loginResponseModel = LoginResponseModel.fromJson(value);
      emit(LoginSuccessState(loginResponseModel));
      // EasyLoading.showSuccess('Success!');
      EasyLoading.dismiss();
    }).catchError((error) {
      // EasyLoading.showError('Data Used');
      if(EasyLoading.isShow){
        EasyLoading.showError("please check Data");
      }
      print("ErrorIs>>"+error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  void userPostSecret({
    @required String baseUrl,
    @required String secret,
  }) {
    emit(LoginLoadingState());
    EasyLoading.instance.loadingStyle=EasyLoadingStyle.custom;
    EasyLoading.show(status: 'loading...');
    PostSecretSSoRequest postSecretSSoRequest =new PostSecretSSoRequest(secret);
    String jsonUser = jsonEncode(postSecretSSoRequest);
    print("jsonUserIs>>"+jsonUser.toString());

    DioHelper.post(baseUrl, Constants.SSoExchange, jsonUser,).then((value) {
      loginResponseModel = LoginResponseModel.fromJson(value);
      emit(LoginSuccessState(loginResponseModel));
      // EasyLoading.showSuccess('Success!');
      EasyLoading.dismiss();
    }).catchError((error) {
      // EasyLoading.showError('Data Used');
      if(EasyLoading.isShow){
        EasyLoading.showError("please check Data");
      }
      print("ErrorIs>>"+error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  void forgetPasswordFunc({
    @required String baseUrl,
    @required String email,
  }) {
    emit(ForgotPasswordLoadingState());
    EasyLoading.instance.loadingStyle=EasyLoadingStyle.custom;
    EasyLoading.show(status: 'loading...');
    ForgetPasswordRequestModel forgetPasswordRequestModel =new ForgetPasswordRequestModel(email);
    String jsonUser = jsonEncode(forgetPasswordRequestModel);
    print("jsonUserIs>>"+jsonUser.toString());

    DioHelper.post(baseUrl, Constants.FORGOT_PASSWORD, jsonUser,).then((value) {
      forgotPasswordResponseModel = ForgotPasswordResponseModel.fromJson(value);
      emit(ForgotPasswordSuccessState(forgotPasswordResponseModel));
      // EasyLoading.showSuccess('Success!');
      EasyLoading.dismiss();
    }).catchError((error) {
      // EasyLoading.showError('Data Used');
      if(EasyLoading.isShow){
        EasyLoading.showError("User does not exist");
      }
      print("ErrorIs>>"+error.toString());
      emit(ForgotPasswordErrorState(error.toString()));
    });
  }

}
