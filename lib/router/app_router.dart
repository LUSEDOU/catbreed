import 'package:catbreeds/breed/breed.dart';
import 'package:catbreeds/breeds/breeds.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter = GoRouter(
  initialLocation: '/breeds',
  routes: [
    GoRoute(
      path: '/breeds',
      builder: BreedsPage.routeBuilder,
      routes: [
        GoRoute(
          path: ':breedId',
          builder: BreedPage.routeBuilder,
        ),
      ],
    ),
  ],
);
