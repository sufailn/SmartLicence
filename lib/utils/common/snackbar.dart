import 'package:flutter/material.dart';

void showMySnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
    ),
  );
}

void navigation(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void navigationreplace(context, screen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}
