import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neirodev/screens/gender/data/repository/gender_repository.dart';
import 'package:neirodev/screens/nationalize/data/model/nationalize_model.dart';
import 'package:neirodev/screens/nationalize/data/repository/nationalize_repository.dart';

part 'get_nationalize_event.dart';

part 'get_nationalize_state.dart';

class GetNationalizeBloc
    extends Bloc<GetNationalizeEvent, GetNationalizeState> {
  final NationalizeRepository nationalizeRepository;

  GetNationalizeBloc({required this.nationalizeRepository})
      : super(GetNationalizeInitial()) {
    on<GetNationalize>(_mapGetNationalize);
  }

  _mapGetNationalize(event, emit) async {
    emit(GetNationalizeProgress());
    final result = await nationalizeRepository.getNationalizeByName(event.name);
    if (result.errorMessage != null) {
      emit(GetNationalizeFailure(errorMessage: result.errorMessage!));
    } else {
      emit(GetNationalizeSuccess(genderModel: result.response));
    }
  }
}
