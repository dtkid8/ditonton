import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_watchlist_movies.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/watchlist_movies_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import 'watchlist_movies_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late MockGetWatchlistMovies mockGetWatchlistMovies;
  late WatchlistMoviesCubit cubit;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    cubit = WatchlistMoviesCubit(getWatchlistMovie: mockGetWatchlistMovies);
  });

  test('initial state should be initialize', () {
    expect(cubit.state, GeneralInitializeState());
    expect(cubit.movie, []);
  });

  blocTest<WatchlistMoviesCubit, GeneralState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistMovies.execute()).thenAnswer((_) async => Right(testMovieList));
      return cubit;
    },
    act: (cubit) => cubit.fetchWatchlistMovies(),
    expect: () => [
      GeneralLoadingState(),
      GeneralLoadedState(testMovieList),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistMovies.execute());
    },
  );

  blocTest<WatchlistMoviesCubit, GeneralState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetWatchlistMovies.execute()).thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
      return cubit;
    },
    act: (bloc) => bloc.fetchWatchlistMovies(),
    expect: () => [
      GeneralLoadingState(),
      GeneralErrorState("Can't get data"),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistMovies.execute());
    },
  );
}
