import 'package:laza/core/index.dart' show AuthUser, ResultFuture;
import 'package:laza/core/utils/typedefs.dart';
import 'package:laza/features/authentication/index.dart'
    show AuthenticationRepository, AuthenticationDatasource;

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  const AuthenticationRepositoryImpl({required this._datasource});

  final AuthenticationDatasource _datasource;

  @override
  ResultFuture<AuthUser?> register({
    required String username,
    required String email,
    required String password,
  }) => _datasource.register(
    username: username,
    email: email,
    password: password,
  );

  @override
  ResultFuture<AuthUser?> login({
    required String username,
    required String password,
  }) => _datasource.login(username: username, password: password);

  @override
  ResultFuture<bool> checkForUsername({required String username}) =>
      _datasource.checkForUsername(username: username);

  @override
  ResultVoid sendPasswordResetLink({required String email}) =>
      _datasource.sendPasswordResetLink(email: email);

  @override
  ResultFuture<AuthUser?> loginWithGoogle() => _datasource.loginWithGoogle();
}
