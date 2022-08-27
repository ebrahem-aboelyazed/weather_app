import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/modules/weather/models/clouds.dart';
import 'package:weather_app/modules/weather/models/coord.dart';
import 'package:weather_app/modules/weather/models/info.dart';
import 'package:weather_app/modules/weather/models/main.dart';
import 'package:weather_app/modules/weather/models/sys.dart';
import 'package:weather_app/modules/weather/models/wind.dart';

part 'weather.freezed.dart';

part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Weather({
    int? id,
    Coord? coord,
    List<Info>? weather,
    @Default('') String base,
    Main? main,
    @Default(0) num visibility,
    Wind? wind,
    Clouds? clouds,
    @Default(0) dt,
    Sys? sys,
    @Default('') String name,
    @Default(0) num cod,
    @Default('') String dtText,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherFromJson(json);
}
