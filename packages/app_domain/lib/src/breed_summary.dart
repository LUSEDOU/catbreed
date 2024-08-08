import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed_summary.g.dart';

/// {@template breed_summary}
/// A class that represents a breed of cat.
/// {@endtemplate}
@JsonSerializable()
class BreedSummary extends Equatable {
  /// {@macro breed_summary}
  const BreedSummary({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.lifeSpan,
    required this.bredFor,
    required this.breedGroup,
  });

  /// Converts a [Map<String, dynamic>] to a [BreedSummary].
  factory BreedSummary.fromJson(Map<String, dynamic> json) => _$BreedSummaryFromJson(json);

  /// The unique identifier for this breed.
  final int id;

  /// The name of this breed.
  final String name;

  /// The weight of this breed.
  final String weight;

  /// The height of this breed.
  final String height;

  /// The life span of this breed.
  @JsonKey(name: 'life_span')
  final String lifeSpan;

  /// The purpose of breeding this breed.
  @JsonKey(name: 'bred_for')
  final String bredFor;

  /// The group this breed belongs to.
  @JsonKey(name: 'breed_group')
  final String breedGroup;

  /// Converts this [BreedSummary] to a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$BreedSummaryToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        weight,
        height,
        lifeSpan,
        bredFor,
        breedGroup,
      ];
}
