part of 'get_gender_bloc.dart';

@immutable
abstract class GetGenderEvent {}

class GetGender extends GetGenderEvent {
  final String name;

  GetGender({required this.name});
}
