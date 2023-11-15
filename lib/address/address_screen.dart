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
          Expanded(
            child: _AddressForm(),
          ),
          SolidButton(
            text: 'Next',
            onPressed: null,
          ),
          SizedBox(height: 30),
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

class SolidButton extends StatelessWidget {
  const SolidButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width - 40, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(text),
    );
  }
}

class _AddressForm extends StatelessWidget {
  const _AddressForm();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please enter information as written \non your ID document.',
          ),
          SizedBox(height: 30),
          AutocompleteTextField(
            hintText: 'Country',
          ),
          SizedBox(height: 20),
          AppTextField(
            hintText: 'Prefecture',
          ),
          SizedBox(height: 20),
          AppTextField(
            hintText: 'Municipality',
          ),
          SizedBox(height: 20),
          AppTextField(
            hintText: 'Street address (subarea-block-house address)',
          ),
          SizedBox(height: 20),
          AppTextField(
            hintText: 'Apartment, suite or unit',
          ),
        ],
      ),
    );
  }
}
