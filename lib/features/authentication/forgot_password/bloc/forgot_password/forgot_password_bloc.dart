import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure;
import 'package:laza/features/authentication/index.dart'
    show
        AuthenticationRepository,
        ForgotPasswordEvent,
        ForgotPasswordLinkSent,
        ForgotPasswordState,
        ForgotPasswordInitial,
        ForgotPasswordLoading,
        ForgotPasswordFailure,
        ForgotPasswordSuccess;

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(this._authenticationRepository)
    : super(const ForgotPasswordInitial()) {
    on<ForgotPasswordLinkSent>(_onForgotPasswordLinkSent);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onForgotPasswordLinkSent(
    ForgotPasswordLinkSent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(ForgotPasswordLoading());

    final result = await _authenticationRepository.sendPasswordResetLink(
      email: event.email,
    );

    result.fold(
      (failure) {
        emit(
          ForgotPasswordFailure(
            failure: APIFailure.fromException(exception: failure),
          ),
        );
      },
      (user) {
        emit(ForgotPasswordSuccess());
      },
    );
  }
}
