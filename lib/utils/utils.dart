import 'package:flutter/material.dart';

class Utils {}

extension SnackExtension on BuildContext {
  void snack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.only(left: 400, right: 400, bottom: 100),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey[900],
        action: SnackBarAction(
          label: 'Ok!',
          textColor: Colors.orange,
          onPressed: () {},
        ),
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
