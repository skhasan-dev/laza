import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/common/index.dart'
    show AppColors, AppTextStyles, CustomAppBar, EmptyState;
import 'package:laza/core/index.dart';
import 'package:laza/features/orders/index.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  final OrdersBloc _ordersBloc = getIt();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ordersBloc.add(OrderFetched());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _ordersBloc,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'Orders',
            style: AppTextStyles.s17W500.copyWith(color: AppColors.carbonBlack),
          ),
          hideCart: true,
        ),
        body: BlocSelector<OrdersBloc, OrderState, OrderState>(
          selector: (state) => state,
          builder: (context, state) {
            if (state is OrderLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is OrderSuccess) {
              final orders = state.orders;
              return RefreshIndicator(
                onRefresh: () async {
                  _ordersBloc.add(OrderFetched());
                },
                child: orders.isEmpty
                    ? EmptyState(label: 'No Orders Found!!')
                    : ListView.separated(
                        padding: EdgeInsets.all(20),
                        separatorBuilder: (_, _) => SizedBox(height: 20),
                        itemBuilder: (_, index) {
                          return OrderCard(order: orders[index]);
                        },
                        itemCount: orders.length,
                      ),
              );
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
