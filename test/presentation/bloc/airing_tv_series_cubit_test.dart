import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/get_now_playing_tv_series.dart';
import 'package:ditonton/presentation/bloc/airing_tv_series_cubit.dart';
import 'package:ditonton/presentation/bloc/general_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy_data/tv_series_dummy_objects.dart';
import 'airing_tv_series_cubit_test.mocks.dart';

@GenerateMocks([GetNowPlayingTvSeries])
void main() {
  late MockGetNowPlayingTvSeries mockGetNowPlayingTvSeries;
  late AiringTvSeriesCubit cubit;

  setUp(() {
    mockGetNowPlayingTvSeries = MockGetNowPlayingTvSeries();
    cubit = AiringTvSeriesCubit(getAiringTvSeries: mockGetNowPlayingTvSeries);
  });

  test('initial state should be initialize', () {
    expect(cubit.state, GeneralInitializeState());
    expect(cubit.tvSeries, []);
  });

  blocTest<AiringTvSeriesCubit, GeneralState>(
    'Should emit [Loading, Loaded] when data is gotten successfully',
    build: () {
      when(mockGetNowPlayingTvSeries.execute()).thenAnswer((_) async => Right(testTvSeriesList));
      return cubit;
    },
    act: (cubit) => cubit.fetchAiringTvSeries(),
    expect: () => [
      GeneralLoadingState(),
      GeneralLoadedState(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
    },
  );

  blocTest<AiringTvSeriesCubit, GeneralState>(
    'Should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockGetNowPlayingTvSeries.execute()).thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return cubit;
    },
    act: (bloc) => bloc.fetchAiringTvSeries(),
    expect: () => [
      GeneralLoadingState(),
      GeneralErrorState('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetNowPlayingTvSeries.execute());
    },
  );
}
