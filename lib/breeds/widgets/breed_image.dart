import 'package:catbreed_repository/catbreed_repository.dart' as model;
import 'package:catbreeds/app_ui/app_spacing/app_spacing.dart';
import 'package:flutter/material.dart';

class BreedImage extends StatelessWidget {
  const BreedImage({required this.image, super.key});

  final model.Image? image;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return const Icon(Icons.error);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.md),
      child: Image(
        image: NetworkImage(image!.url),
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const Center(
              child: SizedBox.square(
                dimension: 100,
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
