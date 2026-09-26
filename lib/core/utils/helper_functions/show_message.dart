import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showMessage(
    BuildContext context,
    String message,
    Color backgroundColor,
    ) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
            height: 1.60,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2),
    ),
  );
}