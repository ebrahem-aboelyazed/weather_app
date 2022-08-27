part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(this.weather);

  final Weather weather;

  @override
  List<Object> get props => [];
}

class WeatherFailure extends WeatherState {
  const WeatherFailure(this.failure);

  final Failure failure;

  @override
  List<Object> get props => [];
}
