import 'dart:convert';
import 'dart:io';

import 'package:app_domain/app_domain.dart';
import 'package:test/test.dart';

void main() {
  group('Breed', () {
    late List<Map<String, dynamic>> breeds;
    const jsonFile = 'test/src/breed_m.json';

    setUp(() {
      breeds = (json.decode(File(jsonFile).readAsStringSync()) as List)
          .cast<Map<String, dynamic>>();
    });

    test('can decode a real request', () {
      expect(() => breeds.map(Breed.fromJson), returnsNormally);
    });

    test('can be (de)serialiced', () {
      final breed = Breed.fromJson(breeds.first);
      expect(breed.toJson(), breeds.first);
    });
  });
}
