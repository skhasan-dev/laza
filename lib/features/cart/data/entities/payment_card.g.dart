// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentCard _$PaymentCardFromJson(Map<String, dynamic> json) => _PaymentCard(
  id: json['id'] as String?,
  ownerName: json['ownerName'] as String?,
  number: json['number'] as String?,
  expiry: json['expiry'] as String?,
  cvv: json['cvv'] as String?,
  primaryMethod: json['primaryMethod'] as bool?,
);

Map<String, dynamic> _$PaymentCardToJson(_PaymentCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerName': instance.ownerName,
      'number': instance.number,
      'expiry': instance.expiry,
      'cvv': instance.cvv,
      'primaryMethod': instance.primaryMethod,
    };
