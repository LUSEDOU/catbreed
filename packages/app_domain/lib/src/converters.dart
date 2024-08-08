import 'package:json_annotation/json_annotation.dart';

/// {@template int_boolean_converter}
/// A [JsonConverter] that converts between an [int] and a [bool].
/// {@endtemplate}
class IntBooleanConverter extends JsonConverter<bool, int> {
  /// {@macro int_boolean_converter}
  const IntBooleanConverter();

  @override
  bool fromJson(int json) => switch (json) {
        0 => false,
        1 => true,
        _ => throw ArgumentError.value(
            json,
            'json',
            'Only 0 and 1 are supported.',
          ),
      };

  @override
  int toJson(bool object) => object ? 1 : 0;
}

/// {@macro int_boolean_converter}
const intBoolean = IntBooleanConverter();
