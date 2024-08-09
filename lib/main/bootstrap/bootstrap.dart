import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:catbreeds/main/bootstrap/app_bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:logging/logging.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  if (kReleaseMode) {
    Logger.root.level = Level.WARNING;
  }

  Logger.root.onRecord.listen(
    (record) {
      debugPrint('${record.level.name}: ${record.time}: '
          '${record.loggerName}: '
          '${record.message}');
      if (record.error != null) {
        debugPrint('${record.error}');
        debugPrint(
          record.stackTrace.toString().split('\n').take(10).join('\n'),
        );
      }
    },
  );

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();
    usePathUrlStrategy();

    runApp(
      await builder(),
    );
  }, (error, stackTrace) {
    Logger.root.severe('runZonedGuarded', error, stackTrace);
  });
}
