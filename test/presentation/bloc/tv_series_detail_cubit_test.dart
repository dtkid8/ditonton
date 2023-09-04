import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/get_watchlist_series_status.dart';
import 'package:ditonton/domain/usecases/remove_series_watchlist.dart';
import 'package:ditonton/domain/usecases/save_watchlist_series.dart';
import 'package:ditonton/presentation/bloc/detail_state.dart';
import 'package:ditonton/presentation/bloc/tv_series_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/tv_series_dummy_objects.dart';
import 'tv_series_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetail,
  GetTvSeriesRecommendations,
  GetWatchListSeriesStatus,
  SaveWatchlistSeries,
  RemoveSeriesWatchlist,
])
void main() {
  late MockGetTvSeriesDetail mockGetTvSeriesDetail;
  late MockGetTvSeriesRecommendations mockGetTvSeriesRecommendations;
  late MockGetWatchListSeriesStatus mockGetWatchListSeriesStatus;
  late MockSaveWatchlistSeries mockSaveWatchlistSeries;
  late MockRemoveSeriesWatchlist mockRemoveWatchlistSeries;
  late TvSeriesDetailCubit cubit;
  final int id = 1;
  setUp(() {
    mockGetTvSeriesDetail = MockGetTvSeriesDetail();
    mockGetTvSeriesRecommendations = MockGetTvSeriesRecommendations();
    mockGetWatchListSeriesStatus = MockGetWatchListSeriesStatus();
    mockSaveWatchlistSeries = MockSaveWatchlistSeries();
    mockRemoveWatchlistSeries = MockRemoveSeriesWatchlist();
    cubit = TvSeriesDetailCubit(
      getTvSeriesDetail: mockGetTvSeriesDetail,
      getTvSeriesRecommendations: mockGetTvSeriesRecommendations,
      getWatchListStatus: mockGetWatchListSeriesStatus,
      saveWatchlist: mockSaveWatchlistSeries,
      removeWatchlist: mockRemoveWatchlistSeries,
    );
  });

  test('initial state should be initialize', () {
    expect(cubit.state, DetailInitializeState());
    expect(
        cubit.tvSeries,
        TvSeriesDetail(
          adult: false,
          backdropPath: "",
          episodeRunTime: [],
          firstAirDate: "",
          genres: [],
          homepage: "",
          id: 0,
          inProduction: false,
          languages: [],
          lastAirDate: "",
          name: "",
          networks: [],
          numberOfEpisodes: 0,
          numberOfSeasons: 0,
          originCountry: [],
          originalLanguage: "",
          originalName: "",
          overview: "",
          popularity: 0,
          posterPath: "",
          spokenLanguages: [],
          status: "",
          tagline: "",
          type: "",
          voteAverage: 0,
          voteCount: 0,
        ));
    expect(cubit.seriesRecommendations, []);
    expect(cubit.watchlistMessage, "");
    expect(cubit.isAddedToWatchlist, false);
  });

  blocTest<TvSeriesDetailCubit, DetailState>(
    'Should emit [Loading, Loaded] when detail data is gotten successfully',
    build: () {
      when(mockGetTvSeriesDetail.execute(id)).thenAnswer((_) async => Right(testTvSeriesDetail));
      when(mockGetTvSeriesRecommendations.execute(id)).thenAnswer((_) async => Right(testTvSeriesList));
      return cubit;
    },
    act: (cubit) => cubit.fetchTvSeriesDetail(id),
    expect: () => [
      DetailLoadingState(),
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesDetail.execute(id));
      verify(mockGetTvSeriesRecommendations.execute(id));
    },
  );

  blocTest<TvSeriesDetailCubit, DetailState>(
    'Should emit [Loading, Error] when detail data is gotten unsuccessfully',
    build: () {
      when(mockGetTvSeriesDetail.execute(id)).thenAnswer((_) async => Right(testTvSeriesDetail));
      when(mockGetTvSeriesRecommendations.execute(id)).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (cubit) => cubit.fetchTvSeriesDetail(id),
    expect: () => [
      DetailLoadingState(),
      DetailErrorState('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesDetail.execute(id));
      verify(mockGetTvSeriesRecommendations.execute(id));
    },
  );

  blocTest<TvSeriesDetailCubit, DetailState>(
    'Should emit [Loading, Error] when recommendation data is gotten unsuccessfully',
    build: () {
      when(mockGetTvSeriesDetail.execute(id)).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTvSeriesRecommendations.execute(id)).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (cubit) => cubit.fetchTvSeriesDetail(id),
    expect: () => [
      DetailLoadingState(),
      DetailErrorState('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetTvSeriesDetail.execute(id));
      verify(mockGetTvSeriesRecommendations.execute(id));
    },
  );

  blocTest<TvSeriesDetailCubit, DetailState>(
    'Should emit [Loading, Loaded] when watchlist status data is gotten successfully',
    build: () {
      when(mockGetWatchListSeriesStatus.execute(id)).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.loadWatchlistSeriesStatus(id),
    expect: () => [
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockGetWatchListSeriesStatus.execute(id));
    },
  );

  blocTest<TvSeriesDetailCubit, DetailState>(
    'Should emit [Watchlist, Loaded] when add watchlist is gotten successfully',
    build: () {
      when(mockSaveWatchlistSeries.execute(testTvSeriesDetail)).thenAnswer((_) async => Right("Added to Watchlist"));
      when(mockGetWatchListSeriesStatus.execute(testTvSeriesDetail.id)).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.addWatchlist(testTvSeriesDetail),
    expect: () => [
      DetailWatchlistState("Added to Watchlist"),
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlistSeries.execute(testTvSeriesDetail));
      verify(mockGetWatchListSeriesStatus.execute(testTvSeriesDetail.id));
    },
  );

  blocTest<TvSeriesDetailCubit, DetailState>(
    'Should emit [Watchlist, Loaded] when remove watchlist is gotten successfully',
    build: () {
      when(mockRemoveWatchlistSeries.execute(testTvSeriesDetail)).thenAnswer((_) async => Right("Removed from Watchlist"));
      when(mockGetWatchListSeriesStatus.execute(testTvSeriesDetail.id)).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.removeFromWatchlist(testTvSeriesDetail),
    expect: () => [
      DetailWatchlistState("Removed from Watchlist"),
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlistSeries.execute(testTvSeriesDetail));
      verify(mockGetWatchListSeriesStatus.execute(testTvSeriesDetail.id));
    },
  );

  blocTest<TvSeriesDetailCubit, DetailState>(
    'Should emit [Watchlist, Error] when add watchlist is gotten unsuccessfully',
    build: () {
      when(mockSaveWatchlistSeries.execute(testTvSeriesDetail)).thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetWatchListSeriesStatus.execute(testTvSeriesDetail.id)).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.addWatchlist(testTvSeriesDetail),
    expect: () => [
      DetailWatchlistState("Failed"),
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockSaveWatchlistSeries.execute(testTvSeriesDetail));
      verify(mockGetWatchListSeriesStatus.execute(testTvSeriesDetail.id));
    },
  );

  blocTest<TvSeriesDetailCubit, DetailState>(
    'Should emit [Watchlist, Error] when remove watchlist is gotten unsuccessfully',
    build: () {
      when(mockRemoveWatchlistSeries.execute(testTvSeriesDetail)).thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetWatchListSeriesStatus.execute(testTvSeriesDetail.id)).thenAnswer((_) async => true);
      return cubit;
    },
    act: (cubit) => cubit.removeFromWatchlist(testTvSeriesDetail),
    expect: () => [
      DetailWatchlistState("Failed"),
      isA<DetailLoadedState<DateTime>>(),
    ],
    verify: (bloc) {
      verify(mockRemoveWatchlistSeries.execute(testTvSeriesDetail));
      verify(mockGetWatchListSeriesStatus.execute(testTvSeriesDetail.id));
    },
  );
}
