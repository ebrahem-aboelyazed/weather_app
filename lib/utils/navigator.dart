import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute<Widget>(builder: (context) => page),
  );
}

void navigateAndReplaceAll(BuildContext context, Widget page) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute<Widget>(builder: (context) => page),
    (route) => false,
  );
}

void navigateAndReplace(BuildContext context, Widget page) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute<Widget>(builder: (context) => page),
  );
}
