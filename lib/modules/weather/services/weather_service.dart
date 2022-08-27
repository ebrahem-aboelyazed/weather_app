import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/modules/weather/models/forecast.dart';
import 'package:weather_app/modules/weather/models/weather.dart';
import 'package:weather_app/utils/utils.dart';

class WeatherService {
  WeatherService._();

  static final WeatherService _weatherService = WeatherService._();

  static WeatherService get instance => _weatherService;

  final _baseService = BaseService.instance;

  Future<Either<Failure, Weather>> getWeatherByGeo({
    required num lat,
    required num lng,
  }) async {
    final response = await _baseService.getData(
      '${Endpoints.weather}'
      '?lat=$lat&lon=$lng&units=metric&appid=${AppConstants.weatherApiKey}',
    );
    return response.fold(Left.new, (r) {
      final body = jsonDecode(r.body) as Map<String, dynamic>;
      return Right(Weather.fromJson(body));
    });
  }

  /// This feature require paid subscription to API
  Future<Either<Failure, List<Forecast>>> getForecastByGeo({
    required num lat,
    required num lng,
  }) async {
    final response = await _baseService.getData(
      '${Endpoints.forecast}/hourly'
      '?lat=$lat&lon=$lng&units=metric&appid=${AppConstants.weatherApiKey}',
    );
    return response.fold(Left.new, (r) {
      final body = jsonDecode(r.body) as Map<String, dynamic>;
      final list = body['list'] as List<dynamic>;
      final forecast = List<Map<String, dynamic>>.from(list);
      return Right(forecast.map(Forecast.fromJson).toList());
    });
  }

  Future<Either<Failure, Weather>> getWeatherByQuery({
    required String query,
  }) async {
    final response = await _baseService.getData(
      '${Endpoints.weather}'
      '?q=$query&units=metric&appid=${AppConstants.weatherApiKey}',
    );
    return response.fold(Left.new, (r) {
      final body = jsonDecode(r.body) as Map<String, dynamic>;
      return Right(Weather.fromJson(body));
    });
  }

  /// This feature require paid subscription to API
  Future<Either<Failure, List<Forecast>>> getForecastByQuery({
    required String query,
  }) async {
    final response = await _baseService.getData(
      '${Endpoints.forecast}/hourly'
      '?q=$query&units=metric&appid=${AppConstants.weatherApiKey}',
    );
    return response.fold(Left.new, (r) {
      final body = jsonDecode(r.body) as Map<String, dynamic>;
      final list = body['list'] as List<dynamic>;
      final forecast = List<Map<String, dynamic>>.from(list);
      return Right(forecast.map(Forecast.fromJson).toList());
    });
  }
}
