// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String?,
  product: json['product'] == null
      ? null
      : Product.fromJson(json['product'] as Map<String, dynamic>),
  shippingAddress: json['shippingAddress'] == null
      ? null
      : Address.fromJson(json['shippingAddress'] as Map<String, dynamic>),
  paymentCard: json['paymentCard'] == null
      ? null
      : PaymentCard.fromJson(json['paymentCard'] as Map<String, dynamic>),
  total: json['total'] as num?,
  shippingCharges: json['shippingCharges'] as num?,
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'product': instance.product,
  'shippingAddress': instance.shippingAddress,
  'paymentCard': instance.paymentCard,
  'total': instance.total,
  'shippingCharges': instance.shippingCharges,
};
