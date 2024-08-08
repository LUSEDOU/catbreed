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
