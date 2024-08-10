import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
/// {@template image}
/// A class that represents an image of a cat.
/// {@endtemplate}
class Image extends Equatable {
  /// {@macro image}
  const Image({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  /// Converts a [Map<String, dynamic>] to a [Image].
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  /// The unique identifier for this image.
  final String id;

  /// The width of this image.
  final int width;

  /// The height of this image.
  final int height;

  /// The URL of this image.
  final String url;

  /// Converts this [Image] to a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$ImageToJson(this);

  /// An empty image.
  static const empty = Image(
    id: '',
    width: 0,
    height: 0,
    url: '',
  );

  /// Whether this image is empty.
  bool get isEmpty => this == Image.empty;



  @override
  List<Object> get props => [
        id,
        width,
        height,
        url,
      ];
}
