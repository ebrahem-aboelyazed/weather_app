import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.freezed.dart';

part 'main.g.dart';

@freezed
class Main with _$Main {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Main({
    @Default(0) num temp,
    @Default(0) num feelsLike,
    @Default(0) num tempMin,
    @Default(0) num tempMax,
    @Default(0) num pressure,
    @Default(0) num humidity,
    @Default(0) num seaLevel,
    @Default(0) num grndLevel,
  }) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$$_MainFromJson(json);
}
