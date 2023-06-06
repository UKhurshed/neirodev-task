part of 'get_nationalize_bloc.dart';

@immutable
abstract class GetNationalizeEvent {}

class GetNationalize extends GetNationalizeEvent {
  final String name;

  GetNationalize({required this.name});
}
