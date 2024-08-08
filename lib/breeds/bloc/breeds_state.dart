part of 'breeds_bloc.dart';

enum BreedsStatus { initial, loading, loaded, error }

enum BreedsFetchStatus { canFetchMore, endOfFeed }

// @JsonSerializable()
class BreedsState extends Equatable {
  const BreedsState({
    this.breeds = const [],
    this.status = BreedsStatus.initial,
    this.fetchStatus = BreedsFetchStatus.canFetchMore,
    this.page = 0,
  });

  // factory BreedsState.fromJson(Map<String, dynamic> json) =>
  //     _$BreedsStateFromJson(json);

  final BreedsStatus status;
  final List<Breed> breeds;
  final BreedsFetchStatus fetchStatus;
  final int page;

  BreedsState copyWith({
    BreedsStatus? status,
    BreedsFetchStatus? fetchStatus,
    List<Breed>? breeds,
    int? page,
  }) {
    return BreedsState(
      status: status ?? this.status,
      breeds: breeds ?? this.breeds,
      fetchStatus: fetchStatus ?? this.fetchStatus,
      page: page ?? this.page,
    );
  }

  // Map<String, dynamic> toJson() => _$BreedsStateToJson(this);

  @override
  List<Object?> get props => [status, breeds, fetchStatus, page];
}
