import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure, Failure;
import 'package:laza/features/authentication/index.dart'
    show AuthenticationRepository;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authenticationRepository) : super(const AuthInitial()) {
    on<AuthSubmitted>(_onAuthSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onAuthSubmitted(
    AuthSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _authenticationRepository.loginWithGoogle();

    result.fold(
      (failure) {
        emit(
          AuthFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (user) {
        emit(AuthSuccess());
      },
    );
  }
}
