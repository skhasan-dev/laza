import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laza/features/products/index.dart'
    show Product, $ProductCopyWith;

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({String? id, Product? product, int? quantity}) =
      _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
