import 'package:flutter/material.dart';

class NavigationUtils {
  static displaySnackBar({
    required String text,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}
