import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/common/index.dart';
import 'package:laza/core/services/dependency_locator.dart';
import 'package:laza/features/cart/index.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final AddressBloc _addressBloc = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _addressBloc,
      child: Scaffold(
        appBar: CustomAppBar(
          hideCart: true,
          title: Text(
            'Address',
            style: AppTextStyles.s17W600.copyWith(color: AppColors.carbonBlack),
          ),
        ),

        body: BlocListener<AddressBloc, AddressState>(
          listener: (context, state) {
            if (state is AddressSuccess) {
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
                  Row(
                    spacing: 15,
                    children: [
                      Expanded(
                        child: AppTextField(
                          controller: _countryController,
                          title: 'Country',
                          subtitle: 'Type your country',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Country is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: AppTextField(
                          controller: _cityController,
                          title: 'City',
                          subtitle: 'Type your city',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'City is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
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
                        return 'Phone number is required';
                      }

                      if (value.length != 10) {
                        return 'Phone number is invalid';
                      }
                      return null;
                    },
                  ),
                  AppTextField(
                    controller: _addressController,
                    title: 'Address',
                    subtitle: 'Type your address',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Address is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: BlocSelector<AddressBloc, AddressState, bool>(
          selector: (state) => state is AddressLoading,
          builder: (context, isLoading) {
            return AppButton(
              label: 'Save Address',
              isLoading: isLoading,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addressBloc.add(
                    AddressSaved(
                      address: Address(
                        name: _nameController.text.trim(),
                        country: _countryController.text.trim(),
                        city: _cityController.text.trim(),
                        address: _addressController.text.trim(),
                        phoneNumber: _numberController.text.trim(),
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
