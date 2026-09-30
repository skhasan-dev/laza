// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  shippingAddress: json['shippingAddress'] == null
      ? null
      : Address.fromJson(json['shippingAddress'] as Map<String, dynamic>),
  paymentCard: json['paymentCard'] == null
      ? null
      : PaymentCard.fromJson(json['paymentCard'] as Map<String, dynamic>),
  total: json['total'] as num?,
  shippingCharges: json['shippingCharges'] as num?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'shippingAddress': instance.shippingAddress?.toJson(),
  'paymentCard': instance.paymentCard?.toJson(),
  'total': instance.total,
  'shippingCharges': instance.shippingCharges,
  'createdAt': instance.createdAt?.toIso8601String(),
};
