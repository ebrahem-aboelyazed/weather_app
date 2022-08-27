import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/modules/weather/models/city.dart';
import 'package:weather_app/modules/weather/models/weather.dart';

part 'forecast.freezed.dart';

part 'forecast.g.dart';

@freezed
class Forecast with _$Forecast {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Forecast({
    @Default([]) List<Weather> list,
    City? city,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$$_ForecastFromJson(json);
}
