import 'package:get_it/get_it.dart';
import 'package:neirodev/screens/age/bloc/get_age_bloc.dart';
import 'package:neirodev/screens/age/data/repository/age_repository.dart';

Future<void> initIC() async {
  final sl = GetIt.instance;

  //bloc
  sl.registerFactory(() => GetAgeBloc(ageRepository: sl()));

  //Repository
  sl.registerLazySingleton<AgeRepository>(() => AgeRepositoryImpl());
}
