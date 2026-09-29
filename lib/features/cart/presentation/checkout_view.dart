import 'package:flutter/material.dart';
import 'package:laza/common/index.dart'
    show AppButton, AppColors, AppTextStyles, CustomAppBar;
import 'package:laza/features/cart/index.dart';
import 'package:laza/features/products/index.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hideCart: true,
        title: Text('Cart', style: AppTextStyles.s17W600),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return CartListItem(
                  item: items[index],
                  onQuantityIncrease: () {},
                  onQuantityDecrease: () {},
                  onRemove: () {},
                );
              },
              separatorBuilder: (_, _) => const SizedBox(height: 20),
              itemCount: items.length,
            ),
            const SizedBox(height: 20),
            _buildRow(
              key: 'Delivery Address',
              keyStyle: AppTextStyles.s17W500.copyWith(
                color: AppColors.carbonBlack,
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 15),

            Text(
              'No address found',
              style: AppTextStyles.s15W400.copyWith(color: AppColors.coolSteel),
            ),

            const SizedBox(height: 20),

            _buildRow(
              key: 'Payment Method',
              keyStyle: AppTextStyles.s17W500.copyWith(
                color: AppColors.carbonBlack,
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 15),
            Text(
              'No address found',
              style: AppTextStyles.s15W400.copyWith(color: AppColors.coolSteel),
            ),

            const SizedBox(height: 20),

            _buildRow(
              key: 'Order Info',
              keyStyle: AppTextStyles.s17W500.copyWith(
                color: AppColors.carbonBlack,
              ),
            ),
            const SizedBox(height: 15),
            _buildRow(key: 'Subtotal', value: '\$500'),
            const SizedBox(height: 10),
            _buildRow(key: 'Shipping cost', value: '\$500'),
            const SizedBox(height: 15),
            _buildRow(key: 'Total', value: '\$500'),
          ],
        ),
      ),

      bottomNavigationBar: AppButton(label: 'Checkout'),
    );
  }

  List<CartItem> items = [
    CartItem(
      id: '#1',
      product: Product(
        thumbnail: 'https://picsum.photos/200',
        title: "Men's Tie-Dye T-Shirt Nike Sportswear",
        price: 4.99,
      ),
      quantity: 1,
    ),
    CartItem(
      id: '#2',
      product: Product(
        thumbnail: 'https://picsum.photos/400',
        title: "Men's Tie-Dye T-Shirt Nike Sportswear",
        price: 9.99,
      ),
      quantity: 2,
    ),
  ];

  Widget _buildRow({
    required String key,
    TextStyle? keyStyle,
    String? value,
    Widget? trailing,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style:
              keyStyle ??
              AppTextStyles.s15W400.copyWith(color: AppColors.coolSteel),
        ),
        trailing ??
            (value != null
                ? Text(
                    value,
                    style: AppTextStyles.s15W500.copyWith(
                      color: AppColors.carbonBlack,
                    ),
                  )
                : SizedBox.shrink()),
      ],
    );
  }
}
