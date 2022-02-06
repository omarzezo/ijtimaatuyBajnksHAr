import 'package:itimaaty/Models/OrganizationResponseModel.dart';

abstract class OrganizationStates {}

class OrganizationInitialState extends OrganizationStates {}

class OrganizationLoadingState extends OrganizationStates {}

class OrganizationSuccessState extends OrganizationStates {
  final OrganizationResponseModel organizationModel;
  OrganizationSuccessState(this.organizationModel);
}

class OrganizationErrorState extends OrganizationStates {
  final String error;
  OrganizationErrorState(this.error);
}
