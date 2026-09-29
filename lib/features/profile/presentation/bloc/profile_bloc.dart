import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/index.dart' show APIFailure, AuthUser, Failure;

import 'package:laza/features/profile/index.dart' show ProfileRepository;

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._profileRepository) : super(const ProfileInitial()) {
    on<ProfileSubmitted>(_onProfileSubmitted);
    on<ProfileFetched>(_onProfileFetched);
  }

  final ProfileRepository _profileRepository;

  Future<void> _onProfileSubmitted(
    ProfileSubmitted event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    final result = await _profileRepository.updateUserProfile(user: event.user);

    result.fold(
      (failure) {
        emit(
          ProfileFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (user) {
        emit(ProfileSuccess(user));
      },
    );
  }

  Future<void> _onProfileFetched(
    ProfileFetched event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    final result = await _profileRepository.getUserProfile();

    result.fold(
      (failure) {
        emit(
          ProfileFailure(failure: APIFailure.fromException(exception: failure)),
        );
      },
      (user) {
        emit(ProfileSuccess(user));
      },
    );
  }
}
