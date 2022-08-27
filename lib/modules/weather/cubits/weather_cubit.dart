import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/data.dart';
import 'package:weather_app/modules/weather/models/weather.dart';
import 'package:weather_app/modules/weather/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  final weatherService = WeatherService.instance;

  Future<void> getWeatherByGeo(Position? position) async {
    emit(WeatherLoading());
    if (position != null) {
      final response = await weatherService.getWeatherByGeo(
        lat: position.latitude,
        lng: position.longitude,
      );
      response.fold(onFailure, (r) => emit(WeatherLoaded(r)));
    } else {
      await getWeatherByQuery('Cairo');
    }
  }

  Future<void> getWeatherByQuery(String query) async {
    emit(WeatherLoading());
    final response = await weatherService.getWeatherByQuery(query: query);
    response.fold(onFailure, (r) => emit(WeatherLoaded(r)));
  }

  void onFailure(Failure failure) {
    emit(WeatherFailure(failure));
  }
}
