// ignore_for_file: prefer_const_constructors

import 'package:catbreed_api_client/catbreed_api_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CatbreedApiClient', () {
    test('can be instantiated', () {
      expect(CatbreedApiClient(), isNotNull);
    });
  });
}
