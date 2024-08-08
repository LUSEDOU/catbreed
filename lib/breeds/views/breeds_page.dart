import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:catbreeds/breeds/breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BreedsPage extends StatelessWidget {
  const BreedsPage({
    this.query,
    super.key,
  });

  factory BreedsPage.routeBuilder(_, GoRouterState state) {
    return BreedsPage(
      key: const Key('breeds_page'),
      query: state.uri.queryParameters['q'],
    );
  }

  final String? query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final repository = context.read<CatbreedRepository>();
        return BreedsBloc(repository: repository)
          ..add(
            (query?.isEmpty ?? true)
                ? const BreedsFetchRequested()
                : BreedsSearchRequested(query!),
          );
      },
      child: const BreedsView(),
    );
  }
}
