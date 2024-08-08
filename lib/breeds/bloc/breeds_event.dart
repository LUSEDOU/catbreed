part of 'breeds_bloc.dart';

sealed class BreedsEvent extends Equatable {
  const BreedsEvent();

  @override
  List<Object?> get props => [];
}

class BreedsFetchRequested extends BreedsEvent {
  const BreedsFetchRequested({
    this.page,
    this.limit,
  });

  final int? limit;
  final int? page;

  @override
  List<Object?> get props => [page, limit];
}

class BreedsSearchRequested extends BreedsEvent {
  const BreedsSearchRequested(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

class BreedsClearRequested extends BreedsEvent {
  const BreedsClearRequested();
}
