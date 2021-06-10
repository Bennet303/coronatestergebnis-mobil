import 'package:get_it/get_it.dart';
import '../features/authentication/domain/usecases/sign.in.dart';

final injector = GetIt.instance;
Future<void> init() async {
  //* Use Case
  //injector.registerLazySingleton(() => SignIn)
}
