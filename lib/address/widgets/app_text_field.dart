import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
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
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF99E1B1)),
        ),
      ),
    );
  }
}
