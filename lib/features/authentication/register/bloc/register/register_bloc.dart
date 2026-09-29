import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure;
import 'package:laza/features/authentication/index.dart'
    show
        AuthenticationRepository,
        CheckedUsername,
        RegisterEvent,
        RegisterFailure,
        RegisterInitial,
        RegisterLoading,
        RegisterState,
        RegisterSubmitted,
        RegisterSuccess;
import 'package:laza/features/authentication/register/bloc/register/index.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._authenticationRepository)
    : super(const RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<CheckedUsername>(_onUsernameChecked);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());

    final result = await _authenticationRepository.register(
      email: event.email,
      username: event.username.trim(),
      password: event.password,
    );

    result.fold(
      (failure) {
        emit(
          RegisterFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (user) {
        emit(RegisterSuccess());
      },
    );
  }

  Future<void> _onUsernameChecked(
    CheckedUsername event,
    Emitter<RegisterState> emit,
  ) async {
    final result = await _authenticationRepository.checkForUsername(
      username: event.username.trim(),
    );

    result.fold(
      (failure) {
        emit(
          RegisterFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (available) {
        emit(RegisterUsernameCheckedSuccess(notAvailable: available));
      },
    );
  }
}
