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
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: const Icon(Icons.search),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF99E1B1)),
        ),
      ),
    );
  }
}
