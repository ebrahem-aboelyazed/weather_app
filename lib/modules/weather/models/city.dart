import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/modules/weather/models/coord.dart';

part 'city.freezed.dart';

part 'city.g.dart';

@freezed
class City with _$City {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory City({
    @Default(0) int id,
    @Default('0') String name,
    Coord? coord,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$$_CityFromJson(json);
}
