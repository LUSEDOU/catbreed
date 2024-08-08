import 'dart:convert';

import 'package:app_domain/app_domain.dart';
import 'package:dio/dio.dart';

/// {@template catbreed_api_client}
/// CatBreeds Api Client
/// {@endtemplate}
class CatbreedApiClient {
  /// {@macro catbreed_api_client}
  CatbreedApiClient({
    required String apiKey,
    String? baseUrl,
    Dio? dio,
  }) : _dio = dio ?? Dio() {
    if (baseUrl != null) {
      _dio.options.baseUrl = baseUrl;
    }
    _dio.options.headers['x-api-key'] = apiKey;
  }

  final Dio _dio;

  /// Searches for breeds by name.
  /// * [query] - The search query.
  ///
  /// Throws an [ApiClientException] if an error occurs.
  Future<List<Breed>> search(String query) async {
    try {
      final response = await _dio.get<String>(
        'breeds/search',
        queryParameters: {
          'q': query,
        },
      );

      final data = response.data;
      if (data == null) throw const ApiClientException('Response is null');

      final breeds =
          (jsonDecode(data) as List<dynamic>).cast<Map<String, dynamic>>();

      return breeds.map(Breed.fromJson).toList();
    } on DioException catch (error) {
      throw ApiClientException(
        'GET /breeds/search returned status ${error.response?.statusCode} with the following error: ${error.response?.data}',
      );
    } on FormatException catch (error) {
      throw ApiDecodeFailure(error);
    }
  }

  /// Fetches a list of breeds from the API.
  /// * [limit] - The number of breeds to fetch.
  /// * [page] - The page of breeds to fetch.
  ///
  /// Throws an [ApiClientException] if an error occurs.
  Future<List<Breed>> fetch({
    int limit = 10,
    int page = 0,
  }) async {
    try {
      final response = await _dio.get<String>(
        'breeds',
        queryParameters: <String, int>{
          'limit': limit,
          'page': page,
        },
      );

      final data = response.data;
      if (data == null) throw const ApiClientException('Response is null');

      final breeds =
          (jsonDecode(data) as List<dynamic>).cast<Map<String, dynamic>>();

      return breeds.map(Breed.fromJson).toList();
    } on DioException catch (error) {
      throw ApiClientException(
        'GET /breeds returned status ${error.response?.statusCode} with the following error: ${error.response?.data}',
      );
    } on FormatException catch (error) {
      throw ApiDecodeFailure(error);
    }
  }

  /// Fetches a breed by id.
  /// * [id] - The id of the breed to fetch.
  Future<BreedSummary?> fetchBreed(int id) async {
    try {
      final response = await _dio.get<String>('breeds/$id');

      final data = response.data;
      if (data == null) throw const ApiClientException('Response is null');

      final breed = jsonDecode(data) as Map<String, dynamic>;

      return BreedSummary.fromJson(breed);
    } on DioException catch (error) {
      throw ApiClientException(
        'GET /breeds/$id returned status ${error.response?.statusCode} with the following error: ${error.response?.data}',
      );
    } on FormatException catch (error) {
      throw ApiDecodeFailure(error);
    }
  }
}

/// {@template api_client_exception}
/// Exception thrown by the apiClient when an error occurs.
/// {@endtemplate}
class ApiClientException implements Exception {
  /// {@macro api_client_exception}
  const ApiClientException(this.error);

  /// The error that caused the exception.
  final Object error;
}

/// {@template api_decode_failure}
/// Exception thrown when an API call fails.
/// {@endtemplate}
class ApiDecodeFailure extends ApiClientException {
  /// {@macro api_decode_failure}
  const ApiDecodeFailure(super.error);
}
