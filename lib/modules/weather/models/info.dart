import 'package:freezed_annotation/freezed_annotation.dart';

part 'info.freezed.dart';

part 'info.g.dart';

@freezed
class Info with _$Info {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Info({
    int? id,
    @Default('') String main,
    @Default('') String description,
    @Default('') String icon,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) =>
      _$$_InfoFromJson(json);
}
