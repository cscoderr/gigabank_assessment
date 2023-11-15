import 'package:flutter/material.dart';

class AutocompleteTextField extends StatelessWidget {
  const AutocompleteTextField({
    super.key,
    this.hintText,
  });

  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
