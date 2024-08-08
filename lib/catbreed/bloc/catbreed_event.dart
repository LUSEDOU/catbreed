part of 'catbreed_bloc.dart';

sealed class CatbreedEvent extends Equatable {
  const CatbreedEvent();

  @override
  List<Object> get props => [];
}

class CatbreedFetchRequested extends CatbreedEvent {
  const CatbreedFetchRequested(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}
