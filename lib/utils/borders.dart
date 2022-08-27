import 'package:flutter/material.dart';
import 'package:weather_app/utils/utils.dart';

const OutlineInputBorder defaultBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Dimensions.radiusLarge),
  ),
);


const OutlineInputBorder searchBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
  borderSide: BorderSide(
    color: Colors.transparent,
    style: BorderStyle.none,
  ),
);
