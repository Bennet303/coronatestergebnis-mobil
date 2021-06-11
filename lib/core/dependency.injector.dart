import 'package:coronatestergebnis_app/features/authentication/data/datasources/firebase.remote.data.source.dart';
import 'package:coronatestergebnis_app/features/authentication/data/datasources/login.remote.data.source.dart';
import 'package:coronatestergebnis_app/features/authentication/data/repositories/login.repository.impl.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/repositories/login.repository.dart';
import 'package:get_it/get_it.dart';
import '../features/authentication/domain/usecases/sign.in.dart';

final injector = GetIt.instance;
Future<void> init() async {
  //* Use Case
  injector
      .registerLazySingleton<SignInUsecase>(() => SignInUsecase(injector()));

  //* Repository
  injector.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(injector()));

  //* Data sources
  injector.registerLazySingleton<LoginRemoteDataSource>(
      () => FirebaseRemoteDataSource());
}
