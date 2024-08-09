import 'package:catbreed_api_client/catbreed_api_client.dart';
import 'package:catbreed_repository/catbreed_repository.dart';

/// {@template catbreed_repository}
/// CatBreeds Repository
/// {@endtemplate}
class CatbreedRepository {
  /// {@macro catbreed_repository}
  const CatbreedRepository({
    required CatbreedApiClient client,
  }) : _client = client;

  final CatbreedApiClient _client;

  /// Fetch a list of breeds
  Future<List<Breed>> fetch({
    int limit = 10,
    int page = 0,
  }) async {
    try {
      return await _client.fetch(limit: limit, page: page);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(CatbreedException(error), stackTrace);
    }
  }

  /// Search for breeds
  Future<List<Breed>> search(String query) async {
    try {
      return await _client.search(query);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(SearchFailure(error), stackTrace);
    }
  }

  /// Fetch a breed by id
  /// Returns null if the breed is not found
  Future<Breed?> getBreed(String id) async {
    try {
      final breed = await _client.fetchBreed(id);
      if (breed == null) return null;

      final results = await search(breed.name);

      return results.firstOrNull;
    } on CatbreedException {
      rethrow;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(FetchBreedFailure(error), stackTrace);
    }
  }
}

/// {@template catbreed_exception}
/// Exception thrown by the CatBreeds Repository
/// {@endtemplate}
class CatbreedException implements Exception {
  /// {@macro catbreed_exception}
  CatbreedException(this.error);

  /// Error thrown by the CatBreeds Repository
  final Object error;

  @override
  String toString() {
    return 'CatbreedException: $error';
  }
}

/// {@template search_failure}
/// Exception thrown when a search fails
/// {@endtemplate}
class SearchFailure extends CatbreedException {
  /// {@macro search_failure}
  SearchFailure(super.error);
}

/// {@template fetch_breed_failure}
/// Exception thrown when fetching a breed fails
/// {@endtemplate}
class FetchBreedFailure extends CatbreedException {
  /// {@macro fetch_breed_failure}
  FetchBreedFailure(super.error);
}
