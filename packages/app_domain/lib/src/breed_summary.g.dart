// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedSummary _$BreedSummaryFromJson(Map<String, dynamic> json) => BreedSummary(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      weight: json['weight'] as String,
      height: json['height'] as String,
      lifeSpan: json['life_span'] as String,
      bredFor: json['bred_for'] as String,
      breedGroup: json['breed_group'] as String,
    );

Map<String, dynamic> _$BreedSummaryToJson(BreedSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'life_span': instance.lifeSpan,
      'bred_for': instance.bredFor,
      'breed_group': instance.breedGroup,
    };
