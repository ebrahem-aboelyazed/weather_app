// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Main _$$_MainFromJson(Map<String, dynamic> json) => _$_Main(
      temp: json['temp'] as num? ?? 0,
      feelsLike: json['feels_like'] as num? ?? 0,
      tempMin: json['temp_min'] as num? ?? 0,
      tempMax: json['temp_max'] as num? ?? 0,
      pressure: json['pressure'] as num? ?? 0,
      humidity: json['humidity'] as num? ?? 0,
      seaLevel: json['sea_level'] as num? ?? 0,
      grndLevel: json['grnd_level'] as num? ?? 0,
    );

Map<String, dynamic> _$$_MainToJson(_$_Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.seaLevel,
      'grnd_level': instance.grndLevel,
    };
