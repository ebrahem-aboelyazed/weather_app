import 'package:freezed_annotation/freezed_annotation.dart';

part 'sys.freezed.dart';

part 'sys.g.dart';

@freezed
class Sys with _$Sys {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Sys({
    @Default('EG') String country,
    @Default(0) num sunrise,
    @Default(0) num sunset,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$$_SysFromJson(json);
}
