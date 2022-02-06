import 'package:itimaaty/Models/dashboard_response_model.dart';

abstract class HomeStates {}

class HomeStatesInitialState extends HomeStates {}

class HomeStatesLoadingState extends HomeStates {}

class HomeStatesSuccessState extends HomeStates {
  final DashboardResponseModel dashboardResponseModel;
  HomeStatesSuccessState(this.dashboardResponseModel);
}

class HomeStatesErrorState extends HomeStates {
  final String error;
  HomeStatesErrorState(this.error);
}
