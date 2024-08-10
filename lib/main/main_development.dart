import 'package:catbreed_api_client/catbreed_api_client.dart';
import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:catbreeds/app/app.dart';
import 'package:catbreeds/main/bootstrap/bootstrap.dart';

void main() {
  bootstrap(
    () async {
      final apiClient = CatbreedApiClient(
        apiKey: const String.fromEnvironment('APIKEY'),
        baseUrl: 'https://api.thecatapi.com/v1/',
      );
      // final apiClient = MockApiClient();

      final repository = CatbreedRepository(client: apiClient);
      //
      return App(repository: repository);
    },
  );
}
