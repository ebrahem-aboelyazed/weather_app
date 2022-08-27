// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Wind _$$_WindFromJson(Map<String, dynamic> json) => _$_Wind(
      speed: json['speed'] as num? ?? 0,
      deg: json['deg'] as num? ?? 0,
      gust: json['gust'] as num? ?? 0,
    );

Map<String, dynamic> _$$_WindToJson(_$_Wind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
