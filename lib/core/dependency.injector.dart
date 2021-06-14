import 'package:coronatestergebnis_app/features/authentication/data/datasources/firebase.remote.data.source.dart';
import 'package:coronatestergebnis_app/features/authentication/data/datasources/login.remote.data.source.dart';
import 'package:coronatestergebnis_app/features/authentication/data/repositories/login.repository.impl.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/repositories/login.repository.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/usecases/check.authstatus.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/usecases/register.dart';
import 'package:get_it/get_it.dart';
import '../features/authentication/domain/usecases/sign.in.dart';
import '../features/authentication/presentation/bloc/authentication_bloc.dart';

final injector = GetIt.instance;
Future<void> init() async {
  //* Bloc
  injector.registerFactory<AuthenticationBloc>(
    () => AuthenticationBloc(
      signInUsecase: injector(),
      registerUsecase: injector(),
      checkAuthstatusUsecase: injector(),
    ),
  );

  //* Use Case
  injector
      .registerLazySingleton<SignInUsecase>(() => SignInUsecase(injector()));

  injector.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(injector()));

  injector.registerLazySingleton<CheckAuthstatusUsecase>(
      () => CheckAuthstatusUsecase(injector()));

  //* Repository
  injector.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(injector()));

  //* Data sources
  injector.registerLazySingleton<LoginRemoteDataSource>(
      () => FirebaseRemoteDataSource());
}
