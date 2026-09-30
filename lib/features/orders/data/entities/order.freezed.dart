// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Order {

 String? get id; List<CartItem>? get items; Address? get shippingAddress; PaymentCard? get paymentCard; num? get total; num? get shippingCharges; DateTime? get createdAt;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Order;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.shippingAddress, _this.shippingAddress) || other.shippingAddress == _this.shippingAddress)&&(identical(other.paymentCard, _this.paymentCard) || other.paymentCard == _this.paymentCard)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.shippingCharges, _this.shippingCharges) || other.shippingCharges == _this.shippingCharges)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Order;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.items),_this.shippingAddress,_this.paymentCard,_this.total,_this.shippingCharges,_this.createdAt);
}

@override
String toString() {
  final _this = this as Order;
  return 'Order(id: ${_this.id}, items: ${_this.items}, shippingAddress: ${_this.shippingAddress}, paymentCard: ${_this.paymentCard}, total: ${_this.total}, shippingCharges: ${_this.shippingCharges}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String? id, List<CartItem>? items, Address? shippingAddress, PaymentCard? paymentCard, num? total, num? shippingCharges, DateTime? createdAt
});


$AddressCopyWith<$Res>? get shippingAddress;$PaymentCardCopyWith<$Res>? get paymentCard;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? items = freezed,Object? shippingAddress = freezed,Object? paymentCard = freezed,Object? total = freezed,Object? shippingCharges = freezed,Object? createdAt = freezed,}) {
  return _then(Order(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>?,shippingAddress: freezed == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Address?,paymentCard: freezed == paymentCard ? _self.paymentCard : paymentCard // ignore: cast_nullable_to_non_nullable
as PaymentCard?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as num?,shippingCharges: freezed == shippingCharges ? _self.shippingCharges : shippingCharges // ignore: cast_nullable_to_non_nullable
as num?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.shippingAddress!, (value) {
    return _then(_self.copyWith(shippingAddress: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCardCopyWith<$Res>? get paymentCard {
    if (_self.paymentCard == null) {
    return null;
  }

  return $PaymentCardCopyWith<$Res>(_self.paymentCard!, (value) {
    return _then(_self.copyWith(paymentCard: value));
  });
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  List<CartItem>? items,  Address? shippingAddress,  PaymentCard? paymentCard,  num? total,  num? shippingCharges,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.items,_that.shippingAddress,_that.paymentCard,_that.total,_that.shippingCharges,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  List<CartItem>? items,  Address? shippingAddress,  PaymentCard? paymentCard,  num? total,  num? shippingCharges,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.items,_that.shippingAddress,_that.paymentCard,_that.total,_that.shippingCharges,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  List<CartItem>? items,  Address? shippingAddress,  PaymentCard? paymentCard,  num? total,  num? shippingCharges,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.items,_that.shippingAddress,_that.paymentCard,_that.total,_that.shippingCharges,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Order implements Order {
  const _Order({this.id,  List<CartItem>? items, this.shippingAddress, this.paymentCard, this.total, this.shippingCharges, this.createdAt}): _items = items;
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String? id;
 final  List<CartItem>? _items;
@override List<CartItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Address? shippingAddress;
@override final  PaymentCard? paymentCard;
@override final  num? total;
@override final  num? shippingCharges;
@override final  DateTime? createdAt;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.paymentCard, paymentCard) || other.paymentCard == paymentCard)&&(identical(other.total, total) || other.total == total)&&(identical(other.shippingCharges, shippingCharges) || other.shippingCharges == shippingCharges)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items),shippingAddress,paymentCard,total,shippingCharges,createdAt);
}

@override
String toString() {
    return 'Order(id: $id, items: $items, shippingAddress: $shippingAddress, paymentCard: $paymentCard, total: $total, shippingCharges: $shippingCharges, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String? id, List<CartItem>? items, Address? shippingAddress, PaymentCard? paymentCard, num? total, num? shippingCharges, DateTime? createdAt
});


@override $AddressCopyWith<$Res>? get shippingAddress;@override $PaymentCardCopyWith<$Res>? get paymentCard;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? items = freezed,Object? shippingAddress = freezed,Object? paymentCard = freezed,Object? total = freezed,Object? shippingCharges = freezed,Object? createdAt = freezed,}) {
  return _then(_Order(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>?,shippingAddress: freezed == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Address?,paymentCard: freezed == paymentCard ? _self.paymentCard : paymentCard // ignore: cast_nullable_to_non_nullable
as PaymentCard?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as num?,shippingCharges: freezed == shippingCharges ? _self.shippingCharges : shippingCharges // ignore: cast_nullable_to_non_nullable
as num?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get shippingAddress {
    if (_self.shippingAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.shippingAddress!, (value) {
    return _then(_self.copyWith(shippingAddress: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCardCopyWith<$Res>? get paymentCard {
    if (_self.paymentCard == null) {
    return null;
  }

  return $PaymentCardCopyWith<$Res>(_self.paymentCard!, (value) {
    return _then(_self.copyWith(paymentCard: value));
  });
}
}

// dart format on
