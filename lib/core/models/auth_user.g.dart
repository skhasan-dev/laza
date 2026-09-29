// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => _AuthUser(
  username: json['username'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  phone: json['phone'] as String?,
  gender: json['gender'] as String?,
  dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
  profileImage: json['profileImage'] as String?,
  favouritesCategories: (json['favouritesCategories'] as List<dynamic>?)
      ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
  'username': instance.username,
  'email': instance.email,
  'password': instance.password,
  'phone': instance.phone,
  'gender': instance.gender,
  'dob': instance.dob?.toIso8601String(),
  'profileImage': instance.profileImage,
  'favouritesCategories': instance.favouritesCategories
      ?.map((e) => e.toJson())
      .toList(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
