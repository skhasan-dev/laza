import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laza/features/cart/index.dart'
    show $AddressCopyWith, $PaymentCardCopyWith, Address, CartItem, PaymentCard;

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Order with _$Order {
  @JsonSerializable(explicitToJson: true)
  const factory Order({
    String? id,
    List<CartItem>? items,
    Address? shippingAddress,
    PaymentCard? paymentCard,
    num? total,
    num? shippingCharges,
    DateTime? createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
