import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:catbreeds/app_ui/app_ui.dart';
import 'package:catbreeds/breed/breed.dart';
import 'package:catbreeds/breeds/breeds.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

    return GestureDetector(
      onTap: () => context.go(
        '/breeds/${breed.id}',
        extra: BreedData(breed: breed),
      ),
      child: Card(
        margin: const EdgeInsets.only(bottom: AppSpacing.lg),
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
                child: BreedImage(image: breed.image),
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
