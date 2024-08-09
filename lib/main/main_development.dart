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

class MockApiClient implements CatbreedApiClient {
  MockApiClient();

  Breed get fake => const Breed(
        weight: Weight(
          imperial: '7  -  10',
          metric: '3 - 5',
        ),
        id: 'abys',
        name: 'Abyssinian',
        cfaUrl: 'http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx',
        vetstreetUrl: 'http://www.vetstreet.com/cats/abyssinian',
        vcahospitalsUrl:
            'https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian',
        temperament: 'Active, Energetic, Independent, Intelligent, Gentle',
        origin: 'Egypt',
        countryCodes: 'EG',
        countryCode: 'EG',
        description:
            'The Abyssinian is easy to care for, and a joy to have in your '
            'home. They’re affectionate cats and love both people and '
            'other animals.',
        lifeSpan: '14 - 15',
        indoor: false,
        lap: true,
        altNames: '',
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 3,
        dogFriendly: 4,
        energyLevel: 5,
        grooming: 1,
        healthIssues: 2,
        intelligence: 5,
        sheddingLevel: 2,
        socialNeeds: 5,
        strangerFriendly: 5,
        vocalisation: 1,
        experimental: false,
        hairless: false,
        natural: true,
        rare: false,
        rex: false,
        suppressedTail: false,
        shortLegs: 0,
        wikipediaUrl: 'https://en.wikipedia.org/wiki/Abyssinian (cat)',
        hypoallergenic: false,
        referenceImageId: '0XYvRd7oD',
        image: Image(
          id: '0XYvRd7oD',
          width: 1204,
          height: 1445,
          url: 'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
        ),
      );

  @override
  Future<List<Breed>> fetch({int limit = 10, int page = 0}) =>
      Future.value(List.generate(limit, (_) => fake));

  @override
  Future<BreedSummary?> fetchBreed(String id) => Future.value(
        BreedSummary(
          id: 0,
          name: fake.name,
          weight: '',
          height: '',
          lifeSpan: '',
          bredFor: '',
          breedGroup: '',
        ),
      );

  @override
  Future<List<Breed>> search(String query) {
    return Future.value(List.generate(10, (_) => fake));
  }
}
