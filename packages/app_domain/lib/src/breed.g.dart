// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breed _$BreedFromJson(Map<String, dynamic> json) => Breed(
      weight: Weight.fromJson(json['weight'] as Map<String, dynamic>),
      id: json['id'] as String,
      name: json['name'] as String,
      temperament: json['temperament'] as String,
      origin: json['origin'] as String,
      countryCodes: json['country_codes'] as String,
      countryCode: json['country_code'] as String,
      description: json['description'] as String,
      lifeSpan: json['life_span'] as String,
      indoor: intBoolean.fromJson((json['indoor'] as num).toInt()),
      adaptability: (json['adaptability'] as num).toInt(),
      affectionLevel: (json['affection_level'] as num).toInt(),
      childFriendly: (json['child_friendly'] as num).toInt(),
      dogFriendly: (json['dog_friendly'] as num).toInt(),
      energyLevel: (json['energy_level'] as num).toInt(),
      grooming: (json['grooming'] as num).toInt(),
      healthIssues: (json['health_issues'] as num).toInt(),
      intelligence: (json['intelligence'] as num).toInt(),
      sheddingLevel: (json['shedding_level'] as num).toInt(),
      socialNeeds: (json['social_needs'] as num).toInt(),
      strangerFriendly: (json['stranger_friendly'] as num).toInt(),
      vocalisation: (json['vocalisation'] as num).toInt(),
      experimental: intBoolean.fromJson((json['experimental'] as num).toInt()),
      hairless: intBoolean.fromJson((json['hairless'] as num).toInt()),
      natural: intBoolean.fromJson((json['natural'] as num).toInt()),
      rare: intBoolean.fromJson((json['rare'] as num).toInt()),
      rex: intBoolean.fromJson((json['rex'] as num).toInt()),
      suppressedTail:
          intBoolean.fromJson((json['suppressed_tail'] as num).toInt()),
      shortLegs: (json['short_legs'] as num).toInt(),
      hypoallergenic:
          intBoolean.fromJson((json['hypoallergenic'] as num).toInt()),
      referenceImageId: json['reference_image_id'] as String?,
      wikipediaUrl: json['wikipedia_url'] as String?,
      catFriendly: (json['cat_friendly'] as num?)?.toInt(),
      altNames: json['alt_names'] as String?,
      image: json['image'] == null
          ? Image.empty
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      lap: _$JsonConverterFromJson<int, bool>(json['lap'], intBoolean.fromJson),
      bidability: (json['bidability'] as num?)?.toInt(),
      vcahospitalsUrl: json['vcahospitals_url'] as String?,
      cfaUrl: json['cfa_url'] as String?,
      vetstreetUrl: json['vetstreet_url'] as String?,
    );

Map<String, dynamic> _$BreedToJson(Breed instance) {
  final val = <String, dynamic>{
    'weight': instance.weight.toJson(),
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cfa_url', instance.cfaUrl);
  writeNotNull('vetstreet_url', instance.vetstreetUrl);
  writeNotNull('vcahospitals_url', instance.vcahospitalsUrl);
  val['temperament'] = instance.temperament;
  val['origin'] = instance.origin;
  val['country_codes'] = instance.countryCodes;
  val['country_code'] = instance.countryCode;
  val['description'] = instance.description;
  val['life_span'] = instance.lifeSpan;
  val['indoor'] = intBoolean.toJson(instance.indoor);
  writeNotNull(
      'lap', _$JsonConverterToJson<int, bool>(instance.lap, intBoolean.toJson));
  writeNotNull('alt_names', instance.altNames);
  val['adaptability'] = instance.adaptability;
  val['affection_level'] = instance.affectionLevel;
  val['child_friendly'] = instance.childFriendly;
  val['dog_friendly'] = instance.dogFriendly;
  writeNotNull('cat_friendly', instance.catFriendly);
  val['energy_level'] = instance.energyLevel;
  val['grooming'] = instance.grooming;
  val['health_issues'] = instance.healthIssues;
  val['intelligence'] = instance.intelligence;
  val['shedding_level'] = instance.sheddingLevel;
  val['social_needs'] = instance.socialNeeds;
  val['stranger_friendly'] = instance.strangerFriendly;
  val['vocalisation'] = instance.vocalisation;
  writeNotNull('bidability', instance.bidability);
  val['experimental'] = intBoolean.toJson(instance.experimental);
  val['hairless'] = intBoolean.toJson(instance.hairless);
  val['natural'] = intBoolean.toJson(instance.natural);
  val['rare'] = intBoolean.toJson(instance.rare);
  val['rex'] = intBoolean.toJson(instance.rex);
  val['suppressed_tail'] = intBoolean.toJson(instance.suppressedTail);
  val['short_legs'] = instance.shortLegs;
  writeNotNull('wikipedia_url', instance.wikipediaUrl);
  val['hypoallergenic'] = intBoolean.toJson(instance.hypoallergenic);
  writeNotNull('reference_image_id', instance.referenceImageId);
  val['image'] = instance.image.toJson();
  return val;
}

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
