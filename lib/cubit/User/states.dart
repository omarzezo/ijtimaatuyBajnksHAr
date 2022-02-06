
// import 'package:ijmeet/Models/users_response_model.dart';

import 'package:itimaaty/Models/LoginResponseModel.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBottomNavBarState extends AppStates {}

class AppGetUsersDataLoadingState extends AppStates {
  final LoginResponseModel model;
  AppGetUsersDataLoadingState({this.model});
}
class AppGetUsersDataSuccessState extends AppStates {
  final LoginResponseModel model;
  AppGetUsersDataSuccessState(this.model);
}

class AppGetUsersDataErrorState extends AppStates {}

