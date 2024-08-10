import 'package:catbreeds/app_ui/app_ui.dart';
import 'package:catbreeds/breeds/breeds.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class BreedsView extends StatelessWidget {
  const BreedsView({super.key, this.query});

  final String? query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CatBreeds'),
      ),
      body: _Body(query: query),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({this.query});

  final String? query;

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            child: BreedSearchBar(initialQuery: query),
          ),
          const Expanded(
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
    // return Text('Some');
    return BlocConsumer<BreedsBloc, BreedsState>(
      listener: (context, state) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      listenWhen: (previous, current) =>
          previous.fetchStatus != current.fetchStatus,
      builder: (BuildContext context, BreedsState state) {
        final breeds = state.breeds;
        final status = state.status;

        return InfiniteList(
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
        );
      },
    );
  }
}
