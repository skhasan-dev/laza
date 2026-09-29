import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laza/features/products/index.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
abstract class AuthUser with _$AuthUser {
  @JsonSerializable(explicitToJson: true)
  const factory AuthUser({
    String? username,
    String? email,
    String? password,
    String? phone,
    String? gender,
    DateTime? dob,
    String? profileImage,
    List<Category>? favouritesCategories,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AuthUser;

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
}
