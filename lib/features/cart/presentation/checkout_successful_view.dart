import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart';
import 'package:laza/core/index.dart';
import 'package:laza/gen/assets.gen.dart';

class CheckoutSuccessfulView extends StatelessWidget {
  const CheckoutSuccessfulView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hideCart: true,
        leading: AppBackButton(
          onPressed: () => context.goNamed(RouteNames.home),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 140),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.orderConfirmedBg.path),
              ),
            ),
            child: SvgPicture.asset(Assets.images.orderConfirmed.path),
          ),
          const SizedBox(height: 40),
          Text(
            'Order Confirmed!',
            style: AppTextStyles.s28W600.copyWith(color: AppColors.carbonBlack),
          ),
          const SizedBox(height: 10),
          Text(
            'Your order has been confirmed, we will send you confirmation email shortly.',
            textAlign: TextAlign.center,
            style: AppTextStyles.s15W400.copyWith(color: AppColors.coolSteel),
          ),
        ],
      ),

      bottomNavigationBar: AppButton(
        label: 'Continue Shopping',
        onPressed: () => context.goNamed(RouteNames.home),
      ),
    );
  }
}
