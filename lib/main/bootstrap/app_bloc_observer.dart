// import 'package:analytics_repository/analytics_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver({
    Logger? logger,
  }) : _logger = logger ?? Logger('AppBlocObserver');

  final Logger _logger;

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    _logger.info('onTransition ${bloc.runtimeType}: $transition');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _logger.warning(
      'onError ${bloc.runtimeType}',
      error,
      stackTrace,
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // final dynamic state = change.nextState;
    // if (state is AnalyticsEventMixin)
    // _analyticsRepository.track(state.event);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    // if (event is AnalyticsEventMixin)
    // _analyticsRepository.track(event.event);
  }
}
