import 'package:freezed_annotation/freezed_annotation.dart';

part 'wind.freezed.dart';

part 'wind.g.dart';

@freezed
class Wind with _$Wind {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Wind({
    @Default(0) num speed,
    @Default(0) num deg,
    @Default(0) num gust,
  }) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$$_WindFromJson(json);
}
