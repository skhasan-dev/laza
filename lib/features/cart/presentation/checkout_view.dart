import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/common/index.dart'
    show AppButton, AppColors, AppTextStyles, CustomAppBar;
import 'package:laza/core/index.dart';
import 'package:laza/features/cart/index.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final CartBloc _cartBloc = getIt();
  final AddressBloc _addressBloc = getIt();
  final PaymentCardBloc _paymentCardBloc = getIt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartBloc.add(CartFetched());
      _addressBloc.add(AddressFetched());
      _paymentCardBloc.add(PaymentCardFetched());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _cartBloc),
        BlocProvider.value(value: _addressBloc),
        BlocProvider.value(value: _paymentCardBloc),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          hideCart: true,
          title: Text('Cart', style: AppTextStyles.s17W600),
        ),

        body: BlocSelector<CartBloc, CartState, List<CartItem>>(
          selector: (state) => (state is CartSuccess) ? state.items : [],
          builder: (context, items) {
            if (items.isEmpty) {
              return Center(
                child: Column(
                  spacing: 4,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Cart is Empty',
                      style: AppTextStyles.s22W600.copyWith(
                        color: AppColors.carbonBlack,
                      ),
                    ),
                    Text(
                      'No items in cart',
                      style: AppTextStyles.s13W400.copyWith(
                        color: AppColors.coolSteel,
                      ),
                    ),
                  ],
                ),
              );
            }
            return SingleChildScrollView(
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
                  const SizedBox(height: 25),
                  SavedAddress(),
                  const SizedBox(height: 20),
                  PaymentCards(),
                  const SizedBox(height: 20),
                  PaymentSummary(total: 600),
                ],
              ),
            );
          },
        ),

        bottomNavigationBar: BlocSelector<CartBloc, CartState, List<CartItem>>(
          selector: (state) => (state is CartSuccess) ? state.items : [],
          builder: (context, items) {
            if (items.isEmpty) {
              return SizedBox.shrink();
            }
            return AppButton(label: 'Checkout');
          },
        ),
      ),
    );
  }
}
