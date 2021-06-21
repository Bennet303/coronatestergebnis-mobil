import 'package:coronatestergebnis_app/features/authentication/data/datasources/firebase.remote.data.source.dart';
import 'package:coronatestergebnis_app/features/authentication/data/datasources/login.remote.data.source.dart';
import 'package:coronatestergebnis_app/features/authentication/data/repositories/login.repository.impl.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/repositories/login.repository.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/usecases/check.authstatus.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/usecases/register.dart';
import 'package:coronatestergebnis_app/features/authentication/domain/usecases/sign.out.dart';
import 'package:coronatestergebnis_app/features/home/data/datasources/firebase.test.result.data.sourc.dart';
import 'package:coronatestergebnis_app/features/home/data/datasources/test.result.data.source.dart';
import 'package:coronatestergebnis_app/features/home/data/repositories/test.result.repository.impl.dart';
import 'package:coronatestergebnis_app/features/home/domain/repositories/test.result.repository.dart';
import 'package:coronatestergebnis_app/features/home/domain/usecases/get.test.result.dart';
import 'package:coronatestergebnis_app/features/home/presentation/bloc/test.result_bloc.dart';
import 'package:coronatestergebnis_app/features/qr_scan/data/datasources/firebase.qr.code.data.source.dart';
import 'package:coronatestergebnis_app/features/qr_scan/data/datasources/firebase.students.data.source.dart';
import 'package:coronatestergebnis_app/features/qr_scan/data/datasources/qr.code.data.source.dart';
import 'package:coronatestergebnis_app/features/qr_scan/data/datasources/students.data.source.dart';
import 'package:coronatestergebnis_app/features/qr_scan/data/repositories/join.class.repository.impl.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/repositories/join.class.repository.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/usecases/join.class.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/usecases/scan.code.dart';
import 'package:coronatestergebnis_app/features/qr_scan/presentation/bloc/join.class_bloc/join.class_bloc.dart';
import 'package:coronatestergebnis_app/features/qr_scan/presentation/bloc/qr_bloc/qr_scan_bloc.dart';
import 'package:get_it/get_it.dart';
import '../features/authentication/domain/usecases/sign.in.dart';
import '../features/authentication/presentation/bloc/authentication_bloc.dart';

final injector = GetIt.instance;
Future<void> init() async {
  ///* Feature: QR
  //* Bloc
  injector.registerFactory<QrScanBloc>(() => QrScanBloc(injector()));

  injector.registerFactory<JoinClassBloc>(
      () => JoinClassBloc(injector(), injector()));

  //* Use Case
  injector.registerLazySingleton<ScanCodeUsecase>(
      () => ScanCodeUsecase(joinClassRepository: injector()));

  injector.registerLazySingleton<JoinClassUsecase>(
      () => JoinClassUsecase(joinClassRepository: injector()));

  //* Repository
  injector.registerLazySingleton<JoinClassRepository>(() =>
      JoinClassRepositoryImpl(
          loginRepository: injector(),
          studentsDataSource: injector(),
          qrDataSource: injector()));

  //* Data Source
  injector.registerLazySingleton<QrCodeDataSource>(
      () => FirebaseQrCodeDataSource());

  injector.registerLazySingleton<StudentsDataSource>(
      () => FirebaseStudentsDataSource());

  ///* Feature: Home
  //* Bloc
  injector.registerFactory<TestResultBloc>(
      () => TestResultBloc(getTestResultUsecase: injector()));

  //* Use Case
  injector.registerLazySingleton<GetTestResultUsecase>(
      () => GetTestResultUsecase(injector()));

  //* Repository
  injector.registerLazySingleton<TestResultRepository>(
    () => TestResultRepositoryImpl(
      testResultDataSource: injector(),
      loginRepository: injector(),
    ),
  );

  //* Data source
  injector.registerLazySingleton<TestResultDataSource>(
    () => FirebaseTestResultDataSource(),
  );

  ///* Feature: Authentication
  //* Bloc
  injector.registerFactory<AuthenticationBloc>(
    () => AuthenticationBloc(
      signInUsecase: injector(),
      registerUsecase: injector(),
      checkAuthstatusUsecase: injector(),
      signOutUsecase: injector(),
    ),
  );

  //* Use Case
  injector
      .registerLazySingleton<SignInUsecase>(() => SignInUsecase(injector()));

  injector.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(injector()));

  injector.registerLazySingleton<CheckAuthstatusUsecase>(
      () => CheckAuthstatusUsecase(injector()));

  injector
      .registerLazySingleton<SignOutUsecase>(() => SignOutUsecase(injector()));

  //* Repository
  injector.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(injector()));

  //* Data sources
  injector.registerLazySingleton<LoginRemoteDataSource>(
      () => FirebaseRemoteDataSource());
}
