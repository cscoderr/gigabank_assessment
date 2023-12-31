import 'package:flutter/services.dart';

//TODO: Handles the formatter based on different edge cases
class StreetAddressFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final textLength = newValue.selection.end;
    if (textLength > 0 && newValue.text.contains(' ')) {
      final latestValue = newValue.text.replaceAll(' ', '-');
      return TextEditingValue(
        text: latestValue,
        selection: TextSelection.collapsed(offset: latestValue.length),
      );
    } else {
      return newValue;
    }
  }
}
