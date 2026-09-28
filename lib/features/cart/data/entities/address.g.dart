// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  id: json['id'] as String?,
  name: json['name'] as String?,
  country: json['country'] as String?,
  city: json['city'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  address: json['address'] as String?,
  primaryAddress: json['primaryAddress'] as bool?,
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'country': instance.country,
  'city': instance.city,
  'phoneNumber': instance.phoneNumber,
  'address': instance.address,
  'primaryAddress': instance.primaryAddress,
};
