part of 'profile_bloc.dart';

sealed class ProfileEvent {
  const ProfileEvent();
}

final class ProfileSubmitted extends ProfileEvent {
  const ProfileSubmitted({required this.user});

  final AuthUser user;
}

final class ProfileFetched extends ProfileEvent {
  const ProfileFetched();
}
