import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weight.g.dart';

/// {@template weight}
/// A class that represents the weight of a breed.
/// {@endtemplate}
@JsonSerializable()
class Weight extends Equatable {
  /// {@macro weight}
  const Weight({
    required this.imperial,
    required this.metric,
  });

  /// Converts a [Map<String, dynamic>] to a [Weight].
  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);

  /// The weight in imperial units.
  final String imperial;

  /// The weight in metric units.
  final String metric;

  /// Converts this [Weight] to a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$WeightToJson(this);

  @override
  List<Object> get props => [imperial, metric];
}
