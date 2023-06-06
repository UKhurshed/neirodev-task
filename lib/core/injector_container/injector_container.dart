import 'package:get_it/get_it.dart';
import 'package:neirodev/screens/age/bloc/get_age_bloc.dart';
import 'package:neirodev/screens/age/data/repository/age_repository.dart';
import 'package:neirodev/screens/gender/bloc/get_gender_bloc.dart';
import 'package:neirodev/screens/gender/data/repository/gender_repository.dart';
import 'package:neirodev/screens/nationalize/bloc/get_nationalize_bloc.dart';
import 'package:neirodev/screens/nationalize/data/repository/nationalize_repository.dart';

Future<void> initIC() async {
  final sl = GetIt.instance;

  //bloc
  sl.registerFactory(() => GetAgeBloc(ageRepository: sl()));

  sl.registerFactory(() => GetGenderBloc(genderRepository: sl()));

  sl.registerFactory(() => GetNationalizeBloc(nationalizeRepository: sl()));

  //Repository
  sl.registerLazySingleton<AgeRepository>(() => AgeRepositoryImpl());

  sl.registerLazySingleton<GenderRepository>(() => GenderRepositoryImpl());

  sl.registerLazySingleton<NationalizeRepository>(
      () => NationalizeRepositoryImpl());
}
