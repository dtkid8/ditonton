import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist.dart';
import 'package:ditonton/presentation/bloc/detail_state.dart';
import 'package:ditonton/presentation/bloc/movie_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListStatus mockGetWatchListSeriesStatus;
  late MockSaveWatchlist mockSaveWatchlistSeries;
  late MockRemoveWatchlist mockRemoveWatchlistSeries;
  late MovieDetailCubit cubit;
  final int id = 1;
  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchListSeriesStatus = MockGetWatchListStatus();
    mockSaveWatchlistSeries = MockSaveWatchlist();
    mockRemoveWatchlistSeries = MockRemoveWatchlist();
    cubit = MovieDetailCubit(
      getWatchListStatus: mockGetWatchListSeriesStatus,
      saveWatchlist: mockSaveWatchlistSeries,
      removeWatchlist: mockRemoveWatchlistSeries,
      getMovieDetail: mockGetMovieDetail,
      getMovieRecommendations: mockGetMovieRecommendations,
    );
  });

  test('initial state should be initialize', () {
    expect(cubit.state, DetailInitializeState());
    expect(
        cubit.movie,
        MovieDetail(
          adult: false,
          backdropPath: "",
          genres: [],
          id: 0,
          overview: "",
          posterPath: "",
          voteAverage: 0,
          voteCount: 0,
          originalTitle: '',
          releaseDate: '',
          runtime: 0,
          title: '',
        ));
    expect(cubit.movieRecommendations, []);
    expect(cubit.watchlistMessage, "");
    expect(cubit.isAddedToWatchlist, false);
  });

  blocTest<MovieDetailCubit, DetailState>(
    'Should emit [Loading, Loaded] when detail data is gotten successfully',
    build: () {
      when(mockGetMovieDetail.execute(id)).thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(id)).thenAnswer((_) async => Right(testMovieList));
      return cubit;
    },
    act: (cubit) => cubit.fetchMovieDetail(id),
    expect: () => [
      DetailLoadingState(),
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(id));
      verify(mockGetMovieRecommendations.execute(id));
    },
  );

  blocTest<MovieDetailCubit, DetailState>(
    'Should emit [Loading, Error] when detail data is gotten unsuccessfully',
    build: () {
      when(mockGetMovieDetail.execute(id)).thenAnswer((_) async => Right(testMovieDetail));
      when(mockGetMovieRecommendations.execute(id)).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (cubit) => cubit.fetchMovieDetail(id),
    expect: () => [
      DetailLoadingState(),
      DetailErrorState('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(id));
      verify(mockGetMovieRecommendations.execute(id));
    },
  );

  blocTest<MovieDetailCubit, DetailState>(
    'Should emit [Loading, Error] when recommendation data is gotten unsuccessfully',
    build: () {
      when(mockGetMovieDetail.execute(id)).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetMovieRecommendations.execute(id)).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (cubit) => cubit.fetchMovieDetail(id),
    expect: () => [
      DetailLoadingState(),
      DetailErrorState('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetMovieDetail.execute(id));
      verify(mockGetMovieRecommendations.execute(id));
    },
  );

  blocTest<MovieDetailCubit, DetailState>(
    'Should emit [Loading, Loaded] when watchlist status data is gotten successfully',
    build: () {
      when(mockGetWatchListSeriesStatus.execute(id)).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.loadWatchlistStatus(id),
    expect: () => [
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockGetWatchListSeriesStatus.execute(id));
    },
  );

  blocTest<MovieDetailCubit, DetailState>(
    'Should emit [Watchlist, Loaded] when add watchlist is gotten successfully',
    build: () {
      when(mockSaveWatchlistSeries.execute(testMovieDetail)).thenAnswer((_) async => Right("Added to Watchlist"));
      when(mockGetWatchListSeriesStatus.execute(testMovieDetail.id)).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.addWatchlist(testMovieDetail),
    expect: () => [
      DetailWatchlistState("Added to Watchlist"),
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlistSeries.execute(testMovieDetail));
      verify(mockGetWatchListSeriesStatus.execute(testMovieDetail.id));
    },
  );

  blocTest<MovieDetailCubit, DetailState>(
    'Should emit [Watchlist, Loaded] when remove watchlist is gotten successfully',
    build: () {
      when(mockRemoveWatchlistSeries.execute(testMovieDetail)).thenAnswer((_) async => Right("Removed from Watchlist"));
      when(mockGetWatchListSeriesStatus.execute(testMovieDetail.id)).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.removeFromWatchlist(testMovieDetail),
    expect: () => [
      DetailWatchlistState("Removed from Watchlist"),
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlistSeries.execute(testMovieDetail));
      verify(mockGetWatchListSeriesStatus.execute(testMovieDetail.id));
    },
  );

  blocTest<MovieDetailCubit, DetailState>(
    'Should emit [Watchlist, Error] when add watchlist is gotten unsuccessfully',
    build: () {
      when(mockSaveWatchlistSeries.execute(testMovieDetail)).thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetWatchListSeriesStatus.execute(testMovieDetail.id)).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.addWatchlist(testMovieDetail),
    expect: () => [
      DetailWatchlistState("Failed"),
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlistSeries.execute(testMovieDetail));
      verify(mockGetWatchListSeriesStatus.execute(testMovieDetail.id));
    },
  );

  blocTest<MovieDetailCubit, DetailState>(
    'Should emit [Watchlist, Error] when remove watchlist is gotten unsuccessfully',
    build: () {
      when(mockRemoveWatchlistSeries.execute(testMovieDetail)).thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetWatchListSeriesStatus.execute(testMovieDetail.id)).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.removeFromWatchlist(testMovieDetail),
    expect: () => [
      DetailWatchlistState("Failed"),
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlistSeries.execute(testMovieDetail));
      verify(mockGetWatchListSeriesStatus.execute(testMovieDetail.id));
    },
  );
}
