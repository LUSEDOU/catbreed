import 'package:bloc/bloc.dart';
import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:equatable/equatable.dart';

part 'breed_state.dart';
part 'breed_event.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  BreedBloc({
    required CatbreedRepository repository,
    Breed? breed,
  })  : _repository = repository,
        super(
          BreedState(
            breed: breed,
            status:
                breed == null ? BreedStatus.unknown : BreedStatus.loaded,
          ),
        ) {
    on<BreedFetchRequested>(_onFetchRequested);
  }

  final CatbreedRepository _repository;

  Future<void> _onFetchRequested(
    BreedFetchRequested event,
    Emitter<BreedState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BreedStatus.loading));

      final breed = await _repository.getBreed(event.id);
      if (breed == null) {
        emit(state.copyWith(status: BreedStatus.error));
        return;
      }

      emit(state.copyWith(breed: breed, status: BreedStatus.loaded));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: BreedStatus.error));
    }
  }
}
