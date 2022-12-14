import 'package:flutter/services.dart';

import 'utils.dart';

class ICNumberFormatter extends TextInputFormatter {
  final String separator;

  ICNumberFormatter({this.separator = ' '});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return textManipulation(
      oldValue,
      newValue,
      textInputFormatter: FilteringTextInputFormatter.digitsOnly,
      formatPattern: (String filteredString) {
        int offset = 0;
        StringBuffer buffer = StringBuffer();
        for (int i = 0; i <= filteredString.length; i += 1) {
          buffer.write(filteredString.substring(offset, i));
          if (i == filteredString.length) break;
          if (i == 6) {
            print(i);
            buffer.write('-');
          }
          if (i == 8) {
            buffer.write('-');
          }
          offset = i;
        }
        return buffer.toString();
      },
    );
  }
}