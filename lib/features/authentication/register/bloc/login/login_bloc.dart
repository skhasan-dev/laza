import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure;
import 'package:laza/features/authentication/index.dart'
    show
        LoginState,
        LoginEvent,
        LoginSubmitted,
        LoginRememberMeChanged,
        AuthenticationRepository,
        LoginInitial,
        LoginLoading,
        LoginFailure,
        LoginSuccess;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authenticationRepository) : super(const LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoginRememberMeChanged>(_onRememberMeChanged);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    final result = await _authenticationRepository.login(
      username: event.username.trim(),
      password: event.password,
    );

    result.fold(
      (failure) {
        emit(
          LoginFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (user) {
        emit(LoginSuccess());
      },
    );
  }

  void _onRememberMeChanged(
    LoginRememberMeChanged event,
    Emitter<LoginState> emit,
  ) {
    // emit(state.copyWith(rememberMe: event.value));
  }
}
