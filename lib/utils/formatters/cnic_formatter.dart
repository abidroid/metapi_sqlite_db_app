import 'package:flutter/services.dart';

class CnicFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text.replaceAll('-', ''); // strip existing dashes
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i == 5 || i == 12) buffer.write('-'); // insert dash at positions
      buffer.write(text[i]);
    }

    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}