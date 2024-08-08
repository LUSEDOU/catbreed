import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:catbreeds/catbreed/catbreed.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CatbreedPage extends StatelessWidget {
  const CatbreedPage({
    required this.breedId,
    super.key,
    this.breed,
  });

  factory CatbreedPage.routeBuilder(_, GoRouterState state) {
    final data = state.extra as CatbreedData?;

    return CatbreedPage(
      key: const Key('catbreed_page'),
      breed: data?.breed,
      breedId: data?.breed.id ?? state.pathParameters['breedId']!,
    );
  }

  final Breed? breed;
  final String breedId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final repository = context.read<CatbreedRepository>();
        final $ = CatbreedBloc(repository: repository);

        if (breed == null) {
          $.add(CatbreedFetchRequested(breedId));
        }
        return $;
      },
      child: const CatbreedView(),
    );
  }
}

class CatbreedData extends Equatable {
  const CatbreedData({
    required this.breed,
  });

  final Breed breed;

  @override
  List<Object?> get props => [breed];
}
