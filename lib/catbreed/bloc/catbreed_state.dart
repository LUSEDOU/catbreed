part of 'catbreed_bloc.dart';

enum CatbreedStatus { unknown, loading, loaded, error }
//
// enum CatbreedFeedMode { search, list }

class CatbreedState extends Equatable {
  const CatbreedState({
    this.breed,
    this.status = CatbreedStatus.unknown,
    // this.mode = CatbreedFeedMode.list,
  });

  final CatbreedStatus status;
  // final CatbreedFeedMode mode;
  final Breed? breed;

  CatbreedState copyWith({
    CatbreedStatus? status,
    // CatbreedFeedMode? mode,
    Breed? breed,
  }) {
    return CatbreedState(
      status: status ?? this.status,
      // mode: mode ?? this.mode,
      breed: breed ?? this.breed,
    );
  }

  @override
  List<Object?> get props => [status, breed];
}
