import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart';
import 'package:laza/core/services/dependency_locator.dart';
import 'package:laza/features/cart/index.dart';

class PaymentCardView extends StatefulWidget {
  const PaymentCardView({super.key});

  @override
  State<PaymentCardView> createState() => _PaymentCardViewState();
}

class _PaymentCardViewState extends State<PaymentCardView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _expController = TextEditingController();

  final TextEditingController _cvvController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();

  final PaymentCardBloc _paymentCardBloc = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _paymentCardBloc,
      child: Scaffold(
        appBar: CustomAppBar(
          hideCart: true,
          title: Text(
            'Add New Card',
            style: AppTextStyles.s17W600.copyWith(color: AppColors.carbonBlack),
          ),
        ),

        body: BlocListener<PaymentCardBloc, PaymentCardState>(
          listener: (context, state) {
            if (state is PaymentCardSuccess) {
              context.pop(true);
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 15,
                children: [
                  AppTextField(
                    controller: _nameController,
                    title: 'Name',
                    subtitle: 'Type your name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      if (value.length < 2) {
                        return 'Enter valid name';
                      }
                      return null;
                    },
                  ),
                  AppTextField(
                    controller: _numberController,
                    title: 'Phone Number',
                    subtitle: 'Type your phone number',
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: false,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Card number is required';
                      }

                      if (value.length != 16) {
                        return 'Card number is invalid';
                      }
                      return null;
                    },
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: _expController,
                          title: 'EXP',
                          subtitle: '24/10',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Expiry is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: AppTextField(
                          controller: _cvvController,
                          title: 'CVV',
                          subtitle: '761',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'CVV is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar:
            BlocSelector<PaymentCardBloc, PaymentCardState, bool>(
              selector: (state) => state is PaymentCardLoading,
              builder: (context, isLoading) {
                return AppButton(
                  label: 'Add Card',
                  isLoading: isLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _paymentCardBloc.add(
                        PaymentCardAdded(
                          card: PaymentCard(
                            ownerName: _nameController.text.trim(),
                            expiry: _expController.text.trim(),
                            cvv: _cvvController.text.trim(),
                            number: _numberController.text.trim(),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
      ),
    );
  }
}
