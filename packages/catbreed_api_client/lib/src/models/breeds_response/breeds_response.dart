import 'package:app_domain/app_domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeds_response.g.dart';

/// {@template breeds_response}
/// Response from the breeds endpoint.
/// {@endtemplate}
@JsonSerializable()
class BreedsResponse {
  /// {@macro breeds_response}
  const BreedsResponse({
    required this.breeds,
  });

  /// Converts a [Map] to an [BreedsResponse]
  factory BreedsResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedsResponseFromJson(json);

  /// The list of breeds returned by the API.
  final List<Breed> breeds;

  /// Converts a [BreedsResponse] to a [Map]
  Map<String, dynamic> toJson() => _$BreedsResponseToJson(this);
}
