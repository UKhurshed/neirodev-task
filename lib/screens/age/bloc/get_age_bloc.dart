import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neirodev/screens/age/data/model/age_model.dart';
import 'package:neirodev/screens/age/data/repository/age_repository.dart';

part 'get_age_event.dart';

part 'get_age_state.dart';

class GetAgeBloc extends Bloc<GetAgeEvent, GetAgeState> {
  final AgeRepository ageRepository;

  GetAgeBloc({required this.ageRepository}) : super(GetAgeInitial()) {
    on<GetAge>(_mapGetAge);
  }

  _mapGetAge(event, emit) async {
    emit(GetAgeProgress());
    final result = await ageRepository.getAgeByNameWithHTTP(event.name);
    if (result.errorMessage != null) {
      emit(GetAgeFailure(errorMessage: result.errorMessage!));
    } else {
      emit(GetAgeSuccess(ageModel: result.response));
    }
  }
}
