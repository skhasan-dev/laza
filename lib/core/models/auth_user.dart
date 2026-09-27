import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
abstract class AuthUser with _$AuthUser {
  const factory AuthUser({
    String? username,
    String? email,
    String? password,
    String? phone,
    String? gender,
    DateTime? dob,
    String? profileImage,
    List<String>? favouritesCategories,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}
