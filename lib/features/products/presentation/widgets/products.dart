import 'package:flutter/material.dart';
import 'package:laza/features/products/index.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Products extends StatelessWidget {
  const Products({
    required this.products,
    required this.onScrollToEnd,
    this.physics,
    super.key,
  });

  final List<Product> products;
  final ScrollPhysics? physics;
  final VoidCallback onScrollToEnd;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: physics ?? const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        mainAxisExtent: 270,
      ),
      itemCount: products.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        final product = products[index];
        return VisibilityDetector(
          key: ValueKey(product.id ?? index),
          onVisibilityChanged: (info) {
            final percentage = info.visibleFraction;
            final lastIndex = index == products.length - 1;

            if (lastIndex && percentage == 1) {
              onScrollToEnd.call();
            }
          },
          child: ProductCard(product: product),
        );
      },
    );
  }
}
