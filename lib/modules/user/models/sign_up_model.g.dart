// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
