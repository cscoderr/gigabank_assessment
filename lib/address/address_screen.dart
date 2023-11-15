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
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Column(
        children: [
          LinearProgressIndicator(
            value: 0.5,
          ),
          _AddressForm(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Registered Address'),
      centerTitle: true,
      leading: const Icon(
        Icons.arrow_back_ios,
        size: 15,
      ),
    );
  }
}

class _AddressForm extends StatelessWidget {
  const _AddressForm();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please enter information as written \non your ID document.',
          ),
          AutocompleteTextField(
            hintText: 'Country',
          ),
          AppTextField(
            hintText: 'Prefecture',
          ),
          AppTextField(
            hintText: 'Manucipality',
          ),
          AppTextField(
            hintText: 'Street address (subarea-block-house)',
          ),
          AppTextField(
            hintText: 'Apartment, suite or unit',
          ),
        ],
      ),
    );
  }
}
