part of 'get_age_bloc.dart';

@immutable
abstract class GetAgeState {}

class GetAgeInitial extends GetAgeState {}

class GetAgeProgress extends GetAgeState {}

class GetAgeSuccess extends GetAgeState {
  final AgeModel ageModel;

  GetAgeSuccess({required this.ageModel});
}

class GetAgeFailure extends GetAgeState {
  final String errorMessage;

  GetAgeFailure({required this.errorMessage});
}
