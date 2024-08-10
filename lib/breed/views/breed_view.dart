import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:catbreeds/app_ui/app_spacing/app_spacing.dart';
import 'package:catbreeds/breed/breed.dart';
import 'package:catbreeds/breeds/breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

class BreedView extends StatelessWidget {
  const BreedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreedBloc, BreedState>(
      listener: (context, state) {
        if (state.status == BreedStatus.error) {
          context.pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('No se encontró la raza'),
              ),
            );
        }
      },
      builder: (context, state) {
        Logger('BreedPage').info('state: ${state.breed}');
        if (state.status == BreedStatus.unknown) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return _Body(breed: state.breed!);
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
      body: BreedContent(breed: breed),
    );
  }
}

class BreedContent extends StatelessWidget {
  const BreedContent({required this.breed, super.key});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: BreedImage(image: breed.image),
            ),
            const SizedBox(height: AppSpacing.xxlg),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: breed.info.map((info) {
                    return InfoTile(
                      title: info.title,
                      value: info.value,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
