import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:catbreeds/breed/breed.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BreedPage extends StatelessWidget {
  const BreedPage({
    required this.breedId,
    super.key,
    this.breed,
  });

  factory BreedPage.routeBuilder(_, GoRouterState state) {
    final data = state.extra as BreedData?;

    return BreedPage(
      key: const Key('breed_page'),
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
        final $ = BreedBloc(repository: repository, breed: breed);

        if (breed == null) {
          $.add(BreedFetchRequested(breedId));
        }
        return $;
      },
      child: const BreedView(),
    );
  }
}

class BreedData extends Equatable {
  const BreedData({
    required this.breed,
  });

  final Breed breed;

  @override
  List<Object?> get props => [breed];
}
