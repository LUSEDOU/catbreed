import 'package:catbreeds/app_ui/app_spacing/app_spacing.dart';
import 'package:catbreeds/breed/breed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

class BreedView extends StatelessWidget {
  const BreedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breed'),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

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
        switch (state.status) {
          case BreedStatus.loading || BreedStatus.unknown:
            return const Center(child: CircularProgressIndicator());
          case BreedStatus.loaded:
            return const BreedContent();
          case BreedStatus.error:
            return const Center(child: Text('Error'));
        }
      },
    );
  }
}

class BreedContent extends StatelessWidget {
  const BreedContent({super.key});

  @override
  Widget build(BuildContext context) {
    final breed = context.select((BreedBloc bloc) => bloc.state.breed!);
    return Center(
      child: SizedBox(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    breed.image.url,
                    fit: BoxFit.cover,
                  ),
                ),
                InfoTile(
                  title: 'Origin',
                  value: breed.origin,
                ),
                InfoTile(
                  title: 'Temperament',
                  value: breed.temperament,
                ),
                InfoTile(
                  title: 'Life Span',
                  value: breed.lifeSpan,
                ),
                InfoTile(
                  title: 'Adaptability',
                  value: breed.adaptability.toString(),
                ),
                InfoTile(
                  title: 'Affection Level',
                  value: breed.affectionLevel.toString(),
                ),
                InfoTile(
                  title: 'Child Friendly',
                  value: breed.childFriendly.toString(),
                ),
                InfoTile(
                  title: 'Grooming',
                  value: breed.grooming.toString(),
                ),
                InfoTile(
                  title: 'Intelligence',
                  value: breed.intelligence.toString(),
                ),
                InfoTile(
                  title: 'Health Issues',
                  value: breed.healthIssues.toString(),
                ),
                InfoTile(
                  title: 'Social Needs',
                  value: breed.socialNeeds.toString(),
                ),
                InfoTile(
                  title: 'Stranger Friendly',
                  value: breed.strangerFriendly.toString(),
                ),
              ],
            ),
          ),
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

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title: ',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: value,
            style: textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
