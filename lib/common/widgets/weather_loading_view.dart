import 'package:flutter/material.dart';
import 'package:weather_app/common/common.dart';

class WeatherLoadingView extends StatelessWidget {
  const WeatherLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerListLoading(
          child: Container(
            height: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
