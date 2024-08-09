import 'package:catbreed_repository/catbreed_repository.dart';
import 'package:catbreeds/app_ui/app_ui.dart';
import 'package:catbreeds/breed/breed.dart';
import 'package:catbreeds/breeds/breeds.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/material.dart' as material show Image;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

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

    if (state.status == BreedsStatus.error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Failed to fetch breeds'),
            TextButton(
              onPressed: () =>
                  context.read<BreedsBloc>().add(const BreedsFetchRequested()),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
            child: BreedSearchBar(),
          ),
          Expanded(
            child: BreedsContent(),
          ),
        ],
      ),
    );
  }
}

class BreedsContent extends StatefulWidget {
  const BreedsContent({super.key});

  @override
  State<BreedsContent> createState() => _BreedsContentState();
}

class _BreedsContentState extends State<BreedsContent> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((BreedsBloc bloc) => bloc.state);
    final breeds = state.breeds;
    final status = state.status;

    // return Text('Some');
    return BlocListener<BreedsBloc, BreedsState>(
      listener: (context, state) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: InfiniteList(
        scrollController: _scrollController,
        itemCount: breeds.length + 1,
        hasError: status == BreedsStatus.error,
        hasReachedMax: state.fetchStatus == BreedsFetchStatus.endOfFeed,
        onFetchData: () =>
            context.read<BreedsBloc>().add(const BreedsFetchRequested()),
        itemBuilder: (context, index) {
          final breed = breeds.elementAtOrNull(index);
          if (breed == null) {
            if (state.fetchStatus == BreedsFetchStatus.endOfFeed) {
              return const SizedBox.shrink();
            }
            return const Center(
              child: SizedBox.square(
                dimension: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return BreedTile(breed: breed);
        },
      ),
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
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
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
