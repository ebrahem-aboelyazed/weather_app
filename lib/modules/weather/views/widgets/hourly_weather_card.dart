import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/widgets/cached_image.dart';
import 'package:weather_app/modules/weather/models/weather.dart';

class HourlyWeatherCard extends StatelessWidget {
  const HourlyWeatherCard({required this.weather, super.key});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const fontWeight = FontWeight.normal;
    final info = weather.weather?.first;
    return Expanded(
      child: Column(
        children: [
          Text(
            DateFormat.E().format(DateTime.parse(weather.dtText)),
            style: textTheme.caption?.copyWith(fontWeight: fontWeight),
          ),
          const SizedBox(height: 8),
          CachedImage(
            'http://openweathermap.org/img/wn/${info?.icon}@2x.png',
            height: 48,
            width: 48,
          ),
          const SizedBox(height: 8),
          Text(
            '${weather.main?.temp.toStringAsFixed(0)}° C',
            style: textTheme.bodyText1?.copyWith(fontWeight: fontWeight),
          ),
        ],
      ),
    );
  }
}
