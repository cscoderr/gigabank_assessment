import 'package:flutter/material.dart';
import 'package:flutterassignment/address/address.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FocusManager.instance.primaryFocus != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: const Column(
          children: [
            LinearProgressIndicator(
              value: 0.5,
            ),
            Expanded(
              child: _AddressForm(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Registered Address'),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 15,
        ),
      ),
    );
  }
}

class _AddressForm extends StatefulWidget {
  const _AddressForm();

  @override
  State<_AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<_AddressForm> {
  late TextEditingController _country;
  late TextEditingController _prefecture;
  late TextEditingController _municipality;
  late TextEditingController _streetAddress;
  late TextEditingController _apartment;
  final _formKey = GlobalKey<FormState>();
  Address? _registeredAddress;

  @override
  void initState() {
    super.initState();
    _country = TextEditingController();
    _prefecture = TextEditingController();
    _municipality = TextEditingController();
    _streetAddress = TextEditingController();
    _apartment = TextEditingController();

    _addListener();
  }

  @override
  void dispose() {
    _country.dispose();
    _prefecture.dispose();
    _municipality.dispose();
    _streetAddress.dispose();
    _apartment.dispose();
    super.dispose();
  }

  //TODO: Remove the listeners and handle it better
  void _addListener() {
    _country.addListener(() {
      setState(() {});
    });

    _prefecture.addListener(() {
      setState(() {});
    });

    _municipality.addListener(() {
      setState(() {});
    });

    _streetAddress.addListener(() {
      setState(() {});
    });

    _apartment.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please enter information as written \non your ID document.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CountryDropdown(
                    controller: _country,
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    controller: _prefecture,
                    hintText: 'Prefecture',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Prefecture is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    controller: _municipality,
                    hintText: 'Municipality',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Municipality is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    controller: _streetAddress,
                    hintText: 'Street address (subarea-block-house address)',
                    inputFormatters: [
                      StreetAddressFormatter(),
                    ],
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Street address is required';
                      }
                      //TODO: write more validation to validate the exact format `subarea-block-house`
                      if (!value!.contains('-')) {
                        return "Street address must be in 'subarea-block-house' format";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    controller: _apartment,
                    hintText: 'Apartment, suite or unit',
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Apartment is required';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          SolidButton(
            text: 'Next',
            onPressed: (_formKey.currentState?.validate() == true)
                ? () {
                    _registeredAddress = Address(
                      country: _country.text,
                      prefecture: _prefecture.text,
                      municipality: _municipality.text,
                      streetAddress: _streetAddress.text,
                      apartment: _apartment.text,
                    );
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          title: const Text('Success'),
                          content: const Text('Address saved successfully'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
