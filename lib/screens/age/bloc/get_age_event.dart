part of 'get_age_bloc.dart';

@immutable
abstract class GetAgeEvent {}

class GetAge extends GetAgeEvent {
  final String name;

  GetAge({required this.name});
}
