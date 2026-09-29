import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laza/features/reviews/index.dart' show Review;

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  @JsonSerializable(explicitToJson: true)
  const factory Product({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    // Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    // ProductMeta? meta,
    String? thumbnail,
    List<String>? images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
