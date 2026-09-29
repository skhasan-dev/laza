part of 'profile_bloc.dart';

sealed class ProfileState {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

final class ProfileSuccess extends ProfileState {
  const ProfileSuccess(this.user);
  final AuthUser user;
}

final class ProfileFailure extends ProfileState {
  const ProfileFailure({required this.failure});

  final Failure? failure;
}
