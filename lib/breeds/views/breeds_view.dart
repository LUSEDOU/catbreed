import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:catbreeds/app_ui/app_ui.dart';
import 'package:catbreeds/breed/breed.dart';
import 'package:catbreeds/breeds/breeds.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/material.dart' as material show Image;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BreedsView extends StatelessWidget {
  const BreedsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breeds'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = context.select((BreedsBloc bloc) => bloc.state);
    final child = switch (state.status) {
      BreedsStatus.initial ||
      BreedsStatus.loading =>
        const Center(child: CircularProgressIndicator()),
      BreedsStatus.loaded => const BreedsContent(),
      BreedsStatus.error => const Center(child: Text('Failed to fetch breeds')),
    };

    return Padding(
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}

class BreedsContent extends StatelessWidget {
  const BreedsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final breeds = context.select((BreedsBloc bloc) => bloc.state.breeds);
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: 300,
            child: ListView.builder(
              itemCount: breeds.length,
              itemBuilder: (context, index) {
                final breed = breeds[index];
                return BreedTile(breed: breed);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class BreedTile extends StatelessWidget {
  const BreedTile({
    required this.breed,
    super.key,
  });

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      child: GestureDetector(
        onTap: () => context.go(
          '/breeds/${breed.id}',
          extra: BreedData(breed: breed),
        ),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          // width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    breed.name,
                    style: textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => context.go(
                      '/breeds/${breed.id}',
                      extra: BreedData(breed: breed),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              AspectRatio(
                aspectRatio: 1,
                // SizedBox(
                // dimension: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.md),
                  child: material.Image(
                    image: NetworkImage(breed.image.url),
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    breed.origin,
                    style: textTheme.bodyLarge,
                  ),
                  Row(
                    children: [
                      Text(
                        '${breed.intelligence}',
                        style: textTheme.bodyLarge,
                      ),
                      const Icon(Icons.star),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
