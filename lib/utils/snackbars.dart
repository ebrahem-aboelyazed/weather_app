import 'package:flutter/material.dart';
import 'package:weather_app/data/data.dart';

void showErrorSnackBar(BuildContext context, Failure failure) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Error\n${failure.message}',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.redAccent,
    ),
  );
}

void showWarningSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Warning\n$message',
        style: const TextStyle(
          color: Colors.blueGrey,
        ),
      ),
      backgroundColor: Colors.yellowAccent,
    ),
  );
}

void showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Success\n$message',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green,
    ),
  );
}
