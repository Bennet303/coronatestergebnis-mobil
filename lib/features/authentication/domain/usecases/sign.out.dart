import 'package:coronatestergebnis_app/features/authentication/domain/repositories/login.repository.dart';

class SignOutUsecase {
  final LoginRepository repository;

  SignOutUsecase(this.repository);

  Future<void> call() async {
    await repository.signOut();
  }
}
