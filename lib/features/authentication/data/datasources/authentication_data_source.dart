import 'package:laza/core/index.dart' show AuthUser, ResultFuture, ResultVoid;

abstract class AuthenticationDatasource {
  ResultFuture<AuthUser?> register({
    required String username,
    required String email,
    required String password,
  });

  ResultFuture<AuthUser?> login({
    required String username,
    required String password,
  });

  ResultVoid sendPasswordResetLink({required String email});

  ResultFuture<bool> checkForUsername({required String username});

  ResultFuture<AuthUser?> loginWithGoogle();
}
