import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard(BuildContext context, {@required String data}) {
  Clipboard.setData(ClipboardData(text: data)).then(
    (value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$data Copied to clipboard.'),
          backgroundColor: Colors.white,
          duration: Duration(milliseconds: 1000),
        ),
      );
    },
  );
}

void hideKeyboard(BuildContext context) =>
FocusScope.of(context).requestFocus(new FocusNode());
