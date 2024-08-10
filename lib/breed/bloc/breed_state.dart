part of 'breed_bloc.dart';

enum BreedStatus { unknown, loading, loaded, error }
//
// enum BreedFeedMode { search, list }

class BreedState extends Equatable {
  const BreedState({
    this.breed,
    this.status = BreedStatus.unknown,
    // this.mode = BreedFeedMode.list,
  });

  final BreedStatus status;
  // final BreedFeedMode mode;
  final Breed? breed;

  BreedState copyWith({
    BreedStatus? status,
    // BreedFeedMode? mode,
    Breed? breed,
  }) {
    return BreedState(
      status: status ?? this.status,
      // mode: mode ?? this.mode,
      breed: breed ?? this.breed,
    );
  }

  @override
  List<Object?> get props => [status, breed];
}

extension Info on Breed {
  List<({String title, dynamic value})> get info => [
        (title: 'Name', value: name),
        (title: 'CfaUrl', value: cfaUrl == null ? null : Uri.parse(cfaUrl!)),
        (
          title: 'VetstreetUrl',
          value: vetstreetUrl == null ? null : Uri.parse(vetstreetUrl!)
        ),
        (
          title: 'VcahospitalsUrl',
          value: vcahospitalsUrl == null ? null : Uri.parse(vcahospitalsUrl!)
        ),
        (title: 'Temperament', value: temperament),
        (title: 'Origin', value: origin),
        (title: 'CountryCodes', value: countryCodes),
        (title: 'CountryCode', value: countryCode),
        (title: 'Description', value: description),
        (title: 'LifeSpan', value: lifeSpan),
        (title: 'Indoor', value: indoor),
        (title: 'Lap', value: lap),
        (title: 'AltNames', value: altNames),
        (title: 'Adaptability', value: adaptability),
        (title: 'AffectionLevel', value: affectionLevel),
        (title: 'ChildFriendly', value: childFriendly),
        (title: 'DogFriendly', value: dogFriendly),
        (title: 'CatFriendly', value: catFriendly),
        (title: 'EnergyLevel', value: energyLevel),
        (title: 'Grooming', value: grooming),
        (title: 'HealthIssues', value: healthIssues),
        (title: 'Intelligence', value: intelligence),
        (title: 'SheddingLevel', value: sheddingLevel),
        (title: 'SocialNeeds', value: socialNeeds),
        (title: 'StrangerFriendly', value: strangerFriendly),
        (title: 'Vocalisation', value: vocalisation),
        (title: 'Bidability', value: bidability),
        (title: 'Experimental', value: experimental),
        (title: 'Hairless', value: hairless),
        (title: 'Natural', value: natural),
        (title: 'Rare', value: rare),
        (title: 'Rex', value: rex),
        (title: 'SuppressedTail', value: suppressedTail),
        (title: 'ShortLegs', value: shortLegs),
        (
          title: 'WikipediaUrl',
          value: wikipediaUrl == null ? null : Uri.parse(wikipediaUrl!)
        ),
        (title: 'Hypoallergenic', value: hypoallergenic),
        (title: 'ReferenceImageId', value: referenceImageId),
      ];
}
