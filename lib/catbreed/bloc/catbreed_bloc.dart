import 'package:bloc/bloc.dart';
import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:equatable/equatable.dart';

part 'catbreed_state.dart';
part 'catbreed_event.dart';

class CatbreedBloc extends Bloc<CatbreedEvent, CatbreedState> {
  CatbreedBloc({
    required CatbreedRepository repository,
    Breed? breed,
  })  : _repository = repository,
        super(
          CatbreedState(
            breed: breed,
            status:
                breed == null ? CatbreedStatus.unknown : CatbreedStatus.loaded,
          ),
        ) {
    on<CatbreedFetchRequested>(_onFetchRequested);
  }

  final CatbreedRepository _repository;

  Future<void> _onFetchRequested(
    CatbreedFetchRequested event,
    Emitter<CatbreedState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CatbreedStatus.loading));

      final breed = await _repository.getBreed(event.id);
      if (breed == null) {
        emit(state.copyWith(status: CatbreedStatus.error));
        return;
      }

      emit(state.copyWith(breed: breed, status: CatbreedStatus.loaded));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: CatbreedStatus.error));
    }
  }
}
