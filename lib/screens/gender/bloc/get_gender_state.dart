part of 'get_gender_bloc.dart';

@immutable
abstract class GetGenderState {}

class GetGenderInitial extends GetGenderState {}

class GetGenderProgress extends GetGenderState {}

class GetGenderSuccess extends GetGenderState {
  final GenderModel genderModel;

  GetGenderSuccess({required this.genderModel});
}

class GetGenderFailure extends GetGenderState {
  final String errorMessage;

  GetGenderFailure({required this.errorMessage});
}
