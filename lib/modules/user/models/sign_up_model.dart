import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SignUpModel {
  SignUpModel({
    this.name = '',
    this.email = '',
    this.password = '',
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);

  String name;
  String email;
  String password;
}
