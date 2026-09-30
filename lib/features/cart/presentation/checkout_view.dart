import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart'
    show AppButton, AppTextStyles, CustomAppBar, EmptyState;
import 'package:laza/core/index.dart' show getIt, RouteNames;
import 'package:laza/core/utils/index.dart';
import 'package:laza/features/cart/index.dart'
    show
        Address,
        AddressBloc,
        AddressFetched,
        CartBloc,
        CartCheckout,
        CartCheckoutSuccess,
        CartFetched,
        CartItemRemoved,
        CartItemUpdated,
        CartListItem,
        CartLoading,
        CartState,
        CartSuccess,
        PaymentCard,
        PaymentCardBloc,
        PaymentCardFetched,
        PaymentCards,
        PaymentSummary,
        SavedAddress;
import 'package:laza/features/orders/index.dart' show Order;

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final CartBloc _cartBloc = getIt();
  final AddressBloc _addressBloc = getIt();
  final PaymentCardBloc _paymentCardBloc = getIt();

  Address? _address;
  PaymentCard? _paymentCard;

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

        body: BlocSelector<CartBloc, CartState, CartState>(
          selector: (state) => state,
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is CartSuccess) {
              final items = state.items;

              return RefreshIndicator(
                onRefresh: () async {
                  _cartBloc.add(CartFetched());
                  _addressBloc.add(AddressFetched());
                  _paymentCardBloc.add(PaymentCardFetched());
                },
                child: items.isEmpty
                    ? EmptyState(label: 'No Items in Cart')
                    : SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return CartListItem(
                                  item: items[index],
                                  onQuantityIncrease: (item) => _cartBloc.add(
                                    CartItemUpdated(item: item),
                                  ),
                                  onQuantityDecrease: (item) => _cartBloc.add(
                                    CartItemUpdated(item: item),
                                  ),
                                  onRemove: () {
                                    _cartBloc.add(
                                      CartItemRemoved(
                                        id: items[index].id ?? '-',
                                      ),
                                    );
                                  },
                                );
                              },
                              separatorBuilder: (_, _) =>
                                  const SizedBox(height: 20),
                              itemCount: items.length,
                            ),
                            const SizedBox(height: 25),
                            SavedAddress(onTap: (value) => _address = value),
                            const SizedBox(height: 20),
                            PaymentCards(
                              onTap: (value) => _paymentCard = value,
                            ),
                            const SizedBox(height: 20),
                            BlocSelector<CartBloc, CartState, double>(
                              selector: (state) {
                                return state is CartSuccess ? state.total : 0;
                              },
                              builder: (context, total) {
                                return PaymentSummary(
                                  total: total,
                                  shippingCharges: 10,
                                );
                              },
                            ),
                            const SizedBox(height: 80),
                          ],
                        ),
                      ),
              );
            }

            return SizedBox.shrink();
          },
        ),

        bottomNavigationBar: BlocConsumer<CartBloc, CartState>(
          listener: (BuildContext context, CartState state) {
            if (state is CartCheckoutSuccess) {
              context.goNamed(RouteNames.orderConfirmed);
            }
          },
          builder: (context, state) {
            if (state is CartSuccess) {
              if (state.items.isEmpty) {
                return SizedBox.shrink();
              }

              return AppButton(
                label: 'Checkout',
                isLoading: state is CartLoading,
                onPressed: () {
                  if (_address == null) {
                    Toasts.showErrorToast(
                      context,
                      message: 'Shipping address is Required',
                    );
                    return;
                  }

                  if (_paymentCard == null) {
                    Toasts.showErrorToast(
                      context,
                      message: 'Payment metho is Required',
                    );
                    return;
                  }

                  _cartBloc.add(
                    CartCheckout(
                      order: Order(
                        items: state.items,
                        total: state.total,
                        shippingCharges: 10,
                        shippingAddress: _address,
                        paymentCard: _paymentCard,
                      ),
                    ),
                  );
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
