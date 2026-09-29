// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentCard {

 String? get id; String? get ownerName; String? get number; String? get expiry; String? get cvv; bool? get primaryMethod;
/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCardCopyWith<PaymentCard> get copyWith => _$PaymentCardCopyWithImpl<PaymentCard>(this as PaymentCard, _$identity);

  /// Serializes this PaymentCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PaymentCard;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentCard&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.ownerName, _this.ownerName) || other.ownerName == _this.ownerName)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.expiry, _this.expiry) || other.expiry == _this.expiry)&&(identical(other.cvv, _this.cvv) || other.cvv == _this.cvv)&&(identical(other.primaryMethod, _this.primaryMethod) || other.primaryMethod == _this.primaryMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PaymentCard;
  return Object.hash(runtimeType,_this.id,_this.ownerName,_this.number,_this.expiry,_this.cvv,_this.primaryMethod);
}

@override
String toString() {
  final _this = this as PaymentCard;
  return 'PaymentCard(id: ${_this.id}, ownerName: ${_this.ownerName}, number: ${_this.number}, expiry: ${_this.expiry}, cvv: ${_this.cvv}, primaryMethod: ${_this.primaryMethod})';
}


}

/// @nodoc
abstract mixin class $PaymentCardCopyWith<$Res>  {
  factory $PaymentCardCopyWith(PaymentCard value, $Res Function(PaymentCard) _then) = _$PaymentCardCopyWithImpl;
@useResult
$Res call({
 String? id, String? ownerName, String? number, String? expiry, String? cvv, bool? primaryMethod
});




}
/// @nodoc
class _$PaymentCardCopyWithImpl<$Res>
    implements $PaymentCardCopyWith<$Res> {
  _$PaymentCardCopyWithImpl(this._self, this._then);

  final PaymentCard _self;
  final $Res Function(PaymentCard) _then;

/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? ownerName = freezed,Object? number = freezed,Object? expiry = freezed,Object? cvv = freezed,Object? primaryMethod = freezed,}) {
  return _then(PaymentCard(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,expiry: freezed == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as String?,cvv: freezed == cvv ? _self.cvv : cvv // ignore: cast_nullable_to_non_nullable
as String?,primaryMethod: freezed == primaryMethod ? _self.primaryMethod : primaryMethod // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentCard].
extension PaymentCardPatterns on PaymentCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentCard value)  $default,){
final _that = this;
switch (_that) {
case _PaymentCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentCard value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? ownerName,  String? number,  String? expiry,  String? cvv,  bool? primaryMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
return $default(_that.id,_that.ownerName,_that.number,_that.expiry,_that.cvv,_that.primaryMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? ownerName,  String? number,  String? expiry,  String? cvv,  bool? primaryMethod)  $default,) {final _that = this;
switch (_that) {
case _PaymentCard():
return $default(_that.id,_that.ownerName,_that.number,_that.expiry,_that.cvv,_that.primaryMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? ownerName,  String? number,  String? expiry,  String? cvv,  bool? primaryMethod)?  $default,) {final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
return $default(_that.id,_that.ownerName,_that.number,_that.expiry,_that.cvv,_that.primaryMethod);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentCard implements PaymentCard {
  const _PaymentCard({this.id, this.ownerName, this.number, this.expiry, this.cvv, this.primaryMethod});
  factory _PaymentCard.fromJson(Map<String, dynamic> json) => _$PaymentCardFromJson(json);

@override final  String? id;
@override final  String? ownerName;
@override final  String? number;
@override final  String? expiry;
@override final  String? cvv;
@override final  bool? primaryMethod;

/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCardCopyWith<_PaymentCard> get copyWith => __$PaymentCardCopyWithImpl<_PaymentCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentCardToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentCard&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName)&&(identical(other.number, number) || other.number == number)&&(identical(other.expiry, expiry) || other.expiry == expiry)&&(identical(other.cvv, cvv) || other.cvv == cvv)&&(identical(other.primaryMethod, primaryMethod) || other.primaryMethod == primaryMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,ownerName,number,expiry,cvv,primaryMethod);
}

@override
String toString() {
    return 'PaymentCard(id: $id, ownerName: $ownerName, number: $number, expiry: $expiry, cvv: $cvv, primaryMethod: $primaryMethod)';
}


}

/// @nodoc
abstract mixin class _$PaymentCardCopyWith<$Res> implements $PaymentCardCopyWith<$Res> {
  factory _$PaymentCardCopyWith(_PaymentCard value, $Res Function(_PaymentCard) _then) = __$PaymentCardCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? ownerName, String? number, String? expiry, String? cvv, bool? primaryMethod
});




}
/// @nodoc
class __$PaymentCardCopyWithImpl<$Res>
    implements _$PaymentCardCopyWith<$Res> {
  __$PaymentCardCopyWithImpl(this._self, this._then);

  final _PaymentCard _self;
  final $Res Function(_PaymentCard) _then;

/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? ownerName = freezed,Object? number = freezed,Object? expiry = freezed,Object? cvv = freezed,Object? primaryMethod = freezed,}) {
  return _then(_PaymentCard(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,expiry: freezed == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as String?,cvv: freezed == cvv ? _self.cvv : cvv // ignore: cast_nullable_to_non_nullable
as String?,primaryMethod: freezed == primaryMethod ? _self.primaryMethod : primaryMethod // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
