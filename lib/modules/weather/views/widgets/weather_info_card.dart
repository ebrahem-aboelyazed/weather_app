import 'package:flutter/material.dart';
import 'package:weather_app/common/common.dart';
import 'package:weather_app/modules/weather/models/weather.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard({required this.weather, super.key});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final info = weather.weather?.first;
    final main = weather.main;
    return Card(
      elevation: 3,
      color: Colors.blueGrey,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(
            image: AssetImage('assets/images/weather_bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  CachedImage(
                    'http://openweathermap.org/img/wn/${info?.icon}@2x.png',
                  ),
                  Text(
                    weather.name,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    info?.description ?? '',
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    '${main?.temp.toStringAsFixed(0)}° C',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Feels Like ${main?.feelsLike.toStringAsFixed(0)}° C',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
