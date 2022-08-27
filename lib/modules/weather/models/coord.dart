import 'package:freezed_annotation/freezed_annotation.dart';

part 'coord.freezed.dart';

part 'coord.g.dart';

@freezed
class Coord with _$Coord {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Coord({
    @Default(0) num speed,
    @Default(0) num deg,
    @Default(0) num gust,
  }) = _Coord;

  factory Coord.fromJson(Map<String, dynamic> json) => _$$_CoordFromJson(json);
}
