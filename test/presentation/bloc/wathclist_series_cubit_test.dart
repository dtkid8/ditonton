import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_watchlist_series.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:ditonton/presentation/bloc/watchlist_series_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/tv_series_dummy_objects.dart';
import 'wathclist_series_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlistSeries])
void main() {
  late MockGetWatchlistSeries mockGetWatchlistSeries;
  late WatchlistSeriesCubit cubit;

  setUp(() {
    mockGetWatchlistSeries = MockGetWatchlistSeries();
    cubit = WatchlistSeriesCubit(getWatchlistSeries: mockGetWatchlistSeries);
  });

  test('initial state should be initialize', () {
    expect(cubit.state, GeneralInitializeState());
    expect(cubit.tvSeries, []);
  });

  blocTest<WatchlistSeriesCubit, GeneralState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetWatchlistSeries.execute()).thenAnswer((_) async => Right(testTvSeriesList));
      return cubit;
    },
    act: (cubit) => cubit.fetchWatchlistSeries(),
    expect: () => [
      GeneralLoadingState(),
      GeneralLoadedState(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistSeries.execute());
    },
  );

  blocTest<WatchlistSeriesCubit, GeneralState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetWatchlistSeries.execute()).thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
      return cubit;
    },
    act: (bloc) => bloc.fetchWatchlistSeries(),
    expect: () => [
      GeneralLoadingState(),
      GeneralErrorState("Can't get data"),
    ],
    verify: (bloc) {
      verify(mockGetWatchlistSeries.execute());
    },
  );
}
