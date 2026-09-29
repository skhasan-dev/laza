// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUser {

 String? get username; String? get email; String? get password; String? get phone; String? get gender; DateTime? get dob; String? get profileImage; List<Category>? get favouritesCategories; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserCopyWith<AuthUser> get copyWith => _$AuthUserCopyWithImpl<AuthUser>(this as AuthUser, _$identity);

  /// Serializes this AuthUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AuthUser;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUser&&(identical(other.username, _this.username) || other.username == _this.username)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.password, _this.password) || other.password == _this.password)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.dob, _this.dob) || other.dob == _this.dob)&&(identical(other.profileImage, _this.profileImage) || other.profileImage == _this.profileImage)&&const DeepCollectionEquality().equals(other.favouritesCategories, _this.favouritesCategories)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AuthUser;
  return Object.hash(runtimeType,_this.username,_this.email,_this.password,_this.phone,_this.gender,_this.dob,_this.profileImage,const DeepCollectionEquality().hash(_this.favouritesCategories),_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as AuthUser;
  return 'AuthUser(username: ${_this.username}, email: ${_this.email}, password: ${_this.password}, phone: ${_this.phone}, gender: ${_this.gender}, dob: ${_this.dob}, profileImage: ${_this.profileImage}, favouritesCategories: ${_this.favouritesCategories}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $AuthUserCopyWith<$Res>  {
  factory $AuthUserCopyWith(AuthUser value, $Res Function(AuthUser) _then) = _$AuthUserCopyWithImpl;
@useResult
$Res call({
 String? username, String? email, String? password, String? phone, String? gender, DateTime? dob, String? profileImage, List<Category>? favouritesCategories, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$AuthUserCopyWithImpl<$Res>
    implements $AuthUserCopyWith<$Res> {
  _$AuthUserCopyWithImpl(this._self, this._then);

  final AuthUser _self;
  final $Res Function(AuthUser) _then;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? email = freezed,Object? password = freezed,Object? phone = freezed,Object? gender = freezed,Object? dob = freezed,Object? profileImage = freezed,Object? favouritesCategories = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(AuthUser(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,favouritesCategories: freezed == favouritesCategories ? _self.favouritesCategories : favouritesCategories // ignore: cast_nullable_to_non_nullable
as List<Category>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUser].
extension AuthUserPatterns on AuthUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUser value)  $default,){
final _that = this;
switch (_that) {
case _AuthUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUser value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? username,  String? email,  String? password,  String? phone,  String? gender,  DateTime? dob,  String? profileImage,  List<Category>? favouritesCategories,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that.username,_that.email,_that.password,_that.phone,_that.gender,_that.dob,_that.profileImage,_that.favouritesCategories,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? username,  String? email,  String? password,  String? phone,  String? gender,  DateTime? dob,  String? profileImage,  List<Category>? favouritesCategories,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AuthUser():
return $default(_that.username,_that.email,_that.password,_that.phone,_that.gender,_that.dob,_that.profileImage,_that.favouritesCategories,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? username,  String? email,  String? password,  String? phone,  String? gender,  DateTime? dob,  String? profileImage,  List<Category>? favouritesCategories,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AuthUser() when $default != null:
return $default(_that.username,_that.email,_that.password,_that.phone,_that.gender,_that.dob,_that.profileImage,_that.favouritesCategories,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _AuthUser implements AuthUser {
  const _AuthUser({this.username, this.email, this.password, this.phone, this.gender, this.dob, this.profileImage,  List<Category>? favouritesCategories, this.createdAt, this.updatedAt}): _favouritesCategories = favouritesCategories;
  factory _AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);

@override final  String? username;
@override final  String? email;
@override final  String? password;
@override final  String? phone;
@override final  String? gender;
@override final  DateTime? dob;
@override final  String? profileImage;
 final  List<Category>? _favouritesCategories;
@override List<Category>? get favouritesCategories {
  final value = _favouritesCategories;
  if (value == null) return null;
  if (_favouritesCategories is EqualUnmodifiableListView) return _favouritesCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserCopyWith<_AuthUser> get copyWith => __$AuthUserCopyWithImpl<_AuthUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUser&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&const DeepCollectionEquality().equals(other.favouritesCategories, _favouritesCategories)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,username,email,password,phone,gender,dob,profileImage,const DeepCollectionEquality().hash(_favouritesCategories),createdAt,updatedAt);
}

@override
String toString() {
    return 'AuthUser(username: $username, email: $email, password: $password, phone: $phone, gender: $gender, dob: $dob, profileImage: $profileImage, favouritesCategories: $favouritesCategories, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AuthUserCopyWith<$Res> implements $AuthUserCopyWith<$Res> {
  factory _$AuthUserCopyWith(_AuthUser value, $Res Function(_AuthUser) _then) = __$AuthUserCopyWithImpl;
@override @useResult
$Res call({
 String? username, String? email, String? password, String? phone, String? gender, DateTime? dob, String? profileImage, List<Category>? favouritesCategories, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$AuthUserCopyWithImpl<$Res>
    implements _$AuthUserCopyWith<$Res> {
  __$AuthUserCopyWithImpl(this._self, this._then);

  final _AuthUser _self;
  final $Res Function(_AuthUser) _then;

/// Create a copy of AuthUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? email = freezed,Object? password = freezed,Object? phone = freezed,Object? gender = freezed,Object? dob = freezed,Object? profileImage = freezed,Object? favouritesCategories = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AuthUser(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,favouritesCategories: freezed == favouritesCategories ? _self._favouritesCategories : favouritesCategories // ignore: cast_nullable_to_non_nullable
as List<Category>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
