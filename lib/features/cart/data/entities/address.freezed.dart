// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Address {

 String? get id; String? get name; String? get country; String? get city; String? get phoneNumber; String? get address; bool? get primaryAddress;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Address;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.country, _this.country) || other.country == _this.country)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.phoneNumber, _this.phoneNumber) || other.phoneNumber == _this.phoneNumber)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.primaryAddress, _this.primaryAddress) || other.primaryAddress == _this.primaryAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Address;
  return Object.hash(runtimeType,_this.id,_this.name,_this.country,_this.city,_this.phoneNumber,_this.address,_this.primaryAddress);
}

@override
String toString() {
  final _this = this as Address;
  return 'Address(id: ${_this.id}, name: ${_this.name}, country: ${_this.country}, city: ${_this.city}, phoneNumber: ${_this.phoneNumber}, address: ${_this.address}, primaryAddress: ${_this.primaryAddress})';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? country, String? city, String? phoneNumber, String? address, bool? primaryAddress
});




}
/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? country = freezed,Object? city = freezed,Object? phoneNumber = freezed,Object? address = freezed,Object? primaryAddress = freezed,}) {
  return _then(Address(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,primaryAddress: freezed == primaryAddress ? _self.primaryAddress : primaryAddress // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Address].
extension AddressPatterns on Address {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Address value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Address value)  $default,){
final _that = this;
switch (_that) {
case _Address():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Address value)?  $default,){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? country,  String? city,  String? phoneNumber,  String? address,  bool? primaryAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.city,_that.phoneNumber,_that.address,_that.primaryAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? country,  String? city,  String? phoneNumber,  String? address,  bool? primaryAddress)  $default,) {final _that = this;
switch (_that) {
case _Address():
return $default(_that.id,_that.name,_that.country,_that.city,_that.phoneNumber,_that.address,_that.primaryAddress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? country,  String? city,  String? phoneNumber,  String? address,  bool? primaryAddress)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.city,_that.phoneNumber,_that.address,_that.primaryAddress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Address implements Address {
  const _Address({this.id, this.name, this.country, this.city, this.phoneNumber, this.address, this.primaryAddress});
  factory _Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? country;
@override final  String? city;
@override final  String? phoneNumber;
@override final  String? address;
@override final  bool? primaryAddress;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressCopyWith<_Address> get copyWith => __$AddressCopyWithImpl<_Address>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.primaryAddress, primaryAddress) || other.primaryAddress == primaryAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,country,city,phoneNumber,address,primaryAddress);
}

@override
String toString() {
    return 'Address(id: $id, name: $name, country: $country, city: $city, phoneNumber: $phoneNumber, address: $address, primaryAddress: $primaryAddress)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? country, String? city, String? phoneNumber, String? address, bool? primaryAddress
});




}
/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? country = freezed,Object? city = freezed,Object? phoneNumber = freezed,Object? address = freezed,Object? primaryAddress = freezed,}) {
  return _then(_Address(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,primaryAddress: freezed == primaryAddress ? _self.primaryAddress : primaryAddress // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
