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
import 'package:itimaaty/network/end_points.dart';
import 'package:itimaaty/network/remote/dio_helper.dart';
import 'organization_states.dart';


class OrganizationCubit extends Cubit<OrganizationStates> {
  OrganizationCubit() : super(OrganizationInitialState());

  static OrganizationCubit get(context) => BlocProvider.of(context);

  OrganizationResponseModel organizationResponseModel;


  void getOrganizationFunc(String domain) {
    emit(OrganizationLoadingState());
    EasyLoading.instance.loadingStyle=EasyLoadingStyle.custom;
    EasyLoading.show(status: 'loading...');

    DioHelper.getForOrganization( domain,).then((value) {
      organizationResponseModel = OrganizationResponseModel.fromJson(value);
      emit(OrganizationSuccessState(organizationResponseModel));
      // EasyLoading.showSuccess('Success!');
      EasyLoading.dismiss();
    }).catchError((error) {
      // EasyLoading.showError('Data Used');
      if(EasyLoading.isShow){
        EasyLoading.showError("please check Data");
      }
      print("ErrorIs>>"+error.toString());
      emit(OrganizationErrorState(error.toString()));
    });
  }

}
