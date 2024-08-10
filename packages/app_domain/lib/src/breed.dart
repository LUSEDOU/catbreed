import 'package:app_domain/app_domain.dart';
import 'package:app_domain/src/converters.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed.g.dart';

/// {@template breed}
/// A class that represents a breed of cat.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class Breed extends Equatable {
  /// {@macro breed}
  const Breed({
    required this.weight,
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.indoor,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.hypoallergenic,
    this.referenceImageId,
    this.wikipediaUrl,
    this.catFriendly,
    this.altNames,
    this.image = Image.empty,
    this.lap,
    this.bidability,
    this.vcahospitalsUrl,
    this.cfaUrl,
    this.vetstreetUrl,
  });

  /// Converts a [Map<String, dynamic>] to a [Breed].
  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);

  /// The weights of this breed.
  final Weight weight;

  /// The unique identifier for this breed.
  final String id;

  /// The name of this breed.
  final String name;

  /// The URL for the Cat Fanciers' Association.
  @JsonKey(name: 'cfa_url')
  final String? cfaUrl;

  /// The URL for Vetstreet.
  @JsonKey(name: 'vetstreet_url')
  final String? vetstreetUrl;

  /// The URL for VCA Hospitals.
  @JsonKey(name: 'vcahospitals_url')
  final String? vcahospitalsUrl;

  /// The temperament of this breed.
  final String temperament;

  /// The origin of this breed.
  final String origin;

  /// The country codes for this breed.
  @JsonKey(name: 'country_codes')
  final String countryCodes;

  /// The country code for this breed.
  @JsonKey(name: 'country_code')
  final String countryCode;

  /// The description of this breed
  final String description;

  /// The life span of this breed.
  @JsonKey(name: 'life_span')
  final String lifeSpan;

  /// The indoor of this breed.
  @intBoolean
  final bool indoor;

  /// The lap of this breed.
  @intBoolean
  final bool? lap;

  /// The alternative names of this breed.
  @JsonKey(name: 'alt_names')
  final String? altNames;

  /// The adaptability of this breed.
  final int adaptability;

  /// The affection level of this breed.
  @JsonKey(name: 'affection_level')
  final int affectionLevel;

  /// The child friendly of this breed.
  @JsonKey(name: 'child_friendly')
  final int childFriendly;

  /// The dog friendly of this breed.
  @JsonKey(name: 'dog_friendly')
  final int dogFriendly;

  /// The cat friendly of this breed.
  @JsonKey(name: 'cat_friendly')
  final int? catFriendly;

  /// The energy level of this breed.
  @JsonKey(name: 'energy_level')
  final int energyLevel;

  /// The grooming of this breed.
  final int grooming;

  /// The health issues of this breed.
  @JsonKey(name: 'health_issues')
  final int healthIssues;

  /// The intelligence of this breed.
  final int intelligence;

  /// The shedding level of this breed.
  @JsonKey(name: 'shedding_level')
  final int sheddingLevel;

  /// The social needs of this breed.
  @JsonKey(name: 'social_needs')
  final int socialNeeds;

  /// The stranger friendly of this breed.
  @JsonKey(name: 'stranger_friendly')
  final int strangerFriendly;

  /// The vocalisation of this breed.
  final int vocalisation;

  /// The bida of this breed.
  final int? bidability;

  /// The experimental of this breed.
  @intBoolean
  final bool experimental;

  /// The hairless of this breed.
  @intBoolean
  final bool hairless;

  /// Whether this breed is natural.
  @intBoolean
  final bool natural;

  /// Whether this breed is rare.
  @intBoolean
  final bool rare;

  /// Whether this breed is rex.
  @intBoolean
  final bool rex;

  /// Whether this breed has a suppressed tail.
  @JsonKey(name: 'suppressed_tail')
  @intBoolean
  final bool suppressedTail;

  /// Whether this breed has short legs.
  @JsonKey(name: 'short_legs')
  final int shortLegs;

  /// Wikipedia URL for this breed.
  @JsonKey(name: 'wikipedia_url')
  final String? wikipediaUrl;

  /// Whether this breed is hypoallergenic.
  @intBoolean
  final bool hypoallergenic;

  /// The reference image ID for this breed.
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;

  /// The image for this breed.
  final Image image;

  /// Converts this [Breed] to a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$BreedToJson(this);

  @override
  List<Object?> get props => [
        weight,
        id,
        name,
        cfaUrl,
        vetstreetUrl,
        vcahospitalsUrl,
        temperament,
        origin,
        countryCodes,
        countryCode,
        description,
        lifeSpan,
        indoor,
        lap,
        altNames,
        adaptability,
        affectionLevel,
        childFriendly,
        dogFriendly,
        energyLevel,
        grooming,
        bidability,
        healthIssues,
        intelligence,
        sheddingLevel,
        socialNeeds,
        strangerFriendly,
        vocalisation,
        experimental,
        hairless,
        natural,
        rare,
        rex,
        suppressedTail,
        shortLegs,
        wikipediaUrl,
        hypoallergenic,
        referenceImageId,
        image,
        catFriendly,
      ];
}
