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
        Logger('BreedPage').info('state: ${state.status}');
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
                child: Builder(
                  builder: (context) {
                    final json = breed.toJson();

                    final infoKeys = json.keys.where(
                      (key) {
                        final value = json[key];
                        if (value == null) {
                          return false;
                        }

                        if (key.contains('url')) {
                          return false;
                        }

                        if (value is int ||
                            (value is String && value.isNotEmpty) ||
                            value is double ||
                            value is bool) {
                          return true;
                        }

                        return false;
                      },
                    ).toList();

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: infoKeys
                          .map(
                            (key) => InfoTile(
                              title: key,
                              value: json[key].toString(),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      width: double.infinity,
      padding: const EdgeInsets.only(right: AppSpacing.md),
      decoration: ShapeDecoration(
        color: theme.colorScheme.surface,
        shape: StadiumBorder(
          side: BorderSide(
            color: theme.colorScheme.primary,
            width: AppSpacing.xs,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            // width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs,
            ),
            decoration: ShapeDecoration(
              color: theme.colorScheme.primary,
              shape: StadiumBorder(
                side: BorderSide(
                  color: theme.colorScheme.primary,
                  width: AppSpacing.xs,
                ),
              ),
            ),
            child: Text(
              title,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                value,
                style: textTheme.titleSmall,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
