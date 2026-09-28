import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_card.freezed.dart';
part 'payment_card.g.dart';

@freezed
abstract class PaymentCard with _$PaymentCard {
  const factory PaymentCard({
    String? id,
    String? ownerName,
    String? number,
    String? expiry,
    String? cvv,
  }) = _PaymentCard;

  factory PaymentCard.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardFromJson(json);
}
