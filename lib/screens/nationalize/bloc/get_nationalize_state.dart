part of 'get_nationalize_bloc.dart';

@immutable
abstract class GetNationalizeState {}

class GetNationalizeInitial extends GetNationalizeState {}

class GetNationalizeProgress extends GetNationalizeState {}

class GetNationalizeSuccess extends GetNationalizeState {
  final NationalizeModel genderModel;

  GetNationalizeSuccess({required this.genderModel});
}

class GetNationalizeFailure extends GetNationalizeState {
  final String errorMessage;

  GetNationalizeFailure({required this.errorMessage});
}
