import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neirodev/screens/gender/data/model/gender_model.dart';
import 'package:neirodev/screens/gender/data/repository/gender_repository.dart';

part 'get_gender_event.dart';

part 'get_gender_state.dart';

class GetGenderBloc extends Bloc<GetGenderEvent, GetGenderState> {
  final GenderRepository genderRepository;

  GetGenderBloc({required this.genderRepository}) : super(GetGenderInitial()) {
    on<GetGender>(_mapGetGender);
  }

  _mapGetGender(event, emit) async {
    emit(GetGenderProgress());
    final result = await genderRepository.getGenderByNameWithHTTP(event.name);
    if (result.errorMessage != null) {
      emit(GetGenderFailure(errorMessage: result.errorMessage!));
    } else {
      emit(GetGenderSuccess(genderModel: result.response));
    }
  }
}
