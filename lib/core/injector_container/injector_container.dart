import 'package:get_it/get_it.dart';
import 'package:neirodev/screens/age/bloc/get_age_bloc.dart';
import 'package:neirodev/screens/age/data/repository/age_repository.dart';
import 'package:neirodev/screens/gender/bloc/get_gender_bloc.dart';
import 'package:neirodev/screens/gender/data/repository/gender_repository.dart';

Future<void> initIC() async {
  final sl = GetIt.instance;

  //bloc
  sl.registerFactory(() => GetAgeBloc(ageRepository: sl()));

  sl.registerFactory(() => GetGenderBloc(genderRepository: sl()));

  //Repository
  sl.registerLazySingleton<AgeRepository>(() => AgeRepositoryImpl());

  sl.registerLazySingleton<GenderRepository>(() => GenderRepositoryImpl());
}
