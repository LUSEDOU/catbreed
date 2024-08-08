import 'package:bloc/bloc.dart';
import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:json_annotation/json_annotation.dart';

part 'breeds_state.dart';
part 'breeds_event.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  BreedsBloc({
    required CatbreedRepository repository,
    // String? query,
  })  : _repository = repository,
        // _query = query ?? '',
        super(const BreedsState()) {
    on<BreedsFetchRequested>(_onFetchRequested);
    on<BreedsSearchRequested>(_onSearchRequested);
    on<BreedsClearRequested>(_onClearRequested);
  }

  final CatbreedRepository _repository;
  // final String _query;

  /// HydratedBloc identifier
  // @override
  // String get id => _query;

  Future<void> _onFetchRequested(
    BreedsFetchRequested event,
    Emitter<BreedsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BreedsStatus.loading));

      final breeds = await _repository.fetch(
        page: state.page + 1,
      );

      if (breeds.isEmpty) {
        emit(state.copyWith(fetchStatus: BreedsFetchStatus.endOfFeed));
        return;
      }

      emit(
        state.copyWith(
          breeds: [...state.breeds, ...breeds],
          status: BreedsStatus.loaded,
        ),
      );
    } catch (exception, stackTrace) {
      addError(exception, stackTrace);
      emit(state.copyWith(status: BreedsStatus.error));
    }
  }

  Future<void> _onSearchRequested(
    BreedsSearchRequested event,
    Emitter<BreedsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BreedsStatus.loading));

      final breeds = await _repository.search(event.query);

      emit(
        state.copyWith(
          breeds: breeds,
          status: BreedsStatus.loaded,
          fetchStatus: BreedsFetchStatus.endOfFeed,
          page: 0,
        ),
      );
    } catch (exception, stackTrace) {
      addError(exception, stackTrace);
      emit(state.copyWith(status: BreedsStatus.error));
    }
  }

  void _onClearRequested(
    BreedsClearRequested event,
    Emitter<BreedsState> emit,
  ) {
    emit(const BreedsState());
    add(const BreedsFetchRequested());
  }

  // @override
  // BreedsState? fromJson(Map<String, dynamic> json) =>
  //     BreedsState.fromJson(json);
  //
  // @override
  // Map<String, dynamic>? toJson(BreedsState state) => state.toJson();
}
