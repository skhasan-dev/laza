import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laza/features/cart/index.dart'
    show Address, $AddressCopyWith, PaymentCard, $PaymentCardCopyWith;
import 'package:laza/features/products/index.dart'
    show Product, $ProductCopyWith;

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    String? id,
    Product? product,
    Address? shippingAddress,
    PaymentCard? paymentCard,
    num? total,
    num? shippingCharges,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
