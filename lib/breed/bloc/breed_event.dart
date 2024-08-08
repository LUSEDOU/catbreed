part of 'breed_bloc.dart';

sealed class BreedEvent extends Equatable {
  const BreedEvent();

  @override
  List<Object> get props => [];
}

class BreedFetchRequested extends BreedEvent {
  const BreedFetchRequested(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
