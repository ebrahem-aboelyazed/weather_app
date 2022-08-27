import 'package:freezed_annotation/freezed_annotation.dart';

part 'clouds.freezed.dart';

part 'clouds.g.dart';

@freezed
class Clouds with _$Clouds {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Clouds({
    @Default(0) num all,
  }) = _Clouds;

  factory Clouds.fromJson(Map<String, dynamic> json) =>
      _$$_CloudsFromJson(json);
}
